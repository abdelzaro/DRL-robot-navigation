;; Auto-generated. Do not edit!


(when (boundp 'dynamic_gap::GapPolarArray)
  (if (not (find-package "DYNAMIC_GAP"))
    (make-package "DYNAMIC_GAP"))
  (shadow 'GapPolarArray (find-package "DYNAMIC_GAP")))
(unless (find-package "DYNAMIC_GAP::GAPPOLARARRAY")
  (make-package "DYNAMIC_GAP::GAPPOLARARRAY"))

(in-package "ROS")
;;//! \htmlinclude GapPolarArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass dynamic_gap::GapPolarArray
  :super ros::object
  :slots (_header _gaps ))

(defmethod dynamic_gap::GapPolarArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:gaps __gaps) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _gaps __gaps)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:gaps
   (&rest __gaps)
   (if (keywordp (car __gaps))
       (send* _gaps __gaps)
     (progn
       (if __gaps (setq _gaps (car __gaps)))
       _gaps)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; dynamic_gap/GapPolar[] _gaps
    (apply #'+ (send-all _gaps :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; dynamic_gap/GapPolar[] _gaps
     (write-long (length _gaps) s)
     (dolist (elem _gaps)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; dynamic_gap/GapPolar[] _gaps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gaps (let (r) (dotimes (i n) (push (instance dynamic_gap::GapPolar :init) r)) r))
     (dolist (elem- _gaps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get dynamic_gap::GapPolarArray :md5sum-) "bca7aae125759a66c1c2548d6ce506aa")
(setf (get dynamic_gap::GapPolarArray :datatype-) "dynamic_gap/GapPolarArray")
(setf (get dynamic_gap::GapPolarArray :definition-)
      "Header      header
GapPolar[]  gaps

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: dynamic_gap/GapPolar
# angles are in the incoming laser frame  (rad)
float32 right_angle
float32 right_range
float32 left_angle
float32 left_range

# convenience: Euclidean width of the gap  (m)
# float32 width 

")



(provide :dynamic_gap/GapPolarArray "bca7aae125759a66c1c2548d6ce506aa")


