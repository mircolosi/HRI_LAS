#include <boost/thread/mutex.hpp>
#include <tf/transform_listener.h>
#include <tcp_interface/RCOMMessage.h>
#include <iostream>

#include "HRIPNPAS.h"
#include "topics.h"

#define RAD(a) ((a)/180.0*M_PI)
#define DEG(a) ((a)*180.0/M_PI)


using namespace std;

bool HRIPNPActionServer::getRobotPose(std::string robotname, double &x, double &y, double &th_rad) {
    if (listener==NULL) {
        listener = new tf::TransformListener();
    }

    string src_frame = "/map";
    string dest_frame = "/" + robotname + "/base_frame";
    if (robotname=="") { // local trasnformation
        src_frame = "map";
        dest_frame = "base_link";
    }

    tf::StampedTransform transform;
    try {
        listener->waitForTransform(src_frame, dest_frame, ros::Time(0), ros::Duration(3));
        listener->lookupTransform(src_frame, dest_frame, ros::Time(0), transform);
    }
    catch(tf::TransformException ex) {
        th_rad = 999999;
        ROS_ERROR("Error in tf trasnform %s -> %s\n",src_frame.c_str(), dest_frame.c_str());
        ROS_ERROR("%s", ex.what());
        return false;
    }
    x = transform.getOrigin().x();
    y = transform.getOrigin().y();
    th_rad = tf::getYaw(transform.getRotation());

    return true;
}


bool HRIPNPActionServer::getLocationPosition(string loc, double &GX, double &GY) {


    if (loc=="home") {
        GX = 2.0; GY = 2.0;
        ROS_INFO_STREAM("Location " << loc << " at " << GX  << " , " << GY);
    }
    else if (loc=="RoomB115") {
        GX = 8.0; GY = 1.8;
        ROS_INFO_STREAM("Location " << loc << " at " << GX  << " , " << GY);      
    }
    else {
        ROS_ERROR_STREAM("Location "<<loc<<" unknown.");
        return false;
    }

    return true;
}



/*
 * ACTIONS
 */


void HRIPNPActionServer::turn(string params, bool *run) {

  if (!run) return;

  cout << "### Executing Turn " << params << " ... " << endl;

  float th_deg = atof(params.c_str());
  do_turn(th_deg,run);

  cout << "### Turn " << params << ((*run)?" Completed":" Aborted") << endl;
}

void HRIPNPActionServer::followcorridor(string params, bool *run) {

  if (!run) return;

  cout << "### Executing Follow Corridor " << params << " ... " << endl;

  double GX,GY;
  if (getLocationPosition(params,GX,GY)) {
      do_follow_corridor(GX,GY,run);
  }
  else 
    ROS_WARN("Follow Corridor: Cannot find location %s.",params.c_str());

  cout << "### Follow Corridor " << params << ((*run)?" Completed":" Aborted") << endl;

}

void HRIPNPActionServer::followperson(string params, bool *run) {

  if (!run) return;

  cout << "### Executing Follow Person " << params << " ... " << endl;

  do_follow_person(run);

  cout << "### Follow Person " << params << ((*run)?" Completed":" Aborted") << endl;

}


void HRIPNPActionServer::goto_movebase(string params, bool *run) {

  cout << "### Executing Move " << params << " ... " << endl;

  double GX,GY;
  if (getLocationPosition(params,GX,GY)) {
    do_movebase(GX,GY,0,run);
  }
  else 
    ROS_WARN("Move: Cannot find location %s.",params.c_str());

  cout << "### Move " << params << ((*run)?" Completed":" Aborted") << endl;

}


void HRIPNPActionServer::say(string params, bool *run) {
  cout << "### Executing Say " << params << " ... " << endl;

  // Using speech-dispatcher
  string cmd = "spd-say "+params;
  //string cmd = "spd-say \"Hi everybody\"";
  system(cmd.c_str());
  
  int sleeptime=4; // *0.5 sec.
  while (*run && sleeptime-->0 && ros::ok())
    ros::Duration(0.5).sleep();

  cout << "### Say " << params << ((*run)?" Completed":" Aborted") << endl;

}

