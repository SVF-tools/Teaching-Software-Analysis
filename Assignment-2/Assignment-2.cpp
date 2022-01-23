//===- SVF-Teaching Assignment 2-------------------------------------//
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
 // SVF-Teaching Assignment 2 : Source Sink ICFG DFS Traversal
 //
 // 
 */

#include <set>
#include "Assignment-2.h"
#include <iostream>
using namespace SVF;
using namespace std;

/// TODO: print each path once this method is called, and
/// add each path as a string into std::set<std::string> paths
/// Print the path in the format "START: 1->2->4->5->END", where -> indicate an ICFGEdge connects two ICFGNode IDs

void ICFGTraversal::printICFGPath(std::vector<const ICFGNode *> &path){
    std::string singlePath = "START: ";
    for (const ICFGNode *node : path)
    {
        singlePath += std::to_string(node->getId());
        singlePath += "->";
    }
    singlePath += "END";
    SVFUtil::outs() << singlePath << "\n";
    paths.insert(singlePath);
}


/// TODO: Implement your context-sensitive ICFG traversal here to traverse each program path (once for any loop) from src to dst
void ICFGTraversal::DFS(std::set<const ICFGNode *> &visited, std::vector<const ICFGNode *> &path, std::stack<const Instruction*> &callstack, const ICFGNode *src, const ICFGNode *dst)
{
    visited.insert(src);
    path.push_back(src);
    if (src == dst)
    {
        printICFGPath(path);
    }
    for (const ICFGEdge *edge : src->getOutEdges())
    {
        if (visited.find(edge->getDstNode()) == visited.end())
        {
            if(edge->isIntraCFGEdge()){
                DFS(visited, path, callstack, edge->getDstNode(), dst);
            }else if(const CallCFGEdge* callEdge = SVFUtil::dyn_cast<CallCFGEdge>(edge)){   // edge->isCFGEdge()
                callstack.push(callEdge->getCallSite());
                DFS(visited, path, callstack,  edge->getDstNode(), dst);
            }else if(const RetCFGEdge* retEdge = SVFUtil::dyn_cast<RetCFGEdge>(edge)){ //edge->isRetCFGEdge()
                if(!callstack.empty() && (callstack.top() == retEdge->getCallSite()))
                {
                    callstack.pop();
                    DFS(visited, path, callstack, edge->getDstNode(), dst);
                }
            } 
        }
    }
    visited.erase(src);
    path.pop_back();

}
