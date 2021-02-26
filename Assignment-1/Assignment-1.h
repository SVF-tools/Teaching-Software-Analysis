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
#include <iostream>
//declare
class Node;
class Edge;

class Node
{
private:
    int nodeID;
    std::set<const Edge *> outEdges; // outgoing edges of this node

public:
    // constructor
    Node(int i) { 
        nodeID = i; 
    }

    // Get the private attribute nodeID
    int getNodeID() const { 
        return nodeID; 
    }

    // Get the private attribute outEdges 
    std::set<const Edge *> getOutEdges() const { 
        return outEdges; 
    }

    // Add an edge into outEdges
    void addOutEdge(const Edge *edge) { 
        outEdges.insert(edge); 
    }
};

class Edge
{
private:
    Node *src;  // source node of the edge
    Node *dst;  // target node of the edge

public:
    // Constructor
    Edge(Node *s, Node *d) : src(s), dst(d){
    }
    // Get the source node
    Node *getSrc() const { 
        return src; 
    }

    // Get the target node
    Node *getDst() const { 
        return dst; 
    }
};

class Graph
{
private:
    std::set<const Node *> nodes;   // a set of nodes on the graph

public:
    Graph(){};
    // Get all the nodes of the graph
    std::set<const Node *> &getNodes() { 
        return nodes; 
    }
    // Add a node into the graph
    void addNode(const Node *node) { 
        nodes.insert(node);
    }
};


class GraphTraversal
{
public:
    // Constructor
    GraphTraversal(){};
    // Destructor
    ~GraphTraversal(){};

    /// To be implemented
    void printPath(std::vector<const Node *> &path);

    /// To be implemented
    void DFS(std::set<const Node *> &visited, std::vector<const Node *> &path, const Node *src, const Node *dst);

    // Retrieve all paths (a set of strings) during graph traversal
    std::set<std::string>& getPaths(){
        return paths;
    } 

private:
    std::set<std::string> paths;
};

#endif

