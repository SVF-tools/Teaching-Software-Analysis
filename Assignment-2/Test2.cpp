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
#include "Assignment-2.h"

void Test1()
{

    std::vector<std::string> moduleNameVec = {"./Assignment-2/testcase/bc/test1.ll"};

    SVFModule *svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    PAGBuilder builder;
    PAG *pag = builder.build(svfModule);
    ICFG *icfg = pag->getICFG();
    icfg->dump(svfModule->getModuleIdentifier() + ".icfg");
    std::vector<const ICFGNode *> path;
    std::stack<const Instruction *>callstack;
    std::set<const ICFGNode *> visited;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const CallBlockNode *src : gt->identifySources())
    {
        for (const CallBlockNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, callstack, src, snk);
        }
    }
    std::set<std::string> expected = {"START: 16->1->2->END"};
    assert(expected == gt->getPaths() && "test1 failed!");
    std::cout << "test1 passed!" << "\n";
    LLVMModuleSet::releaseLLVMModuleSet();
    PAG::releasePAG();
    delete gt;
}

void Test2()
{
    //    Your current workingspace dir}/Assignment-2/testCase/
    std::vector<std::string> moduleNameVec = {"./Assignment-2/testcase/bc/test2.ll"};

    SVFModule *svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    PAGBuilder builder;
    PAG *pag = builder.build(svfModule);
    ICFG *icfg = pag->getICFG();
    icfg->dump(svfModule->getModuleIdentifier() + ".icfg");
    std::vector<const ICFGNode *> path;
    std::set<const ICFGNode *> visited;
    std::stack<const Instruction *>callstack;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const CallBlockNode *src : gt->identifySources())
    {
        for (const CallBlockNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, callstack, src, snk);
        }
    }
    
    std::set<std::string> expected = {"START: 5->8->7->9->10->11->14->END", "START: 5->8->7->9->10->1->2->3->11->14->END", "START: 5->8->7->9->12->13->16->END","START: 5->8->7->9->12->1->2->3->13->16->END" };
    assert(expected == gt->getPaths() && "test2 failed!");
    std::cout << "test2 passed!" << "\n";
    LLVMModuleSet::releaseLLVMModuleSet();
    PAG::releasePAG();
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
