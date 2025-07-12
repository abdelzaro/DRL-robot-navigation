; Auto-generated. Do not edit!


(cl:in-package dynamic_gap-msg)


;//! \htmlinclude GapPolar.msg.html

(cl:defclass <GapPolar> (roslisp-msg-protocol:ros-message)
  ((right_angle
    :reader right_angle
    :initarg :right_angle
    :type cl:float
    :initform 0.0)
   (right_range
    :reader right_range
    :initarg :right_range
    :type cl:float
    :initform 0.0)
   (left_angle
    :reader left_angle
    :initarg :left_angle
    :type cl:float
    :initform 0.0)
   (left_range
    :reader left_range
    :initarg :left_range
    :type cl:float
    :initform 0.0))
)

(cl:defclass GapPolar (<GapPolar>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GapPolar>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GapPolar)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dynamic_gap-msg:<GapPolar> is deprecated: use dynamic_gap-msg:GapPolar instead.")))

(cl:ensure-generic-function 'right_angle-val :lambda-list '(m))
(cl:defmethod right_angle-val ((m <GapPolar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamic_gap-msg:right_angle-val is deprecated.  Use dynamic_gap-msg:right_angle instead.")
  (right_angle m))

(cl:ensure-generic-function 'right_range-val :lambda-list '(m))
(cl:defmethod right_range-val ((m <GapPolar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamic_gap-msg:right_range-val is deprecated.  Use dynamic_gap-msg:right_range instead.")
  (right_range m))

(cl:ensure-generic-function 'left_angle-val :lambda-list '(m))
(cl:defmethod left_angle-val ((m <GapPolar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamic_gap-msg:left_angle-val is deprecated.  Use dynamic_gap-msg:left_angle instead.")
  (left_angle m))

(cl:ensure-generic-function 'left_range-val :lambda-list '(m))
(cl:defmethod left_range-val ((m <GapPolar>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dynamic_gap-msg:left_range-val is deprecated.  Use dynamic_gap-msg:left_range instead.")
  (left_range m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GapPolar>) ostream)
  "Serializes a message object of type '<GapPolar>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'right_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'left_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GapPolar>) istream)
  "Deserializes a message object of type '<GapPolar>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left_range) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GapPolar>)))
  "Returns string type for a message object of type '<GapPolar>"
  "dynamic_gap/GapPolar")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GapPolar)))
  "Returns string type for a message object of type 'GapPolar"
  "dynamic_gap/GapPolar")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GapPolar>)))
  "Returns md5sum for a message object of type '<GapPolar>"
  "633e4eeee72c08575897401f2c80d401")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GapPolar)))
  "Returns md5sum for a message object of type 'GapPolar"
  "633e4eeee72c08575897401f2c80d401")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GapPolar>)))
  "Returns full string definition for message of type '<GapPolar>"
  (cl:format cl:nil "# angles are in the incoming laser frame  (rad)~%float32 right_angle~%float32 right_range~%float32 left_angle~%float32 left_range~%~%# convenience: Euclidean width of the gap  (m)~%# float32 width ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GapPolar)))
  "Returns full string definition for message of type 'GapPolar"
  (cl:format cl:nil "# angles are in the incoming laser frame  (rad)~%float32 right_angle~%float32 right_range~%float32 left_angle~%float32 left_range~%~%# convenience: Euclidean width of the gap  (m)~%# float32 width ~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GapPolar>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GapPolar>))
  "Converts a ROS message object to a list"
  (cl:list 'GapPolar
    (cl:cons ':right_angle (right_angle msg))
    (cl:cons ':right_range (right_range msg))
    (cl:cons ':left_angle (left_angle msg))
    (cl:cons ':left_range (left_range msg))
))
