// Auto-generated. Do not edit!

// (in-package dynamic_gap.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GapPolar = require('./GapPolar.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class GapPolarArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.gaps = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('gaps')) {
        this.gaps = initObj.gaps
      }
      else {
        this.gaps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GapPolarArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [gaps]
    // Serialize the length for message field [gaps]
    bufferOffset = _serializer.uint32(obj.gaps.length, buffer, bufferOffset);
    obj.gaps.forEach((val) => {
      bufferOffset = GapPolar.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GapPolarArray
    let len;
    let data = new GapPolarArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [gaps]
    // Deserialize array length for message field [gaps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.gaps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.gaps[i] = GapPolar.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 16 * object.gaps.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamic_gap/GapPolarArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bca7aae125759a66c1c2548d6ce506aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header      header
    GapPolar[]  gaps
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: dynamic_gap/GapPolar
    # angles are in the incoming laser frame  (rad)
    float32 right_angle
    float32 right_range
    float32 left_angle
    float32 left_range
    
    # convenience: Euclidean width of the gap  (m)
    # float32 width 
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GapPolarArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.gaps !== undefined) {
      resolved.gaps = new Array(msg.gaps.length);
      for (let i = 0; i < resolved.gaps.length; ++i) {
        resolved.gaps[i] = GapPolar.Resolve(msg.gaps[i]);
      }
    }
    else {
      resolved.gaps = []
    }

    return resolved;
    }
};

module.exports = GapPolarArray;
