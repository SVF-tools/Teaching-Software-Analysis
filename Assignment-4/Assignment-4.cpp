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
 // SVF-Teaching Assignment 4: Taint Analysis
 //
 // 
 */


#include "Assignment-4.h"

using namespace SVF;
using namespace llvm;
using namespace std;
//parse the input .bc file 
static llvm::cl::opt<std::string> InputFilename(cl::Positional,
        llvm::cl::desc("<input bitcode>"), llvm::cl::init("-"));

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

// Implement your code here to collect sources
std::set<const CallBlockNode *>& TaintGraphTraversal::identifySources(){
    return ICFGTraversal::identifySources();
}

// Implement your code here to collect sinks
std::set<const CallBlockNode *>& TaintGraphTraversal::identifySinks(){
    return ICFGTraversal::identifySinks();
}

// Start taint checking. 
// There is a tainted flow from p@source to q@sink 
// if (1) alias(p,q)==true and (2) source reaches sink on ICFG.
void TaintGraphTraversal::taintChecking(){
    for(const CallBlockNode* src : identifySources()){
        for(const CallBlockNode* snk : identifySinks()){
            vector<const ICFGNode*> path;
            set<const ICFGNode*> visited;
            if(aliasCheck(src,snk))
                DFS(visited,path,src,snk);
        }
    }
}
