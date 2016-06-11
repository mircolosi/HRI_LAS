; Auto-generated. Do not edit!


(cl:in-package pnp_msgs-msg)


;//! \htmlinclude PNPGoal.msg.html

(cl:defclass <PNPGoal> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (robotname
    :reader robotname
    :initarg :robotname
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
   (function
    :reader function
    :initarg :function
    :type cl:string
    :initform ""))
)

(cl:defclass PNPGoal (<PNPGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PNPGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PNPGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pnp_msgs-msg:<PNPGoal> is deprecated: use pnp_msgs-msg:PNPGoal instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <PNPGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:id-val is deprecated.  Use pnp_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'robotname-val :lambda-list '(m))
(cl:defmethod robotname-val ((m <PNPGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:robotname-val is deprecated.  Use pnp_msgs-msg:robotname instead.")
  (robotname m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <PNPGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:name-val is deprecated.  Use pnp_msgs-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <PNPGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:params-val is deprecated.  Use pnp_msgs-msg:params instead.")
  (params m))

(cl:ensure-generic-function 'function-val :lambda-list '(m))
(cl:defmethod function-val ((m <PNPGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pnp_msgs-msg:function-val is deprecated.  Use pnp_msgs-msg:function instead.")
  (function m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PNPGoal>) ostream)
  "Serializes a message object of type '<PNPGoal>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robotname))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robotname))
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'function))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'function))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PNPGoal>) istream)
  "Deserializes a message object of type '<PNPGoal>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotname) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robotname) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
      (cl:setf (cl:slot-value msg 'function) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'function) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PNPGoal>)))
  "Returns string type for a message object of type '<PNPGoal>"
  "pnp_msgs/PNPGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PNPGoal)))
  "Returns string type for a message object of type 'PNPGoal"
  "pnp_msgs/PNPGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PNPGoal>)))
  "Returns md5sum for a message object of type '<PNPGoal>"
  "a0d5a98248939a7e31819af7d17a2ab6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PNPGoal)))
  "Returns md5sum for a message object of type 'PNPGoal"
  "a0d5a98248939a7e31819af7d17a2ab6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PNPGoal>)))
  "Returns full string definition for message of type '<PNPGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#Goal~%uint32 id~%string robotname~%string name~%string params~%string function~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PNPGoal)))
  "Returns full string definition for message of type 'PNPGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#Goal~%uint32 id~%string robotname~%string name~%string params~%string function~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PNPGoal>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'robotname))
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'params))
     4 (cl:length (cl:slot-value msg 'function))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PNPGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'PNPGoal
    (cl:cons ':id (id msg))
    (cl:cons ':robotname (robotname msg))
    (cl:cons ':name (name msg))
    (cl:cons ':params (params msg))
    (cl:cons ':function (function msg))
))
