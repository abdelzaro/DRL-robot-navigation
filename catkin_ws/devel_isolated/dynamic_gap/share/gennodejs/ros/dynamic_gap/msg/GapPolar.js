// Auto-generated. Do not edit!

// (in-package dynamic_gap.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GapPolar {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.right_angle = null;
      this.right_range = null;
      this.left_angle = null;
      this.left_range = null;
    }
    else {
      if (initObj.hasOwnProperty('right_angle')) {
        this.right_angle = initObj.right_angle
      }
      else {
        this.right_angle = 0.0;
      }
      if (initObj.hasOwnProperty('right_range')) {
        this.right_range = initObj.right_range
      }
      else {
        this.right_range = 0.0;
      }
      if (initObj.hasOwnProperty('left_angle')) {
        this.left_angle = initObj.left_angle
      }
      else {
        this.left_angle = 0.0;
      }
      if (initObj.hasOwnProperty('left_range')) {
        this.left_range = initObj.left_range
      }
      else {
        this.left_range = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GapPolar
    // Serialize message field [right_angle]
    bufferOffset = _serializer.float32(obj.right_angle, buffer, bufferOffset);
    // Serialize message field [right_range]
    bufferOffset = _serializer.float32(obj.right_range, buffer, bufferOffset);
    // Serialize message field [left_angle]
    bufferOffset = _serializer.float32(obj.left_angle, buffer, bufferOffset);
    // Serialize message field [left_range]
    bufferOffset = _serializer.float32(obj.left_range, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GapPolar
    let len;
    let data = new GapPolar(null);
    // Deserialize message field [right_angle]
    data.right_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_range]
    data.right_range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_angle]
    data.left_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_range]
    data.left_range = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dynamic_gap/GapPolar';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '633e4eeee72c08575897401f2c80d401';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new GapPolar(null);
    if (msg.right_angle !== undefined) {
      resolved.right_angle = msg.right_angle;
    }
    else {
      resolved.right_angle = 0.0
    }

    if (msg.right_range !== undefined) {
      resolved.right_range = msg.right_range;
    }
    else {
      resolved.right_range = 0.0
    }

    if (msg.left_angle !== undefined) {
      resolved.left_angle = msg.left_angle;
    }
    else {
      resolved.left_angle = 0.0
    }

    if (msg.left_range !== undefined) {
      resolved.left_range = msg.left_range;
    }
    else {
      resolved.left_range = 0.0
    }

    return resolved;
    }
};

module.exports = GapPolar;
