#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"

using namespace SVF;
using namespace llvm;
using namespace std;

/*
 // SVF-Teaching Assignment 2 : Source Sink ICFG DFS Traversal
 */
//start your code here
int main(int argc, char ** argv) {

    int arg_num = 0;
    char **arg_value = new char*[argc];
    std::vector<std::string> moduleNameVec;
    SVFUtil::processArguments(argc, argv, arg_num, arg_value, moduleNameVec);
    cl::ParseCommandLineOptions(arg_num, arg_value,
                                "Whole Program Points-to Analysis\n");

    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule(moduleNameVec);

    /// Build Program Assignment Graph (PAG)
    PAGBuilder builder;
    PAG* pag = builder.build (svfModule);
	ICFG *icfg = pag->getICFG();


    return 0;
}