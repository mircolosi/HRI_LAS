; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-srv)


;//! \htmlinclude PNPLastEvent-request.msg.html

(cl:defclass <PNPLastEvent-request> (roslisp-msg-protocol:ros-message)
  ((substring
    :reader substring
    :initarg :substring
    :type cl:string
    :initform ""))
)

(cl:defclass PNPLastEvent-request (<PNPLastEvent-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPLastEvent-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPLastEvent-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPLastEvent-request> is deprecated: use pnp_msgs-srv:PNPLastEvent-request instead.")))

(cl:ensure-generic-function 'substring-val :lambda-list '(m))
(cl:defmethod substring-val ((m <PNPLastEvent-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:substring-val is deprecated.  Use pnp_msgs-srv:substring instead.")
  (substring m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPLastEvent-request>) ostream)
  "Serializes a message object of type '<PNPLastEvent-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'substring))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'substring))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPLastEvent-request>) istream)
  "Deserializes a message object of type '<PNPLastEvent-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'substring) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'substring) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPLastEvent-request>)))
  "Returns string type for a service object of type '<PNPLastEvent-request>"
  "pnp_msgs/PNPLastEventRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPLastEvent-request)))
  "Returns string type for a service object of type 'PNPLastEvent-request"
  "pnp_msgs/PNPLastEventRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPLastEvent-request>)))
  "Returns md5sum for a message object of type '<PNPLastEvent-request>"
  "0acea5ee5ed25bf28c97c4f649046fed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPLastEvent-request)))
  "Returns md5sum for a message object of type 'PNPLastEvent-request"
  "0acea5ee5ed25bf28c97c4f649046fed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPLastEvent-request>)))
  "Returns full string definition for message of type '<PNPLastEvent-request>"
  (cl:format cl:nil "string substring~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPLastEvent-request)))
  "Returns full string definition for message of type 'PNPLastEvent-request"
  (cl:format cl:nil "string substring~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPLastEvent-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'substring))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPLastEvent-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPLastEvent-request
    (cl:cons ':substring (substring msg))
))
;//! \htmlinclude PNPLastEvent-response.msg.html

(cl:defclass <PNPLastEvent-response> (roslisp-msg-protocol:ros-message)
  ((eventName
    :reader eventName
    :initarg :eventName
    :type cl:string
    :initform ""))
)

(cl:defclass PNPLastEvent-response (<PNPLastEvent-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPLastEvent-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPLastEvent-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-srv:<PNPLastEvent-response> is deprecated: use pnp_msgs-srv:PNPLastEvent-response instead.")))

(cl:ensure-generic-function 'eventName-val :lambda-list '(m))
(cl:defmethod eventName-val ((m <PNPLastEvent-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-srv:eventName-val is deprecated.  Use pnp_msgs-srv:eventName instead.")
  (eventName m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPLastEvent-response>) ostream)
  "Serializes a message object of type '<PNPLastEvent-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'eventName))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'eventName))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPLastEvent-response>) istream)
  "Deserializes a message object of type '<PNPLastEvent-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'eventName) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'eventName) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPLastEvent-response>)))
  "Returns string type for a service object of type '<PNPLastEvent-response>"
  "pnp_msgs/PNPLastEventResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPLastEvent-response)))
  "Returns string type for a service object of type 'PNPLastEvent-response"
  "pnp_msgs/PNPLastEventResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPLastEvent-response>)))
  "Returns md5sum for a message object of type '<PNPLastEvent-response>"
  "0acea5ee5ed25bf28c97c4f649046fed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPLastEvent-response)))
  "Returns md5sum for a message object of type 'PNPLastEvent-response"
  "0acea5ee5ed25bf28c97c4f649046fed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPLastEvent-response>)))
  "Returns full string definition for message of type '<PNPLastEvent-response>"
  (cl:format cl:nil "string eventName~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPLastEvent-response)))
  "Returns full string definition for message of type 'PNPLastEvent-response"
  (cl:format cl:nil "string eventName~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPLastEvent-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'eventName))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPLastEvent-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPLastEvent-response
    (cl:cons ':eventName (eventName msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PNPLastEvent)))
  'PNPLastEvent-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PNPLastEvent)))
  'PNPLastEvent-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPLastEvent)))
  "Returns string type for a service object of type '<PNPLastEvent>"
  "pnp_msgs/PNPLastEvent")