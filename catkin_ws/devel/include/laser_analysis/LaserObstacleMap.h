// Generated by gencpp from file laser_analysis/LaserObstacleMap.msg
// DO NOT EDIT!


#ifndef LASER_ANALYSIS_MESSAGE_LASEROBSTACLEMAP_H
#define LASER_ANALYSIS_MESSAGE_LASEROBSTACLEMAP_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace laser_analysis
{
template <class ContainerAllocator>
struct LaserObstacleMap_
{
  typedef LaserObstacleMap_<ContainerAllocator> Type;

  LaserObstacleMap_()
    : stamp()
    , npoints(0)
    , mx(0.0)
    , my(0.0)
    , var(0.0)  {
    }
  LaserObstacleMap_(const ContainerAllocator& _alloc)
    : stamp()
    , npoints(0)
    , mx(0.0)
    , my(0.0)
    , var(0.0)  {
    }



   typedef ros::Time _stamp_type;
  _stamp_type stamp;

   typedef int32_t _npoints_type;
  _npoints_type npoints;

   typedef double _mx_type;
  _mx_type mx;

   typedef double _my_type;
  _my_type my;

   typedef double _var_type;
  _var_type var;




  typedef boost::shared_ptr< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> const> ConstPtr;

}; // struct LaserObstacleMap_

typedef ::laser_analysis::LaserObstacleMap_<std::allocator<void> > LaserObstacleMap;

typedef boost::shared_ptr< ::laser_analysis::LaserObstacleMap > LaserObstacleMapPtr;
typedef boost::shared_ptr< ::laser_analysis::LaserObstacleMap const> LaserObstacleMapConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::laser_analysis::LaserObstacleMap_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace laser_analysis

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'laser_analysis': ['/home/parallels/catkin_ws/src/laser_analysis/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "005f105a79e5ce59454afd0525f43586";
  }

  static const char* value(const ::laser_analysis::LaserObstacleMap_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x005f105a79e5ce59ULL;
  static const uint64_t static_value2 = 0x454afd0525f43586ULL;
};

template<class ContainerAllocator>
struct DataType< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "laser_analysis/LaserObstacleMap";
  }

  static const char* value(const ::laser_analysis::LaserObstacleMap_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
{
  static const char* value()
  {
    return "time stamp\n\
int32 npoints\n\
float64 mx\n\
float64 my\n\
float64 var\n\
";
  }

  static const char* value(const ::laser_analysis::LaserObstacleMap_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.stamp);
      stream.next(m.npoints);
      stream.next(m.mx);
      stream.next(m.my);
      stream.next(m.var);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct LaserObstacleMap_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::laser_analysis::LaserObstacleMap_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::laser_analysis::LaserObstacleMap_<ContainerAllocator>& v)
  {
    s << indent << "stamp: ";
    Printer<ros::Time>::stream(s, indent + "  ", v.stamp);
    s << indent << "npoints: ";
    Printer<int32_t>::stream(s, indent + "  ", v.npoints);
    s << indent << "mx: ";
    Printer<double>::stream(s, indent + "  ", v.mx);
    s << indent << "my: ";
    Printer<double>::stream(s, indent + "  ", v.my);
    s << indent << "var: ";
    Printer<double>::stream(s, indent + "  ", v.var);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LASER_ANALYSIS_MESSAGE_LASEROBSTACLEMAP_H
