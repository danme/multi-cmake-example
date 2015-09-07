//
// Created by Daniel Menke on 13.05.15.
//
#include "upstreamA/LibA.h"

#include <base/CoreAdapterA.h>

#include <iostream>

using namespace std;

void LibAPrinter::print() {
    AdapterAPrinter p;
    p.printA();
    string component = "UpstreamA::lib";
    auto copy = component;
    cout << "Hello World from lib: " << copy << endl;
}
