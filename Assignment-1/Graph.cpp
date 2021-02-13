#include <iostream>
#include <set>
#include <vector>
using namespace std;


class Node;
class Edge;
class Node{
    public:
        int nodeID;
        std::set<Edge*> inEdges;
        Node(int i):nodeID(i){};
};
class Edge{
    public:
        Node* src;
        Node* dst;
        Edge(Node* s, Node* d):src(s), dst(d){};
};
class Graph{
    public:
        set<Node*> nodes;  
        Graph(){};
        void addNode(Node* n);
};
void Graph::addNode(Node* n)
{
    nodes.insert(n);
}
//assignment-1 start from here
// vector<string> DFS_solution()
// {

// }




void Runtest1()
{
    /*


      1
    /  \ 
   2   3
   |\ / 
   | 4
   | |
   --5


*/
    // init nodes
    Node* node1 = new Node(1);
    Node* node2 = new Node(2);
    Node* node3 = new Node(3);
    Node* node4 = new Node(4);
    Node* node5 = new Node(5);

    // init edges
    Edge * edge1 = new Edge(node1, node2);
    Edge* edge2  = new Edge(node1, node3);
    node1->inEdges.insert(edge1);
    node1->inEdges.insert(edge2);
    Edge * edge3 = new Edge(node2, node4);
    Edge* edge4 = new Edge(node3, node4);
    node2->inEdges.insert(edge3);
    node3->inEdges.insert(edge4);
    Edge* edge5 = new Edge(node4, node5);
    Edge* edge6 = new Edge(node5,node2);
    node4->inEdges.insert(edge5);
    node5->inEdges.insert(edge6);
    
    // init Graph
    Graph* g = new Graph();
    g->addNode(node1);
    g->addNode(node2);
    g->addNode(node3);
    g->addNode(node4);
    g->addNode(node5);


    vector<string> expected_answer{"1245","1345"};
    // assert(DFS_solution() == expected_answer);
}
int main() {
    //test1
    Runtest1();
}