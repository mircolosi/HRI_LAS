; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-srv)


;//! \htmlinclude PNPGetVariableValue-request.msg.html

(cl:defclass <PNPGetVariableValue-request> (roslisp-msg-protocol:ros-message)
  ((variable
    :reader variable
    :initarg :variable
    :type cl:string
    :initform ""))
)

(cl:defclass PNPGetVariableValue-request (<PNPGetVariableValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPGetVariableValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPGetVariableValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPGetVariableValue-request> is deprecated: use pnp_msgs-srv:PNPGetVariableValue-request instead.")))

(cl:ensure-generic-function 'variable-val :lambda-list '(m))
(cl:defmethod variable-val ((m <PNPGetVariableValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:variable-val is deprecated.  Use pnp_msgs-srv:variable instead.")
  (variable m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPGetVariableValue-request>) ostream)
  "Serializes a message object of type '<PNPGetVariableValue-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'variable))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'variable))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPGetVariableValue-request>) istream)
  "Deserializes a message object of type '<PNPGetVariableValue-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'variable) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'variable) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPGetVariableValue-request>)))
  "Returns string type for a service object of type '<PNPGetVariableValue-request>"
  "pnp_msgs/PNPGetVariableValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPGetVariableValue-request)))
  "Returns string type for a service object of type 'PNPGetVariableValue-request"
  "pnp_msgs/PNPGetVariableValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPGetVariableValue-request>)))
  "Returns md5sum for a message object of type '<PNPGetVariableValue-request>"
  "2cb822bc826e5843de6b96ba6e683d4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPGetVariableValue-request)))
  "Returns md5sum for a message object of type 'PNPGetVariableValue-request"
  "2cb822bc826e5843de6b96ba6e683d4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPGetVariableValue-request>)))
  "Returns full string definition for message of type '<PNPGetVariableValue-request>"
  (cl:format cl:nil "string variable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPGetVariableValue-request)))
  "Returns full string definition for message of type 'PNPGetVariableValue-request"
  (cl:format cl:nil "string variable~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPGetVariableValue-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'variable))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPGetVariableValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPGetVariableValue-request
    (cl:cons ':variable (variable msg))
))
;//! \htmlinclude PNPGetVariableValue-response.msg.html

(cl:defclass <PNPGetVariableValue-response> (roslisp-msg-protocol:ros-message)
  ((answer
    :reader answer
    :initarg :answer
    :type cl:string
    :initform ""))
)

(cl:defclass PNPGetVariableValue-response (<PNPGetVariableValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPGetVariableValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPGetVariableValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPGetVariableValue-response> is deprecated: use pnp_msgs-srv:PNPGetVariableValue-response instead.")))

(cl:ensure-generic-function 'answer-val :lambda-list '(m))
(cl:defmethod answer-val ((m <PNPGetVariableValue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:answer-val is deprecated.  Use pnp_msgs-srv:answer instead.")
  (answer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPGetVariableValue-response>) ostream)
  "Serializes a message object of type '<PNPGetVariableValue-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'answer))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'answer))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPGetVariableValue-response>) istream)
  "Deserializes a message object of type '<PNPGetVariableValue-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPGetVariableValue-response>)))
  "Returns string type for a service object of type '<PNPGetVariableValue-response>"
  "pnp_msgs/PNPGetVariableValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPGetVariableValue-response)))
  "Returns string type for a service object of type 'PNPGetVariableValue-response"
  "pnp_msgs/PNPGetVariableValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPGetVariableValue-response>)))
  "Returns md5sum for a message object of type '<PNPGetVariableValue-response>"
  "2cb822bc826e5843de6b96ba6e683d4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPGetVariableValue-response)))
  "Returns md5sum for a message object of type 'PNPGetVariableValue-response"
  "2cb822bc826e5843de6b96ba6e683d4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPGetVariableValue-response>)))
  "Returns full string definition for message of type '<PNPGetVariableValue-response>"
  (cl:format cl:nil "string answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPGetVariableValue-response)))
  "Returns full string definition for message of type 'PNPGetVariableValue-response"
  (cl:format cl:nil "string answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPGetVariableValue-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'answer))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPGetVariableValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPGetVariableValue-response
    (cl:cons ':answer (answer msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PNPGetVariableValue)))
  'PNPGetVariableValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PNPGetVariableValue)))
  'PNPGetVariableValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPGetVariableValue)))
  "Returns string type for a service object of type '<PNPGetVariableValue>"
  "pnp_msgs/PNPGetVariableValue")