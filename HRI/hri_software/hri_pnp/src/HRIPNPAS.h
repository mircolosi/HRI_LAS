#ifndef __HRIPNPAS_H__
#define __HRIPNPAS_H__

#include <ros/ros.h>
#include <ros/package.h>
#include <actionlib/server/simple_action_server.h>
#include <actionlib/client/simple_action_client.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <tf/transform_listener.h>
#include <std_msgs/String.h>

#include <pnp_ros/PNPActionServer.h>
#include <rococo_navigation/TurnAction.h>
#include <rococo_navigation/FollowCorridorAction.h>
#include <rococo_navigation/FollowPersonAction.h>

#include <tcp_interface/RCOMMessage.h>
#include <laser_analysis/LaserObstacleMap.h>

#include <map>
#include <boost/thread/thread.hpp>



typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;


class HRIPNPActionServer : public PNPActionServer
{
private:
    ros::NodeHandle handle, handlep;
    ros::Publisher event_pub, plantoexec_pub, hri_pub, rcom_pub;
    tf::TransformListener* listener;

    // action clients
    actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> *ac_movebase;
    actionlib::SimpleActionClient<rococo_navigation::TurnAction> *ac_turn;
    actionlib::SimpleActionClient<rococo_navigation::FollowCorridorAction> *ac_followcorridor;
    actionlib::SimpleActionClient<rococo_navigation::FollowPersonAction> *ac_followperson;

    // condition subscribers
    ros::Subscriber laser_obsmap_sub; // receiving data from laser_analysis
    ros::Subscriber tcp_sub; // receiving data from tcp_interface

    //ros::Subscriber kinect_sub;
    ros::Subscriber webcam_sub;

    ros::Publisher PNP_cond_pub;
    
    std::string robotname;
    boost::mutex mtx_movebase;

public:

    HRIPNPActionServer(ros::NodeHandle n);

    virtual int evalCondition(string cond);

    // Get current robot pose
    bool getRobotPose(string robotname, double &x, double &y, double &th_rad);

    // Get coordinates of semantic location
    bool getLocationPosition(string loc, double &GX, double &GY);

    /*
     * ACTIONS
     */
    void advertise(string params, bool *run);
    void advertiseComplex(string params, bool *run);
    void interact(string params, bool *run);
    void swipe(string params, bool *run);
    void wait(string params, bool *run);
    void goto_movebase(string params, bool *run);
    void turn(string params, bool *run);
    void followcorridor(string params, bool *run);
    void followperson(string params, bool *run);
    void say(string params, bool *run);
    void ask(string params, bool *run);
    void display(string params, bool *run);
    void none(string params, bool *run);
    void restart(string params, bool *run);
    
    void do_movebase(float GX, float GY, float GTh_DEG, bool *run);
    void do_turn(float GTh_DEG, bool *run);
    void do_follow_corridor(float GX, float GY, bool *run);
    void do_follow_person(bool *run);

    
    /*
     * CONDITIONS CALLBACKS
     */
    
    void laserobsmapCallback(laser_analysis::LaserObstacleMap msg);
    void tcpCallback(tcp_interface::RCOMMessage msg);

    /*
    cv::Ptr<cv::BackgroundSubtractor> pMog;
    cv::Mat frame;
    cv::Mat fgMask;

    void rgbCallback(const sensor_msgs::ImageConstPtr& msg);
    
    std::string pkg_path, cascadeName, nestedCascadeName;

    void camCallback(const sensor_msgs::ImageConstPtr& msg);

    
/**/


};

#endif
