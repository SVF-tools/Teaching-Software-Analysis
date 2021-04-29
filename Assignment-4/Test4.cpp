#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "Graphs/PTACallGraph.h"
#include "Assignment-4.h"


void Test1()
{
    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test1.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    taint->taintChecking();
    set<string> expected = {"START: 6->7->8->12->10->END", "START: 6->1->2->3->4->7->8->12->10->END"};
    assert(taint->getPaths() == expected && " \n test1 failed !");
    cout << "\n test1 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
}
void Test2()
{

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test2.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);

    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    
    taint->taintChecking();
    assert(taint->getPaths().size() == 0 && " \n test2 failed !");
    cout << "\n test2 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
}

void Test3()
{

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test3.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);

    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    
    taint->taintChecking();
    assert(taint->getPaths().size() == 0 && " \n test3 failed !");
    cout << "\n test3 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();

}

void Test4()
{

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test4.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);

    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    
    taint->taintChecking();
    set<string> expected = {"START: 6->1->2->3->4->7->8->9->10->11->13->15->END", "START: 6->7->8->9->10->11->13->15->END"};
    assert(taint->getPaths() == expected && " \n test4 failed !");
    cout << "\n test4 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
}
int main(int argc, char ** argv)
{
    int arg_num = 0;
    char **arg_value = new char*[argc];
    std::vector<std::string> moduleNameVec;
    SVFUtil::processArguments(argc, argv, arg_num, arg_value, moduleNameVec);
    llvm::cl::ParseCommandLineOptions(arg_num, arg_value,
                                "Whole Program Points-to Analysis\n");
    Test1();
    Test2();
    Test3();
    Test4();
    return 0;
}


