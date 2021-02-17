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