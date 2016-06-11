/* Sapienza University of Rome 
 * 
 * Robot Programming
 * Section of Elective in Artificial Intelligence (Complementi di Intelligenza Artificiale)
 * Master Artificial Intelligence and Robotics (Laurea Magistrale in Intelligenza Artificiale e Robotica)
 * A.A. 2014/2015
 *
 * Image processing with OpenCV 
 *
 * Domenico D. Bloisi and Andrea Pennisi
 *
 * bloisi@dis.uniroma1.it pennisi@dis.uniroma1.it
 *
 * This code is provided without any warranty about its usability. It is for educational purposes and should be regarded as such.
 *
 */

//ROS
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
//OpenCV
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
//BG SUBTRACTION
#include <opencv2/video/background_segm.hpp>

cv::Ptr<cv::BackgroundSubtractor> pMog;
cv::Mat frame;
cv::Mat fgMask;

void rgbCallback(const sensor_msgs::ImageConstPtr& msg)
{
  cv_bridge::CvImageConstPtr cv_ptr;
  try
  {
	cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
  }
  catch (cv_bridge::Exception& ex)
  {
	ROS_ERROR("cv_bridge exception: %s", ex.what());
	exit(-1);
  }


  frame = cv_ptr->image.clone();
  pMog->operator()(frame, fgMask);
  




  std::vector<std::vector<cv::Point> > contours;
  std::vector<cv::Vec4i> hierarchy;

  findContours(fgMask.clone(), contours, hierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);

  if (contours.size() > 0) {

      std::vector<std::vector<cv::Point> > contours_poly(contours.size());
      std::vector<cv::Rect> boundRect(contours.size());
      std::vector<cv::Point2f>center(contours.size());
      std::vector<float>radius(contours.size());


      for (unsigned int idx = 0; idx < contours.size(); idx++)
      {
          const std::vector<cv::Point>& c = contours[idx];
          double area = fabs(cv::contourArea(cv::Mat(c)));
          if (area > 20000) {

              cv::approxPolyDP(cv::Mat(c), contours_poly[idx], 3, true);
              boundRect[idx] = cv::boundingRect(cv::Mat(contours_poly[idx]));
              cv::minEnclosingCircle((cv::Mat)contours_poly[idx], center[idx], radius[idx]);


              //Scalar color(rand() & 255, rand() & 255, rand() & 255);
              cv::Scalar color(80, 80, 80);
              cv::drawContours(fgMask, contours, idx, color, CV_FILLED, 8, hierarchy);

              cv::rectangle(frame, boundRect[idx].tl(), boundRect[idx].br(), CV_RGB(0,0,0), 2, 8, 0);

                if(boundRect[idx].tl().y < 200) {
                    cv::rectangle(frame, boundRect[idx].tl(), boundRect[idx].br(), CV_RGB(255,0,0), 6, 8, 0);
                    system("rostopic pub /diago/PNPConditionEvent std_msgs/String \"data: \'personAt_RoomB115\'\" --once");
                }
          }//area

      }//contours

  }//at least one contour

  cv::imshow("RGB", frame);
  cv::imshow("FgMask", fgMask);
  cv::waitKey(30);
}


void depthCallback(const sensor_msgs::ImageConstPtr& msg)
{
  cv_bridge::CvImageConstPtr cv_ptr;
  try
  {
	 cv_ptr = cv_bridge::toCvCopy(msg, 
				sensor_msgs::image_encodings::TYPE_32FC1);
  }
  catch (cv_bridge::Exception& ex)
  {
  	ROS_ERROR("cv_bridge exception: %s", ex.what());
   	exit(-1);
  }

  cv::imshow("DEPTH", cv_ptr->image);
  cv::waitKey(30);
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "kinectgrabber");

    pMog = new cv::BackgroundSubtractorMOG(); //MOG Approach

    ros::NodeHandle n;
    ros::Subscriber sub = 
		n.subscribe("/camera/rgb/image_color", 1, rgbCallback);
    //ros::Subscriber depth = 
	//	n.subscribe("/camera/depth/image", 1, depthCallback);
    ros::spin();
    return 0;
}
