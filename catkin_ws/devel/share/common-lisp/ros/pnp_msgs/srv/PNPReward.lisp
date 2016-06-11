; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-srv)


;//! \htmlinclude PNPReward-request.msg.html

(cl:defclass <PNPReward-request> (roslisp-msg-protocol:ros-message)
  ((rewardRequest
    :reader rewardRequest
    :initarg :rewardRequest
    :type cl:string
    :initform ""))
)

(cl:defclass PNPReward-request (<PNPReward-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPReward-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPReward-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPReward-request> is deprecated: use pnp_msgs-srv:PNPReward-request instead.")))

(cl:ensure-generic-function 'rewardRequest-val :lambda-list '(m))
(cl:defmethod rewardRequest-val ((m <PNPReward-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:rewardRequest-val is deprecated.  Use pnp_msgs-srv:rewardRequest instead.")
  (rewardRequest m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPReward-request>) ostream)
  "Serializes a message object of type '<PNPReward-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rewardRequest))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rewardRequest))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPReward-request>) istream)
  "Deserializes a message object of type '<PNPReward-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rewardRequest) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rewardRequest) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPReward-request>)))
  "Returns string type for a service object of type '<PNPReward-request>"
  "pnp_msgs/PNPRewardRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPReward-request)))
  "Returns string type for a service object of type 'PNPReward-request"
  "pnp_msgs/PNPRewardRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPReward-request>)))
  "Returns md5sum for a message object of type '<PNPReward-request>"
  "d6bac371d18603a2d7685bb5dacec7cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPReward-request)))
  "Returns md5sum for a message object of type 'PNPReward-request"
  "d6bac371d18603a2d7685bb5dacec7cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPReward-request>)))
  "Returns full string definition for message of type '<PNPReward-request>"
  (cl:format cl:nil "string rewardRequest~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPReward-request)))
  "Returns full string definition for message of type 'PNPReward-request"
  (cl:format cl:nil "string rewardRequest~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPReward-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'rewardRequest))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPReward-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPReward-request
    (cl:cons ':rewardRequest (rewardRequest msg))
))
;//! \htmlinclude PNPReward-response.msg.html

(cl:defclass <PNPReward-response> (roslisp-msg-protocol:ros-message)
  ((reward
    :reader reward
    :initarg :reward
    :type cl:float
    :initform 0.0))
)

(cl:defclass PNPReward-response (<PNPReward-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPReward-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPReward-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPReward-response> is deprecated: use pnp_msgs-srv:PNPReward-response instead.")))

(cl:ensure-generic-function 'reward-val :lambda-list '(m))
(cl:defmethod reward-val ((m <PNPReward-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:reward-val is deprecated.  Use pnp_msgs-srv:reward instead.")
  (reward m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPReward-response>) ostream)
  "Serializes a message object of type '<PNPReward-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'reward))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPReward-response>) istream)
  "Deserializes a message object of type '<PNPReward-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'reward) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPReward-response>)))
  "Returns string type for a service object of type '<PNPReward-response>"
  "pnp_msgs/PNPRewardResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPReward-response)))
  "Returns string type for a service object of type 'PNPReward-response"
  "pnp_msgs/PNPRewardResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPReward-response>)))
  "Returns md5sum for a message object of type '<PNPReward-response>"
  "d6bac371d18603a2d7685bb5dacec7cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPReward-response)))
  "Returns md5sum for a message object of type 'PNPReward-response"
  "d6bac371d18603a2d7685bb5dacec7cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPReward-response>)))
  "Returns full string definition for message of type '<PNPReward-response>"
  (cl:format cl:nil "float32 reward~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPReward-response)))
  "Returns full string definition for message of type 'PNPReward-response"
  (cl:format cl:nil "float32 reward~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPReward-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPReward-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPReward-response
    (cl:cons ':reward (reward msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PNPReward)))
  'PNPReward-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PNPReward)))
  'PNPReward-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPReward)))
  "Returns string type for a service object of type '<PNPReward>"
  "pnp_msgs/PNPReward")