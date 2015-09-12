/* Copyright 2015 Daniel Menke
 *
 * This file is part of cmake-tutorial.
 *
 * cmake-tutorial is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * cmake-tutorial is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with cmake-tutorial.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "base/CoreAdapterB.h"

#include "iostream"

using namespace std;

int main(void) {
    AdapterBPrinter p;
    p.printB();
    cout << "Hello World from test!" << endl;
}
