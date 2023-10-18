//===- Software-Analysis-Teaching Assignment 3-------------------------------------//
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
 // Software-Analysis-Teaching Assignment 3 : Andersen's pointer analysis
 //
 // 
 */

#include "Assignment-3.h"

#include "SVF-LLVM/LLVMUtil.h"
#include "SVF-LLVM/SVFIRBuilder.h"
#include "WPA/Andersen.h"
#include "Util/Options.h"
#include "Util/CommandLine.h"


void Test1()
{
    
    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-3/testcase/bc/no_alias.ll"});
    /// Build Program Assignment Graph (SVFIR)
    SVF::SVFIRBuilder builder(svfModule);
    SVF::SVFIR *pag = builder.build();
    pag->dump ("./Assignment-3/testcase/dot/no_alias_init");
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    andersenPTA->analyze();
    andersenPTA->dump_consCG("./Assignment-3/testcase/dot/no_alias_final");
    delete andersenPTA; 
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::SVFIR::releaseSVFIR();
}

void Test2()
{
    
    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-3/testcase/bc/CI-global.ll"});
    /// Build Program Assignment Graph (SVFIR)
    SVF::SVFIRBuilder builder(svfModule);
    SVF::SVFIR *pag = builder.build();
    pag->dump ("./Assignment-3/testcase/dot/CI-global_init");
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    andersenPTA->analyze();
    andersenPTA->dump_consCG("./Assignment-3/testcase/dot/CI-global_final");
    delete andersenPTA; 
    SVF::SVFIR::releaseSVFIR();
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
}

void Test3()
{
    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-3/testcase/bc/CI-local.ll"});
    /// Build Program Assignment Graph (SVFIR)
    SVF::SVFIRBuilder builder(svfModule);
    SVF::SVFIR *pag = builder.build();
    pag->dump ("./Assignment-3/testcase/dot/CI-local_init");
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    andersenPTA->analyze();
    andersenPTA->dump_consCG("./Assignment-3/testcase/dot/CI-local_final");
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::SVFIR::releaseSVFIR();
    delete andersenPTA; 
}
void Test()
{
    Test1();
    Test2();
    Test3();
}


int main(int argc, char ** argv)
{

    int arg_num = 0;
    int extraArgc = 1;
    char **arg_value = new char *[argc + extraArgc];
    for (; arg_num < argc; ++arg_num) {
        arg_value[arg_num] = argv[arg_num];
    }

    // You may comment it to see the details of the analysis
    arg_value[arg_num++] = (char*) "-stat=false";

    std::vector<std::string> moduleNameVec;
    moduleNameVec = OptionBase::parseOptions(
            arg_num, arg_value, "Teaching-Software-Analysis Assignment 3", "[options]"
    );
    Test();
    return 0;
}
