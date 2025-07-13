; Auto-generated. Do not edit!


(cl:in-package dynamic_gap-msg)


;//! \htmlinclude GapPolarArray.msg.html

(cl:defclass <GapPolarArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (gaps
    :reader gaps
    :initarg :gaps
    :type (cl:vector dynamic_gap-msg:GapPolar)
   :initform (cl:make-array 0 :element-type 'dynamic_gap-msg:GapPolar :initial-element (cl:make-instance 'dynamic_gap-msg:GapPolar))))
)

(cl:defclass GapPolarArray (<GapPolarArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GapPolarArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GapPolarArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamic_gap-msg:<GapPolarArray> is deprecated: use dynamic_gap-msg:GapPolarArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GapPolarArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamic_gap-msg:header-val is deprecated.  Use dynamic_gap-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'gaps-val :lambda-list '(m))
(cl:defmethod gaps-val ((m <GapPolarArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamic_gap-msg:gaps-val is deprecated.  Use dynamic_gap-msg:gaps instead.")
  (gaps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GapPolarArray>) ostream)
  "Serializes a message object of type '<GapPolarArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'gaps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'gaps))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GapPolarArray>) istream)
  "Deserializes a message object of type '<GapPolarArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'gaps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'gaps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'dynamic_gap-msg:GapPolar))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GapPolarArray>)))
  "Returns string type for a message object of type '<GapPolarArray>"
  "dynamic_gap/GapPolarArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GapPolarArray)))
  "Returns string type for a message object of type 'GapPolarArray"
  "dynamic_gap/GapPolarArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GapPolarArray>)))
  "Returns md5sum for a message object of type '<GapPolarArray>"
  "bca7aae125759a66c1c2548d6ce506aa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GapPolarArray)))
  "Returns md5sum for a message object of type 'GapPolarArray"
  "bca7aae125759a66c1c2548d6ce506aa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GapPolarArray>)))
  "Returns full string definition for message of type '<GapPolarArray>"
  (cl:format cl:nil "Header      header~%GapPolar[]  gaps~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: dynamic_gap/GapPolar~%# angles are in the incoming laser frame  (rad)~%float32 right_angle~%float32 right_range~%float32 left_angle~%float32 left_range~%~%# convenience: Euclidean width of the gap  (m)~%# float32 width ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GapPolarArray)))
  "Returns full string definition for message of type 'GapPolarArray"
  (cl:format cl:nil "Header      header~%GapPolar[]  gaps~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: dynamic_gap/GapPolar~%# angles are in the incoming laser frame  (rad)~%float32 right_angle~%float32 right_range~%float32 left_angle~%float32 left_range~%~%# convenience: Euclidean width of the gap  (m)~%# float32 width ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GapPolarArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'gaps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GapPolarArray>))
  "Converts a ROS message object to a list"
  (cl:list 'GapPolarArray
    (cl:cons ':header (header msg))
    (cl:cons ':gaps (gaps msg))
))
