#include "patch.h"
#include "planar_cut_simply_connect.h"
#include "recursive_cut.h"
#include "patch_cut_relabel.h"
#include "non_vertex_manifold_relabel.h"
#include <unordered_map>
#include <igl/boundary_loop.h>
#include <igl/remove_unreferenced.h>
#include <igl/is_vertex_manifold.h>
namespace bcclean{
    // all the static member must be defined out side the class scope
    // because they are intrinsically not part of thec class
    Eigen::MatrixXd patch::Vbase;
    Eigen::MatrixXi patch::Fbase;
    Eigen::MatrixXd patch::V_mod;
    Eigen::MatrixXi patch::F_mod;
    std::vector<node> patch::node_list; // list of all nodes
    std::vector<edge> patch::edge_list; // list of all edges;
    int patch::total_label_num;
    Eigen::VectorXi patch::FL; // a copy of initial face labels
    Eigen::VectorXi patch::FL_mod; // Face labels after modification

    void patch::SetStatics(const Eigen::MatrixXd & Vbase_in, const Eigen::MatrixXi & Fbase_in, const Eigen::VectorXi & FL_in, size_t total_label_num_in){
        Vbase = Vbase_in;
        Fbase = Fbase_in;
        FL = FL_in;
        FL_mod = FL;
        total_label_num =total_label_num_in;
        std::unordered_map<int, std::vector<int> > patch_edge_dict;
        std::unordered_map<int, std::vector<bool> > patch_edge_direc_dict;
        bcclean::build_edge_list(Vbase, Fbase, FL, total_label_num, edge_list, patch_edge_dict);
        // initialize edge_list
        std::unordered_map<int, std::vector<int>> _vertex_label_list_dict;
        bcclean::build_vertex_label_list_dict(Fbase, FL, total_label_num, _vertex_label_list_dict);
        for(auto item: _vertex_label_list_dict){
            if(item.second.size()>2){
                // it is a node
                node nd;
                nd.initialize(total_label_num, item.first, Vbase.row(item.first), item.second);
                node_list.push_back(nd);
            }
        }
    }

    void CollectPatches(){
        // this function must be called after SetSattics
        // check all set otherwise exit with failure
        // when collecting the patches , it could split the edges whose two nodes are on boundaries while itself is not part of boundary
        if(patch::total_label_num<=0){
            std::cout << "Static members not initialized, abort" <<std::endl;
            exit(EXIT_FAILURE);
        }
        // else do 
        std::map<int, int> label_count_dict; // count how many faces are there in a label patch recorded for resizing only
        std::map<int, Eigen::MatrixXi> label_faces_dict;
        std::map<int, Eigen::VectorXi> label_FI_dict;
        for(int lb = 0; lb < patch::total_label_num; ++lb){
            label_count_dict[lb] =0;
            label_faces_dict[lb] = Eigen::MatrixXi::Zero(patch::Fbase.rows(),3);
            label_FI_dict[lb] = Eigen::VectorXi::Zero(patch::Fbase.rows());
        }
        for(int fidx =0 ; fidx < patch::FL.rows(); ++fidx){
            int lb = patch::FL(fidx);
            label_faces_dict[lb].row(label_count_dict[lb])=patch::Fbase.row(fidx);
            label_FI_dict[lb](label_count_dict[lb])= fidx;
            label_count_dict[lb]+=1;
        }
        for(int lb = 0; lb < patch::total_label_num; ++lb){
            label_faces_dict[lb].conservativeResize(label_count_dict[lb],3);
            label_FI_dict[lb].conservativeResize(label_count_dict[lb]);
        }
        int total_label_num_dummy = patch::total_label_num;
        
        for(int lb =0; lb < patch::total_label_num; ++ lb){
            Preprocess::recursive_cut(patch::Vbase, patch::Fbase,patch::FL_mod,label_faces_dict,label_FI_dict,lb);
       
        }
        std::cout << "patch relabel finished" << std::endl;
        patch::total_label_num = total_label_num_dummy;
    }
}