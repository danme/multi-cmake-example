//
// Created by Daniel Menke on 13.05.15.
//
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
