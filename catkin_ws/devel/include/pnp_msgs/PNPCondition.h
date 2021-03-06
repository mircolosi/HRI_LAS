// Generated by gencpp from file pnp_msgs/PNPCondition.msg
// DO NOT EDIT!


#ifndef PNP_MSGS_MESSAGE_PNPCONDITION_H
#define PNP_MSGS_MESSAGE_PNPCONDITION_H

#include <ros/service_traits.h>


#include <pnp_msgs/PNPConditionRequest.h>
#include <pnp_msgs/PNPConditionResponse.h>


namespace pnp_msgs
{

struct PNPCondition
{

typedef PNPConditionRequest Request;
typedef PNPConditionResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct PNPCondition
} // namespace pnp_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::pnp_msgs::PNPCondition > {
  static const char* value()
  {
    return "1ecc39f814c627a69987379b4f614f10";
  }

  static const char* value(const ::pnp_msgs::PNPCondition&) { return value(); }
};

template<>
struct DataType< ::pnp_msgs::PNPCondition > {
  static const char* value()
  {
    return "pnp_msgs/PNPCondition";
  }

  static const char* value(const ::pnp_msgs::PNPCondition&) { return value(); }
};


// service_traits::MD5Sum< ::pnp_msgs::PNPConditionRequest> should match 
// service_traits::MD5Sum< ::pnp_msgs::PNPCondition > 
template<>
struct MD5Sum< ::pnp_msgs::PNPConditionRequest>
{
  static const char* value()
  {
    return MD5Sum< ::pnp_msgs::PNPCondition >::value();
  }
  static const char* value(const ::pnp_msgs::PNPConditionRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::pnp_msgs::PNPConditionRequest> should match 
// service_traits::DataType< ::pnp_msgs::PNPCondition > 
template<>
struct DataType< ::pnp_msgs::PNPConditionRequest>
{
  static const char* value()
  {
    return DataType< ::pnp_msgs::PNPCondition >::value();
  }
  static const char* value(const ::pnp_msgs::PNPConditionRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::pnp_msgs::PNPConditionResponse> should match 
// service_traits::MD5Sum< ::pnp_msgs::PNPCondition > 
template<>
struct MD5Sum< ::pnp_msgs::PNPConditionResponse>
{
  static const char* value()
  {
    return MD5Sum< ::pnp_msgs::PNPCondition >::value();
  }
  static const char* value(const ::pnp_msgs::PNPConditionResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::pnp_msgs::PNPConditionResponse> should match 
// service_traits::DataType< ::pnp_msgs::PNPCondition > 
template<>
struct DataType< ::pnp_msgs::PNPConditionResponse>
{
  static const char* value()
  {
    return DataType< ::pnp_msgs::PNPCondition >::value();
  }
  static const char* value(const ::pnp_msgs::PNPConditionResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PNP_MSGS_MESSAGE_PNPCONDITION_H
