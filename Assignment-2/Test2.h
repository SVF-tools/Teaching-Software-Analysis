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
 // SVF-Teaching Assignment 2 : Source Sink ICFG DFS Traversal
 //
 // 
 */
#ifndef TEST_2_H_
#define TEST_2_H_
#include "Assignment-2.h"

void Test1()
{

    std::vector<std::string> moduleNameVec = {"{$Your current workingspace dir}/Assignment-2/testCase/test1.ll"};

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    PAGBuilder builder;
    PAG* pag = builder.build (svfModule);
	ICFG *icfg = pag->getICFG();
    icfg->dump("icfg_test1");
	vector<const ICFGNode*> path;
    set<const ICFGNode*> visited;
    ICFGTraversal* gt = new ICFGTraversal(pag);
    for(const CallBlockNode* src : gt->identifySources()){
        for(const CallBlockNode* snk : gt->identifySinks()){
            gt->DFS(visited,path,src,snk);
        }
    }
    set<string> expected = {"START:20->1->2->3->4->END"};
    assert(expected == gt->paths);
    
    delete gt;
}

void Test2()
{

    std::vector<std::string> moduleNameVec = {"{$Your current workingspace dir}/Assignment-2/testCase/test2.ll"};

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    PAGBuilder builder;
    PAG* pag = builder.build (svfModule);
	ICFG *icfg = pag->getICFG();
    icfg->dump("icfg_test2");
	vector<const ICFGNode*> path;
    set<const ICFGNode*> visited;
    ICFGTraversal* gt = new ICFGTraversal(pag);
    for(const CallBlockNode* src : gt->identifySources()){
        for(const CallBlockNode* snk : gt->identifySinks()){
            gt->DFS(visited,path,src,snk);
        }
    }
    set<string> expected = {"START:16->1->2->3->17->20->22->24->25->13->14->15->18->END","START:16->17->20->22->24->25->13->14->15->18->END"};
    assert(expected == gt->paths);
    delete gt;
}
void Test()
{
    Test1();
    Test2();
    return 0;
}

#endif

