; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-msg)


;//! \htmlinclude ActionFinished.msg.html

(cl:defclass <ActionFinished> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (params
    :reader params
    :initarg :params
    :type cl:string
    :initform "")
   (result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass ActionFinished (<ActionFinished>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ActionFinished>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ActionFinished)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-msg:<ActionFinished> is deprecated: use pnp_msgs-msg:ActionFinished instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <ActionFinished>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:id-val is deprecated.  Use pnp_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ActionFinished>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:name-val is deprecated.  Use pnp_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <ActionFinished>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:params-val is deprecated.  Use pnp_msgs-msg:params instead.")
  (params m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <ActionFinished>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:result-val is deprecated.  Use pnp_msgs-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ActionFinished>) ostream)
  "Serializes a message object of type '<ActionFinished>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'params))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'params))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ActionFinished>) istream)
  "Deserializes a message object of type '<ActionFinished>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'params) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'params) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ActionFinished>)))
  "Returns string type for a message object of type '<ActionFinished>"
  "pnp_msgs/ActionFinished")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ActionFinished)))
  "Returns string type for a message object of type 'ActionFinished"
  "pnp_msgs/ActionFinished")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ActionFinished>)))
  "Returns md5sum for a message object of type '<ActionFinished>"
  "62ff49e7da707990283c2b8184dd5fc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ActionFinished)))
  "Returns md5sum for a message object of type 'ActionFinished"
  "62ff49e7da707990283c2b8184dd5fc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ActionFinished>)))
  "Returns full string definition for message of type '<ActionFinished>"
  (cl:format cl:nil "string id~%string name~%string params~%string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ActionFinished)))
  "Returns full string definition for message of type 'ActionFinished"
  (cl:format cl:nil "string id~%string name~%string params~%string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ActionFinished>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'params))
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ActionFinished>))
  "Converts a ROS message object to a list"
  (cl:list 'ActionFinished
    (cl:cons ':id (id msg))
    (cl:cons ':name (name msg))
    (cl:cons ':params (params msg))
    (cl:cons ':result (result msg))
))
