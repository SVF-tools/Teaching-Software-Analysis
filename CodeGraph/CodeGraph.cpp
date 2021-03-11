//===- CodeGraph.cpp -- -------------------------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013->  <Yulei Sui>
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
 // PAG ICFG Generation
 //
 // Author: Guanqin Zhang  email: 152585@uts.edu.au
 */

#include "SVF-FE/LLVMUtil.h"
#include "Graphs/SVFG.h"
#include "WPA/Andersen.h"
#include "SABER/LeakChecker.h"
#include "SVF-FE/PAGBuilder.h"


using namespace SVF;
using namespace llvm;
using namespace std;

static llvm::cl::opt<std::string> InputFilename(cl::Positional,
        llvm::cl::desc("<input bitcode>"), llvm::cl::init("-"));

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
    PAG *pag = builder.build(svfModule);
    //dump pag
    pag->dump(svfModule->getModuleIdentifier() + ".pag");
    /// ICFG
    ICFG *icfg = pag->getICFG();
    //dump icfg
    icfg->dump(svfModule->getModuleIdentifier() + ".icfg");

        // iterate each ICFGNode on ICFG
    for(ICFG::iterator i = icfg->begin(); i != icfg->end(); i++)
    {
        ICFGNode *n = i->second;
        // SVFUtil::outs() << n->toString() << "\n";
        // for(ICFGEdge* edge : n->getOutEdges()){
        //     SVFUtil::outs() << edge->toString() << "\n";
        // }
    }

    // iterate each PAGNode on PAG
    for(PAG::iterator p = pag->begin(); p != pag->end();p++)
    {
        PAGNode *n = p->second;
        // SVFUtil::outs() << n->toString() << "\n";
        // for(PAGEdge* edge : n->getOutEdges()){
        //     SVFUtil::outs() << edge->toString() << "\n";
        // }
    }


    return 0;
}