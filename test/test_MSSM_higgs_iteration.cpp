
#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE test_MSSM_higgs_iteration

#include <boost/test/unit_test.hpp>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_multimin.h>

#include "error.hpp"
#include "logger.hpp"
#include "ew_input.hpp"
#include "wrappers.hpp"
#include "two_scale_solver.hpp"
#include "two_scale_running_precision.hpp"
#include "MSSM_model.hpp"
#include "MSSM_input_parameters.hpp"
#include "MSSM_high_scale_constraint.hpp"
#include "MSSM_susy_scale_constraint.hpp"
#include "MSSM_low_scale_constraint.hpp"
#include "MSSM_convergence_tester.hpp"
#include "MSSM_initial_guesser.hpp"
#include "test_MSSM.hpp"

#define SM(p) Electroweak_constants::p
#define STANDARD_DEVIATION_MZ 0.0021
#define STANDARD_DEVIATION_MH 0.4

double mHmZchi2(const gsl_vector* x, void* params)
{
   MSSM* model = static_cast<MSSM*>(params);

   const double vd = gsl_vector_get(x, 0);
   const double vu = gsl_vector_get(x, 1);

   model->set_vd(vd);
   model->set_vu(vu);

   model->calculate_DRbar_parameters();
   model->calculate_Mhh_pole_1loop();
   model->calculate_MVZ_pole_1loop();

   const double mH = model->get_physical().Mhh(1);
   const double mZ = model->get_physical().MVZ;

   return Sqr(SM(MZ) - mZ)/Sqr(STANDARD_DEVIATION_MZ)
        + Sqr(SM(MH) - mH)/Sqr(STANDARD_DEVIATION_MH);
}

template <std::size_t dimension>
class Minimizer {
public:
   typedef double (*Function_t)(const gsl_vector*, void*);

   Minimizer(void* model_, Function_t function_, std::size_t max_iterations_, double precision_)
      : max_iterations(max_iterations_)
      , precision(precision_)
      , initial_step_size(1.0)
      , minimum_value(0.0)
      , model(model_)
      , function(function_) {
      starting_point = gsl_vector_alloc(dimension);
      step_size = gsl_vector_alloc(dimension);
   }
   Minimizer(const Minimizer& other)
      : max_iterations(other.max_iterations)
      , precision(other.precision)
      , initial_step_size(other.initial_step_size)
      , minimum_value(other.minimum_value)
      , model(other.model)
      , function(other.function) {
      starting_point = gsl_vector_alloc(dimension);
      step_size = gsl_vector_alloc(dimension);
      // copy vectors
      gsl_vector_memcpy(starting_point, other.starting_point);
      gsl_vector_memcpy(step_size, other.step_size);
   }
   ~Minimizer() {
      gsl_vector_free(starting_point);
      gsl_vector_free(step_size);
   }

   double get_minimum_value() const { return minimum_value; }
   int minimize(const double[dimension]);

private:
   std::size_t max_iterations;
   double precision, initial_step_size;
   double minimum_value;
   gsl_vector *starting_point, *step_size;
   void* model;
   Function_t function;

   void print_state(gsl_multimin_fminimizer*, std::size_t) const;
};

template <std::size_t dimension>
int Minimizer<dimension>::minimize(const double start[dimension])
{
   assert(model && "Minimizer<dimension>::minimize: model pointer"
          " must not be zero!");
   assert(function && "Minimizer<dimension>::minimize: function pointer"
          " must not be zero!");

   const gsl_multimin_fminimizer_type *type =
      gsl_multimin_fminimizer_nmsimplex2;
   gsl_multimin_fminimizer *minimizer;
   gsl_multimin_function minex_func;

   // Set starting point
   for (std::size_t i = 0; i < dimension; i++)
      gsl_vector_set(starting_point, i, start[i]);

   // Set initial step sizes
   gsl_vector_set_all(step_size, initial_step_size);

   // Initialize method and iterate
   minex_func.n = dimension;
   minex_func.f = function;
   minex_func.params = model;

   minimizer = gsl_multimin_fminimizer_alloc(type, dimension);
   gsl_multimin_fminimizer_set(minimizer, &minex_func, starting_point, step_size);

   size_t iter = 0;
   int status;

   do {
      iter++;
      status = gsl_multimin_fminimizer_iterate(minimizer);

      if (status)
         break;

      const double size = gsl_multimin_fminimizer_size(minimizer);
      status = gsl_multimin_test_size(size, precision);

#ifdef VERBOSE
      print_state(minimizer, iter);
#endif
   } while (status == GSL_CONTINUE && iter < max_iterations);

#ifdef VERBOSE
   printf("\tMinimization status = %s\n", gsl_strerror(status));
#endif

   minimum_value = minimizer->fval;
   gsl_multimin_fminimizer_free(minimizer);

   return status;
}

