#ifndef BCCLEAN_DIJKSTAR_TRACING_H
#define BCCLEAN_DIJKSTAR_TRACING_H 
#include <Eigen/Core>
#include "patch.h"
#include "node.h"
#include "edge.h"
#include "kdtree_NN_Eigen.hpp"
#include <unordered_map>
#include <map>
#include <cstdlib>
#include <ctime>
#include <igl/dijkstra.h>
#include <igl/adjacency_list.h>
#include <igl/vertex_triangle_adjacency.h>
#include <igl/triangle_triangle_adjacency.h>
#include <algorithm>
#include <functional>
#include <cmath>

namespace bcclean{
namespace MatchMaker{
    void silence_vertices1(std::vector<std::vector<int > > & VV, std::vector<bool> & VCuts, const std::vector<int> & silent_indices);

   

    void CC_faces_per_node(
        const Eigen::MatrixXd & V,
        const Eigen::MatrixXi & F,
        const std::vector<int> & node_list,
        std::map<int, std::vector<int> > & node_faces_dict
    );    

    void setWeights(
        const Eigen::MatrixXd & V,
        const Eigen::MatrixXd & V_bad,
        const edge & edg,
        const int & upratio,
        const int & power,
        std::vector<double> & Weights
    );

    bool dijkstra_trace(
        const std::vector<std::vector<int> > & VV,
        const int & source,
        const int & target,
        const std::vector<double> & Weights,
        std::vector<int> & path
    );
    

    bool split_detect(
        const Eigen::MatrixXi & F,
        const Eigen::MatrixXi & TT, // triangle-triangle adjacency
        const std::vector<int> & node_list,
        const std::vector<bool> & VCuts, // indicate whether a vertex is on the boundary
        const std::vector<std::vector<bool> > & TCuts, // indicate whether wich edge of a face is on the boundary
        std::pair<int, int> & splits
    );


    bool determin_adj_configure1(
        const Eigen::MatrixXi & F, 
        const std::vector<std::vector<int > > & VF, 
        const int uidx, 
        const int vidx,
        int & fupidx,
        int & fdownidx,
        int & vupidx,
        int & vdownidx);

    void splits_update(
        const std::pair<int, int> & splits,
        Eigen::MatrixXd & Vraw, // raw mesh
        Eigen::MatrixXi & Fraw,
        Eigen::VectorXi & FL,
        std::vector<bool> & VCuts, // indicate whether a vertex is on the boundary
        std::vector<std::vector<bool> > & TCuts,
        std::vector<std::vector<int> > & VV // adjacency list on Fraw, posibly some ofthem has been silenced
    );

    void trace_and_label(
        const Eigen::MatrixXd & V_bad,
        const Eigen::MatrixXi & F_bad,
        const Eigen::VectorXi & FL_bad,
        Eigen::MatrixXd & V_good,
        Eigen::MatrixXi & F_good,
        Eigen::VectorXi & FL_good,
        int & key
    );

    
}
}

#endif // BCCLEAN_DIJKSTAR_TRACING_H
