//
// Created by Daniel Menke on 13.05.15.
//

#include "base/CoreAdapterA.h"
#include "base/BaseCore.h"

#include "iostream"

using namespace std;

void AdapterAPrinter::printA() {
    BasePrinter base;
    base.printHello();
    string component = "AdapterA";
    auto copy = component;
    cout << "Hello World from lib: " << copy << endl;
}
