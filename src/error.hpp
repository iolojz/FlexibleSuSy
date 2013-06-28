// ====================================================================
// This file is part of FlexibleSUSY.
//
// FlexibleSUSY is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License,
// or (at your option) any later version.
//
// FlexibleSUSY is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with FlexibleSUSY.  If not, see
// <http://www.gnu.org/licenses/>.
// ====================================================================

#ifndef ERROR_H
#define ERROR_H

#include <string>

class Error {
public:
   virtual ~Error() {}
   virtual std::string what() const = 0;
};

class Two_scale_model;

class TachyonError : public Error {
public:
   TachyonError(Two_scale_model*, const std::string&, int);
   virtual ~TachyonError() {}
   virtual std::string what() const;
private:
   Two_scale_model* model;
   std::string particle_name;
   int particle_index;
};

#endif
