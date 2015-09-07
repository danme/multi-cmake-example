//
// Created by Daniel Menke on 13.05.15.
//

#include "base/CoreAdapterB.h"
#include "base/BaseCore.h"

#include "iostream"

using namespace std;

void AdapterBPrinter::printB() {
    BasePrinter base;
    base.printHello();
    string component = "AdapterB";
    auto copy = component;
    cout << "Hello World from lib: " << copy << endl;
}
