//===- Software-Analysis-Teaching Assignment 2-------------------------------------//
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
 // Software-Analysis-Teaching Assignment 2 : Source Sink ICFG DFS Traversal
 //
 // 
 */

#include <iostream>
#include "Assignment-2.h"

void Test1()
{

    std::vector<std::string> moduleNameVec = {"./Assignment-2/testcase/bc/test1.ll"};

    SVFModule *svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);
 
    /// Build Program Assignment Graph (SVFIR)
    SVFIRBuilder builder(svfModule);
    SVFIR *pag = builder.build();
    ICFG *icfg = pag->getICFG();
    // If you want to test your own case, plase change the dump name
    icfg->dump("./Assignment-2/testcase/dot/test1.ll.icfg");
    std::vector<const ICFGNode *> path;
    std::stack<const SVFInstruction *>callstack;
    std::set<const ICFGNode *> visited;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const CallICFGNode *src : gt->identifySources())
    {
        for (const CallICFGNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, callstack, src, snk);
        }
    }
    std::set<std::string> expected = {"START: 16->1->2->END"};
    assert(expected == gt->getPaths() && "test1 failed!");
    std::cout << "test1 passed!" << "\n";
    SVFIR::releaseSVFIR();
    LLVMModuleSet::releaseLLVMModuleSet();
    delete gt;
}

void Test2()
{
    //    Your current workingspace dir}/Assignment-2/testCase/
    std::vector<std::string> moduleNameVec = {"./Assignment-2/testcase/bc/test2.ll"};

    SVFModule *svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);
 
    /// Build Program Assignment Graph (SVFIR)
    SVFIRBuilder builder(svfModule);
    SVFIR *pag = builder.build();
    ICFG *icfg = pag->getICFG();
    // If you want to test your own case, plase change the dump name
    icfg->dump("./Assignment-2/testcase/dot/test2.ll.icfg");
    std::vector<const ICFGNode *> path;
    std::set<const ICFGNode *> visited;
    std::stack<const SVFInstruction *>callstack;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const CallICFGNode *src : gt->identifySources())
    {
        for (const CallICFGNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, callstack, src, snk);
        }
    }
    
    std::set<std::string> expected = {"START: 5->6->7->8->11->1->2->3->12->15->END", "START: 5->6->7->8->9->1->2->3->10->13->END"};
    assert(expected == gt->getPaths() && "test2 failed!");
    std::cout << "test2 passed!" << "\n";
    LLVMModuleSet::releaseLLVMModuleSet();
    SVFIR::releaseSVFIR();
    delete gt;
}
void Test()
{
    Test1();
    Test2();
}

int main()
{
    Test();
    return 0;
}
