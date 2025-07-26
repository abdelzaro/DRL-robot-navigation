;; Auto-generated. Do not edit!


(when (boundp 'dynamic_gap::GapPolar)
  (if (not (find-package "DYNAMIC_GAP"))
    (make-package "DYNAMIC_GAP"))
  (shadow 'GapPolar (find-package "DYNAMIC_GAP")))
(unless (find-package "DYNAMIC_GAP::GAPPOLAR")
  (make-package "DYNAMIC_GAP::GAPPOLAR"))

(in-package "ROS")
;;//! \htmlinclude GapPolar.msg.html


(defclass dynamic_gap::GapPolar
  :super ros::object
  :slots (_right_angle _right_range _left_angle _left_range ))

(defmethod dynamic_gap::GapPolar
  (:init
   (&key
    ((:right_angle __right_angle) 0.0)
    ((:right_range __right_range) 0.0)
    ((:left_angle __left_angle) 0.0)
    ((:left_range __left_range) 0.0)
    )
   (send-super :init)
   (setq _right_angle (float __right_angle))
   (setq _right_range (float __right_range))
   (setq _left_angle (float __left_angle))
   (setq _left_range (float __left_range))
   self)
  (:right_angle
   (&optional __right_angle)
   (if __right_angle (setq _right_angle __right_angle)) _right_angle)
  (:right_range
   (&optional __right_range)
   (if __right_range (setq _right_range __right_range)) _right_range)
  (:left_angle
   (&optional __left_angle)
   (if __left_angle (setq _left_angle __left_angle)) _left_angle)
  (:left_range
   (&optional __left_range)
   (if __left_range (setq _left_range __left_range)) _left_range)
  (:serialization-length
   ()
   (+
    ;; float32 _right_angle
    4
    ;; float32 _right_range
    4
    ;; float32 _left_angle
    4
    ;; float32 _left_range
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _right_angle
       (sys::poke _right_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_range
       (sys::poke _right_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_angle
       (sys::poke _left_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _left_range
       (sys::poke _left_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _right_angle
     (setq _right_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_range
     (setq _right_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_angle
     (setq _left_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _left_range
     (setq _left_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get dynamic_gap::GapPolar :md5sum-) "633e4eeee72c08575897401f2c80d401")
(setf (get dynamic_gap::GapPolar :datatype-) "dynamic_gap/GapPolar")
(setf (get dynamic_gap::GapPolar :definition-)
      "# angles are in the incoming laser frame  (rad)
float32 right_angle
float32 right_range
float32 left_angle
float32 left_range

# convenience: Euclidean width of the gap  (m)
# float32 width 

")



(provide :dynamic_gap/GapPolar "633e4eeee72c08575897401f2c80d401")


