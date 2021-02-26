#ifndef TEST_2_H_
#define TEST_2_H_
#include "Assignment-2.h"
#include <iostream>
#include <cassert>


void Test1()
{

    std::vector<std::string> moduleNameVec = {"/home/SVF-tools/SVF-Teaching/Assignment-2/testcase/bc/test1.ll"};

    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    SVF::ICFG *icfg = pag->getICFG();
    icfg->dump("/home/SVF-tools/SVF-Teaching/Assignment-2/testcase/dot/icfg_test1");
    std::vector<const SVF::ICFGNode *> path;
    std::set<const SVF::ICFGNode *> visited;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const SVF::CallBlockNode *src : gt->identifySources())
    {
        for (const SVF::CallBlockNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, src, snk);
        }
    }
    std::set<std::string> expected = {"START:20->1->2->3->4->END"};
    assert(expected == gt->getPaths() && "Test case 1 failed");
    std::cout << "Test case 1 passed!\n";
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
    delete gt;
}
void Test2()
{

    std::vector<std::string> moduleNameVec = {"/home/SVF-tools/SVF-Teaching/Assignment-2/testcase/bc/test2.ll"};

    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    SVF::ICFG *icfg = pag->getICFG();
    icfg->dump("/home/SVF-tools/SVF-Teaching/Assignment-2/testcase/dot/icfg_test2");
    std::vector<const SVF::ICFGNode *> path;
    std::set<const SVF::ICFGNode *> visited;
    ICFGTraversal *gt = new ICFGTraversal(pag);
    for (const SVF::CallBlockNode *src : gt->identifySources())
    {
        for (const SVF::CallBlockNode *snk : gt->identifySinks())
        {
            gt->DFS(visited, path, src, snk);
        }
    }
    std::set<std::string> expected = {"START:16->1->2->3->17->20->22->24->25->13->14->15->18->END", "START:16->17->20->22->24->25->13->14->15->18->END"};
    assert(expected == gt->getPaths() && "Test case 2 failed");
    std::cout << "Test case 2 passed!\n";
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
    delete gt;
}

void Test()
{
    Test1();
    Test2();
}

#endif