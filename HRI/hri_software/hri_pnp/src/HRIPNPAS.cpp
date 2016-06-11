#include <boost/thread/thread.hpp>

#include <actionlib/server/simple_action_server.h>
#include <actionlib/client/simple_action_client.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <boost/algorithm/string.hpp>
#include <tcp_interface/RCOMMessage.h>
#include <laser_analysis/LaserObstacleMap.h>

#include "topics.h"

#include "HRIPNPAS.h"

HRIPNPActionServer::HRIPNPActionServer(ros::NodeHandle n) : PNPActionServer(), handle(n), handlep("~")  
{
    event_pub = handle.advertise<std_msgs::String>(TOPIC_PNPCONDITION, 10);
    plantoexec_pub = handle.advertise<std_msgs::String>(TOPIC_PLANTOEXEC, 100);
    rcom_pub= handle.advertise<tcp_interface::RCOMMessage>(TOPIC_RCOMMESSAGE,10);

    register_action("wait",&HRIPNPActionServer::wait,this);
    register_action("turn",&HRIPNPActionServer::turn,this);
    register_action("goto",&HRIPNPActionServer::followcorridor,this);
    register_action("move",&HRIPNPActionServer::goto_movebase,this);
    register_action("say",&HRIPNPActionServer::say,this);
    register_action("ask",&HRIPNPActionServer::ask,this);
    register_action("display",&HRIPNPActionServer::display,this);
    register_action("restart",&HRIPNPActionServer::restart,this);

    register_action("followcorridor",&HRIPNPActionServer::followcorridor,this);
    register_action("followperson",&HRIPNPActionServer::followperson,this);

    register_action("greetperson", &HRIPNPActionServer::say, this);
    //register_action("gesturerecog", &HRIPNPActionServer::gesture_recog, this);

    handle.param("robot_name",robotname,string("diago"));

    listener = new tf::TransformListener();

    ac_movebase = NULL; ac_turn = NULL; ac_followcorridor = NULL; ac_followperson = NULL;

    
    laser_obsmap_sub = handle.subscribe(TOPIC_LASER_OBSMAP, 10, &HRIPNPActionServer::laserobsmapCallback, this);
    tcp_sub = handle.subscribe(TOPIC_RCOMMESSAGE, 10, &HRIPNPActionServer::tcpCallback, this);
/*
    // bg subtraction

    pMog = new cv::BackgroundSubtractorMOG(); //MOG Approach

    kinect_sub = handle.subscribe(TOPIC_KINECT_RGB, 1, &HRIPNPActionServer::rgbCallback, this);

/**/
    // try with webcam
    // computing detector's path


    //webcam_sub = handle.subscribe(TOPIC_WEBCAM, 1, &HRIPNPActionServer::camCallback, this);

        
    PNP_cond_pub = handle.advertise<std_msgs::String>(TOPIC_PNPCONDITION, 100);

}






