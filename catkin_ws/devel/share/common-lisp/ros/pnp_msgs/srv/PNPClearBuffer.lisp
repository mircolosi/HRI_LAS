; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-srv)


;//! \htmlinclude PNPClearBuffer-request.msg.html

(cl:defclass <PNPClearBuffer-request> (roslisp-msg-protocol:ros-message)
  ((cond
    :reader cond
    :initarg :cond
    :type cl:string
    :initform ""))
)

(cl:defclass PNPClearBuffer-request (<PNPClearBuffer-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPClearBuffer-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPClearBuffer-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPClearBuffer-request> is deprecated: use pnp_msgs-srv:PNPClearBuffer-request instead.")))

(cl:ensure-generic-function 'cond-val :lambda-list '(m))
(cl:defmethod cond-val ((m <PNPClearBuffer-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:cond-val is deprecated.  Use pnp_msgs-srv:cond instead.")
  (cond m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPClearBuffer-request>) ostream)
  "Serializes a message object of type '<PNPClearBuffer-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'cond))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'cond))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPClearBuffer-request>) istream)
  "Deserializes a message object of type '<PNPClearBuffer-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPClearBuffer-request>)))
  "Returns string type for a service object of type '<PNPClearBuffer-request>"
  "pnp_msgs/PNPClearBufferRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPClearBuffer-request)))
  "Returns string type for a service object of type 'PNPClearBuffer-request"
  "pnp_msgs/PNPClearBufferRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPClearBuffer-request>)))
  "Returns md5sum for a message object of type '<PNPClearBuffer-request>"
  "70dde2d68f4afb0b125abb038f75e1e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPClearBuffer-request)))
  "Returns md5sum for a message object of type 'PNPClearBuffer-request"
  "70dde2d68f4afb0b125abb038f75e1e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPClearBuffer-request>)))
  "Returns full string definition for message of type '<PNPClearBuffer-request>"
  (cl:format cl:nil "string cond~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPClearBuffer-request)))
  "Returns full string definition for message of type 'PNPClearBuffer-request"
  (cl:format cl:nil "string cond~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPClearBuffer-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'cond))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPClearBuffer-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPClearBuffer-request
    (cl:cons ':cond (cond msg))
))
;//! \htmlinclude PNPClearBuffer-response.msg.html

(cl:defclass <PNPClearBuffer-response> (roslisp-msg-protocol:ros-message)
  ((answer
    :reader answer
    :initarg :answer
    :type cl:string
    :initform ""))
)

(cl:defclass PNPClearBuffer-response (<PNPClearBuffer-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPClearBuffer-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPClearBuffer-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPClearBuffer-response> is deprecated: use pnp_msgs-srv:PNPClearBuffer-response instead.")))

(cl:ensure-generic-function 'answer-val :lambda-list '(m))
(cl:defmethod answer-val ((m <PNPClearBuffer-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:answer-val is deprecated.  Use pnp_msgs-srv:answer instead.")
  (answer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPClearBuffer-response>) ostream)
  "Serializes a message object of type '<PNPClearBuffer-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'answer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'answer))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPClearBuffer-response>) istream)
  "Deserializes a message object of type '<PNPClearBuffer-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'answer) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'answer) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPClearBuffer-response>)))
  "Returns string type for a service object of type '<PNPClearBuffer-response>"
  "pnp_msgs/PNPClearBufferResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPClearBuffer-response)))
  "Returns string type for a service object of type 'PNPClearBuffer-response"
  "pnp_msgs/PNPClearBufferResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPClearBuffer-response>)))
  "Returns md5sum for a message object of type '<PNPClearBuffer-response>"
  "70dde2d68f4afb0b125abb038f75e1e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPClearBuffer-response)))
  "Returns md5sum for a message object of type 'PNPClearBuffer-response"
  "70dde2d68f4afb0b125abb038f75e1e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPClearBuffer-response>)))
  "Returns full string definition for message of type '<PNPClearBuffer-response>"
  (cl:format cl:nil "string answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPClearBuffer-response)))
  "Returns full string definition for message of type 'PNPClearBuffer-response"
  (cl:format cl:nil "string answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPClearBuffer-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'answer))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPClearBuffer-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPClearBuffer-response
    (cl:cons ':answer (answer msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PNPClearBuffer)))
  'PNPClearBuffer-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PNPClearBuffer)))
  'PNPClearBuffer-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPClearBuffer)))
  "Returns string type for a service object of type '<PNPClearBuffer>"
  "pnp_msgs/PNPClearBuffer")