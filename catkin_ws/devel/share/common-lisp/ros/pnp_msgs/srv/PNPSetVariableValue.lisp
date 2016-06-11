; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-srv)


;//! \htmlinclude PNPSetVariableValue-request.msg.html

(cl:defclass <PNPSetVariableValue-request> (roslisp-msg-protocol:ros-message)
  ((variable
    :reader variable
    :initarg :variable
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:string
    :initform ""))
)

(cl:defclass PNPSetVariableValue-request (<PNPSetVariableValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPSetVariableValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPSetVariableValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPSetVariableValue-request> is deprecated: use pnp_msgs-srv:PNPSetVariableValue-request instead.")))

(cl:ensure-generic-function 'variable-val :lambda-list '(m))
(cl:defmethod variable-val ((m <PNPSetVariableValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:variable-val is deprecated.  Use pnp_msgs-srv:variable instead.")
  (variable m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <PNPSetVariableValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:value-val is deprecated.  Use pnp_msgs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPSetVariableValue-request>) ostream)
  "Serializes a message object of type '<PNPSetVariableValue-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'variable))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'variable))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPSetVariableValue-request>) istream)
  "Deserializes a message object of type '<PNPSetVariableValue-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'variable) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'variable) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPSetVariableValue-request>)))
  "Returns string type for a service object of type '<PNPSetVariableValue-request>"
  "pnp_msgs/PNPSetVariableValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPSetVariableValue-request)))
  "Returns string type for a service object of type 'PNPSetVariableValue-request"
  "pnp_msgs/PNPSetVariableValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPSetVariableValue-request>)))
  "Returns md5sum for a message object of type '<PNPSetVariableValue-request>"
  "f26fb17f1178850596cc513f7a908898")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPSetVariableValue-request)))
  "Returns md5sum for a message object of type 'PNPSetVariableValue-request"
  "f26fb17f1178850596cc513f7a908898")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPSetVariableValue-request>)))
  "Returns full string definition for message of type '<PNPSetVariableValue-request>"
  (cl:format cl:nil "string variable~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPSetVariableValue-request)))
  "Returns full string definition for message of type 'PNPSetVariableValue-request"
  (cl:format cl:nil "string variable~%string value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPSetVariableValue-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'variable))
     4 (cl:length (cl:slot-value msg 'value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPSetVariableValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPSetVariableValue-request
    (cl:cons ':variable (variable msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude PNPSetVariableValue-response.msg.html

(cl:defclass <PNPSetVariableValue-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass PNPSetVariableValue-response (<PNPSetVariableValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPSetVariableValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPSetVariableValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPSetVariableValue-response> is deprecated: use pnp_msgs-srv:PNPSetVariableValue-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPSetVariableValue-response>) ostream)
  "Serializes a message object of type '<PNPSetVariableValue-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPSetVariableValue-response>) istream)
  "Deserializes a message object of type '<PNPSetVariableValue-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPSetVariableValue-response>)))
  "Returns string type for a service object of type '<PNPSetVariableValue-response>"
  "pnp_msgs/PNPSetVariableValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPSetVariableValue-response)))
  "Returns string type for a service object of type 'PNPSetVariableValue-response"
  "pnp_msgs/PNPSetVariableValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPSetVariableValue-response>)))
  "Returns md5sum for a message object of type '<PNPSetVariableValue-response>"
  "f26fb17f1178850596cc513f7a908898")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPSetVariableValue-response)))
  "Returns md5sum for a message object of type 'PNPSetVariableValue-response"
  "f26fb17f1178850596cc513f7a908898")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPSetVariableValue-response>)))
  "Returns full string definition for message of type '<PNPSetVariableValue-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPSetVariableValue-response)))
  "Returns full string definition for message of type 'PNPSetVariableValue-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPSetVariableValue-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPSetVariableValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPSetVariableValue-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PNPSetVariableValue)))
  'PNPSetVariableValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PNPSetVariableValue)))
  'PNPSetVariableValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPSetVariableValue)))
  "Returns string type for a service object of type '<PNPSetVariableValue>"
  "pnp_msgs/PNPSetVariableValue")