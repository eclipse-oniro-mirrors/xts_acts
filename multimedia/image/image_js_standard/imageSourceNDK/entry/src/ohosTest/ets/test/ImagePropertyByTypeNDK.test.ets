import image from "@ohos.multimedia.image";

interface ModifyRule {
  expectValueJPG: number | string | Array<number> | Array<number | null> | null;
  expectValuePNG: number | string | Array<number> | Array<number | null> | null;
  expectValueHEIC: number | string | Array<number> | Array<number | null> | null;
  expectValueWEBP: number | string | Array<number> | Array<number | null> | null;
  expectValueDNG: number | string | Array<number> | Array<number | null> | null;
}

interface ModifyRule2 {
  modifyValue: number | Array<number> | ArrayBuffer;
  expectValueJPG: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValuePNG: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValueHEIC: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValueWEBP: number | Array<number> | Array<number | null> | null | ArrayBuffer;
  expectValueDNG: number | Array<number> | Array<number | null> | null | ArrayBuffer;
}

interface PropertyTypeConfig {
  keys: Array<image.PropertyKey>;
  rules: Map<image.PropertyKey, ModifyRule>;
}

interface PropertyTypeConfig2 {
  keys: Array<image.PropertyKey>;
  rules: Map<image.PropertyKey, ModifyRule2>;
}

interface ImagePropertyConfigType {
  short: PropertyTypeConfig;
  shortReadOnly: PropertyTypeConfig;
  long: PropertyTypeConfig;
  double: PropertyTypeConfig;
  intArray: PropertyTypeConfig;
  doubleArray: PropertyTypeConfig;
  arrayBuffer: PropertyTypeConfig;
  string: PropertyTypeConfig;
  arrayBufferOnly: PropertyTypeConfig;
  shortModify: PropertyTypeConfig2;
  longModify: PropertyTypeConfig2;
  doubleModify: PropertyTypeConfig2;
  intArrayModify: PropertyTypeConfig2;
  doubleArrayModify: PropertyTypeConfig2;
  arrayBufferModify: PropertyTypeConfig2;
}

let makernote: number[] = [72, 85, 65, 87, 69, 73, 0, 0, 73, 73, 42, 0, 8, 0, 0, 0, 9, 0, 0, 2, 4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 4, 0, 1, 0, 0, 0, 2, 0, 0, 0, 2, 2, 4, 0, 1, 0, 0, 0, 3, 0, 0, 0, 3, 2, 9, 0, 1, 0, 0, 0, 4, 0, 0, 0, 4, 2, 9, 0, 1, 0, 0, 0, 5, 0, 0, 0, 5, 2, 4, 0, 1, 0, 0, 0, 6, 0, 0, 0, 13, 2, 9, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 1, 4, 0, 1, 0, 0, 0, 122, 0, 0, 0, 0, 0, 4, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 8, 0, 1, 1, 4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 2, 1, 4, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 1, 4, 0, 1, 0, 0, 0, 3, 0, 0, 0, 4, 1, 7, 0, 8, 0, 0, 0, 224, 0, 0, 0, 5, 1, 7, 0, 16, 0, 0, 0, 232, 0, 0, 0, 6, 1, 7, 0, 4, 0, 0, 0, 1, 2, 3, 4, 7, 1, 7, 0, 4, 0, 0, 0, 5, 6, 7, 8, 8, 1, 7, 0, 8, 0, 0, 0, 248, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 11, 0, 1, 0, 4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 2, 0, 4, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 4, 0, 1, 0, 0, 0, 3, 0, 0, 0, 4, 0, 4, 0, 1, 0, 0, 0, 4, 0, 0, 0, 5, 0, 4, 0, 1, 0, 0, 0, 5, 0, 0, 0, 6, 0, 4, 0, 1, 0, 0, 0, 6, 0, 0, 0, 7, 0, 4, 0, 1, 0, 0, 0, 7, 0, 0, 0, 8, 0, 4, 0, 1, 0, 0, 0, 8, 0, 0, 0, 9, 0, 4, 0, 1, 0, 0, 0, 9, 0, 0, 0, 10, 0, 4, 0, 1, 0, 0, 0, 10, 0, 0, 0, 11, 0, 4, 0, 1, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0]
let makernoteWEBP: number[] = [72, 85, 65, 87, 69, 73, 0, 0, 73, 73, 42, 0, 8, 0, 0, 0, 9, 0, 0, 2, 4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 2, 4, 0, 1, 0, 0, 0, 2, 0, 0, 0, 2, 2, 4, 0, 1, 0, 0, 0, 3, 0, 0, 0, 3, 2, 9, 0, 1, 0, 0, 0, 4, 0, 0, 0, 4, 2, 9, 0, 1, 0, 0, 0, 5, 0, 0, 0, 5, 2, 4, 0, 1, 0, 0, 0, 6, 0, 0, 0, 13, 2, 9, 0, 1, 0, 0, 0, 7, 0, 0, 0, 0, 1, 4, 0, 1, 0, 0, 0, 122, 0, 0, 0, 0, 0, 4, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 8, 0, 1, 1, 4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 2, 1, 4, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 1, 4, 0, 1, 0, 0, 0, 3, 0, 0, 0, 4, 1, 7, 0, 8, 0, 0, 0, 224, 0, 0, 0, 5, 1, 7, 0, 16, 0, 0, 0, 232, 0, 0, 0, 6, 1, 7, 0, 4, 0, 0, 0, 1, 2, 3, 4, 7, 1, 7, 0, 4, 0, 0, 0, 5, 6, 7, 8, 8, 1, 7, 0, 8, 0, 0, 0, 248, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 11, 0, 1, 0, 4, 0, 1, 0, 0, 0, 1, 0, 0, 0, 2, 0, 4, 0, 1, 0, 0, 0, 2, 0, 0, 0, 3, 0, 4, 0, 1, 0, 0, 0, 3, 0, 0, 0, 4, 0, 4, 0, 1, 0, 0, 0, 4, 0, 0, 0, 5, 0, 4, 0, 1, 0, 0, 0, 5, 0, 0, 0, 6, 0, 4, 0, 1, 0, 0, 0, 6, 0, 0, 0, 7, 0, 4, 0, 1, 0, 0, 0, 7, 0, 0, 0, 8, 0, 4, 0, 1, 0, 0, 0, 8, 0, 0, 0, 9, 0, 4, 0, 1, 0, 0, 0, 9, 0, 0, 0, 10, 0, 4, 0, 1, 0, 0, 0, 10, 0, 0, 0, 11, 0, 4, 0, 1, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0]
let makernoteDNG: number[] = [76,69,73,67,65,0,2,255,0,31,3,0,0,7,0,5,210,0,1,121];

const testArrayBufferUint8: Uint8Array = new Uint8Array([48, 50, 49, 48]);
const testExifArrayBuffer: ArrayBuffer = testArrayBufferUint8.buffer as ArrayBuffer;
const testArrayBufferUint8_1: Uint8Array = new Uint8Array([1]);
const testExifArrayBuffer_1: ArrayBuffer = testArrayBufferUint8_1.buffer as ArrayBuffer;
const testArrayBufferUint8_2: Uint8Array = new Uint8Array([5, 6]);
const testExifArrayBuffer_2: ArrayBuffer = testArrayBufferUint8_2.buffer as ArrayBuffer;

