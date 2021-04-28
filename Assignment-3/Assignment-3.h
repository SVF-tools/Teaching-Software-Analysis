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
#ifndef ASSIGNMENT_3_H_
#define ASSIGNMENT_3_H_
#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "WPA/Andersen.h"

class AndersenPTA: public SVF::AndersenBase
{
public:
    // Constructor
    AndersenPTA(SVF::PAG* _pag) : AndersenBase(_pag){};

    //dump constraint graph
    void dump_consCG(string name)
    {
        consCG->dump(name);
    };

private:
	
    // Process all the address constraint edges
    void processAllAddr();

    // To be implemented
    virtual void solveWorklist();

    /// Add copy edge on constraint graph
    virtual bool addCopyEdge(SVF::NodeID src, SVF::NodeID dst)
    {
        if (consCG->addCopyCGEdge(src, dst))
            return true;
	else
            return false;
    }

};

#endif
