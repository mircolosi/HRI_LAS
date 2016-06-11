
(cl:in-package :asdf)

(defsystem "pnp_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PNPCondition" :depends-on ("_package_PNPCondition"))
    (:file "_package_PNPCondition" :depends-on ("_package"))
    (:file "PNPSetVariableValue" :depends-on ("_package_PNPSetVariableValue"))
    (:file "_package_PNPSetVariableValue" :depends-on ("_package"))
    (:file "PNPReward" :depends-on ("_package_PNPReward"))
    (:file "_package_PNPReward" :depends-on ("_package"))
    (:file "PNPLastEvent" :depends-on ("_package_PNPLastEvent"))
    (:file "_package_PNPLastEvent" :depends-on ("_package"))
    (:file "PNPGetVariableValue" :depends-on ("_package_PNPGetVariableValue"))
    (:file "_package_PNPGetVariableValue" :depends-on ("_package"))
    (:file "PNPClearBuffer" :depends-on ("_package_PNPClearBuffer"))
    (:file "_package_PNPClearBuffer" :depends-on ("_package"))
  ))