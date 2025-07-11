// Generated by gencpp from file dynamic_gap/GapPolarArray.msg
// DO NOT EDIT!


#ifndef DYNAMIC_GAP_MESSAGE_GAPPOLARARRAY_H
#define DYNAMIC_GAP_MESSAGE_GAPPOLARARRAY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <dynamic_gap/GapPolar.h>

namespace dynamic_gap
{
template <class ContainerAllocator>
struct GapPolarArray_
{
  typedef GapPolarArray_<ContainerAllocator> Type;

  GapPolarArray_()
    : header()
    , gaps()  {
    }
  GapPolarArray_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , gaps(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::dynamic_gap::GapPolar_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::dynamic_gap::GapPolar_<ContainerAllocator> >> _gaps_type;
  _gaps_type gaps;





  typedef boost::shared_ptr< ::dynamic_gap::GapPolarArray_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dynamic_gap::GapPolarArray_<ContainerAllocator> const> ConstPtr;

}; // struct GapPolarArray_

typedef ::dynamic_gap::GapPolarArray_<std::allocator<void> > GapPolarArray;

typedef boost::shared_ptr< ::dynamic_gap::GapPolarArray > GapPolarArrayPtr;
typedef boost::shared_ptr< ::dynamic_gap::GapPolarArray const> GapPolarArrayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dynamic_gap::GapPolarArray_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::dynamic_gap::GapPolarArray_<ContainerAllocator1> & lhs, const ::dynamic_gap::GapPolarArray_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.gaps == rhs.gaps;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::dynamic_gap::GapPolarArray_<ContainerAllocator1> & lhs, const ::dynamic_gap::GapPolarArray_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace dynamic_gap

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dynamic_gap::GapPolarArray_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dynamic_gap::GapPolarArray_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dynamic_gap::GapPolarArray_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bca7aae125759a66c1c2548d6ce506aa";
  }

  static const char* value(const ::dynamic_gap::GapPolarArray_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbca7aae125759a66ULL;
  static const uint64_t static_value2 = 0xc1c2548d6ce506aaULL;
};

template<class ContainerAllocator>
struct DataType< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dynamic_gap/GapPolarArray";
  }

  static const char* value(const ::dynamic_gap::GapPolarArray_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header      header\n"
"GapPolar[]  gaps\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: dynamic_gap/GapPolar\n"
"# angles are in the incoming laser frame  (rad)\n"
"float32 right_angle\n"
"float32 right_range\n"
"float32 left_angle\n"
"float32 left_range\n"
"\n"
"# convenience: Euclidean width of the gap  (m)\n"
"# float32 width \n"
;
  }

  static const char* value(const ::dynamic_gap::GapPolarArray_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.gaps);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GapPolarArray_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dynamic_gap::GapPolarArray_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dynamic_gap::GapPolarArray_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "header: ";
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "gaps: ";
    if (v.gaps.empty() || false)
      s << "[";
    for (size_t i = 0; i < v.gaps.size(); ++i)
    {
      if (false && i > 0)
        s << ", ";
      else if (!false)
        s << std::endl << indent << "  -";
      Printer< ::dynamic_gap::GapPolar_<ContainerAllocator> >::stream(s, false ? std::string() : indent + "    ", v.gaps[i]);
    }
    if (v.gaps.empty() || false)
      s << "]";
  }
};

} // namespace message_operations
} // namespace ros

#endif // DYNAMIC_GAP_MESSAGE_GAPPOLARARRAY_H
