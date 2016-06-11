
(cl:in-package :asdf)

(defsystem "glocalizer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "LocalizerRanges" :depends-on ("_package_LocalizerRanges"))
    (:file "_package_LocalizerRanges" :depends-on ("_package"))
  ))