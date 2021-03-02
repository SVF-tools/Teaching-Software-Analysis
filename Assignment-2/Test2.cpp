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

#include "Assignment-2.h"

void Test1()
{

    std::vector<std::string> moduleNameVec = {"./Assignment-2/testcase/bc/test1.ll"};

    SVFModule *svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    PAGBuilder builder;
    PAG *pag = builder.build(svfModule);
    ICFG *icfg = pag->getICFG();
    icfg->dump("icfg_test1");
    std::vector<const ICFGNode *> path;
    std::set<const ICFGNode *> visited;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const CallBlockNode *src : gt->identifySources())
    {
        for (const CallBlockNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, src, snk);
        }
    }
    std::set<std::string> expected = {"START:20->1->2->3->4->END"};
    assert(expected == gt->getPaths());
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
    icfg->dump("icfg_test2");
    std::vector<const ICFGNode *> path;
    std::set<const ICFGNode *> visited;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const CallBlockNode *src : gt->identifySources())
    {
        for (const CallBlockNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, src, snk);
        }
    }
    std::set<std::string> expected = {"START:16->1->2->3->17->20->22->24->25->13->14->15->18->END", "START:16->17->20->22->24->25->13->14->15->18->END"};
    assert(expected == gt->getPaths());
    LLVMModuleSet::releaseLLVMModuleSet();
    PAG::releasePAG();
    delete gt;
}
void Test()
{
    //TODO: running together problem, for each one will be fine
    // SVFModule lack of destructor?
    Test1();
    Test2();
    // Test3();
}

int main()
{
    Test();
    return 0;
}
