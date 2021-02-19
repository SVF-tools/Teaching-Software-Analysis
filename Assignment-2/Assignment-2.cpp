//===- SVF-Teaching Assignment 2-------------------------------------//
//
//                     SVF: Static Value-Flow Analysis
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

#include "SVF-FE/LLVMUtil.h"
#include "SVF-FE/PAGBuilder.h"
#include "Assignment-2.h"
#include "Test2.h"
using namespace SVF;
using namespace llvm;
using namespace std;
//parse the input .bc file 


/// TODO: Implement your depth first search here to traversal each program path (once for any loop) from src to dst on ICFG
void ICFGTraversal::DFS(set<const ICFGNode *> &visited, vector<const ICFGNode *> &path, const ICFGNode *src, const ICFGNode *dst)
{

}
/// TODO: Implement your depth first search here to traversal each program path (once for any loop) from src to dst on ICFG with function call context
void ICFGTraversal::DFS_cxt(set<const ICFGNode *>& visited, vector<const ICFGNode *>& path,unordered_map<ICFGNode*, CallSiteID>& ctx, const ICFGNode *src, const ICFGNode *dst)
{
        
}
int main(int argc, char ** argv) {
    Test();
    return 0;
}