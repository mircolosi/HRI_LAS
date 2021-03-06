// Generated by gencpp from file pnp_msgs/PNPGetVariableValueRequest.msg
// DO NOT EDIT!


#ifndef PNP_MSGS_MESSAGE_PNPGETVARIABLEVALUEREQUEST_H
#define PNP_MSGS_MESSAGE_PNPGETVARIABLEVALUEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace pnp_msgs
{
template <class ContainerAllocator>
struct PNPGetVariableValueRequest_
{
  typedef PNPGetVariableValueRequest_<ContainerAllocator> Type;

  PNPGetVariableValueRequest_()
    : variable()  {
    }
  PNPGetVariableValueRequest_(const ContainerAllocator& _alloc)
    : variable(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _variable_type;
  _variable_type variable;




  typedef boost::shared_ptr< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PNPGetVariableValueRequest_

typedef ::pnp_msgs::PNPGetVariableValueRequest_<std::allocator<void> > PNPGetVariableValueRequest;

typedef boost::shared_ptr< ::pnp_msgs::PNPGetVariableValueRequest > PNPGetVariableValueRequestPtr;
typedef boost::shared_ptr< ::pnp_msgs::PNPGetVariableValueRequest const> PNPGetVariableValueRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pnp_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'pnp_msgs': ['/home/parallels/catkin_ws/src/pnp_msgs/msg', '/home/parallels/catkin_ws/devel/share/pnp_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f0025523f25a3be72b81a4752d8b3914";
  }

  static const char* value(const ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf0025523f25a3be7ULL;
  static const uint64_t static_value2 = 0x2b81a4752d8b3914ULL;
};

template<class ContainerAllocator>
struct DataType< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pnp_msgs/PNPGetVariableValueRequest";
  }

  static const char* value(const ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string variable\n\
";
  }

  static const char* value(const ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.variable);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct PNPGetVariableValueRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pnp_msgs::PNPGetVariableValueRequest_<ContainerAllocator>& v)
  {
    s << indent << "variable: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.variable);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PNP_MSGS_MESSAGE_PNPGETVARIABLEVALUEREQUEST_H
