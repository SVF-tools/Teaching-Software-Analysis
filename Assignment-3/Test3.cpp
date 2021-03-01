//===- SVF-Teaching Assignment 3-------------------------------------//
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
 // Assignment 3 : Andersen's pointer analysis
 //
 // 
 */

#include "Assignment-3.h"

#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "WPA/Andersen.h"
#include "Util/SVFUtil.h"
#include "Assignment-3.h"

void Test1()
{
    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-3/testcase/bc/CI-local.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    pag->dump ("./Assignment-3/testcase/dot/CI-local_init");
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    andersenPTA->analyze();
    andersenPTA->dump_consCG("./Assignment-3/testcase/dot/CI-local_final");
    andersenPTA->dumpTopLevelPtsTo();
    SVF::LLVMModuleSet::releaseLLVMModuleSet();
    SVF::PAG::releasePAG();
    delete andersenPTA; 
}

void Test2()
{
    
    SVF::SVFModule *svfModule = SVF::LLVMModuleSet::getLLVMModuleSet()->buildSVFModule({"./Assignment-3/testcase/bc/CI-global.ll"});
    /// Build Program Assignment Graph (PAG)
    SVF::PAGBuilder builder;
    SVF::PAG *pag = builder.build(svfModule);
    pag->dump ("./Assignment-3/testcase/dot/CI-global_init");
    AndersenPTA *andersenPTA = new AndersenPTA(pag);
    andersenPTA->analyze();
    andersenPTA->dump_consCG("./Assignment-3/testcase/dot/CI-global_final");
    andersenPTA->dumpTopLevelPtsTo();
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
