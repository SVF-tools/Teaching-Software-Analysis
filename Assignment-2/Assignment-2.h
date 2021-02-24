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
#include <iostream>
#include <vector>
#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/LLVMModule.h"
#include "Util/SVFUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "SVF-FE/ICFGBuilder.h"
#include "Graphs/PAG.h"
#include "Graphs/ICFG.h"

class ICFGTraversal
{

public:
    std::set<std::string> paths;
    ICFGTraversal(SVF::PAG *p) : pag(p) {}

    std::string printPathId(std::vector<const SVF::ICFGNode *> &path)
    {
        std::string singlePath = "START:";
        for (const SVF::ICFGNode *node : path)
        {
            singlePath += std::to_string(node->getId());
            singlePath += "->";
        }
        singlePath += "END";
        return singlePath;
    }

    std::set<const SVF::CallBlockNode *> &identifySources();

    std::set<const SVF::CallBlockNode *> &identifySinks();

    void DFS(std::set<const SVF::ICFGNode *> &visited, std::vector<const SVF::ICFGNode *> &path, const SVF::ICFGNode *src, const SVF::ICFGNode *dst);


private:
    std::set<const SVF::CallBlockNode *> sources;
    std::set<const SVF::CallBlockNode *> sinks;
    SVF::PAG *pag;
};

#endif