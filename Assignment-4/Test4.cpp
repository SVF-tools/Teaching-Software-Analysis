#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "Graphs/PTACallGraph.h"
#include "Assignment-4.h"
static llvm::cl::opt<std::string> InputFilename(llvm::cl::Positional,
        llvm::cl::desc("<input bitcode>"), llvm::cl::init("-"));

void Test(int argc, char ** argv)
{
    int arg_num = 0;
    char **arg_value = new char*[argc];
    std::vector<std::string> moduleNameVec;
    SVFUtil::processArguments(argc, argv, arg_num, arg_value, moduleNameVec);
    llvm::cl::ParseCommandLineOptions(arg_num, arg_value,
                                "Whole Program Points-to Analysis\n");

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    TaintGraphTraversal* taint = new TaintGraphTraversal(pag,andersenPTA);
    andersenPTA->analyze();
    taint->taintChecking();
    set<string> expected = {"START:16->1->2->3->4->17->18->19->20->END", "START:16->17->18->19->20->END"};
    assert(taint->getICFGPaths() == expected && " \n test1 failed !");
    cout << "\n test1 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
    delete andersenPTA; 
}



int main(int argc, char ** argv)
{
    Test(argc, argv);
    return 0;
}




