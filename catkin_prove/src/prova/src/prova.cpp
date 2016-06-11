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
#include <opencv2/objdetect/objdetect.hpp>


#include <cctype>
#include <iostream>
#include <iterator>
#include <stdio.h>


using namespace std;
using namespace cv;



void detectAndDraw( Mat& img, CascadeClassifier& cascade,
  CascadeClassifier& nestedCascade);

static const std::string OPENCV_WINDOW = "Image window";
string cascadeName = "/home/parallels/catkin_prove/haarcascade_frontalface_default.xml";
string nestedCascadeName = "/home/parallels/catkin_prove/haarcascade_eye_tree_eyeglasses.xml";

void camCallback(const sensor_msgs::ImageConstPtr& msg){

  cv_bridge::CvImagePtr cv_ptr;
  Mat frame, frameCopy, image;
  try
  {
    cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("cv_bridge exception: %s", e.what());
    return;
  }

  CascadeClassifier cascade, nestedCascade;

  if( !cascade.load( cascadeName ) )
  {
    cerr << "ERROR: Could not load classifier cascade" << endl;
    system("pwd");
    return;
  }
  if (!nestedCascade.load(nestedCascadeName))
  {
    cerr << "ERROR: Could not load nested classifier cascade" << endl;
    return;
  }
  
  frame = cv_ptr->image;
  if( !frame.empty() ){

    //flip( frame, frameCopy, 0 );

    detectAndDraw( frame, cascade, nestedCascade);
    cv_ptr->image = frameCopy;
    cv::imshow(OPENCV_WINDOW, frame);
    cv::waitKey(3);
  }
  else return;

    // Output modified video stream
    //image_pub_.publish(cv_ptr->toImageMsg());
}


void detectAndDraw( Mat& img, CascadeClassifier& cascade,
  CascadeClassifier& nestedCascade)
{
  int i = 0;
  double t = 0;
  double scale = 1.0;
  vector<Rect> faces, faces2;
  const static Scalar colors[] =  { CV_RGB(0,0,255),
    CV_RGB(0,128,255),
    CV_RGB(0,255,255),
    CV_RGB(0,255,0),
    CV_RGB(255,128,0),
    CV_RGB(255,255,0),
    CV_RGB(255,0,0),
    CV_RGB(255,0,255)} ;
    Mat gray, smallImg( cvRound (img.rows/scale), cvRound(img.cols/scale), CV_8UC1 );

    cvtColor( img, gray, CV_BGR2GRAY );
    resize( gray, smallImg, smallImg.size(), 0, 0, INTER_LINEAR );
    equalizeHist( smallImg, smallImg );

    t = (double)cvGetTickCount();
    cascade.detectMultiScale( smallImg, faces,
        1.1, //scaleFactor
    5, //minNeighbors
    0
    |CV_HAAR_FIND_BIGGEST_OBJECT
        //|CV_HAAR_DO_ROUGH_SEARCH
    |CV_HAAR_SCALE_IMAGE
        , //flags
        Size(30, 30) ); //minSize

    t = (double)cvGetTickCount() - t;
    // printf( "detection time = %g ms\n", t/((double)cvGetTickFrequency()*1000.) );
    
    for( vector<Rect>::const_iterator r = faces.begin(); r != faces.end(); r++, i++ )
    {
      Mat smallImgROI;
      vector<Rect> nestedObjects;
      Point center;
      Scalar color = colors[i%8];
      int radius;

      double aspect_ratio = (double)r->width/r->height;
      if( 0.75 < aspect_ratio && aspect_ratio < 1.3 )
      {
        center.x = cvRound((r->x + r->width*0.5)*scale);
        center.y = cvRound((r->y + r->height*0.5)*scale);
        radius = cvRound((r->width + r->height)*0.25*scale);
            //circle( img, center, radius, color, 3, 8, 0 );
        rectangle( img, cvPoint(cvRound(r->x*scale), cvRound(r->y*scale)),
         cvPoint(cvRound((r->x + r->width-1)*scale), cvRound((r->y + r->height-1)*scale)),
         color, 3, 8, 0);
      }
      else
        rectangle( img, cvPoint(cvRound(r->x*scale), cvRound(r->y*scale)),
         cvPoint(cvRound((r->x + r->width-1)*scale), cvRound((r->y + r->height-1)*scale)),
         color, 3, 8, 0);
      if( nestedCascade.empty() )
        continue;
      smallImgROI = smallImg(*r);
      nestedCascade.detectMultiScale( smallImgROI, nestedObjects,
        1.1, 2, 0
            //|CV_HAAR_FIND_BIGGEST_OBJECT
            //|CV_HAAR_DO_ROUGH_SEARCH
            //|CV_HAAR_DO_CANNY_PRUNING
        |CV_HAAR_SCALE_IMAGE
        ,
        Size(30, 30) );
      for( vector<Rect>::const_iterator nr = nestedObjects.begin(); nr != nestedObjects.end(); nr++ )
      {
        center.x = cvRound((r->x + nr->x + nr->width*0.5)*scale);
        center.y = cvRound((r->y + nr->y + nr->height*0.5)*scale);
        radius = cvRound((nr->width + nr->height)*0.25*scale);
        circle( img, center, radius, color, 3, 8, 0 );
      }
    }
    cv::imshow( "result", img );
  }

  int main(int argc, char** argv)
  {
   ros::init(argc, argv, "webcam");

   ros::NodeHandle n;
   ros::Subscriber sub = n.subscribe("/usb_cam/image_raw", 1, camCallback);

   ros::spin();
   return 0;
 }