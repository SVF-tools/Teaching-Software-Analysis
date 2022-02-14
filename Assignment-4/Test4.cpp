//===- Software-Analysis-Teaching Assignment 4-------------------------------------//
//
//    SVF: Static Value-Flow Analysis Framework for Source Code    
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
 // Software-Analysis-Teaching Assignment 4: Information Flow Tracking
 //
 // 
 */
#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/SVFIRBuilder.h"
#include "Graphs/PTACallGraph.h"
#include "Assignment-4.h"


void Test1()
{
    cout << "\n running test1: " << endl;
    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test1.ll"});
    svfModule->buildSymbolTableInfo();
    /// Build Program Assignment Graph (SVFIR)
    SVF::SVFIRBuilder builder;
    SVF::SVFIR *pag = builder.build(svfModule);
    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    taint->taintChecking();
    set<string> expected = {"START: 6->7->8->12->10->END", "START: 6->1->2->3->4->7->8->12->10->END"};
    assert(taint->getPaths() == expected && " \n wrong paths generated - test1 failed !");
    cout << "\n test1 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::SVFIR::releaseSVFIR();
}
void Test2()
{
    cout << "\n running test2 :" << endl;
    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test2.ll"});
    svfModule->buildSymbolTableInfo();
    /// Build Program Assignment Graph (SVFIR)
    SVF::SVFIRBuilder builder;
    SVF::SVFIR *pag = builder.build(svfModule);

    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    
    taint->taintChecking();
    assert(taint->getPaths().size() == 0 && " \n should not exist tainted path - test2 failed !");
    cout << "\n test2 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::SVFIR::releaseSVFIR();
}

void Test3()
{
    cout << "\n running test3 :" << endl;
    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test3.ll"});
    svfModule->buildSymbolTableInfo();
    /// Build Program Assignment Graph (SVFIR)
    SVF::SVFIRBuilder builder;
    SVF::SVFIR *pag = builder.build(svfModule);

    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    
    taint->taintChecking();
    assert(taint->getPaths().size() == 0 && " \n should not exist tainted path - test3 failed !");
    cout << "\n test3 passed !" << endl;
    SVF::SVFIR::releaseSVFIR();
    SVF::LLVMModuleSet::releaseLLVMModuleSet();

}

void Test4()
{
    cout << "\n running test4 :" << endl;
    SVFModule* svfModule = LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-4/testcase/bc/test4.ll"});
    svfModule->buildSymbolTableInfo();
    /// Build Program Assignment Graph (SVFIR)
    SVF::SVFIRBuilder builder;
    SVF::SVFIR *pag = builder.build(svfModule);

    TaintGraphTraversal* taint = new TaintGraphTraversal(pag);
    
    taint->taintChecking();
    set<string> expected = {"START: 6->1->2->3->4->7->8->9->10->11->13->15->END", "START: 6->7->8->9->10->11->13->15->END"};
    assert(taint->getPaths() == expected && " \n wrong paths generated - test4 failed !");
    cout << "\n test4 passed !" << endl;
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::SVFIR::releaseSVFIR();
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


