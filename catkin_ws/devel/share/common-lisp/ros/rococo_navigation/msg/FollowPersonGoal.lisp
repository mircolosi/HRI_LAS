; Auto-generated. Do not edit!


(cl:in-package rococo_navigation-msg)


;//! \htmlinclude FollowPersonGoal.msg.html

(cl:defclass <FollowPersonGoal> (roslisp-msg-protocol:ros-message)
  ((target_X
    :reader target_X
    :initarg :target_X
    :type cl:float
    :initform 0.0)
   (target_Y
    :reader target_Y
    :initarg :target_Y
    :type cl:float
    :initform 0.0)
   (max_vel
    :reader max_vel
    :initarg :max_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass FollowPersonGoal (<FollowPersonGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FollowPersonGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FollowPersonGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rococo_navigation-msg:<FollowPersonGoal> is deprecated: use rococo_navigation-msg:FollowPersonGoal instead.")))

(cl:ensure-generic-function 'target_X-val :lambda-list '(m))
(cl:defmethod target_X-val ((m <FollowPersonGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:target_X-val is deprecated.  Use rococo_navigation-msg:target_X instead.")
  (target_X m))

(cl:ensure-generic-function 'target_Y-val :lambda-list '(m))
(cl:defmethod target_Y-val ((m <FollowPersonGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:target_Y-val is deprecated.  Use rococo_navigation-msg:target_Y instead.")
  (target_Y m))

(cl:ensure-generic-function 'max_vel-val :lambda-list '(m))
(cl:defmethod max_vel-val ((m <FollowPersonGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:max_vel-val is deprecated.  Use rococo_navigation-msg:max_vel instead.")
  (max_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FollowPersonGoal>) ostream)
  "Serializes a message object of type '<FollowPersonGoal>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_X))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_Y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FollowPersonGoal>) istream)
  "Deserializes a message object of type '<FollowPersonGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_X) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_Y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_vel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FollowPersonGoal>)))
  "Returns string type for a message object of type '<FollowPersonGoal>"
  "rococo_navigation/FollowPersonGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FollowPersonGoal)))
  "Returns string type for a message object of type 'FollowPersonGoal"
  "rococo_navigation/FollowPersonGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FollowPersonGoal>)))
  "Returns md5sum for a message object of type '<FollowPersonGoal>"
  "6213a78c6faf5ade64348156f926f0c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FollowPersonGoal)))
  "Returns md5sum for a message object of type 'FollowPersonGoal"
  "6213a78c6faf5ade64348156f926f0c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FollowPersonGoal>)))
  "Returns full string definition for message of type '<FollowPersonGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%# target person~%float32 target_X~%float32 target_Y~%# max velocity [m/s]~%float32 max_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FollowPersonGoal)))
  "Returns full string definition for message of type 'FollowPersonGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%# target person~%float32 target_X~%float32 target_Y~%# max velocity [m/s]~%float32 max_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FollowPersonGoal>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FollowPersonGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'FollowPersonGoal
    (cl:cons ':target_X (target_X msg))
    (cl:cons ':target_Y (target_Y msg))
    (cl:cons ':max_vel (max_vel msg))
))
