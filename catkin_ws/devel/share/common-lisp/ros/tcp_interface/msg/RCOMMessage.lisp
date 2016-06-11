; Auto-generated. Do not edit!


(cl:in-package tcp_interface-msg)


;//! \htmlinclude RCOMMessage.msg.html

(cl:defclass <RCOMMessage> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (robotsender
    :reader robotsender
    :initarg :robotsender
    :type cl:string
    :initform "")
   (robotreceiver
    :reader robotreceiver
    :initarg :robotreceiver
    :type cl:string
    :initform "")
   (value
    :reader value
    :initarg :value
    :type cl:string
    :initform ""))
)

(cl:defclass RCOMMessage (<RCOMMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RCOMMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RCOMMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tcp_interface-msg:<RCOMMessage> is deprecated: use tcp_interface-msg:RCOMMessage instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RCOMMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tcp_interface-msg:header-val is deprecated.  Use tcp_interface-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'robotsender-val :lambda-list '(m))
(cl:defmethod robotsender-val ((m <RCOMMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tcp_interface-msg:robotsender-val is deprecated.  Use tcp_interface-msg:robotsender instead.")
  (robotsender m))

(cl:ensure-generic-function 'robotreceiver-val :lambda-list '(m))
(cl:defmethod robotreceiver-val ((m <RCOMMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tcp_interface-msg:robotreceiver-val is deprecated.  Use tcp_interface-msg:robotreceiver instead.")
  (robotreceiver m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <RCOMMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tcp_interface-msg:value-val is deprecated.  Use tcp_interface-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RCOMMessage>) ostream)
  "Serializes a message object of type '<RCOMMessage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotsender))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotsender))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotreceiver))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotreceiver))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'value))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RCOMMessage>) istream)
  "Deserializes a message object of type '<RCOMMessage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotsender) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotsender) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotreceiver) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotreceiver) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RCOMMessage>)))
  "Returns string type for a message object of type '<RCOMMessage>"
  "tcp_interface/RCOMMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RCOMMessage)))
  "Returns string type for a message object of type 'RCOMMessage"
  "tcp_interface/RCOMMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RCOMMessage>)))
  "Returns md5sum for a message object of type '<RCOMMessage>"
  "eade0dbd2c9d3c49dad275602c410b50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RCOMMessage)))
  "Returns md5sum for a message object of type 'RCOMMessage"
  "eade0dbd2c9d3c49dad275602c410b50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RCOMMessage>)))
  "Returns full string definition for message of type '<RCOMMessage>"
  (cl:format cl:nil "Header header~%string robotsender~%string robotreceiver~%string value~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RCOMMessage)))
  "Returns full string definition for message of type 'RCOMMessage"
  (cl:format cl:nil "Header header~%string robotsender~%string robotreceiver~%string value~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RCOMMessage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'robotsender))
     4 (cl:length (cl:slot-value msg 'robotreceiver))
     4 (cl:length (cl:slot-value msg 'value))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RCOMMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'RCOMMessage
    (cl:cons ':header (header msg))
    (cl:cons ':robotsender (robotsender msg))
    (cl:cons ':robotreceiver (robotreceiver msg))
    (cl:cons ':value (value msg))
))
