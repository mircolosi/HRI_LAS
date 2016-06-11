// Generated by gencpp from file pnp_msgs/Action.msg
// DO NOT EDIT!


#ifndef PNP_MSGS_MESSAGE_ACTION_H
#define PNP_MSGS_MESSAGE_ACTION_H


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
struct Action_
{
  typedef Action_<ContainerAllocator> Type;

  Action_()
    : id()
    , robotname()
    , name()
    , params()
    , function()
    , result()  {
    }
  Action_(const ContainerAllocator& _alloc)
    : id(_alloc)
    , robotname(_alloc)
    , name(_alloc)
    , params(_alloc)
    , function(_alloc)
    , result(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _id_type;
  _id_type id;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _robotname_type;
  _robotname_type robotname;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _params_type;
  _params_type params;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _function_type;
  _function_type function;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _result_type;
  _result_type result;




  typedef boost::shared_ptr< ::pnp_msgs::Action_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pnp_msgs::Action_<ContainerAllocator> const> ConstPtr;

}; // struct Action_

typedef ::pnp_msgs::Action_<std::allocator<void> > Action;

typedef boost::shared_ptr< ::pnp_msgs::Action > ActionPtr;
typedef boost::shared_ptr< ::pnp_msgs::Action const> ActionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pnp_msgs::Action_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pnp_msgs::Action_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::pnp_msgs::Action_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pnp_msgs::Action_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pnp_msgs::Action_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pnp_msgs::Action_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pnp_msgs::Action_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pnp_msgs::Action_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pnp_msgs::Action_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8780cff1f4b14d977db133b1cc558632";
  }

  static const char* value(const ::pnp_msgs::Action_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8780cff1f4b14d97ULL;
  static const uint64_t static_value2 = 0x7db133b1cc558632ULL;
};

template<class ContainerAllocator>
struct DataType< ::pnp_msgs::Action_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pnp_msgs/Action";
  }

  static const char* value(const ::pnp_msgs::Action_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pnp_msgs::Action_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string id\n\
string robotname\n\
string name\n\
string params\n\
string function\n\
string result\n\
";
  }

  static const char* value(const ::pnp_msgs::Action_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pnp_msgs::Action_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
      stream.next(m.robotname);
      stream.next(m.name);
      stream.next(m.params);
      stream.next(m.function);
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Action_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pnp_msgs::Action_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pnp_msgs::Action_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.id);
    s << indent << "robotname: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.robotname);
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "params: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.params);
    s << indent << "function: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.function);
    s << indent << "result: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PNP_MSGS_MESSAGE_ACTION_H
