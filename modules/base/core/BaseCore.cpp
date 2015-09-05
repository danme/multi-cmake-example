//
// Created by Daniel Menke on 13.05.15.
//

#include "BaseCore.h"

#include "iostream"

using namespace std;

void BasePrinter::printHello() {
    string component = "core";
    auto copy = component;
    cout << "Hello World from lib: " << copy << endl;
}
