/* Copyright 2015 Daniel Menke
 *
 * This file is part of multi-cmake-example.
 *
 * multi-cmake-example is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * multi-cmake-example is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with multi-cmake-example.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "upstreamA/LibA.h"

#include <iostream>

using namespace std;

int main(void) {
    cout << "This is my awesome app 1:" << endl;
    LibAPrinter p;
    p.print();
    string component = "MyApp1::myapp";
    auto copy = component;
    cout << "Hello World from app: " << copy << endl;
}
