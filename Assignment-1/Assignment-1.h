//===- SVF-Teaching Assignment 1-------------------------------------//
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
 // SVF-Teaching Assignment 1 : Graph Traversal
 //
 // 
 */

#ifndef ASSIGNMENT_1_H_
#define ASSIGNMENT_1_H_
#include <set>
#include <vector>
#include <string>
class Node;
class Edge;
class Node
{
public:
    int nodeID;
    std::set<const Edge *> outEdges;
    Node(int i) : nodeID(i){};
};
class Edge
{
public:
    Node *src;
    Node *dst;
    Edge(Node *s, Node *d) : src(s), dst(d){};
};
class Graph
{
public:
    std::set<Node *> nodes;
    Graph(){};
    void addNode(Node *n);
};

void Graph::addNode(Node *n)
{
    nodes.insert(n);
}

class GraphTraversal
{
public:
    // Constructor
    GraphTraversal(){};
    // Destructor
    ~GraphTraversal(){};
    std::set<std::string> paths;

    /// To be implemented
    void printPath(std::vector<const Node *> &path);

    /// To be implemented
    void DFS(std::set<const Node *> &visited, std::vector<const Node *> &path, const Node *src, const Node *dst);
};
// //declare function
// void dfs(set<const Node*>& visited, vector<const Node*>& path, const Node *src,const Node *dst);
// //print vector of path to string format of answer
// void printPath(vector<const Node*>& path);

#endif