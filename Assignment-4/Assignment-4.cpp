//===- SVF-Teaching Assignment 4-------------------------------------//
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
 // SVF-Teaching Assignment 4: Information Flow Tracking
 //
 // 
 */
#include "Assignment-4.h"
#include <fstream>
#include <sstream>
#include <typeinfo>
using namespace SVF;
using namespace llvm;
using namespace std;

//parse and get the SrcSnk.txt filename 
// params for assign-4 test1.ll -configSrcSnk SrcSnk.txt 
static llvm::cl::opt<string> SrcSnk("configSrcSnk", llvm::cl::init(""),
                                         llvm::cl::desc("Load Source && Sink API from file"));

/// Checking alias of the variables at source and sink.
bool TaintGraphTraversal::aliasCheck(const CallBlockNode *src, const CallBlockNode *snk)
{
    const RetBlockNode* ret = src->getRetBlockNode();
    const PAGNode* actualRetPAGNode = ret->getActualRet();
    for(const PAGNode* param : snk->getActualParms()){
        if(ander->alias(actualRetPAGNode->getId(), param->getId()))
            return true;
    }
    return false;
}

// TODO: Implement your code here to collect sources function names read from checker_source_api
std::set<const CallBlockNode *>& TaintGraphTraversal::identifySources()
{
    return ICFGTraversal::identifySources();
}
// TODO: Implement your code here to collect sinks function names read from checker_sink_api
std::set<const CallBlockNode *>& TaintGraphTraversal::identifySinks()
{
    return ICFGTraversal::identifySinks();
}

// Start taint checking. 
// There is a tainted flow from p@source to q@sink 
// if (1) alias(p,q)==true and (2) source reaches sink on ICFG.
void TaintGraphTraversal::taintChecking(){
    if (!SrcSnk.empty())
        // add Src Snk function name AIP from file
        readSrcSnkFormFile(SrcSnk);
    for(const CallBlockNode* src : identifySources()){
        for(const CallBlockNode* snk : identifySinks()){
            vector<const ICFGNode*> path;
            set<const ICFGNode*> visited;
            if(aliasCheck(src,snk))
                DFS(visited,path,src,snk);
        }
    }
}

// TODO: Implement your code to parse each line from `SrcSnk.txt` in the form of 
// line 1: "source -> { api api api }"
// line 2: "sink   -> { api api api }" 
void TaintGraphTraversal::readSrcSnkFormFile(const string& filename){
    
}