void HRIPNPActionServer::ask(string params, bool *run) {
  cout << "### Executing Ask " << params << " ... " << endl;

  string to_send = "ask_" + params;
  tcp_interface::RCOMMessage message_to_send;
  message_to_send.robotsender= "diago";
  message_to_send.robotreceiver="all";
  message_to_send.value= to_send;
  rcom_pub.publish(message_to_send);

  say(params, run);

  cout << "### Ask " << params << ((*run)?" Completed":" Aborted") << endl;

}


void HRIPNPActionServer::display(string params, bool *run) {
  cout << "### Executing Display " << params << " ... " << endl;
  
  
  // non-terminating action
  //while (*run && ros::ok())
  //  ros::Duration(0.5).sleep();

  // send through tcp_interface a string "display_{text|image|video}_arg"
  
  string to_send = "display_" + params;
  tcp_interface::RCOMMessage message_to_send;
  message_to_send.robotsender= "diago";
  message_to_send.robotreceiver="all";
  message_to_send.value= to_send;
  rcom_pub.publish(message_to_send);
  
  say(params, run);

  cout << "### Display " << params << ((*run)?" Completed":" Aborted") << endl;

}


void HRIPNPActionServer::wait(string params, bool *run)
{
    // ROS_INFO_STREAM("### Executing Wait action " << params << " ... ");
/*
    int sleeptime=1; // * 0.2 sec.
    while (*run && sleeptime-->0)
        ros::Duration(0.2).sleep();
*/

    ros::Duration(0.1).sleep();
/*
    if (*run)
        ROS_INFO("### Finished Wait");
    else
        ROS_INFO("### Aborted Wait");
*/
}

void HRIPNPActionServer::none(string params, bool *run)
{
    ROS_INFO_STREAM("### Executing no action ###");
}

void HRIPNPActionServer::restart(string params, bool *run)
{
    ROS_INFO_STREAM("### Executing Restart action " << params << " ... ");

    // publish planToExec to start the plan
    string planname = "AUTOGENpolicy";
    std_msgs::String s;
    s.data = planname;
    plantoexec_pub.publish(s); // start the new one

    cout << "### Restart " << params << ((*run)?" Completed":" Aborted") << endl;
}



void HRIPNPActionServer::do_movebase(float GX, float GY, float GTh_DEG, bool *run) { // theta in degrees

  mtx_movebase.lock();

  if (ac_movebase==NULL) { //create the client only once
    // Define the action client (true: we want to spin a thread)
    ac_movebase = new actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction>(TOPIC_MOVE_BASE, true);

    // Wait for the action server to come up
    while(!ac_movebase->waitForServer(ros::Duration(5.0))){
	    ROS_INFO("Waiting for move_base action server to come up");
    }
  }

  // Read time
  double secs =ros::Time::now().toSec();
  while (secs==0) {  // NEEDED OTHERWISE CLOCK WILL BE 0 AND GOAL_ID IS NOT SET CORRECTLY
	  ROS_ERROR_STREAM("Time is null: " << ros::Time::now());
	  ros::Duration(1.0).sleep();
      secs =ros::Time::now().toSec();
  }

  // Set the goal (MAP frame)
  move_base_msgs::MoveBaseGoal goal;

  goal.target_pose.header.frame_id = "/map";
  goal.target_pose.header.stamp = ros::Time::now();

  goal.target_pose.pose.position.x = GX;
  goal.target_pose.pose.position.y = GY;
  goal.target_pose.pose.orientation.z = sin(RAD(GTh_DEG)/2);
  goal.target_pose.pose.orientation.w = cos(RAD(GTh_DEG)/2);

  // Send the goal
  // ROS_INFO("Sending goal");
  ac_movebase->sendGoal(goal);

  // Wait for termination (check distance every delay seconds)
  double delay = 0.1;
  double d_threshold=0.5, d=d_threshold+1.0;
  while (!ac_movebase->waitForResult(ros::Duration(delay)) && (*run) && (d>d_threshold)) {
    // ROS_INFO("Running...");
    double RX,RY,RTH;
    if (getRobotPose(robotname, RX, RY, RTH))
      d = fabs(GX-RX)+fabs(GY-RY);
  }

  // Cancel all goals (NEEDED TO ISSUE NEW GOALS LATER)
  ac_movebase->cancelAllGoals(); ros::Duration(0.2).sleep(); // wait a little

  mtx_movebase.unlock();
}



