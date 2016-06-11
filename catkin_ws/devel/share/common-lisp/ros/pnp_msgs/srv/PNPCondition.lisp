; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-srv)


;//! \htmlinclude PNPCondition-request.msg.html

(cl:defclass <PNPCondition-request> (roslisp-msg-protocol:ros-message)
  ((cond
    :reader cond
    :initarg :cond
    :type cl:string
    :initform ""))
)

(cl:defclass PNPCondition-request (<PNPCondition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPCondition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPCondition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPCondition-request> is deprecated: use pnp_msgs-srv:PNPCondition-request instead.")))

(cl:ensure-generic-function 'cond-val :lambda-list '(m))
(cl:defmethod cond-val ((m <PNPCondition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:cond-val is deprecated.  Use pnp_msgs-srv:cond instead.")
  (cond m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPCondition-request>) ostream)
  "Serializes a message object of type '<PNPCondition-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cond))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cond))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPCondition-request>) istream)
  "Deserializes a message object of type '<PNPCondition-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'cond) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'cond) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPCondition-request>)))
  "Returns string type for a service object of type '<PNPCondition-request>"
  "pnp_msgs/PNPConditionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPCondition-request)))
  "Returns string type for a service object of type 'PNPCondition-request"
  "pnp_msgs/PNPConditionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPCondition-request>)))
  "Returns md5sum for a message object of type '<PNPCondition-request>"
  "1ecc39f814c627a69987379b4f614f10")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPCondition-request)))
  "Returns md5sum for a message object of type 'PNPCondition-request"
  "1ecc39f814c627a69987379b4f614f10")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPCondition-request>)))
  "Returns full string definition for message of type '<PNPCondition-request>"
  (cl:format cl:nil "string cond~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPCondition-request)))
  "Returns full string definition for message of type 'PNPCondition-request"
  (cl:format cl:nil "string cond~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPCondition-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'cond))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPCondition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPCondition-request
    (cl:cons ':cond (cond msg))
))
;//! \htmlinclude PNPCondition-response.msg.html

(cl:defclass <PNPCondition-response> (roslisp-msg-protocol:ros-message)
  ((truth_value
    :reader truth_value
    :initarg :truth_value
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PNPCondition-response (<PNPCondition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPCondition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPCondition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPCondition-response> is deprecated: use pnp_msgs-srv:PNPCondition-response instead.")))

(cl:ensure-generic-function 'truth_value-val :lambda-list '(m))
(cl:defmethod truth_value-val ((m <PNPCondition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:truth_value-val is deprecated.  Use pnp_msgs-srv:truth_value instead.")
  (truth_value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPCondition-response>) ostream)
  "Serializes a message object of type '<PNPCondition-response>"
  (cl:let* ((signed (cl:slot-value msg 'truth_value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPCondition-response>) istream)
  "Deserializes a message object of type '<PNPCondition-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'truth_value) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPCondition-response>)))
  "Returns string type for a service object of type '<PNPCondition-response>"
  "pnp_msgs/PNPConditionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPCondition-response)))
  "Returns string type for a service object of type 'PNPCondition-response"
  "pnp_msgs/PNPConditionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPCondition-response>)))
  "Returns md5sum for a message object of type '<PNPCondition-response>"
  "1ecc39f814c627a69987379b4f614f10")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPCondition-response)))
  "Returns md5sum for a message object of type 'PNPCondition-response"
  "1ecc39f814c627a69987379b4f614f10")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPCondition-response>)))
  "Returns full string definition for message of type '<PNPCondition-response>"
  (cl:format cl:nil "int8 truth_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPCondition-response)))
  "Returns full string definition for message of type 'PNPCondition-response"
  (cl:format cl:nil "int8 truth_value~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPCondition-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPCondition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPCondition-response
    (cl:cons ':truth_value (truth_value msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PNPCondition)))
  'PNPCondition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PNPCondition)))
  'PNPCondition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPCondition)))
  "Returns string type for a service object of type '<PNPCondition>"
  "pnp_msgs/PNPCondition")