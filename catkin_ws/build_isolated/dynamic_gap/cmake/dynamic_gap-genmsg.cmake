# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "dynamic_gap: 2 messages, 0 services")

set(MSG_I_FLAGS "-Idynamic_gap:/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(dynamic_gap_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg" NAME_WE)
add_custom_target(_dynamic_gap_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dynamic_gap" "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg" ""
)

get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg" NAME_WE)
add_custom_target(_dynamic_gap_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dynamic_gap" "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg" "dynamic_gap/GapPolar:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamic_gap
)
_generate_msg_cpp(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg"
  "${MSG_I_FLAGS}"
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamic_gap
)

### Generating Services

### Generating Module File
_generate_module_cpp(dynamic_gap
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamic_gap
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(dynamic_gap_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(dynamic_gap_generate_messages dynamic_gap_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_cpp _dynamic_gap_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_cpp _dynamic_gap_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamic_gap_gencpp)
add_dependencies(dynamic_gap_gencpp dynamic_gap_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamic_gap_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamic_gap
)
_generate_msg_eus(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg"
  "${MSG_I_FLAGS}"
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamic_gap
)

### Generating Services

### Generating Module File
_generate_module_eus(dynamic_gap
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamic_gap
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(dynamic_gap_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(dynamic_gap_generate_messages dynamic_gap_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_eus _dynamic_gap_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_eus _dynamic_gap_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamic_gap_geneus)
add_dependencies(dynamic_gap_geneus dynamic_gap_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamic_gap_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamic_gap
)
_generate_msg_lisp(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg"
  "${MSG_I_FLAGS}"
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamic_gap
)

### Generating Services

### Generating Module File
_generate_module_lisp(dynamic_gap
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamic_gap
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(dynamic_gap_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(dynamic_gap_generate_messages dynamic_gap_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_lisp _dynamic_gap_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_lisp _dynamic_gap_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamic_gap_genlisp)
add_dependencies(dynamic_gap_genlisp dynamic_gap_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamic_gap_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamic_gap
)
_generate_msg_nodejs(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg"
  "${MSG_I_FLAGS}"
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamic_gap
)

### Generating Services

### Generating Module File
_generate_module_nodejs(dynamic_gap
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamic_gap
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(dynamic_gap_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(dynamic_gap_generate_messages dynamic_gap_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_nodejs _dynamic_gap_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_nodejs _dynamic_gap_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamic_gap_gennodejs)
add_dependencies(dynamic_gap_gennodejs dynamic_gap_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamic_gap_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamic_gap
)
_generate_msg_py(dynamic_gap
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg"
  "${MSG_I_FLAGS}"
  "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamic_gap
)

### Generating Services

### Generating Module File
_generate_module_py(dynamic_gap
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamic_gap
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(dynamic_gap_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(dynamic_gap_generate_messages dynamic_gap_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolar.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_py _dynamic_gap_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/power20/DRL-robot-navigation/catkin_ws/src/dynamic_gap/msg/GapPolarArray.msg" NAME_WE)
add_dependencies(dynamic_gap_generate_messages_py _dynamic_gap_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dynamic_gap_genpy)
add_dependencies(dynamic_gap_genpy dynamic_gap_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dynamic_gap_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamic_gap)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dynamic_gap
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(dynamic_gap_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(dynamic_gap_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(dynamic_gap_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamic_gap)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dynamic_gap
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(dynamic_gap_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(dynamic_gap_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(dynamic_gap_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamic_gap)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dynamic_gap
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(dynamic_gap_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(dynamic_gap_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(dynamic_gap_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamic_gap)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dynamic_gap
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(dynamic_gap_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(dynamic_gap_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(dynamic_gap_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamic_gap)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamic_gap\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dynamic_gap
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(dynamic_gap_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(dynamic_gap_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(dynamic_gap_generate_messages_py sensor_msgs_generate_messages_py)
endif()