void HRIPNPActionServer::do_turn(float GTh_DEG, bool *run) {

    if (ac_turn==NULL) {
      ac_turn = new actionlib::SimpleActionClient<rococo_navigation::TurnAction>(TOPIC_TURN, true);

      while(!ac_turn->waitForServer(ros::Duration(5.0))){
              ROS_INFO("Waiting for turn action server to come up");
      }
    }

    rococo_navigation::TurnGoal goal;

    goal.target_angle = GTh_DEG;
    goal.absolute_relative_flag = "ABS";
    goal.max_ang_vel = 50.0;  // deg/s

    // Send the goal
    ROS_INFO("Sending goal TURN %f", GTh_DEG);
    ac_turn->cancelAllGoals(); ros::Duration(1).sleep();
    ac_turn->sendGoal(goal);

    while (!ac_turn->waitForResult(ros::Duration(0.5)) && (*run)){
       // ROS_INFO("Turning...");
    }
    ac_turn->cancelAllGoals();
}



void HRIPNPActionServer::do_follow_corridor(float GX, float GY, bool *run) {

  if (ac_followcorridor==NULL) {
    // Define the action client (true: we want to spin a thread)
    ac_followcorridor = new actionlib::SimpleActionClient<rococo_navigation::FollowCorridorAction>(TOPIC_FOLLOWCORRIDOR, true);

    // Wait for the action server to come up
    while(!ac_followcorridor->waitForServer(ros::Duration(5.0))){
            ROS_INFO("Waiting for follow_corridor action server to come up");
    }
  }

  // Read time
  double secs =ros::Time::now().toSec();
  while (secs==0) {  // NEEDED OTHERWISE CLOCK WILL BE 0 AND GOAL_ID IS NOT SET CORRECTLY
      ROS_ERROR_STREAM("Time is null: " << ros::Time::now());
      ros::Duration(1.0).sleep();
    secs =ros::Time::now().toSec();
  }

  // Set the goal (MAP frame)
  rococo_navigation::FollowCorridorGoal goal;
  goal.target_X = GX;  goal.target_Y = GY;   // goal
  goal.max_vel = 0.7;  // m/s

  // Send the goal
  ROS_INFO("Sending goal");
  ac_followcorridor->sendGoal(goal);

  // Wait for termination
  double d_threshold=0.5, d=d_threshold+1.0;
  while (!ac_followcorridor->waitForResult(ros::Duration(0.5)) && (*run) && (d>d_threshold)) {
    // ROS_INFO("Running...");
    // double RX,RY,RTH;
  }

  // Cancel all goals (NEEDED TO ISSUE NEW GOALS LATER)
  ac_followcorridor->cancelAllGoals(); ros::Duration(1).sleep(); // wait 1 sec
}


void HRIPNPActionServer::do_follow_person(bool *run) {

    double max_vel = 1.0; 

    if (ac_followperson==NULL) {
        ac_followperson = new actionlib::SimpleActionClient<rococo_navigation::FollowPersonAction>(TOPIC_FOLLOWPERSON, true);
    }

    // Wait for the action server to come up
    while(!ac_followperson->waitForServer(ros::Duration(5.0))){
        ROS_INFO("Waiting for follow_person action server to come up");
    }

    // Cancel all goals (JUST IN CASE SOME GOAL WAS NOT CLOSED BEFORE)
    ac_followperson->cancelAllGoals(); ros::Duration(1).sleep(); // wait 1 sec

    // Set the goal
    rococo_navigation::FollowPersonGoal goal;
    goal.target_X = 0;  goal.target_Y = 0;   // unused so far
    goal.max_vel = max_vel;  // m/s

    // Send the goal
    ROS_INFO("Sending goal");
    ac_followperson->sendGoal(goal);

	  // Wait for termination
    while (!ac_followperson->waitForResult(ros::Duration(0.25)) && (*run)) {
	    // ROS_INFO_STREAM("Running... [" << ac_followperson.getState().toString() << "]");
    }
    // ROS_INFO_STREAM("Finished [" << ac.getState().toString() << "]");

    // Print result
    if (ac_followperson->getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
        ROS_INFO("FollowPerson successful");
    else
        ROS_INFO("FollowPerson failed");

    // Cancel all goals (NEEDED TO ISSUE NEW GOALS LATER)
    ac_followperson->cancelAllGoals(); ros::Duration(1).sleep(); // wait 1 sec

}

