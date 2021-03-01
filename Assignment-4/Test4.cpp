#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "Graphs/PTACallGraph.h"
#include "Assignment-4.h"

void Test1()
{
    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/test1.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    TaintGraphTraversal* taint = new TaintGraphTraversal(pag,andersenPTA);
    taint->taintChecking();
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
    delete andersenPTA; 
}

void Test2()
{
    
    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/test2.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    TaintGraphTraversal* taint = new TaintGraphTraversal(pag,andersenPTA);
    taint->taintChecking();
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
    delete andersenPTA; 
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




