#include <stdio.h>

#include <ros/package.h>

#include "topics.h"

#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <std_msgs/String.h>

//OpenCV
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/objdetect/objdetect.hpp>

//BG SUBTRACTION
#include <opencv2/video/background_segm.hpp>

using namespace cv;
using namespace std;

std::string pkg_path, cascadeName, nestedCascadeName;
static const std::string OPENCV_WINDOW = "Image window";
ros::Publisher condition_pub;


void detectAndDraw( Mat& img, CascadeClassifier& cascade, CascadeClassifier& nestedCascade, bool& detected_face)
{
    int i = 0;
    double t = 0;
    double scale = 1.0;
    vector<Rect> faces, faces2;
    int nestedObjectsSize;
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
        nestedObjectsSize =  nestedObjects.size();
        for( vector<Rect>::const_iterator nr = nestedObjects.begin(); nr != nestedObjects.end(); nr++ )
        {
            center.x = cvRound((r->x + nr->x + nr->width*0.5)*scale);
            center.y = cvRound((r->y + nr->y + nr->height*0.5)*scale);
            radius = cvRound((nr->width + nr->height)*0.25*scale);
            circle( img, center, radius, color, 3, 8, 0 );
        }
    }

    if (faces.size() > 0 && nestedObjectsSize > 0 )
      detected_face = true;
}


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
        cout << cascadeName << endl;
        return;
    }
    if (!nestedCascade.load(nestedCascadeName))
    {
        cerr << "ERROR: Could not load nested classifier cascade" << endl;
        return;
    }
    
    frame = cv_ptr->image;
    if( !frame.empty() ){
        bool detected_face = false;
        detectAndDraw( frame, cascade, nestedCascade, detected_face);
        cv_ptr->image = frame;
        cv::imshow(OPENCV_WINDOW, cv_ptr->image);
        cv::waitKey(3);
        //string param = PARAM_PNPCONDITIONBUFFER + string("personhere");
        std_msgs::String send_msg;

        std::string cond = "personhere";
        if (detected_face)
        {
          cout<<"[personhere]"<<endl;
          send_msg.data = cond;

          //ROS_INFO("%s", send_msg.data.c_str());

          //handle.setParam(param, 1);
          //system("rostopic pub /diago/PNPConditionEvent std_msgs/String \"data: \'personhere\'\" --once");
          condition_pub.publish(send_msg);


        } 
        else {

          cout << "[not present]" << endl;
          //handle.setParam(param,0);
        }
/**/


    }
    else return;
}


int main(int argc, char **argv)
{
	/* code */
	ros::init(argc, argv, "gesture_recogniotion");

	ros::NodeHandle n;

	condition_pub = n.advertise<std_msgs::String>(TOPIC_PNPCONDITION,100);

	

	pkg_path = ros::package::getPath("hri_pnp");
    cascadeName = pkg_path + "/detector/haarcascade_frontalface_default.xml";
    nestedCascadeName = pkg_path + "/detector/haarcascade_eye_tree_eyeglasses.xml";

	ros::Subscriber webcam_sub = n.subscribe(TOPIC_CAM, 1, camCallback);

	ros::spin();;

	return 0;
}