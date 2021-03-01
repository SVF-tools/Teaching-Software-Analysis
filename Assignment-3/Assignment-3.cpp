//===- SVF-Teaching Assignment 3-------------------------------------//
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
 // Assignment 3 : Andersen's pointer analysis
 //
 // 
 */

#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "WPA/Andersen.h"
#include "Assignment-3.h"
using namespace SVF;
using namespace llvm;
using namespace std;


// TODO: Implement your Andersen's Algorithm here
void AndersenPTA::solveWorklist(){
        processAllAddr();
	
	// Andersen's worklist-based transitive closure solving starts from  here

}

// TODO: Initialize each pointer at the address constraint
void AndersenPTA::processAllAddr(){
    for (ConstraintGraph::const_iterator nodeIt = consCG->begin(), nodeEit = consCG->end(); nodeIt != nodeEit; nodeIt++)
    {
        ConstraintNode *cgNode = nodeIt->second;
        for (ConstraintNode::const_iterator it = cgNode->incomingAddrsBegin(), eit = cgNode->incomingAddrsEnd();
                it != eit; ++it)
        {
            const AddrCGEdge *addr = SVFUtil::cast<AddrCGEdge>(*it);
	    /// Implement your code here:
        }
    }
}
