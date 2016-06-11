#include <boost/algorithm/string.hpp>

#include "HRIPNPAS.h"
#include "topics.h"

using namespace std;


void HRIPNPActionServer::laserobsmapCallback(laser_analysis::LaserObstacleMap msg) {
    
    //    cout << "laser obstacle: " << msg << endl;
    
    bool r = (msg.npoints>5 && msg.mx<1.3);
    string param = PARAM_PNPCONDITIONBUFFER + string("personhere");
    handle.setParam(param, r?1:0);
}


void HRIPNPActionServer::tcpCallback(tcp_interface::RCOMMessage msg) {
    string sm = msg.value;
    if (sm!="") {
        boost::algorithm::to_lower(sm);
        cout << "Received from ASR: " << sm << endl;
        vector<string> toks;
        boost::split(toks,sm,boost::is_any_of("()\" \n\r"));
        if (toks.size()>1) {
            vector<string>::iterator it = toks.begin();
            string pre = *it++; // should be eityher 'button' or 'asr'
            string frame = "-";
            if (pre=="asr") {
                frame = *it++;
            }
            string value = "-";
            for ( ; it!=toks.end(); it++){
                if (*it!="") {
                    value = *it; break;
                }
            }
            cout << "Tokenize from ASR: " << toks.size() << " - " << pre << " - " << frame << " - " << value << endl;
            std_msgs::String out;
            out.data = value;
            PNP_cond_pub.publish(out);
            cout << "Published PNP condition from ASR: " << out.data << endl;
        }
    }
}


int HRIPNPActionServer::evalCondition(string cond) {
    
    // when this function returns -1, the condition is evaluated from
    // the events published to PNPConditionEvent
    return -1;
}

/*

void HRIPNPActionServer::rgbCallback(const sensor_msgs::ImageConstPtr& msg)
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
                    cout<<"Publishing topic"<<endl;
                    

                    system("rostopic pub /diago/PNPConditionEvent std_msgs/String \"data: \'personAt_RoomB115\'\" --once");
                }
            }//area
            
        }//contours
        
    }//at least one contour
    
    cv::imshow("RGB", frame);
    cv::imshow("FgMask", fgMask);
    cv::waitKey(30);
}



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

void HRIPNPActionServer::camCallback(const sensor_msgs::ImageConstPtr& msg){
    
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
        string param = PARAM_PNPCONDITIONBUFFER + string("personhere");
        if (detected_face)
        {
          cout<<"[personhere]"<<endl;
          
          handle.setParam(param, 1);
          //system("rostopic pub /diago/PNPConditionEvent std_msgs/String \"data: \'personhere\'\" --once");
        } else {

          cout << "[not present]" << endl;
          handle.setParam(param,0);
        }



    }
    else return;
}


/**/