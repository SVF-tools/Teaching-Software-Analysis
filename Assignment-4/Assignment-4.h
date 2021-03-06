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
#ifndef ASSIGNMENT_4_H_
#define ASSIGNMENT_4_H_
#include "Assignment-2.h"
#include "Assignment-3.h"

class TaintGraphTraversal : public ICFGTraversal{

public:
    // mapping a type to its corresponding APIs, e.g., source -> {getenv, ...}
    typedef std::map<int, std::set<std::string> > api_map ;
    TaintGraphTraversal(PAG* pag, AndersenPTA* pta): ICFGTraversal(pag), ander(pta) {}
    
    // Can be used in adding elements to apis
    void add_API(int index, const std::string api) { 
        APIS[index].insert(api);
    }

    set<string> getICFGPaths(){ return paths;}

    bool aliasCheck(const CallBlockNode *src, const CallBlockNode *snk);

    // TODO: Identify source nodes on ICFG (i.e., call instruction with its callee function named 'src')
    std::set<const CallBlockNode *>& identifySources();

    // TODO: Identify sink nodes on ICFG (i.e., call instruction with its callee function named 'sink')
    std::set<const CallBlockNode *>& identifySinks();

    // TODO: Source and sink function names read from SrcSnk.txt
    void readSrcSnkFormFile(const string& filename);
    
    void taintChecking();

private:
    AndersenPTA* ander;

    // default source and sink function name API if SrcSnk.txt is not added
    std::set<std::string> checker_source_api {"source"};
    std::set<std::string> checker_sink_api {"sink"};
    
    api_map APIS {{0,checker_source_api}, {1,checker_sink_api}};
};

#endif