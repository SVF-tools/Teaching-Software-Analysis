//===- SVF-Teaching Assignment 2-------------------------------------//
//
//     SVF: Static Value-Flow Analysis Framework for Source Code
//
// Copyright (C) <2013->
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===-----------------------------------------------------------------------===//

/*
 // Assignment 2 : Source Sink ICFG DFS Traversal
 //
 // 
 */

#include <iostream>
#include "../Assignment-2.h"

void Test1(std::vector<std::string>& moduleNameVec)
{
    // Directly call buildSVFModule
    LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);
    /// Build Program Assignment Graph (SVFIR)
    SVFIRBuilder builder;
    SVFIR *pag = builder.build();
    ICFG *icfg = pag->getICFG();
    icfg->dump("icfg");
    std::vector<const ICFGNode *> path;
    std::stack<const ICFGNode *>callstack;
    std::set<const ICFGNode *> visited;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const CallICFGNode *src : gt->identifySources())
    {
        for (const CallICFGNode *snk : gt->identifySinks())
        {
            gt->reachability(src, snk);
        }
    }
    for(auto path : gt->getPaths())
        std::cerr << path << "\n";

    SVFIR::releaseSVFIR();
    LLVMModuleSet::releaseLLVMModuleSet();
    delete gt;
}



int main(int argc, char *argv[])
{
    int arg_num = 0;
    int extraArgc = 1;
    char **arg_value = new char *[argc + extraArgc];
    for (; arg_num < argc; ++arg_num) {
        arg_value[arg_num] = argv[arg_num];
    }

    // You may comment it to see the details of the analysis
    arg_value[arg_num++] = (char*) "-stat=false";

    std::vector<std::string> moduleNameVec;
    moduleNameVec = OptionBase::parseOptions(
            arg_num, arg_value, "Teaching-Software-Analysis Assignment 2", "[options] <input-bitcode...>"
    );

    Test1(moduleNameVec);
    return 0;
}
