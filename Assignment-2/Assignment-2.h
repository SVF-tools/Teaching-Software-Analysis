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

#ifndef ASSIGNMENT_2_H_
#define ASSIGNMENT_2_H_

#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "Assignment-2.h"


class ICFGTraversal
{

public:
    set<string> paths;
    ICFGTraversal(PAG* p): pag(p) {}

    void printICFGPath(vector<const ICFGNode *> &path)
    {
        SVFUtil::outs() << "Path START:  {  \n"; 
        for(const ICFGNode* node : path){
            SVFUtil::outs() << node->toString()<< " --> \n";
        }
        SVFUtil::outs() << " \n }  END";
    }


    void DFS(set<const ICFGNode *> &visited, vector<const ICFGNode *> &path, const ICFGNode *src, const ICFGNode *dst);

    void DFS_cxt(set<const ICFGNode *> &visited, vector<const ICFGNode *> &path, unordered_map<ICFGNode*, CallSiteID>ctx, const ICFGNode *src, const ICFGNode *dst);
    
    // identify the source function entry
    set<const CallBlockNode *>& identifySources()
    {
        for (const CallBlockNode *cs : pag->getCallSiteSet())
        {
            const SVFFunction *fun = SVFUtil::getCallee(cs->getCallSite());
            if (fun->getName() == "src" || fun->getName() == "getenv")
            {
                sources.insert(cs);
            }
        }
        return sources;
    }
    //identify the sink function entry
    set<const CallBlockNode *>& identifySinks()
    {
        for (const CallBlockNode *cs : pag->getCallSiteSet())
        {
            const SVFFunction *fun = SVFUtil::getCallee(cs->getCallSite());
            if (fun->getName() == "sink")
            {
                sinks.insert(cs);
            }
        }
        return sinks;
    }


private:

    set<const CallBlockNode*> sources;
    set<const CallBlockNode*> sinks;
    PAG* pag;
};







#endif