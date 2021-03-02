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
#ifndef ASSIGNMENT_4_H_
#define ASSIGNMENT_4_H_
#include "Assignment-2.h"
#include "Assignment-3.h"

class TaintGraphTraversal : public ICFGTraversal{

private:
    AndersenPTA* ander;

    // source & sink high frequency words
    std::set<string> checker_source_api {"source", "getenv", "read", "getchar"};
    std::set<string> checker_sink_api {"sink", "execl", "execv", "execp"};  
public:
    TaintGraphTraversal(PAG* pag, AndersenPTA* pta): ICFGTraversal(pag), ander(pta) {

    }

    bool aliasCheck(const CallBlockNode *src, const CallBlockNode *snk);

    // Identify source nodes on ICFG (i.e., call instruction with its callee function named 'src')
    std::set<const CallBlockNode *>& identifySources();

    // Identify sink nodes on ICFG (i.e., call instruction with its callee function named 'sink')
    std::set<const CallBlockNode *>& identifySinks();

    void taintChecking();
};

#endif