template <std::size_t dimension>
void Minimizer<dimension>::print_state(gsl_multimin_fminimizer* minimizer,
                                       std::size_t iteration) const
{
   std::cout << "\tIteration " << iteration << ": x =";
   for (std::size_t i = 0; i < dimension; ++i)
      std::cout << " " << gsl_vector_get(minimizer->x, i);
   std::cout << ", f(x) = " << minimizer->fval << '\n';
}

BOOST_AUTO_TEST_CASE( test_copy_Minimizer )
{
   Minimizer<2> minimizer1(NULL, NULL, 100, 1.0e-2);
   Minimizer<2> minimizer2(minimizer1);
}

BOOST_AUTO_TEST_CASE( test_MSSM_higgs_iteration )
{
   MSSM_input_parameters input;
   MSSM model;

   const double ALPHASMZ = 0.1176;
   const double ALPHAMZ = 1.0 / 127.918;
   const double sinthWsq = 0.23122;
   const double alpha1 = 5 * ALPHAMZ / (3 * (1 - sinthWsq));
   const double alpha2 = ALPHAMZ / sinthWsq;
   const double g1 = sqrt(4 * Pi * alpha1);
   const double g2 = sqrt(4 * Pi * alpha2);
   const double g3 = sqrt(4 * Pi * ALPHASMZ);
   const double tanBeta = input.TanBeta;
   const double sinBeta = sin(atan(tanBeta));
   const double cosBeta = cos(atan(tanBeta));
   const double M12 = input.m12;
   const double m0 = input.m0;
   const double a0 = input.Azero;
   const double root2 = sqrt(2.0);
   const double vev = 246.0;
   const double vu = vev * sinBeta;
   const double vd = vev * cosBeta;
   const double susyMu = input.SignMu * 120.0;
   const double BMu = Sqr(2.0 * susyMu);
   const double scale = Electroweak_constants::MZ;

   Eigen::Matrix<double,3,3> Yu(Eigen::Matrix<double,3,3>::Zero()),
      Yd(Eigen::Matrix<double,3,3>::Zero()),
      Ye(Eigen::Matrix<double,3,3>::Zero()),
      mm0(Eigen::Matrix<double,3,3>::Zero());
   Yu(2,2) = 165.0   * root2 / (vev * sinBeta);
   Yd(2,2) = 2.9     * root2 / (vev * cosBeta);
   Ye(2,2) = 1.77699 * root2 / (vev * cosBeta);
   mm0 = Sqr(m0) * Eigen::Matrix<double,3,3>::Identity();

   model.set_scale(scale);
   model.set_loops(1);
   model.set_g1(g1);
   model.set_g2(g2);
   model.set_g3(g3);
   model.set_Yu(Yu);
   model.set_Yd(Yd);
   model.set_Ye(Ye);
   model.set_MassB(M12);
   model.set_MassG(M12);
   model.set_MassWB(M12);
   model.set_mq2(mm0);
   model.set_ml2(mm0);
   model.set_md2(mm0);
   model.set_mu2(mm0);
   model.set_me2(mm0);
   model.set_mHd2(Sqr(m0));
   model.set_mHu2(Sqr(m0));
   model.set_TYu(a0 * Yu);
   model.set_TYd(a0 * Yd);
   model.set_TYe(a0 * Ye);
   model.set_Mu(susyMu);
   model.set_BMu(BMu);
   model.set_vu(vu);
   model.set_vd(vd);

   Minimizer<2> minimizer(&model, mHmZchi2, 100, 1.0e-2);
   const double start[2] = { model.get_vd(), model.get_vu() };

   const int status = minimizer.minimize(start);

   BOOST_CHECK_EQUAL(status, GSL_SUCCESS);
   BOOST_MESSAGE("New vd = " << model.get_vd() << ", vu = " << model.get_vu());
   BOOST_MESSAGE("Predicted tan(beta) = " << model.get_vu() / model.get_vd());

   // check how close we got
   model.calculate_DRbar_parameters();
   model.calculate_Mhh_pole_1loop();
   model.calculate_MVZ_pole_1loop();

   const double mH = model.get_physical().Mhh(1);
   const double mZ = model.get_physical().MVZ;

   BOOST_CHECK_CLOSE_FRACTION(mH, 125., 0.400);
   BOOST_CHECK_CLOSE_FRACTION(mZ, 91. , 0.003);
}