const ImagePropertyConfig: ImagePropertyConfigType = {
  short: {
    keys: [
      image.PropertyKey.ORIENTATION,
      image.PropertyKey.IMAGE_WIDTH,
      image.PropertyKey.IMAGE_LENGTH,
      image.PropertyKey.SAMPLES_PER_PIXEL,
      image.PropertyKey.PLANAR_CONFIGURATION,
      image.PropertyKey.RESOLUTION_UNIT,
      image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
      image.PropertyKey.COMPRESSION,
      image.PropertyKey.EXPOSURE_PROGRAM,
      image.PropertyKey.METERING_MODE,
      image.PropertyKey.LIGHT_SOURCE,
      image.PropertyKey.FLASH,
      image.PropertyKey.WHITE_BALANCE,
      image.PropertyKey.SCENE_CAPTURE_TYPE,
      image.PropertyKey.CONTRAST,
      image.PropertyKey.SATURATION,
      image.PropertyKey.SHARPNESS,
      image.PropertyKey.CUSTOM_RENDERED,
      image.PropertyKey.EXPOSURE_MODE,
      image.PropertyKey.GAIN_CONTROL,
      image.PropertyKey.SUBJECT_DISTANCE_RANGE,
      image.PropertyKey.SENSING_METHOD,
      image.PropertyKey.COLOR_SPACE,
      image.PropertyKey.PIXEL_X_DIMENSION,
      image.PropertyKey.PIXEL_Y_DIMENSION,
      image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
      image.PropertyKey.ISO_SPEED_RATINGS,
      image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,
      image.PropertyKey.SENSITIVITY_TYPE,
      image.PropertyKey.ISO_SPEED,
      image.PropertyKey.YCBCR_POSITIONING,
      image.PropertyKey.GPS_ALTITUDE_REF,
      image.PropertyKey.GPS_DIFFERENTIAL,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.ORIENTATION,                 { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 2    ,expectValueDNG: 1        }],
      [image.PropertyKey.IMAGE_WIDTH,                 { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 3456 ,expectValueDNG: 5984     }],
      [image.PropertyKey.IMAGE_LENGTH,                { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 4608 ,expectValueDNG: 4000     }],
      [image.PropertyKey.SAMPLES_PER_PIXEL,           { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 23   ,expectValueDNG: 1        }],
      [image.PropertyKey.PLANAR_CONFIGURATION,        { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 1    ,expectValueDNG: 1        }],
      [image.PropertyKey.RESOLUTION_UNIT,             { expectValueJPG: 2,   expectValuePNG: 2,   expectValueHEIC: 2,   expectValueWEBP: 2    ,expectValueDNG: 2        }],
      [image.PropertyKey.PHOTOMETRIC_INTERPRETATION,  { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 32803    }],
      [image.PropertyKey.COMPRESSION,                 { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 1    ,expectValueDNG: 7        }],
      [image.PropertyKey.EXPOSURE_PROGRAM,            { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 2    ,expectValueDNG: 3        }],
      [image.PropertyKey.METERING_MODE,               { expectValueJPG: 5,   expectValuePNG: 5,   expectValueHEIC: 5,   expectValueWEBP: 5    ,expectValueDNG: 2        }],
      [image.PropertyKey.LIGHT_SOURCE,                { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 1    ,expectValueDNG: 0        }],
      [image.PropertyKey.FLASH,                       { expectValueJPG: 5,   expectValuePNG: 5,   expectValueHEIC: 5,   expectValueWEBP: 24   ,expectValueDNG: 0        }],
      [image.PropertyKey.WHITE_BALANCE,               { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 0    ,expectValueDNG: 0        }],
      [image.PropertyKey.SCENE_CAPTURE_TYPE,          { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 0        }],
      [image.PropertyKey.CONTRAST,                    { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 0        }],
      [image.PropertyKey.SATURATION,                  { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 0        }],
      [image.PropertyKey.SHARPNESS,                   { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 0        }],
      [image.PropertyKey.CUSTOM_RENDERED,             { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 1    ,expectValueDNG: 0        }],
      [image.PropertyKey.EXPOSURE_MODE,               { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 0        }],
      [image.PropertyKey.GAIN_CONTROL,                { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 7700202  }],
      [image.PropertyKey.SUBJECT_DISTANCE_RANGE,      { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 0    ,expectValueDNG: 7700202  }],
      [image.PropertyKey.SENSING_METHOD,              { expectValueJPG: 3,   expectValuePNG: 3,   expectValueHEIC: 3,   expectValueWEBP: 2    ,expectValueDNG: 7700202  }],
      [image.PropertyKey.COLOR_SPACE,                 { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 1    ,expectValueDNG: 1        }],
      [image.PropertyKey.PIXEL_X_DIMENSION,           { expectValueJPG: 123, expectValuePNG: 123, expectValueHEIC: 123, expectValueWEBP: 123  ,expectValueDNG: 5984     }],
      [image.PropertyKey.PIXEL_Y_DIMENSION,           { expectValueJPG: 234, expectValuePNG: 234, expectValueHEIC: 234, expectValueWEBP: 4608 ,expectValueDNG: 4000     }],
      [image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,  { expectValueJPG: 2,   expectValuePNG: 2,   expectValueHEIC: 2,   expectValueWEBP: 27   ,expectValueDNG: 7700202  }],
      [image.PropertyKey.ISO_SPEED_RATINGS,           { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 200  ,expectValueDNG: 200      }],
      [image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,    { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 200  ,expectValueDNG: 200      }],
      [image.PropertyKey.SENSITIVITY_TYPE,            { expectValueJPG: 5,   expectValuePNG: 5,   expectValueHEIC: 5,   expectValueWEBP: 5    ,expectValueDNG: 7700202  }],
      [image.PropertyKey.ISO_SPEED,                   { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 200  ,expectValueDNG: 200      }],
      [image.PropertyKey.YCBCR_POSITIONING,           { expectValueJPG: 1,   expectValuePNG: 1,   expectValueHEIC: 1,   expectValueWEBP: 1    ,expectValueDNG: 7700202  }],
      [image.PropertyKey.GPS_ALTITUDE_REF,            { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 1    ,expectValueDNG: 0        }],
      [image.PropertyKey.GPS_DIFFERENTIAL,            { expectValueJPG: 0,   expectValuePNG: 0,   expectValueHEIC: 0,   expectValueWEBP: 1    ,expectValueDNG: 7700202  }],
    ])
  },
  shortReadOnly: {
    keys: [
      image.PropertyKey.GIF_LOOP_COUNT,
      image.PropertyKey.JPEG_INTERCHANGE_FORMAT,
      image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.JPEG_INTERCHANGE_FORMAT,        { expectValueJPG: 2798, expectValuePNG: 2798, expectValueHEIC: 2798, expectValueWEBP: null, expectValueDNG: 7700202  }],
      [image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH, { expectValueJPG: 4,    expectValuePNG: 4,    expectValueHEIC: 4,    expectValueWEBP: null, expectValueDNG: 7700202  }]
    ])
  },
  long: {
    keys: [
      image.PropertyKey.NEW_SUBFILE_TYPE,
      image.PropertyKey.SUBFILE_TYPE,
      image.PropertyKey.STRIP_OFFSETS,
      image.PropertyKey.ROWS_PER_STRIP,
      image.PropertyKey.STRIP_BYTE_COUNTS,
      image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
      image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
      image.PropertyKey.ISO_SPEED_LATITUDE_YYY,
      image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.NEW_SUBFILE_TYPE,            { expectValueJPG: 3,    expectValuePNG: 3,    expectValueHEIC: 3,    expectValueWEBP: 3  , expectValueDNG: 0        }],
      [image.PropertyKey.SUBFILE_TYPE,                { expectValueJPG: 2,    expectValuePNG: 2,    expectValueHEIC: 2,    expectValueWEBP: 2  , expectValueDNG: 7700202  }],
      [image.PropertyKey.STRIP_OFFSETS,               { expectValueJPG: 123,  expectValuePNG: 123,  expectValueHEIC: 123,  expectValueWEBP: 123, expectValueDNG: 17854    }],
      [image.PropertyKey.ROWS_PER_STRIP,              { expectValueJPG: 123,  expectValuePNG: 123,  expectValueHEIC: 123,  expectValueWEBP: 123, expectValueDNG: 4000     }],
      [image.PropertyKey.STRIP_BYTE_COUNTS,           { expectValueJPG: 123,  expectValuePNG: 123,  expectValueHEIC: 123,  expectValueWEBP: 123, expectValueDNG: 24739144 }],
      [image.PropertyKey.ISO_SPEED_LATITUDE_YYY,      { expectValueJPG: 1456, expectValuePNG: 1456, expectValueHEIC: 1456, expectValueWEBP: 3  , expectValueDNG: 7700202  }],
      [image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,  { expectValueJPG: 123,  expectValuePNG: 123,  expectValueHEIC: 123,  expectValueWEBP: 241, expectValueDNG: 7700202  }],
      [image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,      { expectValueJPG: 1456, expectValuePNG: 1456, expectValueHEIC: 1456, expectValueWEBP: 3  , expectValueDNG: 7700202  }],
      [image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, { expectValueJPG: 5,    expectValuePNG: 5,    expectValueHEIC: 5,    expectValueWEBP: 5  , expectValueDNG: 7700202  }],
    ])
  },
  double: {
    keys: [
      image.PropertyKey.X_RESOLUTION,
      image.PropertyKey.Y_RESOLUTION,
      image.PropertyKey.EXPOSURE_TIME,
      image.PropertyKey.F_NUMBER,
      image.PropertyKey.SHUTTER_SPEED,
      image.PropertyKey.APERTURE_VALUE,
      image.PropertyKey.BRIGHTNESS_VALUE,
      image.PropertyKey.EXPOSURE_BIAS_VALUE,
      image.PropertyKey.MAX_APERTURE_VALUE,
      image.PropertyKey.SUBJECT_DISTANCE,
      image.PropertyKey.FLASH_ENERGY,
      image.PropertyKey.FOCAL_LENGTH,
      image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
      image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
      image.PropertyKey.EXPOSURE_INDEX,
      image.PropertyKey.DIGITAL_ZOOM_RATIO,
      image.PropertyKey.GAMMA,
      image.PropertyKey.GPS_ALTITUDE,
      image.PropertyKey.GPS_SPEED,
      image.PropertyKey.GPS_TRACK,
      image.PropertyKey.GPS_IMG_DIRECTION,
      image.PropertyKey.GPS_DEST_BEARING,
      image.PropertyKey.GPS_DEST_DISTANCE,
      image.PropertyKey.GPS_DOP, 
      image.PropertyKey.GPS_H_POSITIONING_ERROR
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.X_RESOLUTION,             { expectValueJPG: 0,                    expectValuePNG: 0,                    expectValueHEIC: 0,                       expectValueWEBP: 72,                expectValueDNG: 300,        }],
      [image.PropertyKey.Y_RESOLUTION,             { expectValueJPG: 0,                    expectValuePNG: 0,                    expectValueHEIC: 0,                       expectValueWEBP: 72,                expectValueDNG: 300,        }],
      [image.PropertyKey.EXPOSURE_TIME,            { expectValueJPG: 0.029411764705882353, expectValuePNG: 0.029411764705882353, expectValueHEIC: 0.029411764705882353,    expectValueWEBP: 0.03,              expectValueDNG: 0.00025,    }],
      [image.PropertyKey.F_NUMBER,                 { expectValueJPG: 1,                    expectValuePNG: 1,                    expectValueHEIC: 1,                       expectValueWEBP: 1.8,               expectValueDNG: 7700202,    }],
      [image.PropertyKey.SHUTTER_SPEED,            { expectValueJPG: 2.5,                  expectValuePNG: 2.5,                  expectValueHEIC: 2.5,                     expectValueWEBP: 14,                expectValueDNG: 12,         }],
      [image.PropertyKey.APERTURE_VALUE,           { expectValueJPG: 4,                    expectValuePNG: 4,                    expectValueHEIC: 4,                       expectValueWEBP: 1.69,              expectValueDNG: 2.5,        }],
      [image.PropertyKey.BRIGHTNESS_VALUE,         { expectValueJPG: 2.5,                  expectValuePNG: 2.5,                  expectValueHEIC: 2.5,                     expectValueWEBP: 0,                 expectValueDNG: 7700202,    }],
      [image.PropertyKey.EXPOSURE_BIAS_VALUE,      { expectValueJPG: 23,                   expectValuePNG: 23,                   expectValueHEIC: 23,                      expectValueWEBP: 0,                 expectValueDNG: 0.33203125, }],
      [image.PropertyKey.MAX_APERTURE_VALUE,       { expectValueJPG: 2.5,                  expectValuePNG: 2.5,                  expectValueHEIC: 2.5,                     expectValueWEBP: 1.69,              expectValueDNG: 0.96875,    }],
      [image.PropertyKey.SUBJECT_DISTANCE,         { expectValueJPG: 2.5,                  expectValuePNG: 2.5,                  expectValueHEIC: 2.5,                     expectValueWEBP: 25,                expectValueDNG: 7700202,    }],
      [image.PropertyKey.FLASH_ENERGY,             { expectValueJPG: 832,                  expectValuePNG: 832,                  expectValueHEIC: 832,                     expectValueWEBP: 832,               expectValueDNG: 7700202,    }],
      [image.PropertyKey.FOCAL_LENGTH,             { expectValueJPG: 0,                    expectValuePNG: 0,                    expectValueHEIC: 0,                       expectValueWEBP: 31,                expectValueDNG: 35,         }],
      [image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, { expectValueJPG: 1080,                 expectValuePNG: 1080,                 expectValueHEIC: 1080,                    expectValueWEBP: 1080,              expectValueDNG: 7700202,    }],
      [image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, { expectValueJPG: 880,                  expectValuePNG: 880,                  expectValueHEIC: 880,                     expectValueWEBP: 880,               expectValueDNG: 7700202,    }],
      [image.PropertyKey.EXPOSURE_INDEX,           { expectValueJPG: 1.5,                  expectValuePNG: 1.5,                  expectValueHEIC: 1.5,                     expectValueWEBP: 1.5,               expectValueDNG: 7700202,    }],
      [image.PropertyKey.DIGITAL_ZOOM_RATIO,       { expectValueJPG: 321,                  expectValuePNG: 321,                  expectValueHEIC: 321,                     expectValueWEBP: 1,                 expectValueDNG: 0,          }],
      [image.PropertyKey.GAMMA,                    { expectValueJPG: 2.5,                  expectValuePNG: 2.5,                  expectValueHEIC: 2.5,                     expectValueWEBP: 1.5,               expectValueDNG: 7700202,    }],
      [image.PropertyKey.GPS_ALTITUDE,             { expectValueJPG: 0,                    expectValuePNG: 0,                    expectValueHEIC: 0,                       expectValueWEBP: 0,                 expectValueDNG: 0,          }],
      [image.PropertyKey.GPS_SPEED,                { expectValueJPG: 150,                  expectValuePNG: 150,                  expectValueHEIC: 150,                     expectValueWEBP: 150,               expectValueDNG: 0,          }],
      [image.PropertyKey.GPS_TRACK,                { expectValueJPG: 38,                   expectValuePNG: 38,                   expectValueHEIC: 38,                      expectValueWEBP: 111,               expectValueDNG: 0,          }],
      [image.PropertyKey.GPS_IMG_DIRECTION,        { expectValueJPG: 2.232142857142857,    expectValuePNG: 2.232142857142857,    expectValueHEIC: 2.232142857142857,       expectValueWEBP: 2.232142857142857, expectValueDNG: 7700202,    }],
      [image.PropertyKey.GPS_DEST_BEARING,         { expectValueJPG: 2,                    expectValuePNG: 2,                    expectValueHEIC: 2,                       expectValueWEBP: 2,                 expectValueDNG: 7700202,    }],
      [image.PropertyKey.GPS_DEST_DISTANCE,        { expectValueJPG: 10,                   expectValuePNG: 10,                   expectValueHEIC: 10,                      expectValueWEBP: 10,                expectValueDNG: 7700202,    }],
      [image.PropertyKey.GPS_DOP,                  { expectValueJPG: 182,                  expectValuePNG: 182,                  expectValueHEIC: 182,                     expectValueWEBP: 182,               expectValueDNG: 0,          }],
      [image.PropertyKey.GPS_H_POSITIONING_ERROR,  { expectValueJPG: 2.5,                  expectValuePNG: 2.5,                  expectValueHEIC: 2.5,                     expectValueWEBP: 2,                 expectValueDNG: 7700202,    }],
    ])
  },
  intArray: {
    keys: [
      image.PropertyKey.BITS_PER_SAMPLE,
      image.PropertyKey.YCBCR_SUB_SAMPLING,
      image.PropertyKey.DEFAULT_CROP_SIZE,
      image.PropertyKey.SUBJECT_AREA,
      image.PropertyKey.SUBJECT_LOCATION,
      image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE,
      image.PropertyKey.DNG_VERSION,
      image.PropertyKey.GPS_VERSION_ID,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.BITS_PER_SAMPLE,                        { expectValueJPG: [1,1,1],   expectValuePNG: [1,1,1],   expectValueHEIC: [1,1,1],   expectValueWEBP: [8,8,8]   , expectValueDNG: [16]         }],
      [image.PropertyKey.YCBCR_SUB_SAMPLING,                     { expectValueJPG: [3,2],     expectValuePNG: [3,2],     expectValueHEIC: [3,2],     expectValueWEBP: [3,3]     , expectValueDNG: 7700202      }],
      [image.PropertyKey.DEFAULT_CROP_SIZE,                      { expectValueJPG: [153,841], expectValuePNG: [153,841], expectValueHEIC: [153,841], expectValueWEBP: [12,1]    , expectValueDNG: [5976,3992]  }],
      [image.PropertyKey.SUBJECT_AREA,                           { expectValueJPG: [12,13],   expectValuePNG: [12,13],   expectValueHEIC: [12,13],   expectValueWEBP: [10,20]   , expectValueDNG: 7700202      }],
      [image.PropertyKey.SUBJECT_LOCATION,                       { expectValueJPG: [0,1],     expectValuePNG: [0,1],     expectValueHEIC: [0,1],     expectValueWEBP: [5,6]     , expectValueDNG: 7700202      }],
      [image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, { expectValueJPG: [23,34],   expectValuePNG: [23,34],   expectValueHEIC: [23,34],   expectValueWEBP: [1234,1]  , expectValueDNG: 7700202      }],
      [image.PropertyKey.DNG_VERSION,                            { expectValueJPG: [2,2,3,1], expectValuePNG: [2,2,3,1], expectValueHEIC: [2,2,3,1], expectValueWEBP: [1,1,2,3] , expectValueDNG: [1,3,0,0]    }],
      [image.PropertyKey.GPS_VERSION_ID,                         { expectValueJPG: [2,2,0,0], expectValuePNG: [2,2,0,0], expectValueHEIC: [2,2,0,0], expectValueWEBP: [2,2,0,0] , expectValueDNG: [2,2,0,0]    }],
    ])
  },
  doubleArray: {
    keys: [
      image.PropertyKey.YCBCR_COEFFICIENTS,
      image.PropertyKey.PRIMARY_CHROMATICITIES,
      image.PropertyKey.REFERENCE_BLACK_WHITE,
      image.PropertyKey.GPS_DEST_LONGITUDE,
      image.PropertyKey.GPS_DEST_LATITUDE,
      image.PropertyKey.GPS_LONGITUDE,
      image.PropertyKey.GPS_LATITUDE,
      image.PropertyKey.GPS_TIME_STAMP,
      image.PropertyKey.LENS_SPECIFICATION,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.YCBCR_COEFFICIENTS,      { expectValueJPG: [0.299,0.587,0.114],     expectValuePNG: [0.299,0.587,0.114],     expectValueHEIC: [0.299,0.587,0.114],     expectValueWEBP: [0.299,0.587,0.114]   , expectValueDNG: [0.299,0.587,0.114]     }],
      [image.PropertyKey.PRIMARY_CHROMATICITIES,  { expectValueJPG: [0],                     expectValuePNG: [0],                     expectValueHEIC: [0],                     expectValueWEBP: [124]                 , expectValueDNG: 7700202                 }],
      [image.PropertyKey.REFERENCE_BLACK_WHITE,   { expectValueJPG: [222,0,1.5,0,25.2,25.2], expectValuePNG: [222,0,1.5,0,25.2,25.2], expectValueHEIC: [222,0,1.5,0,25.2,25.2], expectValueWEBP: [221,255,0,255,0,255] , expectValueDNG: [0,255,128,255,128,255] }],
      [image.PropertyKey.GPS_DEST_LONGITUDE,      { expectValueJPG: [33,22,11],              expectValuePNG: [33,22,11],              expectValueHEIC: [33,22,11],              expectValueWEBP: [33,22,11]            , expectValueDNG: 7700202                 }],
      [image.PropertyKey.GPS_DEST_LATITUDE,       { expectValueJPG: [33,22,11],              expectValuePNG: [33,22,11],              expectValueHEIC: [33,22,11],              expectValueWEBP: [33,22,11]            , expectValueDNG: 7700202                 }],
      [image.PropertyKey.GPS_LONGITUDE,           { expectValueJPG: [120,52,26],             expectValuePNG: [120,52,26],             expectValueHEIC: [120,52,26],             expectValueWEBP: [120,52,26]           , expectValueDNG: [0,0,0]                 }],
      [image.PropertyKey.GPS_LATITUDE,            { expectValueJPG: [39,54,20],              expectValuePNG: [39,54,20],              expectValueHEIC: [39,54,20],              expectValueWEBP: [39,54,20]            , expectValueDNG: [0,0,0]                 }],
      [image.PropertyKey.GPS_TIME_STAMP,          { expectValueJPG: [11,37,58],              expectValuePNG: [11,37,58],              expectValueHEIC: [11,37,58],              expectValueWEBP: [11,37,58]            , expectValueDNG: [0,0,0]                 }],
      [image.PropertyKey.LENS_SPECIFICATION,      { expectValueJPG: [0.75,2.5,1.5,0.5],      expectValuePNG: [0.75,2.5,1.5,0.5],      expectValueHEIC: [0.75,2.5,1.5,0.5],      expectValueWEBP: [1,2.5,3,2]           , expectValueDNG: [35,35,1.4,16]          }],
    ])
  },
  arrayBuffer: {
    keys: [
      image.PropertyKey.OECF,
      image.PropertyKey.MAKER_NOTE,
      image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,
      image.PropertyKey.FILE_SOURCE,
      image.PropertyKey.SCENE_TYPE,
      image.PropertyKey.CFA_PATTERN,
      image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
      image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.OECF,                                     { expectValueJPG: [101,120,99,99],   expectValuePNG: [101,120,99,99],   expectValueHEIC: [101,120,99,99],   expectValueWEBP: [99,99],       expectValueDNG: 7700202       }],
      [image.PropertyKey.MAKER_NOTE,                               { expectValueJPG: makernote,         expectValuePNG: makernote,         expectValueHEIC: makernote,         expectValueWEBP: makernoteWEBP, expectValueDNG: makernoteDNG  }],
      [image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,               { expectValueJPG: [49,51],           expectValuePNG: [49,51],           expectValueHEIC: [49,51],           expectValueWEBP: [49,51],       expectValueDNG: 7700202       }],
      [image.PropertyKey.FILE_SOURCE,                              { expectValueJPG: [3],               expectValuePNG: [3],               expectValueHEIC: [3],               expectValueWEBP: [3],           expectValueDNG: [3]       }],
      [image.PropertyKey.SCENE_TYPE,                               { expectValueJPG: [1],               expectValuePNG: [1],               expectValueHEIC: [1],               expectValueWEBP: [1],           expectValueDNG: [1]           }],
      [image.PropertyKey.CFA_PATTERN,                              { expectValueJPG: [51],              expectValuePNG: [51],              expectValueHEIC: [51],              expectValueWEBP: [97],          expectValueDNG: 7700202           }],
      [image.PropertyKey.DEVICE_SETTING_DESCRIPTION,               { expectValueJPG: [50,120,120,120],  expectValuePNG: [50,120,120,120],  expectValueHEIC: [50,120,120,120],  expectValueWEBP: [50],          expectValueDNG: 7700202           }],
      [image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, { expectValueJPG: [120,120,120,119], expectValuePNG: [120,120,120,119], expectValueHEIC: [120,120,120,119], expectValueWEBP: [49,50,51],    expectValueDNG: 7700202       }],
    ])
  },
  arrayBufferOnly: {
    keys: [
      image.PropertyKey.FACE_SMILE_SCORE,
      image.PropertyKey.FACE_RECT,
      image.PropertyKey.FACE_LEYE_CENTER,
      image.PropertyKey.FACE_REYE_CENTER,
      image.PropertyKey.FACE_MOUTH_CENTER,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.FACE_SMILE_SCORE,   { expectValueJPG: [1,2,3,4,5,6,7,8], expectValuePNG: [1,2,3,4,5,6,7,8], expectValueHEIC: [1,2,3,4,5,6,7,8], expectValueWEBP: [1,2,3,4,5,6,7,8] , expectValueDNG: 7700202                                                                 }],
      [image.PropertyKey.FACE_LEYE_CENTER,   { expectValueJPG: [1,2,3,4],         expectValuePNG: [1,2,3,4],         expectValueHEIC: [1,2,3,4],         expectValueWEBP: [1,2,3,4],          expectValueDNG: 7700202                                                                 }],
      [image.PropertyKey.FACE_REYE_CENTER,   { expectValueJPG: [5,6,7,8],         expectValuePNG: [5,6,7,8],         expectValueHEIC: [5,6,7,8],         expectValueWEBP: [5,6,7,8],          expectValueDNG: 7700202                                                                 }],
      [image.PropertyKey.FACE_MOUTH_CENTER,  { expectValueJPG: [1,2,3,4,5,6,7,8], expectValuePNG: [1,2,3,4,5,6,7,8], expectValueHEIC: [1,2,3,4,5,6,7,8], expectValueWEBP: [1,2,3,4,5,6,7,8],  expectValueDNG: 7700202                                                                 }],
      [image.PropertyKey.FACE_RECT,          { expectValueJPG: [1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8], expectValuePNG: [1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8], expectValueHEIC: [1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8], expectValueWEBP: [1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8], expectValueDNG: 7700202  }],
    ])
  },
  string: {
    keys: [
      image.PropertyKey.IMAGE_DESCRIPTION,
      image.PropertyKey.MAKE,
      image.PropertyKey.MODEL,
      image.PropertyKey.TRANSFER_FUNCTION,
      image.PropertyKey.SOFTWARE,
      image.PropertyKey.DATE_TIME,
      image.PropertyKey.ARTIST,
      image.PropertyKey.COPYRIGHT,
      image.PropertyKey.SPECTRAL_SENSITIVITY,
      image.PropertyKey.GPS_LATITUDE_REF,
      image.PropertyKey.GPS_LONGITUDE_REF,
      image.PropertyKey.GPS_SATELLITES,
      image.PropertyKey.GPS_STATUS,
      image.PropertyKey.GPS_MEASURE_MODE,
      image.PropertyKey.GPS_SPEED_REF,
      image.PropertyKey.GPS_TRACK_REF,
      image.PropertyKey.GPS_IMG_DIRECTION_REF,
      image.PropertyKey.GPS_MAP_DATUM,
      image.PropertyKey.GPS_DEST_LATITUDE_REF,
      image.PropertyKey.GPS_DEST_LONGITUDE_REF,
      image.PropertyKey.GPS_DEST_BEARING_REF,
      image.PropertyKey.GPS_DEST_DISTANCE_REF,
      image.PropertyKey.GPS_PROCESSING_METHOD,
      image.PropertyKey.GPS_AREA_INFORMATION,
      image.PropertyKey.GPS_DATE_STAMP,
      image.PropertyKey.EXIF_VERSION,
      image.PropertyKey.DATE_TIME_ORIGINAL,
      image.PropertyKey.DATE_TIME_DIGITIZED,
      image.PropertyKey.OFFSET_TIME,
      image.PropertyKey.OFFSET_TIME_ORIGINAL,
      image.PropertyKey.OFFSET_TIME_DIGITIZED,
      image.PropertyKey.COMPONENTS_CONFIGURATION,
      image.PropertyKey.RELATED_SOUND_FILE,
      image.PropertyKey.SUBSEC_TIME,
      image.PropertyKey.SUBSEC_TIME_ORIGINAL,
      image.PropertyKey.SUBSEC_TIME_DIGITIZED,
      image.PropertyKey.FLASHPIX_VERSION,
      image.PropertyKey.USER_COMMENT,
      image.PropertyKey.IMAGE_UNIQUE_ID,
      image.PropertyKey.CAMERA_OWNER_NAME,
      image.PropertyKey.BODY_SERIAL_NUMBER,
      image.PropertyKey.LENS_MAKE,
      image.PropertyKey.LENS_MODEL,
      image.PropertyKey.LENS_SERIAL_NUMBER,
    ],
    rules: new Map<image.PropertyKey, ModifyRule>([
      [image.PropertyKey.IMAGE_DESCRIPTION,          { expectValueJPG: "_cuva%s\\d",              expectValuePNG: "_cuva%s\\d",              expectValueHEIC: "_cuva%s\\d",              expectValueWEBP: "cuva",                    expectValueDNG: 7700202                             }],
      [image.PropertyKey.MAKE,                       { expectValueJPG: "华为",                    expectValuePNG: "华为",                     expectValueHEIC:"华为",                     expectValueWEBP: "华为",                     expectValueDNG: "Leica Camera AG"                   }],
      [image.PropertyKey.MODEL,                      { expectValueJPG: "TNY-AL00",                expectValuePNG: "TNY-AL00",                expectValueHEIC: "TNY-AL00",                expectValueWEBP: 7700202,                   expectValueDNG: "LEICA M (Typ 240)"                 }],
      [image.PropertyKey.TRANSFER_FUNCTION,          { expectValueJPG: "3 bytes undefined data",  expectValuePNG: "3 bytes undefined data",  expectValueHEIC: "3 bytes undefined data",  expectValueWEBP: "1 bytes undefined data",  expectValueDNG: 7700202                             }],
      [image.PropertyKey.SOFTWARE,                   { expectValueJPG: "华为",                    expectValuePNG: "华为",                     expectValueHEIC:"华为",                     expectValueWEBP: "TNY-AL00",                 expectValueDNG: "        2.0.2.5"                  }],
      [image.PropertyKey.DATE_TIME,                  { expectValueJPG: "2024:12:31",              expectValuePNG: "2024:12:31",              expectValueHEIC: "2024:12:31",              expectValueWEBP: "2022:06:02 15:51:35",      expectValueDNG: 7700202                            }],
      [image.PropertyKey.ARTIST,                     { expectValueJPG: "None",                    expectValuePNG: "None",                    expectValueHEIC: "None",                    expectValueWEBP: "Bogdan Hrastnik",          expectValueDNG: 7700202                            }],
      [image.PropertyKey.COPYRIGHT,                  { expectValueJPG: "undefined (Photographer) - [None] (Editor)", expectValuePNG: "undefined (Photographer) - [None] (Editor)", expectValueHEIC: "undefined (Photographer) - [None] (Editor)", expectValueWEBP: "ABB (Photographer) - [None] (Editor)", expectValueDNG: 7700202 }],
      [image.PropertyKey.SPECTRAL_SENSITIVITY,       { expectValueJPG: "abc",                     expectValuePNG: "abc",                     expectValueHEIC: "abc",                     expectValueWEBP: "sensitivity",              expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_LATITUDE_REF,           { expectValueJPG: "N",                       expectValuePNG: "N",                       expectValueHEIC: "N",                       expectValueWEBP: "N",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_LONGITUDE_REF,          { expectValueJPG: "E",                       expectValuePNG: "E",                       expectValueHEIC: "E",                       expectValueWEBP: "W",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_SATELLITES,             { expectValueJPG: "xxx",                     expectValuePNG: "xxx",                     expectValueHEIC: "xxx",                     expectValueWEBP: "BBA",                      expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_STATUS,                 { expectValueJPG: "A",                       expectValuePNG: "A",                       expectValueHEIC: "A",                       expectValueWEBP: "A",                        expectValueDNG: "V"                                }],
      [image.PropertyKey.GPS_MEASURE_MODE,           { expectValueJPG: "2",                       expectValuePNG: "2",                       expectValueHEIC: "2",                       expectValueWEBP: "2",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_SPEED_REF,              { expectValueJPG: "N",                       expectValuePNG: "N",                       expectValueHEIC: "N",                       expectValueWEBP: "K",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_TRACK_REF,              { expectValueJPG: "T",                       expectValuePNG: "T",                       expectValueHEIC: "T",                       expectValueWEBP: "T",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_IMG_DIRECTION_REF,      { expectValueJPG: "M",                       expectValuePNG: "M",                       expectValueHEIC: "M",                       expectValueWEBP: "M",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_MAP_DATUM,              { expectValueJPG: "xxx",                     expectValuePNG: "xxx",                     expectValueHEIC: "xxx",                     expectValueWEBP: "TEST",                     expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_DEST_LATITUDE_REF,      { expectValueJPG: "N",                       expectValuePNG: "N",                       expectValueHEIC: "N",                       expectValueWEBP: "S",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_DEST_LONGITUDE_REF,     { expectValueJPG: "E",                       expectValuePNG: "E",                       expectValueHEIC: "E",                       expectValueWEBP: "W",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_DEST_BEARING_REF,       { expectValueJPG: "T",                       expectValuePNG: "T",                       expectValueHEIC: "T",                       expectValueWEBP: "M",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_DEST_DISTANCE_REF,      { expectValueJPG: "N",                       expectValuePNG: "N",                       expectValueHEIC: "N",                       expectValueWEBP: "K",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_PROCESSING_METHOD,      { expectValueJPG: "CELLID",                  expectValuePNG: "CELLID",                  expectValueHEIC: "CELLID",                  expectValueWEBP: "CELLID",                   expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_AREA_INFORMATION,       { expectValueJPG: "arexxx",                  expectValuePNG: "arexxx",                  expectValueHEIC: "arexxx",                  expectValueWEBP: "accxx",                    expectValueDNG: 7700202                            }],
      [image.PropertyKey.GPS_DATE_STAMP,             { expectValueJPG: "2025:01:11",              expectValuePNG: "2025:01:11",              expectValueHEIC: "2025:01:11",              expectValueWEBP: "2022:01:11",               expectValueDNG: "2000:00:00"                       }],
      [image.PropertyKey.EXIF_VERSION,               { expectValueJPG: "Exif Version 1.1",        expectValuePNG: "Exif Version 1.1",        expectValueHEIC: "Exif Version 1.1",        expectValueWEBP: "Exif Version 1.1",         expectValueDNG: "Exif Version 2.3"                 }],
      [image.PropertyKey.DATE_TIME_ORIGINAL,         { expectValueJPG: "2024:01:25 05:51:34",     expectValuePNG: "2024:01:25 05:51:34",     expectValueHEIC: "2024:01:25 05:51:34",     expectValueWEBP: "2022:06:02 15:51:35",      expectValueDNG: "2015:09:18 07:58:04"              }],
      [image.PropertyKey.DATE_TIME_DIGITIZED,        { expectValueJPG: "2022:06:02 15:51:34",     expectValuePNG: "2022:06:02 15:51:34",     expectValueHEIC: "2022:06:02 15:51:34",     expectValueWEBP: "2022:06:02 15:51:35",      expectValueDNG: "2015:09:18 07:58:04"              }],
      [image.PropertyKey.OFFSET_TIME,                { expectValueJPG: "2024:01:25",              expectValuePNG: "2024:01:25",              expectValueHEIC: "2024:01:25",              expectValueWEBP: "111",                      expectValueDNG: 7700202                            }],
      [image.PropertyKey.OFFSET_TIME_ORIGINAL,       { expectValueJPG: "chex",                    expectValuePNG: "chex",                    expectValueHEIC: "chex",                    expectValueWEBP: "00xx",                     expectValueDNG: 7700202                            }],
      [image.PropertyKey.OFFSET_TIME_DIGITIZED,      { expectValueJPG: "cfh",                     expectValuePNG: "cfh",                     expectValueHEIC: "cfh",                     expectValueWEBP: "abs",                      expectValueDNG: 7700202                            }],
      [image.PropertyKey.COMPONENTS_CONFIGURATION,   { expectValueJPG: "Y R G B",                 expectValuePNG: "Y R G B",                 expectValueHEIC: "Y R G B",                 expectValueWEBP: "Y R G B",                  expectValueDNG: " Y Cb Cr-"                        }],
      [image.PropertyKey.RELATED_SOUND_FILE,         { expectValueJPG: "/usr/home",               expectValuePNG: "/usr/home",               expectValueHEIC: "/usr/home",               expectValueWEBP: "abb",                      expectValueDNG: 7700202                            }],
      [image.PropertyKey.SUBSEC_TIME,                { expectValueJPG: "123456",                  expectValuePNG: "123456",                  expectValueHEIC: "123456",                  expectValueWEBP: "123456",                   expectValueDNG: 7700202                            }],
      [image.PropertyKey.SUBSEC_TIME_ORIGINAL,       { expectValueJPG: "427000",                  expectValuePNG: "427000",                  expectValueHEIC: "427000",                  expectValueWEBP: "543792",                   expectValueDNG: 7700202                            }],
      [image.PropertyKey.SUBSEC_TIME_DIGITIZED,      { expectValueJPG: "427000",                  expectValuePNG: "427000",                  expectValueHEIC: "427000",                  expectValueWEBP: "427000",                   expectValueDNG: 7700202                            }],
      [image.PropertyKey.FLASHPIX_VERSION,           { expectValueJPG: "FlashPix Version 1.0",    expectValuePNG: "FlashPix Version 1.0",    expectValueHEIC: "FlashPix Version 1.0",    expectValueWEBP: "FlashPix Version 1.0",     expectValueDNG: 7700202                            }],
      [image.PropertyKey.USER_COMMENT,               { expectValueJPG: "place for user comments", expectValuePNG: "place for user comments", expectValueHEIC: "place for user comments", expectValueWEBP: "place for user comments.", expectValueDNG: 7700202                            }],
      [image.PropertyKey.IMAGE_UNIQUE_ID,            { expectValueJPG: "FXIC012",                 expectValuePNG: "FXIC012",                 expectValueHEIC: "FXIC012",                 expectValueWEBP: "FXIC012",                  expectValueDNG: "00000000000000000000000000203035" }],
      [image.PropertyKey.CAMERA_OWNER_NAME,          { expectValueJPG: "c.uec",                   expectValuePNG: "c.uec",                   expectValueHEIC: "c.uec",                   expectValueWEBP: "2",                        expectValueDNG: 7700202                            }],
      [image.PropertyKey.BODY_SERIAL_NUMBER,         { expectValueJPG: "exoch",                   expectValuePNG: "exoch",                   expectValueHEIC: "exoch",                   expectValueWEBP: "x1",                       expectValueDNG: 7700202                            }],
      [image.PropertyKey.LENS_MAKE,                  { expectValueJPG: "xxwx",                    expectValuePNG: "xxwx",                    expectValueHEIC: "xxwx",                    expectValueWEBP: "aaa",                      expectValueDNG: "Leica Camera AG"                  }],
      [image.PropertyKey.LENS_MODEL,                 { expectValueJPG: "txaw",                    expectValuePNG: "txaw",                    expectValueHEIC: "txaw",                    expectValueWEBP: "xxx",                      expectValueDNG: "Summilux-M 1:1.4/35 ASPH."        }],
      [image.PropertyKey.LENS_SERIAL_NUMBER,         { expectValueJPG: "qxhc",                    expectValuePNG: "qxhc",                    expectValueHEIC: "qxhc",                    expectValueWEBP: "111",                      expectValueDNG: "-------"                          }],
    ])
  },
  shortModify: {
    keys: [
      image.PropertyKey.ORIENTATION,
      image.PropertyKey.IMAGE_WIDTH,
      image.PropertyKey.IMAGE_LENGTH,
      image.PropertyKey.SAMPLES_PER_PIXEL,
      image.PropertyKey.PLANAR_CONFIGURATION,
      image.PropertyKey.RESOLUTION_UNIT,
      image.PropertyKey.PHOTOMETRIC_INTERPRETATION,
      image.PropertyKey.COMPRESSION,
      image.PropertyKey.EXPOSURE_PROGRAM,
      image.PropertyKey.METERING_MODE,
      image.PropertyKey.LIGHT_SOURCE,
      image.PropertyKey.FLASH,
      image.PropertyKey.WHITE_BALANCE,
      image.PropertyKey.SCENE_CAPTURE_TYPE,
      image.PropertyKey.CONTRAST,
      image.PropertyKey.SATURATION,
      image.PropertyKey.SHARPNESS,
      image.PropertyKey.CUSTOM_RENDERED,
      image.PropertyKey.EXPOSURE_MODE,
      image.PropertyKey.GAIN_CONTROL,
      image.PropertyKey.SUBJECT_DISTANCE_RANGE,
      image.PropertyKey.SENSING_METHOD,
      image.PropertyKey.COLOR_SPACE,
      image.PropertyKey.PIXEL_X_DIMENSION,
      image.PropertyKey.PIXEL_Y_DIMENSION,
      image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,
      image.PropertyKey.ISO_SPEED_RATINGS,
      image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,
      image.PropertyKey.SENSITIVITY_TYPE,
      image.PropertyKey.ISO_SPEED,
      image.PropertyKey.YCBCR_POSITIONING,
      image.PropertyKey.GPS_ALTITUDE_REF,
      image.PropertyKey.GPS_DIFFERENTIAL,
    ],
    rules: new Map<image.PropertyKey, ModifyRule2>([
      [image.PropertyKey.ORIENTATION,                 { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.IMAGE_WIDTH,                 { modifyValue: 500,   expectValueJPG: 500,   expectValuePNG: 500,   expectValueHEIC: 500,   expectValueWEBP: 500,  expectValueDNG: 500,  }],
      [image.PropertyKey.IMAGE_LENGTH,                { modifyValue: 600,   expectValueJPG: 600,   expectValuePNG: 600,   expectValueHEIC: 600,   expectValueWEBP: 600,  expectValueDNG: 600,  }],
      [image.PropertyKey.SAMPLES_PER_PIXEL,           { modifyValue: 9,     expectValueJPG: 9,     expectValuePNG: 9,     expectValueHEIC: 9,     expectValueWEBP: 9,    expectValueDNG: 9,    }],
      [image.PropertyKey.PLANAR_CONFIGURATION,        { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.RESOLUTION_UNIT,             { modifyValue: 3,     expectValueJPG: 3,     expectValuePNG: 3,     expectValueHEIC: 3,     expectValueWEBP: 3,    expectValueDNG: 3,    }],
      [image.PropertyKey.PHOTOMETRIC_INTERPRETATION,  { modifyValue: 8,     expectValueJPG: 8,     expectValuePNG: 8,     expectValueHEIC: 8,     expectValueWEBP: 8,    expectValueDNG: 8,    }],
      [image.PropertyKey.COMPRESSION,                 { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.EXPOSURE_PROGRAM,            { modifyValue: 7,     expectValueJPG: 7,     expectValuePNG: 7,     expectValueHEIC: 7,     expectValueWEBP: 7,    expectValueDNG: 7,    }],
      [image.PropertyKey.METERING_MODE,               { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.LIGHT_SOURCE,                { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.FLASH,                       { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.WHITE_BALANCE,               { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.SCENE_CAPTURE_TYPE,          { modifyValue: 3,     expectValueJPG: 3,     expectValuePNG: 3,     expectValueHEIC: 3,     expectValueWEBP: 3,    expectValueDNG: 3,    }],
      [image.PropertyKey.CONTRAST,                    { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.SATURATION,                  { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.SHARPNESS,                   { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.CUSTOM_RENDERED,             { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.EXPOSURE_MODE,               { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.GAIN_CONTROL,                { modifyValue: 4,     expectValueJPG: 4,     expectValuePNG: 4,     expectValueHEIC: 4,     expectValueWEBP: 4,    expectValueDNG: 4,    }],
      [image.PropertyKey.SUBJECT_DISTANCE_RANGE,      { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.SENSING_METHOD,              { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.COLOR_SPACE,                 { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.PIXEL_X_DIMENSION,           { modifyValue: 4096,  expectValueJPG: 4096,  expectValuePNG: 4096,  expectValueHEIC: 4096,  expectValueWEBP: 4096, expectValueDNG: 4096, }],
      [image.PropertyKey.PIXEL_Y_DIMENSION,           { modifyValue: 3072,  expectValueJPG: 3072,  expectValuePNG: 3072,  expectValueHEIC: 3072,  expectValueWEBP: 3072, expectValueDNG: 3072, }],
      [image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM,  { modifyValue: 50,    expectValueJPG: 50,    expectValuePNG: 50,    expectValueHEIC: 50,    expectValueWEBP: 50,   expectValueDNG: 50,   }],
      [image.PropertyKey.ISO_SPEED_RATINGS,           { modifyValue: 3200,  expectValueJPG: 3200,  expectValuePNG: 3200,  expectValueHEIC: 3200,  expectValueWEBP: 3200, expectValueDNG: 3200, }],
      [image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY,    { modifyValue: 3200,  expectValueJPG: 3200,  expectValuePNG: 3200,  expectValueHEIC: 3200,  expectValueWEBP: 3200, expectValueDNG: 3200, }],
      [image.PropertyKey.SENSITIVITY_TYPE,            { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.ISO_SPEED,                   { modifyValue: 3200,  expectValueJPG: 3200,  expectValuePNG: 3200,  expectValueHEIC: 3200,  expectValueWEBP: 3200, expectValueDNG: 3200, }],
      [image.PropertyKey.YCBCR_POSITIONING,           { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.GPS_ALTITUDE_REF,            { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
      [image.PropertyKey.GPS_DIFFERENTIAL,            { modifyValue: 1,     expectValueJPG: 1,     expectValuePNG: 1,     expectValueHEIC: 1,     expectValueWEBP: 1,    expectValueDNG: 1,    }],
    ])
  },
  longModify: {
    keys: [
      image.PropertyKey.NEW_SUBFILE_TYPE,
      image.PropertyKey.STRIP_OFFSETS,
      image.PropertyKey.ROWS_PER_STRIP,
      image.PropertyKey.STRIP_BYTE_COUNTS,
      image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY,
      image.PropertyKey.ISO_SPEED_LATITUDE_YYY,
      image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,
      image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,
    ],
    rules: new Map<image.PropertyKey, ModifyRule2>([
      [image.PropertyKey.NEW_SUBFILE_TYPE,            { modifyValue: 2,     expectValueJPG: 2,     expectValuePNG: 2,     expectValueHEIC: 2,     expectValueWEBP: 2,    expectValueDNG: 2,    }],
      [image.PropertyKey.STRIP_OFFSETS,               { modifyValue: 100,   expectValueJPG: 100,   expectValuePNG: 100,   expectValueHEIC: 100,   expectValueWEBP: 100,  expectValueDNG: 100,  }],
      [image.PropertyKey.ROWS_PER_STRIP,              { modifyValue: 10,    expectValueJPG: 10,    expectValuePNG: 10,    expectValueHEIC: 10,    expectValueWEBP: 10,   expectValueDNG: 10,   }],
      [image.PropertyKey.STRIP_BYTE_COUNTS,           { modifyValue: 1024,  expectValueJPG: 1024,  expectValuePNG: 1024,  expectValueHEIC: 1024,  expectValueWEBP: 1024, expectValueDNG: 1024, }],
      [image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, { modifyValue: 400,   expectValueJPG: 400,   expectValuePNG: 400,   expectValueHEIC: 400,   expectValueWEBP: 400,  expectValueDNG: 400,  }],
      [image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX,  { modifyValue: 3300,  expectValueJPG: 3300,  expectValuePNG: 3300,  expectValueHEIC: 3300,  expectValueWEBP: 3300, expectValueDNG: 3300, }],
      [image.PropertyKey.ISO_SPEED_LATITUDE_YYY,      { modifyValue: 3000,  expectValueJPG: 3000,  expectValuePNG: 3000,  expectValueHEIC: 3000,  expectValueWEBP: 3000, expectValueDNG: 3000, }],
      [image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ,      { modifyValue: 3100,  expectValueJPG: 3100,  expectValuePNG: 3100,  expectValueHEIC: 3100,  expectValueWEBP: 3100, expectValueDNG: 3100, }],
    ])
  },
  doubleModify: {
    keys: [
      image.PropertyKey.X_RESOLUTION,
      image.PropertyKey.Y_RESOLUTION,
      image.PropertyKey.EXPOSURE_TIME,
      image.PropertyKey.F_NUMBER,
      image.PropertyKey.SHUTTER_SPEED,
      image.PropertyKey.APERTURE_VALUE,
      image.PropertyKey.BRIGHTNESS_VALUE,
      image.PropertyKey.EXPOSURE_BIAS_VALUE,
      image.PropertyKey.MAX_APERTURE_VALUE,
      image.PropertyKey.SUBJECT_DISTANCE,
      image.PropertyKey.FLASH_ENERGY,
      image.PropertyKey.FOCAL_LENGTH,
      image.PropertyKey.FOCAL_PLANE_X_RESOLUTION,
      image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION,
      image.PropertyKey.EXPOSURE_INDEX,
      image.PropertyKey.DIGITAL_ZOOM_RATIO,
      image.PropertyKey.GAMMA,
      image.PropertyKey.GPS_ALTITUDE,
      image.PropertyKey.GPS_SPEED,
      image.PropertyKey.GPS_TRACK,
      image.PropertyKey.GPS_IMG_DIRECTION,
      image.PropertyKey.GPS_DEST_BEARING,
      image.PropertyKey.GPS_DEST_DISTANCE,
      image.PropertyKey.GPS_DOP, 
      image.PropertyKey.GPS_H_POSITIONING_ERROR
    ],
    rules: new Map<image.PropertyKey, ModifyRule2>([
      [image.PropertyKey.X_RESOLUTION,             { modifyValue: 2147483647, expectValueJPG: 2147483647.000000,expectValuePNG: 2147483647.000000, expectValueHEIC: 2147483647.000000, expectValueWEBP: 2147483647.000000, expectValueDNG: 2147483647.000000, }],
      [image.PropertyKey.Y_RESOLUTION,             { modifyValue: 12.3,       expectValueJPG: 12.300000,        expectValuePNG: 12.300000,         expectValueHEIC: 12.300000,         expectValueWEBP: 12.300000,         expectValueDNG: 12.300000, }],
      [image.PropertyKey.EXPOSURE_TIME,            { modifyValue: 1/22,       expectValueJPG: 0.045455,         expectValuePNG: 0.045455,          expectValueHEIC: 0.045455,          expectValueWEBP: 0.045455,          expectValueDNG: 0.045455,  }],
      [image.PropertyKey.F_NUMBER,                 { modifyValue: 1.8,        expectValueJPG: 1.800000,         expectValuePNG: 1.800000,          expectValueHEIC: 1.800000,          expectValueWEBP: 1.800000,          expectValueDNG: 1.800000,  }],
      [image.PropertyKey.SHUTTER_SPEED,            { modifyValue: 1.00,       expectValueJPG: 1.000000,         expectValuePNG: 1.000000,          expectValueHEIC: 1.000000,          expectValueWEBP: 1.000000,          expectValueDNG: 1.000000,  }],
      [image.PropertyKey.APERTURE_VALUE,           { modifyValue: 5.6,        expectValueJPG: 5.600000,         expectValuePNG: 5.600000,          expectValueHEIC: 5.600000,          expectValueWEBP: 5.600000,          expectValueDNG: 5.600000,  }],
      [image.PropertyKey.BRIGHTNESS_VALUE,         { modifyValue: 2.00,       expectValueJPG: 2.000000,         expectValuePNG: 2.000000,          expectValueHEIC: 2.000000,          expectValueWEBP: 2.000000,          expectValueDNG: 2.000000,  }],
      [image.PropertyKey.EXPOSURE_BIAS_VALUE,      { modifyValue: 1.00,       expectValueJPG: 1.000000,         expectValuePNG: 1.000000,          expectValueHEIC: 1.000000,          expectValueWEBP: 1.000000,          expectValueDNG: 1.000000,  }],
      [image.PropertyKey.MAX_APERTURE_VALUE,       { modifyValue: 1.00,       expectValueJPG: 1.000000,         expectValuePNG: 1.000000,          expectValueHEIC: 1.000000,          expectValueWEBP: 1.000000,          expectValueDNG: 1.000000,  }],
      [image.PropertyKey.SUBJECT_DISTANCE,         { modifyValue: 100.0,      expectValueJPG: 100.000000,       expectValuePNG: 100.000000,        expectValueHEIC: 100.000000,        expectValueWEBP: 100.000000,        expectValueDNG: 100.000000,}],
      [image.PropertyKey.FLASH_ENERGY,             { modifyValue: 5.0,        expectValueJPG: 5.000000,         expectValuePNG: 5.000000,          expectValueHEIC: 5.000000,          expectValueWEBP: 5.000000,          expectValueDNG: 5.000000,  }],
      [image.PropertyKey.FOCAL_LENGTH,             { modifyValue: 50.0,       expectValueJPG: 50.000000,        expectValuePNG: 50.000000,         expectValueHEIC: 50.000000,         expectValueWEBP: 50.000000,         expectValueDNG: 50.000000, }],
      [image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, { modifyValue: 500.0,      expectValueJPG: 500.000000,       expectValuePNG: 500.000000,        expectValueHEIC: 500.000000,        expectValueWEBP: 500.000000,        expectValueDNG: 500.000000,}],
      [image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, { modifyValue: 500.0,      expectValueJPG: 500.000000,       expectValuePNG: 500.000000,        expectValueHEIC: 500.000000,        expectValueWEBP: 500.000000,        expectValueDNG: 500.000000,}],
      [image.PropertyKey.EXPOSURE_INDEX,           { modifyValue: 1.1,        expectValueJPG: 1.100000,         expectValuePNG: 1.100000,          expectValueHEIC: 1.100000,          expectValueWEBP: 1.100000,          expectValueDNG: 1.100000,  }],
      [image.PropertyKey.DIGITAL_ZOOM_RATIO,       { modifyValue: 0.5,        expectValueJPG: 0.500000,         expectValuePNG: 0.500000,          expectValueHEIC: 0.500000,          expectValueWEBP: 0.500000,          expectValueDNG: 0.500000,  }],
      [image.PropertyKey.GAMMA,                    { modifyValue: 1.1,        expectValueJPG: 1.100000,         expectValuePNG: 1.100000,          expectValueHEIC: 1.100000,          expectValueWEBP: 1.100000,          expectValueDNG: 1.100000,  }],
      [image.PropertyKey.GPS_ALTITUDE,             { modifyValue: 123.45,     expectValueJPG: 123.450000,       expectValuePNG: 123.450000,        expectValueHEIC: 123.450000,        expectValueWEBP: 123.450000,        expectValueDNG: 123.450000,}],
      [image.PropertyKey.GPS_SPEED,                { modifyValue: 123.45,     expectValueJPG: 123.450000,       expectValuePNG: 123.450000,        expectValueHEIC: 123.450000,        expectValueWEBP: 123.450000,        expectValueDNG: 123.450000,}],
      [image.PropertyKey.GPS_TRACK,                { modifyValue: 180.0,      expectValueJPG: 180.000000,       expectValuePNG: 180.000000,        expectValueHEIC: 180.000000,        expectValueWEBP: 180.000000,        expectValueDNG: 180.000000,}],
      [image.PropertyKey.GPS_IMG_DIRECTION,        { modifyValue: 12.3,       expectValueJPG: 12.300000,        expectValuePNG: 12.300000,         expectValueHEIC: 12.300000,         expectValueWEBP: 12.300000,         expectValueDNG: 12.300000, }],
      [image.PropertyKey.GPS_DEST_BEARING,         { modifyValue: 200.0,      expectValueJPG: 200.000000,       expectValuePNG: 200.000000,        expectValueHEIC: 200.000000,        expectValueWEBP: 200.000000,        expectValueDNG: 200.000000,}],
      [image.PropertyKey.GPS_DEST_DISTANCE,        { modifyValue: 100.0,      expectValueJPG: 100.000000,       expectValuePNG: 100.000000,        expectValueHEIC: 100.000000,        expectValueWEBP: 100.000000,        expectValueDNG: 100.000000,}],
      [image.PropertyKey.GPS_DOP,                  { modifyValue: 1.5,        expectValueJPG: 1.500000,         expectValuePNG: 1.500000,          expectValueHEIC: 1.500000,          expectValueWEBP: 1.500000,          expectValueDNG: 1.500000,  }],
      [image.PropertyKey.GPS_H_POSITIONING_ERROR,  { modifyValue: 100.0,      expectValueJPG: 100.000000,       expectValuePNG: 100.000000,        expectValueHEIC: 100.000000,        expectValueWEBP: 100.000000,        expectValueDNG: 100.000000,}],
    ])
  },
  intArrayModify: {
    keys: [
      image.PropertyKey.BITS_PER_SAMPLE,
      image.PropertyKey.YCBCR_SUB_SAMPLING,
      image.PropertyKey.DEFAULT_CROP_SIZE,
      image.PropertyKey.SUBJECT_AREA,
      image.PropertyKey.SUBJECT_LOCATION,
      image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE,
      image.PropertyKey.DNG_VERSION,
      image.PropertyKey.GPS_VERSION_ID,
    ],
    rules: new Map<image.PropertyKey, ModifyRule2>([
      [image.PropertyKey.BITS_PER_SAMPLE,                        { modifyValue: [6,6,6],    expectValueJPG: [6,6,6],    expectValuePNG: [6,6,6],    expectValueHEIC: [6,6,6],    expectValueWEBP: [6,6,6],   expectValueDNG: [6,6,6],   }],
      [image.PropertyKey.YCBCR_SUB_SAMPLING,                     { modifyValue: [3,3],      expectValueJPG: [3,3],      expectValuePNG: [3,3],      expectValueHEIC: [3,3],      expectValueWEBP: [3,3],     expectValueDNG: [3,3],     }],
      [image.PropertyKey.DEFAULT_CROP_SIZE,                      { modifyValue: [200,300],  expectValueJPG: [200,300],  expectValuePNG: [200,300],  expectValueHEIC: [200,300],  expectValueWEBP: [200,300], expectValueDNG: [200,300], }],
      [image.PropertyKey.SUBJECT_AREA,                           { modifyValue: [40,60],    expectValueJPG: [40,60],    expectValuePNG: [40,60],    expectValueHEIC: [40,60],    expectValueWEBP: [40,60],   expectValueDNG: [40,60],   }],
      [image.PropertyKey.SUBJECT_LOCATION,                       { modifyValue: [124,345],  expectValueJPG: [124,345],  expectValuePNG: [124,345],  expectValueHEIC: [124,345],  expectValueWEBP: [124,345], expectValueDNG: [124,345], }],
      [image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, { modifyValue: [3,5],      expectValueJPG: [3,5],      expectValuePNG: [3,5],      expectValueHEIC: [3,5],      expectValueWEBP: [3,5],     expectValueDNG: [3,5],     }],
      [image.PropertyKey.DNG_VERSION,                            { modifyValue: [2,8,1,5],  expectValueJPG: [2,8,1,5],  expectValuePNG: [2,8,1,5],  expectValueHEIC: [2,8,1,5],  expectValueWEBP: [2,8,1,5], expectValueDNG: [2,8,1,5], }],
      [image.PropertyKey.GPS_VERSION_ID,                         { modifyValue: [3,2,0,5],  expectValueJPG: [3,2,0,5],  expectValuePNG: [3,2,0,5],  expectValueHEIC: [3,2,0,5],  expectValueWEBP: [3,2,0,5], expectValueDNG: [3,2,0,5], }],
    ])
  },
  doubleArrayModify: {
    keys: [
      image.PropertyKey.YCBCR_COEFFICIENTS,
      image.PropertyKey.WHITE_POINT,
      image.PropertyKey.PRIMARY_CHROMATICITIES,
      image.PropertyKey.REFERENCE_BLACK_WHITE,
      image.PropertyKey.GPS_DEST_LATITUDE,
      image.PropertyKey.GPS_DEST_LONGITUDE,
      image.PropertyKey.GPS_LONGITUDE,
      image.PropertyKey.GPS_LATITUDE,
      image.PropertyKey.GPS_TIME_STAMP,
      image.PropertyKey.LENS_SPECIFICATION,
    ],
    rules: new Map<image.PropertyKey, ModifyRule2>([
      [image.PropertyKey.YCBCR_COEFFICIENTS,      { modifyValue: [0.299,0.587,0.114],    expectValueJPG: [0.299,0.587,0.114],    expectValuePNG: [0.299,0.587,0.114],    expectValueHEIC: [0.299,0.587,0.114],    expectValueWEBP: [0.299,0.587,0.114],   expectValueDNG: [0.299,0.587,0.114],   }],
      [image.PropertyKey.WHITE_POINT,             { modifyValue: [0.299,0.587],          expectValueJPG: [0.299,0.587],          expectValuePNG: [0.299,0.587],          expectValueHEIC: [0.299,0.587],          expectValueWEBP: [0.299,0.587],         expectValueDNG: [0.299,0.587],         }],
      [image.PropertyKey.PRIMARY_CHROMATICITIES,  { modifyValue: [0.5],                  expectValueJPG: [0.5],                  expectValuePNG: [0.5],                  expectValueHEIC: [0.5],                  expectValueWEBP: [0.5],                 expectValueDNG: [0.5],                 }],
      [image.PropertyKey.REFERENCE_BLACK_WHITE,   { modifyValue: [1,255, 0,255, 0,255],  expectValueJPG: [1,255, 0,255, 0,255],  expectValuePNG: [1,255, 0,255, 0,255],  expectValueHEIC: [1,255, 0,255, 0,255],  expectValueWEBP: [1,255, 0,255, 0,255], expectValueDNG: [1,255, 0,255, 0,255], }],
      [image.PropertyKey.GPS_DEST_LATITUDE,       { modifyValue: [39,54,10],             expectValueJPG: [39,54,10],             expectValuePNG: [39,54,10],             expectValueHEIC: [39,54,10],             expectValueWEBP: [39,54,10],            expectValueDNG: [39,54,10],            }],
      [image.PropertyKey.GPS_DEST_LONGITUDE,      { modifyValue: [40,25,46],             expectValueJPG: [40,25,46],             expectValuePNG: [40,25,46],             expectValueHEIC: [40,25,46],             expectValueWEBP: [40,25,46],            expectValueDNG: [40,25,46],            }],
      [image.PropertyKey.GPS_LONGITUDE,           { modifyValue: [116.4,19.5,42.16],     expectValueJPG: [116.4,19.5,42.16],     expectValuePNG: [116.4,19.5,42.16],     expectValueHEIC: [116.4,19.5,42.16],     expectValueWEBP: [116.4,19.5,42.16],    expectValueDNG: [116.4,19.5,42.16],    }],
      [image.PropertyKey.GPS_LATITUDE,            { modifyValue: [39.6,54.8,7.542],      expectValueJPG: [39.6,54.8,7.542],      expectValuePNG: [39.6,54.8,7.542],      expectValueHEIC: [39.6,54.8,7.542],      expectValueWEBP: [39.6,54.8,7.542],     expectValueDNG: [39.6,54.8,7.542],     }],
      [image.PropertyKey.GPS_TIME_STAMP,          { modifyValue: [10,30,30.12],          expectValueJPG: [10,30,30.12],          expectValuePNG: [10,30,30.12],          expectValueHEIC: [10,30,30.12],          expectValueWEBP: [10,30,30.12],         expectValueDNG: [10,30,30.12],         }],
      [image.PropertyKey.LENS_SPECIFICATION,      { modifyValue: [12.1,12.2,12.3,12.4],  expectValueJPG: [12.1,12.2,12.3,12.4],  expectValuePNG: [12.1,12.2,12.3,12.4],  expectValueHEIC: [12.1,12.2,12.3,12.4],  expectValueWEBP: [12.1,12.2,12.3,12.4], expectValueDNG: [12.1,12.2,12.3,12.4], }],
    ])
  },
  arrayBufferModify: {
    keys: [
      image.PropertyKey.OECF,
      image.PropertyKey.MAKER_NOTE,
      image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,
      image.PropertyKey.FILE_SOURCE,
      image.PropertyKey.SCENE_TYPE,
      image.PropertyKey.CFA_PATTERN,
      image.PropertyKey.DEVICE_SETTING_DESCRIPTION,
      image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE,
    ],
    rules: new Map<image.PropertyKey, ModifyRule2>([
      [image.PropertyKey.OECF,                                     { modifyValue: testExifArrayBuffer,   expectValueJPG: [48, 50, 49, 48],  expectValuePNG: [48, 50, 49, 48],  expectValueHEIC: [48, 50, 49, 48],  expectValueWEBP: [48, 50, 49, 48], expectValueDNG: [48, 50, 49, 48], }],
      [image.PropertyKey.MAKER_NOTE,                               { modifyValue: testExifArrayBuffer,   expectValueJPG: [48, 50, 49, 48],  expectValuePNG: [48, 50, 49, 48],  expectValueHEIC: [48, 50, 49, 48],  expectValueWEBP: [48, 50, 49, 48], expectValueDNG: [48, 50, 49, 48], }],
      [image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE,               { modifyValue: testExifArrayBuffer_2, expectValueJPG: [5, 6],            expectValuePNG: [5, 6],            expectValueHEIC: [5, 6],            expectValueWEBP: [5, 6],           expectValueDNG: [5, 6],           }],
      [image.PropertyKey.FILE_SOURCE,                              { modifyValue: testExifArrayBuffer_1, expectValueJPG: [1],               expectValuePNG: [1],               expectValueHEIC: [1],               expectValueWEBP: [1],              expectValueDNG: [1],              }],
      [image.PropertyKey.SCENE_TYPE,                               { modifyValue: testExifArrayBuffer_1, expectValueJPG: [1],               expectValuePNG: [1],               expectValueHEIC: [1],               expectValueWEBP: [1],              expectValueDNG: [1],              }],
      [image.PropertyKey.CFA_PATTERN,                              { modifyValue: testExifArrayBuffer_1, expectValueJPG: [1],               expectValuePNG: [1],               expectValueHEIC: [1],               expectValueWEBP: [1],              expectValueDNG: [1],              }],
      [image.PropertyKey.DEVICE_SETTING_DESCRIPTION,               { modifyValue: testExifArrayBuffer,   expectValueJPG: [48, 50, 49, 48],  expectValuePNG: [48, 50, 49, 48],  expectValueHEIC: [48, 50, 49, 48],  expectValueWEBP: [48, 50, 49, 48], expectValueDNG: [48, 50, 49, 48], }],
      [image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, { modifyValue: testExifArrayBuffer,   expectValueJPG: [48, 50, 49, 48],  expectValuePNG: [48, 50, 49, 48],  expectValueHEIC: [48, 50, 49, 48],  expectValueWEBP: [48, 50, 49, 48], expectValueDNG: [48, 50, 49, 48], }],
    ])
  },
};

export { ImagePropertyConfig };