import image from "@ohos.multimedia.image";

interface ModifyRule {
  modifyValue: string;
  oldExpectValue: string;
  newExpectValue: string | number | Array<number> | boolean;
}

interface ModifyRuleDNG {
  oldExpectValue: string | null | undefined;
  newExpectValue: string | number | Array<number> | boolean | undefined;
}

interface readOnlyRule {
  expectValueJPG: string | number | Array<number> | null | undefined | boolean;
  expectValuePNG: string | number | Array<number> | null | undefined | boolean;
  expectValueHEIC: string | number | Array<number> | null | undefined | boolean;
  expectValueWEBP: string | number | Array<number> | null | undefined | boolean;
  expectValueDNG: string | number | Array<number> | null | undefined | boolean;
}

let makernoteDNG: number[] = [76,69,73,67,65,0,2,255,0,31,3,0,0,7,0,5,210,0,1,121];

let imageExifMetadatakey: string[] = [
  "newSubfileType",
  "subfileType",
  "imageWidth",
  "imageLength",
  "bitsPerSample",
  "compression",
  "photometricInterpretation",
  "imageDescription",
  "make",
  "model",
  "stripOffsets",
  "orientation",
  "samplesPerPixel",
  "rowsPerStrip",
  "stripByteCounts",
  "xResolution",
  "yResolution",
  "planarConfiguration",
  "resolutionUnit",
  "transferFunction",
  "software",
  "dateTime",
  "artist",
  "whitePoint",
  "primaryChromaticities",
  "photoMode",
  "yCbCrCoefficients",
  "yCbCrSubSampling",
  "yCbCrPositioning",
  "referenceBlackWhite",
  "copyright",
  "exposureTime",
  "fNumber",
  "exposureProgram",
  "spectralSensitivity",
  "gpsVersionID",
  "gpsLatitudeRef",
  "gpsLatitude",
  "gpsLongitudeRef",
  "gpsLongitude",
  "gpsAltitudeRef",
  "gpsAltitude",
  "gpsTimestamp",
  "gpsSatellites",
  "gpsStatus",
  "gpsMeasureMode",
  "gpsDop",
  "gpsSpeedRef",
  "gpsSpeed",
  "gpsTrackRef",
  "gpsTrack",
  "gpsImgDirectionRef",
  "gpsImgDirection",
  "gpsMapDatum",
  "gpsDestLatitudeRef",
  "gpsDestLatitude",
  "gpsDestLongitudeRef",
  "gpsDestLongitude",
  "gpsDestBearingRef",
  "gpsDestBearing",
  "gpsDestDistanceRef",
  "gpsDestDistance",
  "gpsProcessingMethod",
  "gpsAreaInformation",
  "gpsDateStamp",
  "gpsDifferential",
  "gpsHPositioningError",
  "isoSpeedRatings",
  "photographicSensitivity",
  "oecf",
  "sensitivityType",
  "standardOutputSensitivity",
  "recommendedExposureIndex",
  "isoSpeedLatitudeyyy",
  "isoSpeedLatitudezzz",
  "exifVersion",
  "dateTimeOriginal",
  "dateTimeDigitized",
  "offsetTime",
  "offsetTimeOriginal",
  "offsetTimeDigitized",
  "componentsConfiguration",
  "compressedBitsPerPixel",
  "shutterSpeedValue",
  "apertureValue",
  "brightnessValue",
  "exposureBiasValue",
  "maxApertureValue",
  "subjectDistance",
  "meteringMode",
  "lightSource",
  "flash",
  "focalLength",
  "subjectArea",
  "makerNote",
  "userComment",
  "subsecTime",
  "subsecTimeOriginal",
  "subsecTimeDigitized",
  "flashpixVersion",
  "colorSpace",
  "pixelXDimension",
  "pixelYDimension",
  "relatedSoundFile",
  "flashEnergy",
  "spatialFrequencyResponse",
  "focalPlaneXResolution",
  "focalPlaneYResolution",
  "focalPlaneResolutionUnit",
  "subjectLocation",
  "exposureIndex",
  "sensingMethod",
  "fileSource",
  "sceneType",
  "cfaPattern",
  "customRendered",
  "exposureMode",
  "whiteBalance",
  "digitalZoomRatio",
  "focalLengthIn35mmFilm",
  "sceneCaptureType",
  "gainControl",
  "contrast",
  "saturation",
  "sharpness",
  "deviceSettingDescription",
  "subjectDistanceRange",
  "imageUniqueId",
  "cameraOwnerName",
  "bodySerialNumber",
  "lensSpecification",
  "lensMake",
  "lensModel",
  "lensSerialNumber",
  "compositeImage",
  "sourceImageNumberOfCompositeImage",
  "sourceExposureTimesOfCompositeImage",
  "gamma",
]

let readAndWriteExifMetadata: string[] = [
    "NewSubfileType",
    "SubfileType",
    "ImageWidth",
    "ImageLength",
    "BitsPerSample",
    "Compression",
    "PhotometricInterpretation",
    "ImageDescription",
    "Make",
    "Model",
    "StripOffsets",
    "Orientation",
    "SamplesPerPixel",
    "RowsPerStrip",
    "StripByteCounts",
    "XResolution",
    "YResolution",
    "PlanarConfiguration",
    "ResolutionUnit",
    "TransferFunction",
    "Software",
    "DateTime",
    "Artist",
    "WhitePoint",
    "PrimaryChromaticities",
    "PhotoMode",
    "YCbCrCoefficients",
    "YCbCrSubSampling",
    "YCbCrPositioning",
    "ReferenceBlackWhite",
    "Copyright",
    "ExposureTime",
    "FNumber",
    "ExposureProgram",
    "SpectralSensitivity",
    "GPSVersionID",
    "GPSLatitudeRef",
    "GPSLatitude",
    "GPSLongitudeRef",
    "GPSLongitude",
    "GPSAltitudeRef",
    "GPSAltitude",
    "GPSTimeStamp",
    "GPSSatellites",
    "GPSStatus",
    "GPSMeasureMode",
    "GPSDOP",
    "GPSSpeedRef",
    "GPSSpeed",
    "GPSTrackRef",
    "GPSTrack",
    "GPSImgDirectionRef",
    "GPSImgDirection",
    "GPSMapDatum",
    "GPSDestLatitudeRef",
    "GPSDestLatitude",
    "GPSDestLongitudeRef",
    "GPSDestLongitude",
    "GPSDestBearingRef",
    "GPSDestBearing",
    "GPSDestDistanceRef",
    "GPSDestDistance",
    "GPSProcessingMethod",
    "GPSAreaInformation",
    "GPSDateStamp",
    "GPSDifferential",
    "GPSHPositioningError",
    "ISOSpeedRatings",
    "PhotographicSensitivity",
    "OECF",
    "SensitivityType",
    "StandardOutputSensitivity",
    "RecommendedExposureIndex",
    "ISOSpeedLatitudeyyy",
    "ISOSpeedLatitudezzz",
    "ExifVersion",
    "DateTimeOriginal",
    "DateTimeDigitized",
    "OffsetTime",
    "OffsetTimeOriginal",
    "OffsetTimeDigitized",
    "ComponentsConfiguration",
    "CompressedBitsPerPixel",
    "ShutterSpeedValue",
    "ApertureValue",
    "BrightnessValue",
    "ExposureBiasValue",
    "MaxApertureValue",
    "SubjectDistance",
    "MeteringMode",
    "LightSource",
    "Flash",
    "FocalLength",
    "SubjectArea",
    "MakerNote",
    "UserComment",
    "SubsecTime",
    "SubsecTimeOriginal",
    "SubsecTimeDigitized",
    "FlashpixVersion",
    "ColorSpace",
    "PixelXDimension",
    "PixelYDimension",
    "RelatedSoundFile",
    "FlashEnergy",
    "SpatialFrequencyResponse",
    "FocalPlaneXResolution",
    "FocalPlaneYResolution",
    "FocalPlaneResolutionUnit",
    "SubjectLocation",
    "ExposureIndex",
    "SensingMethod",
    "FileSource",
    "SceneType",
    "CFAPattern",
    "CustomRendered",
    "ExposureMode",
    "WhiteBalance",
    "DigitalZoomRatio",
    "FocalLengthIn35mmFilm",
    "SceneCaptureType",
    "GainControl",
    "Contrast",
    "Saturation",
    "Sharpness",
    "DeviceSettingDescription",
    "SubjectDistanceRange",
    "ImageUniqueID",
    "CameraOwnerName",
    "BodySerialNumber",
    "LensSpecification",
    "LensMake",
    "LensModel",
    "LensSerialNumber",
    "CompositeImage",
    "SourceImageNumberOfCompositeImage",
    "SourceExposureTimesOfCompositeImage",
    "Gamma",
];

let imageMakerNoteHwMetadatakey: string[] = [
    "isXmageSupported",
    "xmageWatermarkMode",
    "xmageLeft",
    "xmageTop",
    "xmageRight",
    "xmageBottom",
    "isCloudEnhanced",
    "captureMode",
];

let readAndWriteMakerNoteHwMetadata: string[] = [
    "HwMnoteIsXmageSupported",
    "HwMnoteXmageMode",
    "HwMnoteXmageLeft",
    "HwMnoteXmageTop",
    "HwMnoteXmageRight",
    "HwMnoteXmageBottom",
    "HwMnoteCloudEnhancementMode",
    "HwMnoteCaptureMode",
];

const testArrayBufferUint8: Uint8Array = new Uint8Array([48, 50, 49, 48]);
const testExifArrayBuffer: ArrayBuffer = testArrayBufferUint8.buffer as ArrayBuffer;
const testArrayBufferUint8_1: Uint8Array = new Uint8Array([1]);
const testExifArrayBuffer_1: ArrayBuffer = testArrayBufferUint8_1.buffer as ArrayBuffer;

// 可读写EXIF属性的验证规则映射表
const exifReadWriteValidationRules = new Map<string, ModifyRule>([
  ["NewSubfileType",                      { modifyValue: '5',                    oldExpectValue: "5",                     newExpectValue: 5                         }],
  ["SubfileType",                         { modifyValue: '3',                    oldExpectValue: '3',                     newExpectValue: 3                         }],
  ["ImageWidth",                          { modifyValue: '2000',                 oldExpectValue: "2000",                  newExpectValue: 2000                      }],
  ["ImageLength",                         { modifyValue: '1000',                 oldExpectValue: "1000",                  newExpectValue: 1000                      }],
  ["BitsPerSample",                       { modifyValue: '3000, 4000, 5000',     oldExpectValue: '3000, 4000, 5000',      newExpectValue: [3000,4000,5000]          }],
  ["Compression",                         { modifyValue: '32773',                oldExpectValue: 'PackBits compression',  newExpectValue: 32773                     }],
  ["PhotometricInterpretation",           { modifyValue: '1',                    oldExpectValue: 'Normal mono',           newExpectValue: 1                         }],
  ["ImageDescription",                    { modifyValue: '@  @',                 oldExpectValue: '@  @',                  newExpectValue: '@  @'                    }],
  ["Make",                                { modifyValue: 'APPLE',                oldExpectValue: 'APPLE',                 newExpectValue: 'APPLE'                   }],
  ["Model",                               { modifyValue: '%s \\0',               oldExpectValue: '%s \\0',                newExpectValue: '%s \\0'                  }],
  ["StripOffsets",                        { modifyValue: '456',                  oldExpectValue: '456',                   newExpectValue: [456]                     }],
  ["Orientation",                         { modifyValue: 'Left-bottom',          oldExpectValue: 'Left-bottom',           newExpectValue: 8                         }],
  ["SamplesPerPixel",                     { modifyValue: '3000',                 oldExpectValue: '3000',                  newExpectValue: 3000                      }],
  ["RowsPerStrip",                        { modifyValue: '345',                  oldExpectValue: '345',                   newExpectValue: 345                       }],
  ["StripByteCounts",                     { modifyValue: '345',                  oldExpectValue: '345',                   newExpectValue: [345]                     }],
  ["XResolution",                         { modifyValue: '31/1',                 oldExpectValue: '31',                    newExpectValue: 31                        }],
  ["YResolution",                         { modifyValue: '31/1',                 oldExpectValue: '31',                    newExpectValue: 31                        }],
  ["PlanarConfiguration",                 { modifyValue: '2',                    oldExpectValue: 'Planar format',         newExpectValue: 2                         }],
  ["ResolutionUnit",                      { modifyValue: '3',                    oldExpectValue: 'Centimeter',            newExpectValue: 3                         }],
  ["TransferFunction",                    { modifyValue: 'abc',                  oldExpectValue: '3 bytes undefined data',newExpectValue: '3 bytes undefined data'  }],
  ["Software",                            { modifyValue: '%s \\0',               oldExpectValue: '%s \\0',                newExpectValue: '%s \\0'                  }],
  ["DateTime",                            { modifyValue: '1900:01:01',           oldExpectValue: '1900:01:01',            newExpectValue: '1900:01:01'              }],
  ["Artist",                              { modifyValue: '%s \\0',               oldExpectValue: '%s \\0',                newExpectValue: '%s \\0'                  }],
  ["WhitePoint",                          { modifyValue: '252,1',                oldExpectValue: '252,  1',               newExpectValue: [252, 1]                  }],
  ["PrimaryChromaticities",               { modifyValue: '31/1',                 oldExpectValue: '31',                    newExpectValue: [31]                      }],
  ["PhotoMode",                           { modifyValue: '13',                   oldExpectValue: '13',                    newExpectValue: 13                        }],
  ["YCbCrCoefficients",                   { modifyValue: '3/2 4/2 9/3',          oldExpectValue: '1.5, 2.0, 3.0',         newExpectValue: [1.5,2.0,3.0]             }],
  ["YCbCrSubSampling",                    { modifyValue: '4 5',                  oldExpectValue: '4, 5',                  newExpectValue: [4,5]                     }],
  ["YCbCrPositioning",                    { modifyValue: '2',                    oldExpectValue: 'Co-sited',              newExpectValue: 2                         }],
  ["ReferenceBlackWhite",                 { modifyValue: '3 255 0 255 0 255',    oldExpectValue: ' 3, 255,  0, 255,  0, 255',newExpectValue: [3,255,0,255,0,255]    }],
  ["Copyright",                           { modifyValue: 'joseph',               oldExpectValue: 'joseph (Photographer) - [None] (Editor)', newExpectValue: 'joseph (Photographer) - [None] (Editor)' }],
  ["ExposureTime",                        { modifyValue: '1/60',                 oldExpectValue: '1/60 sec.',             newExpectValue: 1/60                      }],
  ["FNumber",                             { modifyValue: '1/30',                 oldExpectValue: 'f/0.03',                newExpectValue: 0.03333333333333333       }],
  ["ExposureProgram",                     { modifyValue: '8',                    oldExpectValue: 'Landscape mode (for landscape photos with the background in focus)', newExpectValue: 8 }],
  ["SpectralSensitivity",                 { modifyValue: '1234',                 oldExpectValue: '1234',                  newExpectValue: '1234'                    }],
  ["ISOSpeedRatings",                     { modifyValue: '1234',                 oldExpectValue: '1234',                  newExpectValue: 1234                      }],
  ["GPSVersionID",                        { modifyValue: '2.2.0.1',              oldExpectValue: '2.2.0.1',               newExpectValue: [2,2, 0, 1]               }],
  ["GPSLatitudeRef",                      { modifyValue: 'S',                    oldExpectValue: 'S',                     newExpectValue: 'S'                       }],
  ["GPSLatitude",                         { modifyValue: '114,3',                oldExpectValue: '38.0,  0,  0',          newExpectValue: [38.0, 0, 0]              }],
  ["GPSLongitudeRef",                     { modifyValue: 'W',                    oldExpectValue: 'W',                     newExpectValue: 'W'                       }],
  ["GPSLongitude",                        { modifyValue: '114,3',                oldExpectValue: '38.0,  0,  0',          newExpectValue: [38, 0, 0]                }],
  ["GPSAltitudeRef",                      { modifyValue: '1',                    oldExpectValue: 'Sea level reference',   newExpectValue: 1                         }],
  ["GPSAltitude",                         { modifyValue: '100/100',              oldExpectValue: '1.00',                  newExpectValue: 1.00                      }],
  ["GPSTimeStamp",                        { modifyValue: '12 54 20',             oldExpectValue: '12:54:20.00',           newExpectValue: [12, 54, 20]              }],
  ["GPSSatellites",                       { modifyValue: 'a b c',                oldExpectValue: 'a b c',                 newExpectValue: 'a b c'                   }],
  ["GPSStatus",                           { modifyValue: 'V',                    oldExpectValue: 'V',                     newExpectValue: 'V'                       }],
  ["GPSMeasureMode",                      { modifyValue: '3',                    oldExpectValue: '3',                     newExpectValue: '3'                       }],
  ["GPSDOP",                              { modifyValue: '100/100',              oldExpectValue: '1.00',                  newExpectValue: 1.00                      }],
  ["GPSSpeedRef",                         { modifyValue: 'K',                    oldExpectValue: 'K',                     newExpectValue: 'K'                       }],
  ["GPSSpeed",                            { modifyValue: '0/1',                  oldExpectValue: ' 0',                    newExpectValue: 0                         }],
  ["GPSTrackRef",                         { modifyValue: 'M',                    oldExpectValue: 'M',                     newExpectValue: 'M'                       }],
  ["GPSTrack",                            { modifyValue: '3.5',                  oldExpectValue: '3.5',                   newExpectValue: 3.5                       }],
  ["GPSImgDirectionRef",                  { modifyValue: 'T',                    oldExpectValue: 'T',                     newExpectValue: 'T'                       }],
  ["GPSImgDirection",                     { modifyValue: '2.5',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["GPSMapDatum",                         { modifyValue: '%s\\0',                oldExpectValue: '%s\\0',                 newExpectValue: '%s\\0'                   }],
  ["GPSDestLatitudeRef",                  { modifyValue: 'S',                    oldExpectValue: 'S',                     newExpectValue: 'S'                       }],
  ["GPSDestLatitude",                     { modifyValue: '0/1 0/1 0/1',          oldExpectValue: ' 0,  0,  0',            newExpectValue: [0, 0, 0]                 }],
  ["GPSDestLongitudeRef",                 { modifyValue: 'W',                    oldExpectValue: 'W',                     newExpectValue: 'W'                       }],
  ["GPSDestLongitude",                    { modifyValue: '0/1 0/1 0/1',          oldExpectValue: ' 0,  0,  0',            newExpectValue: [0, 0, 0]                 }],
  ["GPSDestBearingRef",                   { modifyValue: 'M',                    oldExpectValue: 'M',                     newExpectValue: 'M'                       }],
  ["GPSDestBearing",                      { modifyValue: '2.5',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["GPSDestDistanceRef",                  { modifyValue: 'K',                    oldExpectValue: 'K',                     newExpectValue: 'K'                       }],
  ["GPSDestDistance",                     { modifyValue: '2.5',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["GPSProcessingMethod",                 { modifyValue: 'XXX',                  oldExpectValue: 'XXX',                   newExpectValue: 'XXX'                     }],
  ["GPSAreaInformation",                  { modifyValue: 'client',               oldExpectValue: 'client',                newExpectValue: 'client'                  }],
  ["GPSDateStamp",                        { modifyValue: '1900:01:01',           oldExpectValue: '1900:01:01',            newExpectValue: '1900:01:01'              }],
  ["GPSDifferential",                     { modifyValue: '1',                    oldExpectValue: '1',                     newExpectValue: 1                         }],
  ["GPSHPositioningError",                { modifyValue: '1/2',                  oldExpectValue: '0.5',                   newExpectValue: 0.5                       }],
  ["PhotographicSensitivity",             { modifyValue: '1234',                 oldExpectValue: '1234',                  newExpectValue: [1234]                    }],
  ["OECF",                                { modifyValue: 'ab',                   oldExpectValue: '2 bytes undefined data',newExpectValue: [97, 98]                  }],
  ["SensitivityType",                     { modifyValue: '0',                    oldExpectValue: 'Unknown',               newExpectValue: 0                         }],
  ["StandardOutputSensitivity",           { modifyValue: '1000',                 oldExpectValue: '1000',                  newExpectValue: 1000                      }],
  ["RecommendedExposureIndex",            { modifyValue: '2147483647',           oldExpectValue: '2147483647',            newExpectValue: 2147483647                }],
  ["ISOSpeedLatitudeyyy",                 { modifyValue: '123',                  oldExpectValue: '123',                   newExpectValue: 123                       }],
  ["ISOSpeedLatitudezzz",                 { modifyValue: '123',                  oldExpectValue: '123',                   newExpectValue: 123                       }],
  ["ExifVersion",                         { modifyValue: '0120',                 oldExpectValue: 'Exif Version 1.2',      newExpectValue: "Exif Version 1.2"        }],
  ["DateTimeOriginal",                    { modifyValue: '1900:01:01 00:00:00',  oldExpectValue: '1900:01:01 00:00:00',   newExpectValue: '1900:01:01 00:00:00'     }],
  ["DateTimeDigitized",                   { modifyValue: '1900:01:01 00:00:00',  oldExpectValue: '1900:01:01 00:00:00',   newExpectValue: '1900:01:01 00:00:00'     }],
  ["OffsetTime",                          { modifyValue: '2023:01:25',           oldExpectValue: '2023:01:25',            newExpectValue: '2023:01:25'              }],
  ["OffsetTimeOriginal",                  { modifyValue: 'ject',                 oldExpectValue: 'ject',                  newExpectValue: 'ject'                    }],
  ["OffsetTimeDigitized",                 { modifyValue: 'cirtize',              oldExpectValue: 'cirtize',               newExpectValue: 'cirtize'                 }],
  ["ComponentsConfiguration",             { modifyValue: '1256',                 oldExpectValue: 'Y Cb G B',              newExpectValue: "Y Cb G B"                }],
  ["CompressedBitsPerPixel",              { modifyValue: '25',                   oldExpectValue: '25',                    newExpectValue: 25                        }],
  ["ShutterSpeedValue",                   { modifyValue: '3/2',                  oldExpectValue: '1.50 EV (1/3 sec.)',    newExpectValue: 1.50                      }],
  ["ApertureValue",                       { modifyValue: '16',                   oldExpectValue: '16.00 EV (f/256.0)',    newExpectValue: 16.00                     }],
  ["BrightnessValue",                     { modifyValue: '6/5',                  oldExpectValue: '1.20 EV (7.87 cd/m^2)', newExpectValue: 1.20                      }],
  ["ExposureBiasValue",                   { modifyValue: '4',                    oldExpectValue: '4.00 EV',               newExpectValue: 4.00                      }],
  ["MaxApertureValue",                    { modifyValue: '8/5',                  oldExpectValue: '1.60 EV (f/1.7)',       newExpectValue: 1.60                      }],
  ["SubjectDistance",                     { modifyValue: '1/2',                  oldExpectValue: '0.5 m',                 newExpectValue: 0.5                       }],
  ["MeteringMode",                        { modifyValue: '0',                    oldExpectValue: 'Unknown',               newExpectValue: 0                         }],
  ["LightSource",                         { modifyValue: 'Daylight',             oldExpectValue: 'Daylight',              newExpectValue: 1                         }],
  ["Flash",                               { modifyValue: '95',                   oldExpectValue: 'Flash fired, auto mode, return light detected, red-eye reduction mode', newExpectValue: 95 }],
  ["FocalLength",                         { modifyValue: '31/1',                 oldExpectValue: '31.0 mm',               newExpectValue: 31.0                      }],
  ["SubjectArea",                         { modifyValue: '45 23',                oldExpectValue: '(x,y) = (45,23)',       newExpectValue: [45, 23]                  }],
  ["MakerNote",                           { modifyValue: '123',                  oldExpectValue: '123',                   newExpectValue: [49, 50, 51]              }],
  ["UserComment",                         { modifyValue: '456',                  oldExpectValue: '456',                   newExpectValue: "456"                     }],
  ["SubsecTime",                          { modifyValue: '427000',               oldExpectValue: '427000',                newExpectValue: '427000'                  }],
  ["SubsecTimeOriginal",                  { modifyValue: '123456',               oldExpectValue: '123456',                newExpectValue: '123456'                  }],
  ["SubsecTimeDigitized",                 { modifyValue: '999999',               oldExpectValue: '999999',                newExpectValue: '999999'                  }],
  ["FlashpixVersion",                     { modifyValue: '0101',                 oldExpectValue: 'FlashPix Version 1.01', newExpectValue: "FlashPix Version 1.01"   }],
  ["ColorSpace",                          { modifyValue: '2',                    oldExpectValue: 'Adobe RGB',             newExpectValue: 2                         }],
  ["PixelXDimension",                     { modifyValue: '0',                    oldExpectValue: '0',                     newExpectValue: 0                         }],
  ["PixelYDimension",                     { modifyValue: '0',                    oldExpectValue: '0',                     newExpectValue: 0                         }],
  ["RelatedSoundFile",                    { modifyValue: 'abc',                  oldExpectValue: 'abc',                   newExpectValue: 'abc'                     }],
  ["FlashEnergy",                         { modifyValue: '5/2',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["SpatialFrequencyResponse",            { modifyValue: 'corn',                 oldExpectValue: 'corn',                  newExpectValue: [99, 111, 114 , 110]      }],
  ["FocalPlaneXResolution",               { modifyValue: '102/1',                oldExpectValue: '102',                   newExpectValue: 102                       }],
  ["FocalPlaneYResolution",               { modifyValue: '81/1',                 oldExpectValue: '81',                    newExpectValue: 81                        }],
  ["FocalPlaneResolutionUnit",            { modifyValue: '3',                    oldExpectValue: 'Centimeter',            newExpectValue: 3                         }],
  ["SubjectLocation",                     { modifyValue: '23 112',               oldExpectValue: '23, 112',               newExpectValue: [23, 112]                 }],
  ["ExposureIndex",                       { modifyValue: '5/2',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["SensingMethod",                       { modifyValue: '8',                    oldExpectValue: 'Color sequential linear sensor', newExpectValue: 8                }],
  ["FileSource",                          { modifyValue: '4',                    oldExpectValue: 'Internal error (unknown value 4)', newExpectValue: [4]            }],
  ["SceneType",                           { modifyValue: 'Directly photographed',oldExpectValue: 'Directly photographed', newExpectValue: [1]                       }],
  ["CFAPattern",                          { modifyValue: 'ab',                   oldExpectValue: '2 bytes undefined data',newExpectValue: [97, 98]                  }],
  ["CustomRendered",                      { modifyValue: '1',                    oldExpectValue: 'Custom process',        newExpectValue: 1                         }],
  ["ExposureMode",                        { modifyValue: '2',                    oldExpectValue: 'Auto bracket',          newExpectValue: 2                         }],
  ["WhiteBalance",                        { modifyValue: '0',                    oldExpectValue: 'Auto white balance',    newExpectValue: 0                         }],
  ["DigitalZoomRatio",                    { modifyValue: '23/1',                 oldExpectValue: '23',                    newExpectValue: 23                        }],
  ["FocalLengthIn35mmFilm",               { modifyValue: '12',                   oldExpectValue: '12',                    newExpectValue: 12                        }],
  ["SceneCaptureType",                    { modifyValue: '3',                    oldExpectValue: 'Night scene',           newExpectValue: 3                         }],
  ["GainControl",                         { modifyValue: '4',                    oldExpectValue: 'High gain down',        newExpectValue: 4                         }],
  ["Contrast",                            { modifyValue: '2',                    oldExpectValue: 'Hard',                  newExpectValue: 2                         }],
  ["Saturation",                          { modifyValue: '2',                    oldExpectValue: 'High saturation',       newExpectValue: 2                         }],
  ["Sharpness",                           { modifyValue: '2',                    oldExpectValue: 'Hard',                  newExpectValue: 2                         }],
  ["DeviceSettingDescription",            { modifyValue: 'coxex',                oldExpectValue: 'coxex',                 newExpectValue: [99, 111, 120, 101, 120]  }],
  ["SubjectDistanceRange",                { modifyValue: '3',                    oldExpectValue: 'Distant view',          newExpectValue: 3                         }],
  ["ImageUniqueID",                       { modifyValue: 'xxx',                  oldExpectValue: 'xxx',                   newExpectValue: 'xxx'                     }],
  ["CameraOwnerName",                     { modifyValue: 'joseph',               oldExpectValue: 'joseph',                newExpectValue: 'joseph'                  }],
  ["BodySerialNumber",                    { modifyValue: 'xoinc',                oldExpectValue: 'xoinc',                 newExpectValue: 'xoinc'                   }],
  ["LensSpecification",                   { modifyValue: '3/4 5/2 3/2 5/2',      oldExpectValue: '0.8, 2.5, 1.5, 2.5',    newExpectValue: [0.75,2.5,1.5,2.5]        }],
  ["LensMake",                            { modifyValue: 'plex',                 oldExpectValue: 'plex',                  newExpectValue: 'plex'                    }],
  ["LensModel",                           { modifyValue: 'world',                oldExpectValue: 'world',                 newExpectValue: 'world'                   }],
  ["LensSerialNumber",                    { modifyValue: 'root',                 oldExpectValue: 'root',                  newExpectValue: 'root'                    }],
  ["CompositeImage",                      { modifyValue: '3',                    oldExpectValue: '3',                     newExpectValue: 3                         }],
  ["SourceImageNumberOfCompositeImage",   { modifyValue: '11 23',                oldExpectValue: '11, 23',                newExpectValue: [11, 23]                  }],
  ["SourceExposureTimesOfCompositeImage", { modifyValue: 'xixe',                 oldExpectValue: 'xixe',                  newExpectValue: [120, 105, 120, 101]      }],
  ["Gamma",                               { modifyValue: '3/2',                  oldExpectValue: '1.5',                   newExpectValue: 1.5                       }],
  ["HwMnoteIsXmageSupported",             { modifyValue: '100',                  oldExpectValue: '100',                   newExpectValue: true                      }],
  ["HwMnoteXmageMode",                    { modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageLeft",                    { modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageTop",                     { modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageRight",                   { modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageBottom",                  { modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteCloudEnhancementMode",         { modifyValue: '1',                    oldExpectValue: '1',                     newExpectValue: true                      }],
  ["HwMnoteCaptureMode",                  { modifyValue: '123456',               oldExpectValue: '123456',                newExpectValue: 123456                    }],
]);

// 可读写DNG EXIF属性的验证规则映射表
const DNGExifReadWriteValidationRules = new Map<string, ModifyRuleDNG>([
  ["NewSubfileType",                      { oldExpectValue: "1",                           newExpectValue: 0                           }],
  ["SubfileType",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ImageWidth",                          { oldExpectValue: "160",                         newExpectValue: 5984                        }],
  ["ImageLength",                         { oldExpectValue: "120",                         newExpectValue: 4000                        }],
  ["BitsPerSample",                       { oldExpectValue: '8, 8, 8',                     newExpectValue: [16]                        }],
  ["Compression",                         { oldExpectValue: 'JPEG compression',            newExpectValue: 7                           }],
  ["PhotometricInterpretation",           { oldExpectValue: 'YCbCr',                       newExpectValue: 32803                       }],
  ["ImageDescription",                    { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Make",                                { oldExpectValue: 'Leica Camera AG',             newExpectValue: 'Leica Camera AG'           }],
  ["Model",                               { oldExpectValue: 'LEICA M (Typ 240)',           newExpectValue: 'LEICA M (Typ 240)'         }],
  ["StripOffsets",                        { oldExpectValue: '4096',                        newExpectValue: [17854]                     }],
  ["Orientation",                         { oldExpectValue: 'Top-left',                    newExpectValue: 1                           }],
  ["SamplesPerPixel",                     { oldExpectValue: '3',                           newExpectValue: 1                           }],
  ["RowsPerStrip",                        { oldExpectValue: '120',                         newExpectValue: 4000                        }],
  ["StripByteCounts",                     { oldExpectValue: '12919',                       newExpectValue: [24739144]                  }],
  ["XResolution",                         { oldExpectValue: '72',                          newExpectValue: 300                         }],
  ["YResolution",                         { oldExpectValue: '72',                          newExpectValue: 300                         }],
  ["PlanarConfiguration",                 { oldExpectValue: 'Chunky format',               newExpectValue: 1                           }],
  ["ResolutionUnit",                      { oldExpectValue: 'Inch',                        newExpectValue: 2                           }],
  ["TransferFunction",                    { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Software",                            { oldExpectValue: '        2.0.2.5',             newExpectValue: '        2.0.2.5'           }],
  ["DateTime",                            { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Artist",                              { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["WhitePoint",                          { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["PrimaryChromaticities",               { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["PhotoMode",                           { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["YCbCrCoefficients",                   { oldExpectValue: '0.299, 0.587, 0.114',         newExpectValue: [0.299,0.587,0.114]         }],
  ["YCbCrSubSampling",                    { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["YCbCrPositioning",                    { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ReferenceBlackWhite",                 { oldExpectValue: ' 0, 255, 128, 255, 128, 255', newExpectValue: [0,255,128,255,128,255]     }],
  ["Copyright",                           { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureTime",                        { oldExpectValue: '1/4000 sec.',                 newExpectValue: 0.00025                     }],
  ["FNumber",                             { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureProgram",                     { oldExpectValue: 'Aperture priority',           newExpectValue: 3                           }],
  ["SpectralSensitivity",                 { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ISOSpeedRatings",                     { oldExpectValue: '200',                         newExpectValue: 200                         }],
  ["GPSVersionID",                        { oldExpectValue: '2.2.0.0',                     newExpectValue: [2,2,0,0]                   }],
  ["GPSLatitudeRef",                      { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSLatitude",                         { oldExpectValue: ' 0,  0, 0.000',               newExpectValue: [0,0,0]                     }],
  ["GPSLongitudeRef",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSLongitude",                        { oldExpectValue: ' 0,  0, 0.000',               newExpectValue: [0,0,0]                     }],
  ["GPSAltitudeRef",                      { oldExpectValue: 'Sea level',                   newExpectValue: 0                           }],
  ["GPSAltitude",                         { oldExpectValue: '0.00',                        newExpectValue: 0                           }],
  ["GPSTimeStamp",                        { oldExpectValue: '00:00:00.00',                 newExpectValue: [0,0,0]                     }],
  ["GPSSatellites",                       { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSStatus",                           { oldExpectValue: 'V',                           newExpectValue: "V"                         }],
  ["GPSMeasureMode",                      { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDOP",                              { oldExpectValue: '0.00',                        newExpectValue: 0                           }],
  ["GPSSpeedRef",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSSpeed",                            { oldExpectValue: '0.00',                        newExpectValue: 0                           }],
  ["GPSTrackRef",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSTrack",                            { oldExpectValue: ' 0',                          newExpectValue: 0                           }],
  ["GPSImgDirectionRef",                  { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSImgDirection",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSMapDatum",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLatitudeRef",                  { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLatitude",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLongitudeRef",                 { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLongitude",                    { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestBearingRef",                   { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestBearing",                      { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestDistanceRef",                  { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestDistance",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSProcessingMethod",                 { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSAreaInformation",                  { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDateStamp",                        { oldExpectValue: '2000:00:00',                  newExpectValue: '2000:00:00'                }],
  ["GPSDifferential",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSHPositioningError",                { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["PhotographicSensitivity",             { oldExpectValue: '200',                         newExpectValue: [200]                       }],
  ["OECF",                                { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SensitivityType",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["StandardOutputSensitivity",           { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["RecommendedExposureIndex",            { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ISOSpeedLatitudeyyy",                 { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ISOSpeedLatitudezzz",                 { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExifVersion",                         { oldExpectValue: 'Exif Version 2.3',            newExpectValue: "Exif Version 2.3"          }],
  ["DateTimeOriginal",                    { oldExpectValue: '2015:09:18 07:58:04',         newExpectValue: '2015:09:18 07:58:04'       }],
  ["DateTimeDigitized",                   { oldExpectValue: '2015:09:18 07:58:04',         newExpectValue: '2015:09:18 07:58:04'       }],
  ["OffsetTime",                          { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["OffsetTimeOriginal",                  { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["OffsetTimeDigitized",                 { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ComponentsConfiguration",             { oldExpectValue: 'Y Cb Cr -',                   newExpectValue: " Y Cb Cr-"                 }],
  ["CompressedBitsPerPixel",              { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ShutterSpeedValue",                   { oldExpectValue: '12.00 EV (1/4096 sec.)',      newExpectValue: 12                          }],
  ["ApertureValue",                       { oldExpectValue: '2.50 EV (f/2.4)',             newExpectValue: 2.5                         }],
  ["BrightnessValue",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureBiasValue",                   { oldExpectValue: '0.33 EV',                     newExpectValue: 0.33203125                  }],
  ["MaxApertureValue",                    { oldExpectValue: '0.97 EV (f/1.4)',             newExpectValue: 0.96875                     }],
  ["SubjectDistance",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["MeteringMode",                        { oldExpectValue: 'Center-weighted average',     newExpectValue: 2                           }],
  ["LightSource",                         { oldExpectValue: 'Unknown',                     newExpectValue: 0                           }],
  ["Flash",                               { oldExpectValue: 'Flash did not fire',          newExpectValue: 0                           }],
  ["FocalLength",                         { oldExpectValue: '35.0 mm',                     newExpectValue: 35                          }],
  ["SubjectArea",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["MakerNote",                           { oldExpectValue: null,                          newExpectValue: makernoteDNG                }],
  ["UserComment",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubsecTime",                          { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubsecTimeOriginal",                  { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubsecTimeDigitized",                 { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FlashpixVersion",                     { oldExpectValue: 'FlashPix Version 1.0',        newExpectValue: undefined                   }],
  ["ColorSpace",                          { oldExpectValue: 'sRGB',                        newExpectValue: 1                           }],
  ["PixelXDimension",                     { oldExpectValue: '5984',                        newExpectValue: 5984                        }],
  ["PixelYDimension",                     { oldExpectValue: '4000',                        newExpectValue: 4000                        }],
  ["RelatedSoundFile",                    { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FlashEnergy",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SpatialFrequencyResponse",            { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FocalPlaneXResolution",               { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FocalPlaneYResolution",               { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FocalPlaneResolutionUnit",            { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubjectLocation",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureIndex",                       { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SensingMethod",                       { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FileSource",                          { oldExpectValue: 'DSC',                         newExpectValue: [3]                         }],
  ["SceneType",                           { oldExpectValue: 'Directly photographed',       newExpectValue: [1]                         }],
  ["CFAPattern",                          { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["CustomRendered",                      { oldExpectValue: 'Normal process',              newExpectValue: 0                           }],
  ["ExposureMode",                        { oldExpectValue: 'Auto exposure',               newExpectValue: 0                           }],
  ["WhiteBalance",                        { oldExpectValue: 'Auto white balance',          newExpectValue: 0                           }],
  ["DigitalZoomRatio",                    { oldExpectValue: ' 0',                          newExpectValue: 0                           }],
  ["FocalLengthIn35mmFilm",               { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SceneCaptureType",                    { oldExpectValue: 'Standard',                    newExpectValue: 0                           }],
  ["GainControl",                         { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Contrast",                            { oldExpectValue: 'Normal',                      newExpectValue: 0                           }],
  ["Saturation",                          { oldExpectValue: 'Normal',                      newExpectValue: 0                           }],
  ["Sharpness",                           { oldExpectValue: 'Normal',                      newExpectValue: 0                           }],
  ["DeviceSettingDescription",            { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubjectDistanceRange",                { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["CameraOwnerName",                     { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["BodySerialNumber",                    { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["LensSpecification",                   { oldExpectValue: '35, 35, 1.4, 16.0',           newExpectValue: [35,35,1.4,16]              }],
  ["LensMake",                            { oldExpectValue: 'Leica Camera AG',             newExpectValue: 'Leica Camera AG'           }],
  ["LensModel",                           { oldExpectValue: 'Summilux-M 1:1.4/35 ASPH.',   newExpectValue: 'Summilux-M 1:1.4/35 ASPH.' }],
  ["LensSerialNumber",                    { oldExpectValue: '-------',                     newExpectValue: '-------'                   }],
  ["CompositeImage",                      { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SourceImageNumberOfCompositeImage",   { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SourceExposureTimesOfCompositeImage", { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Gamma",                               { oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["HwMnoteIsXmageSupported",             { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageMode",                    { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageLeft",                    { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageTop",                     { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageRight",                   { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageBottom",                  { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteCloudEnhancementMode",         { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }], 
  ["HwMnoteCaptureMode",                  { oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
]);

let imageOnlyMakerNoteHwMetadata: string[] = [
  "xmageColorMode",
  "isWindSnapshot",
  "sceneVersion",
  "sceneFoodConfidence",
  "sceneStageConfidence",
  "sceneBlueSkyConfidence",
  "sceneGreenPlantConfidence",
  "sceneBeachConfidence",
  "sceneSnowConfidence",
  "sceneSunsetConfidence",
  "sceneFlowersConfidence",
  "sceneNightConfidence",
  "sceneTextConfidence",
  "faceCount",
  "burstNumber",
  "isFrontCamera",
  "rollAngle",
  "pitchAngle",
  "physicalAperture",
  "focusMode",
];

let readOnlyMakerNoteHwMetadata: string[] = [
  "HwMnoteXmageColorMode",
  "HwMnoteWindSnapshotMode",
  "HwMnoteSceneVersion",
  "HwMnoteSceneFoodConf",
  "HwMnoteSceneStageConf",
  "HwMnoteSceneBlueSkyConf",
  "HwMnoteSceneGreenP1antConf",
  "HwMnoteSceneBeachConf",
  "HwMnoteSceneSnowConf",
  "HwMnoteSceneSunsetConf",
  "HwMnoteSceneFlowersConf",
  "HwMnoteSceneNightConf",
  "HwMnoteSceneTextConf",
  "HwMnoteFaceCount",
  "HwMnoteBurstNumber",
  "HwMnoteFrontCamera",
  "HwMnoteRollAngle",
  "HwMnotePitchAngle",
  "HwMnotePhysicalAperture", 
  "HwMnoteFocusMode",
];

const exifReadOnlyValidationRules = new Map<string, readOnlyRule>([
  ["JPEGInterchangeFormat",        { expectValueJPG: 2798,      expectValuePNG: 2798,      expectValueHEIC: 2798,      expectValueWEBP: undefined, expectValueDNG: 10344     }],
  ["JPEGInterchangeFormatLength",  { expectValueJPG: 4,         expectValuePNG: 4,         expectValueHEIC: 4,         expectValueWEBP: undefined, expectValueDNG: 4         }],
  ["HwMnoteXmageColorMode",        { expectValueJPG: undefined, expectValuePNG: undefined, expectValueHEIC: undefined, expectValueWEBP: undefined, expectValueDNG: undefined }],
  ["HwMnoteWindSnapshotMode",      { expectValueJPG: undefined, expectValuePNG: undefined, expectValueHEIC: undefined, expectValueWEBP: undefined, expectValueDNG: undefined }],
  ["HwMnoteSceneVersion",          { expectValueJPG: 1,         expectValuePNG: 1,         expectValueHEIC: 1,         expectValueWEBP: 1,         expectValueDNG: 1         }],
  ["HwMnoteSceneFoodConf",         { expectValueJPG: 2,         expectValuePNG: 2,         expectValueHEIC: 2,         expectValueWEBP: 2,         expectValueDNG: 2         }],
  ["HwMnoteSceneStageConf",        { expectValueJPG: 3,         expectValuePNG: 3,         expectValueHEIC: 3,         expectValueWEBP: 3,         expectValueDNG: 3         }],
  ["HwMnoteSceneBlueSkyConf",      { expectValueJPG: 4,         expectValuePNG: 4,         expectValueHEIC: 4,         expectValueWEBP: 4,         expectValueDNG: 4         }],
  ["HwMnoteSceneGreenP1antConf",   { expectValueJPG: undefined, expectValuePNG: undefined, expectValueHEIC: undefined, expectValueWEBP: undefined, expectValueDNG: undefined }],
  ["HwMnoteSceneBeachConf",        { expectValueJPG: 6,         expectValuePNG: 6,         expectValueHEIC: 6,         expectValueWEBP: 6,         expectValueDNG: 6,        }],
  ["HwMnoteSceneSnowConf",         { expectValueJPG: 7,         expectValuePNG: 7,         expectValueHEIC: 7,         expectValueWEBP: 7,         expectValueDNG: 7,        }],
  ["HwMnoteSceneSunsetConf",       { expectValueJPG: 8,         expectValuePNG: 8,         expectValueHEIC: 8,         expectValueWEBP: 8,         expectValueDNG: 8,        }],
  ["HwMnoteSceneFlowersConf",      { expectValueJPG: 9,         expectValuePNG: 9,         expectValueHEIC: 9,         expectValueWEBP: 9,         expectValueDNG: 9,        }],
  ["HwMnoteSceneNightConf",        { expectValueJPG: 10,        expectValuePNG: 10,        expectValueHEIC: 10,        expectValueWEBP: 10,        expectValueDNG: 10        }],
  ["HwMnoteSceneTextConf",         { expectValueJPG: 11,        expectValuePNG: 11,        expectValueHEIC: 11,        expectValueWEBP: 11,        expectValueDNG: 11        }],
  ["HwMnoteFaceCount",             { expectValueJPG: 2,         expectValuePNG: 2,         expectValueHEIC: 2,         expectValueWEBP: 2,         expectValueDNG: 2         }],
  ["HwMnoteBurstNumber",           { expectValueJPG: 2,         expectValuePNG: 2,         expectValueHEIC: 2,         expectValueWEBP: 2,         expectValueDNG: 2         }],
  ["HwMnoteFrontCamera",           { expectValueJPG: true,      expectValuePNG: true,      expectValueHEIC: true,      expectValueWEBP: true,      expectValueDNG: true      }],
  ["HwMnoteRollAngle",             { expectValueJPG: 4,         expectValuePNG: 4,         expectValueHEIC: 4,         expectValueWEBP: 4,         expectValueDNG: 4         }],
  ["HwMnotePitchAngle",            { expectValueJPG: 5,         expectValuePNG: 5,         expectValueHEIC: 5,         expectValueWEBP: 5,         expectValueDNG: 5         }],
  ["HwMnotePhysicalAperture",      { expectValueJPG: 6,         expectValuePNG: 6,         expectValueHEIC: 6,         expectValueWEBP: 6,         expectValueDNG: 6         }],
  ["HwMnoteFocusMode",             { expectValueJPG: 7,         expectValuePNG: 7,         expectValueHEIC: 7,         expectValueWEBP: 7,         expectValueDNG: 7         }],
]);

let testExifMetadata = image.ExifMetadata.createInstance();
testExifMetadata.newSubfileType = 5;
testExifMetadata.subfileType = 3;
testExifMetadata.imageWidth = 65535;
testExifMetadata.imageLength = 65535;
testExifMetadata.bitsPerSample = [65535,65535,65535];
testExifMetadata.compression = 32773;
testExifMetadata.photometricInterpretation = 1;
testExifMetadata.imageDescription = '@  @';
testExifMetadata.make = 'APPLE';
testExifMetadata.model = '%s \\0';
testExifMetadata.stripOffsets = [456];
testExifMetadata.orientation = image.Orientation.TOP_LEFT;
testExifMetadata.samplesPerPixel = 65535;
testExifMetadata.rowsPerStrip = 345;
testExifMetadata.stripByteCounts = [345];
testExifMetadata.xResolution = 31/1;
testExifMetadata.yResolution = 31/1;
testExifMetadata.planarConfiguration = 2;
testExifMetadata.resolutionUnit = 3;
testExifMetadata.transferFunction = 'abc';
testExifMetadata.software = '%s \\0';
testExifMetadata.dateTime = '1900:01:01';
testExifMetadata.artist = '%s \\0';
testExifMetadata.whitePoint = [252, 1];
testExifMetadata.primaryChromaticities = [31];
testExifMetadata.photoMode = 13;
testExifMetadata.yCbCrCoefficients = [1.5,2.0,3.0];
testExifMetadata.yCbCrSubSampling = [4,5];
testExifMetadata.yCbCrPositioning = 2;
testExifMetadata.referenceBlackWhite = [3,255,0,255,0,255];
testExifMetadata.copyright = 'joseph';
testExifMetadata.exposureTime = 1/60;
testExifMetadata.fNumber = 1/30;
testExifMetadata.exposureProgram = 8;
testExifMetadata.spectralSensitivity = '1234';
testExifMetadata.gpsVersionID = [2, 2, 0, 1];
testExifMetadata.gpsLatitudeRef = 'S';
testExifMetadata.gpsLatitude = [38.0, 0, 0];
testExifMetadata.gpsLongitudeRef = 'W';
testExifMetadata.gpsLongitude = [38, 0, 0];
testExifMetadata.gpsAltitudeRef = 1;
testExifMetadata.gpsAltitude = 1.00;
testExifMetadata.gpsTimestamp = [12, 54, 20];
testExifMetadata.gpsSatellites = 'a b c';
testExifMetadata.gpsStatus = 'V';
testExifMetadata.gpsMeasureMode = '3';
testExifMetadata.gpsDop = 1.5;
testExifMetadata.gpsSpeedRef = 'K';
testExifMetadata.gpsSpeed = 0;
testExifMetadata.gpsTrackRef = 'M';
testExifMetadata.gpsTrack = 3.5;
testExifMetadata.gpsImgDirectionRef = 'T';
testExifMetadata.gpsImgDirection = 2.5;
testExifMetadata.gpsMapDatum = '%s\\0';
testExifMetadata.gpsDestLatitudeRef = 'S';
testExifMetadata.gpsDestLatitude = [0, 0, 0];
testExifMetadata.gpsDestLongitudeRef = 'W';
testExifMetadata.gpsDestLongitude = [0, 0, 0];
testExifMetadata.gpsDestBearingRef = 'M';
testExifMetadata.gpsDestBearing = 2.5;
testExifMetadata.gpsDestDistanceRef = 'K';
testExifMetadata.gpsDestDistance = 2.5;
testExifMetadata.gpsProcessingMethod = 'XXX';
testExifMetadata.gpsAreaInformation = 'client';
testExifMetadata.gpsDateStamp = '1900:01:01';
testExifMetadata.gpsDifferential = 1;
testExifMetadata.gpsHPositioningError = 0.5;
testExifMetadata.isoSpeedRatings = 3200;
testExifMetadata.photographicSensitivity = [3200];
testExifMetadata.oecf = testExifArrayBuffer;
testExifMetadata.sensitivityType = 0;
testExifMetadata.standardOutputSensitivity = 1000;
testExifMetadata.recommendedExposureIndex = 2147483647;
testExifMetadata.isoSpeedLatitudeyyy = 123;
testExifMetadata.isoSpeedLatitudezzz = 123;
testExifMetadata.exifVersion = "Exif Version 2.1";
testExifMetadata.dateTimeOriginal = '1900:01:01 00:00:00';
testExifMetadata.dateTimeDigitized = '1900:01:01 00:00:00';
testExifMetadata.offsetTime = '2023:01:25';
testExifMetadata.offsetTimeOriginal = 'ject';
testExifMetadata.offsetTimeDigitized = 'cirtize';
testExifMetadata.componentsConfiguration = "Y R G B";
testExifMetadata.compressedBitsPerPixel = 25;
testExifMetadata.shutterSpeedValue = 3/2;
testExifMetadata.apertureValue = 16;
testExifMetadata.brightnessValue = 6/5;
testExifMetadata.exposureBiasValue = 4;
testExifMetadata.maxApertureValue = 8/5;
testExifMetadata.subjectDistance = 1/2;
testExifMetadata.meteringMode = 0;
testExifMetadata.lightSource = 1;
testExifMetadata.flash = 95;
testExifMetadata.focalLength = 31.0;
testExifMetadata.subjectArea = [45, 23];
testExifMetadata.makerNote = testExifArrayBuffer;
testExifMetadata.userComment = "place for user comments";
testExifMetadata.subsecTime = '427000';
testExifMetadata.subsecTimeOriginal = '123456';
testExifMetadata.subsecTimeDigitized = '999999';
testExifMetadata.flashpixVersion = "FlashPix Version 1.0";
testExifMetadata.colorSpace = 2;
testExifMetadata.pixelXDimension = 0;
testExifMetadata.pixelYDimension = 0;
testExifMetadata.relatedSoundFile = 'abc';
testExifMetadata.flashEnergy = 2.5;
testExifMetadata.spatialFrequencyResponse = testExifArrayBuffer;
testExifMetadata.focalPlaneXResolution = 102;
testExifMetadata.focalPlaneYResolution = 81;
testExifMetadata.focalPlaneResolutionUnit = 3;
testExifMetadata.subjectLocation = [23, 112];
testExifMetadata.exposureIndex = 2.5;
testExifMetadata.sensingMethod = 8;
testExifMetadata.fileSource = testExifArrayBuffer_1;
testExifMetadata.sceneType = testExifArrayBuffer_1;
testExifMetadata.cfaPattern = testExifArrayBuffer;
testExifMetadata.customRendered = 1;
testExifMetadata.exposureMode = 2;
testExifMetadata.whiteBalance = 0;
testExifMetadata.digitalZoomRatio = 23/1;
testExifMetadata.focalLengthIn35mmFilm = 12;
testExifMetadata.sceneCaptureType = 3;
testExifMetadata.gainControl = 4;
testExifMetadata.contrast = 2;
testExifMetadata.saturation = 2;
testExifMetadata.sharpness = 2;
testExifMetadata.deviceSettingDescription = testExifArrayBuffer;
testExifMetadata.subjectDistanceRange = 3;
testExifMetadata.imageUniqueId = 'Image Unique ID';
testExifMetadata.cameraOwnerName = 'joseph';
testExifMetadata.bodySerialNumber = 'xoinc';
testExifMetadata.lensSpecification = [0.75,2.5,1.5,2.5];
testExifMetadata.lensMake = 'plex';
testExifMetadata.lensModel = 'world';
testExifMetadata.lensSerialNumber = 'root';
testExifMetadata.compositeImage = 3;
testExifMetadata.sourceImageNumberOfCompositeImage = [11, 23];
testExifMetadata.sourceExposureTimesOfCompositeImage = testExifArrayBuffer;
testExifMetadata.gamma = 1.5;

// 华为厂商Note元数据测试对象 (使用对象字面量，将在运行时作为MakerNoteHuaweiMetadata使用)
let testHuaweiMakerNoteMetadata = image.MakerNoteHuaweiMetadata.createInstance();
testHuaweiMakerNoteMetadata.isXmageSupported = true;
testHuaweiMakerNoteMetadata.xmageWatermarkMode = 2;
testHuaweiMakerNoteMetadata.xmageLeft = 200;
testHuaweiMakerNoteMetadata.xmageTop = 231;
testHuaweiMakerNoteMetadata.xmageRight = 156;
testHuaweiMakerNoteMetadata.xmageBottom = 423;
testHuaweiMakerNoteMetadata.isCloudEnhanced = true;
testHuaweiMakerNoteMetadata.captureMode = 456321789;

interface ModifyRule1 {
  oldExpectValue: string;
  newExpectValue: string | number | Array<number> | ArrayBuffer | boolean;
}

// 写入元数据后的预期值验证规则映射表
const exifWriteExpectedValueRules = new Map<string, ModifyRule1>([
  ["NewSubfileType",                       { oldExpectValue: "5",                        newExpectValue: 5                        }],
  ["SubfileType",                          { oldExpectValue: "3",                        newExpectValue: 3                        }],
  ["ImageWidth",                           { oldExpectValue: "65535",                    newExpectValue: 65535                    }],
  ["ImageLength",                          { oldExpectValue: "65535",                    newExpectValue: 65535                    }],
  ["BitsPerSample",                        { oldExpectValue: "65535, 65535, 65535",      newExpectValue: [65535,65535,65535]      }],
  ["Compression",                          { oldExpectValue: "PackBits compression",     newExpectValue: 32773                    }],
  ["PhotometricInterpretation",            { oldExpectValue: "Normal mono",              newExpectValue: 1                        }],
  ["ImageDescription",                     { oldExpectValue: "@  @",                     newExpectValue: '@  @'                   }],
  ["Make",                                 { oldExpectValue: "APPLE",                    newExpectValue: 'APPLE'                  }],
  ["Model",                                { oldExpectValue: "%s \\0",                   newExpectValue: '%s \\0'                 }],
  ["StripOffsets",                         { oldExpectValue: "456",                      newExpectValue: [456]                    }],
  ["Orientation",                          { oldExpectValue: "Top-left",                 newExpectValue: 1                        }],
  ["SamplesPerPixel",                      { oldExpectValue: "65535",                    newExpectValue: 65535                    }],
  ["RowsPerStrip",                         { oldExpectValue: "345",                      newExpectValue: 345                      }],
  ["StripByteCounts",                      { oldExpectValue: "345",                      newExpectValue: [345]                    }],
  ["XResolution",                          { oldExpectValue: "31",                       newExpectValue: 31                       }],
  ["YResolution",                          { oldExpectValue: "31",                       newExpectValue: 31                       }],
  ["PlanarConfiguration",                  { oldExpectValue: "Planar format",            newExpectValue: 2                        }],
  ["ResolutionUnit",                       { oldExpectValue: "Centimeter",               newExpectValue: 3                        }],
  ["TransferFunction",                     { oldExpectValue: "3 bytes undefined data",   newExpectValue: '3 bytes undefined data' }],
  ["Software",                             { oldExpectValue: "%s \\0",                   newExpectValue: '%s \\0'                 }],
  ["DateTime",                             { oldExpectValue: "1900:01:01",               newExpectValue: '1900:01:01'             }],
  ["Artist",                               { oldExpectValue: "%s \\0",                   newExpectValue: '%s \\0'                 }],
  ["WhitePoint",                           { oldExpectValue: "252,  1",                  newExpectValue: [252, 1]                 }],
  ["PrimaryChromaticities",                { oldExpectValue: "31",                       newExpectValue: [31]                     }],
  ["PhotoMode",                            { oldExpectValue: "13",                       newExpectValue: 13                       }],
  ["YCbCrCoefficients",                    { oldExpectValue: "1.5,  2,  3",              newExpectValue: [1.5,2.0,3.0]            }],
  ["YCbCrSubSampling",                     { oldExpectValue: "4, 5",                     newExpectValue: [4,5]                    }],
  ["YCbCrPositioning",                     { oldExpectValue: "Co-sited",                 newExpectValue: 2                        }],
  ["ReferenceBlackWhite",                  { oldExpectValue: " 3, 255,  0, 255,  0, 255",newExpectValue: [3,255,0,255,0,255]      }],
  ["Copyright",                            { oldExpectValue: "joseph (Photographer) - [None] (Editor)", newExpectValue: 'joseph (Photographer) - [None] (Editor)' }],
  ["ExposureTime",                         { oldExpectValue: "1/60 sec.",                newExpectValue: 0.0166667                }],
  ["FNumber",                              { oldExpectValue: "f/0.03",                   newExpectValue: 0.0333333                }],
  ["ExposureProgram",                      { oldExpectValue: "Landscape mode (for landscape photos with the background in focus)", newExpectValue: 8 }],
  ["SpectralSensitivity",                  { oldExpectValue: "1234",                     newExpectValue: '1234'                   }],
  ["ISOSpeedRatings",                      { oldExpectValue: "3200",                     newExpectValue: 3200                     }],
  ["GPSVersionID",                         { oldExpectValue: "2.2.0.1",                  newExpectValue: [2,2,0,1]                }],
  ["GPSLatitudeRef",                       { oldExpectValue: "S",                        newExpectValue: 'S'                      }],
  ["GPSLatitude",                          { oldExpectValue: "38,  0,  0",               newExpectValue: [38.0, 0, 0]             }],
  ["GPSLongitudeRef",                      { oldExpectValue: "W",                        newExpectValue: 'W'                      }],
  ["GPSLongitude",                         { oldExpectValue: "38,  0,  0",               newExpectValue: [38, 0, 0]               }],
  ["GPSAltitudeRef",                       { oldExpectValue: "Sea level reference",      newExpectValue: 1                        }],
  ["GPSAltitude",                          { oldExpectValue: " 1",                       newExpectValue: 1.00                     }],
  ["GPSTimeStamp",                         { oldExpectValue: "12:54:20.00",              newExpectValue: [12, 54, 20]             }],
  ["GPSSatellites",                        { oldExpectValue: "a b c",                    newExpectValue: 'a b c'                  }],
  ["GPSStatus",                            { oldExpectValue: "V",                        newExpectValue: 'V'                      }],
  ["GPSMeasureMode",                       { oldExpectValue: "3",                        newExpectValue: '3'                      }],
  ["GPSDOP",                               { oldExpectValue: "1.5",                      newExpectValue: 1.5                      }],
  ["GPSSpeedRef",                          { oldExpectValue: "K",                        newExpectValue: 'K'                      }],
  ["GPSSpeed",                             { oldExpectValue: " 0",                       newExpectValue: 0                        }],
  ["GPSTrackRef",                          { oldExpectValue: "M",                        newExpectValue: 'M'                      }],
  ["GPSTrack",                             { oldExpectValue: "3.5",                      newExpectValue: 3.5                      }],
  ["GPSImgDirectionRef",                   { oldExpectValue: "T",                        newExpectValue: 'T'                      }],
  ["GPSImgDirection",                      { oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["GPSMapDatum",                          { oldExpectValue: "%s\\0",                    newExpectValue: '%s\\0'                  }],
  ["GPSDestLatitudeRef",                   { oldExpectValue: "S",                        newExpectValue: 'S'                      }],
  ["GPSDestLatitude",                      { oldExpectValue: " 0,  0,  0",               newExpectValue: [0, 0, 0]                }],
  ["GPSDestLongitudeRef",                  { oldExpectValue: "W",                        newExpectValue: 'W'                      }],
  ["GPSDestLongitude",                     { oldExpectValue: " 0,  0,  0",               newExpectValue: [0, 0, 0]                }],
  ["GPSDestBearingRef",                    { oldExpectValue: "M",                        newExpectValue: 'M'                      }],
  ["GPSDestBearing",                       { oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["GPSDestDistanceRef",                   { oldExpectValue: "K",                        newExpectValue: 'K'                      }],
  ["GPSDestDistance",                      { oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["GPSProcessingMethod",                  { oldExpectValue: "XXX",                      newExpectValue: 'XXX'                    }],
  ["GPSAreaInformation",                   { oldExpectValue: "client",                   newExpectValue: 'client'                 }],
  ["GPSDateStamp",                         { oldExpectValue: "1900:01:01",               newExpectValue: '1900:01:01'             }],
  ["GPSDifferential",                      { oldExpectValue: "1",                        newExpectValue: 1                        }],
  ["GPSHPositioningError",                 { oldExpectValue: "0.5",                      newExpectValue: 0.5                      }],
  ["PhotographicSensitivity",              { oldExpectValue: "3200",                     newExpectValue: [3200]                   }],
  ["OECF",                                 { oldExpectValue: "4 bytes undefined data",   newExpectValue: [48, 50, 49, 48]         }],
  ["SensitivityType",                      { oldExpectValue: "Unknown",                  newExpectValue: 0                        }],
  ["StandardOutputSensitivity",            { oldExpectValue: "1000",                     newExpectValue: 1000                     }],
  ["RecommendedExposureIndex",             { oldExpectValue: "2147483647",               newExpectValue: 2147483647               }],
  ["ISOSpeedLatitudeyyy",                  { oldExpectValue: "123",                      newExpectValue: 123                      }],
  ["ISOSpeedLatitudezzz",                  { oldExpectValue: "123",                      newExpectValue: 123                      }],
  ["ExifVersion",                          { oldExpectValue: "Exif Version 2.1",         newExpectValue: "Exif Version 2.1"       }],
  ["DateTimeOriginal",                     { oldExpectValue: "1900:01:01 00:00:00",      newExpectValue: '1900:01:01 00:00:00'    }],
  ["DateTimeDigitized",                    { oldExpectValue: "1900:01:01 00:00:00",      newExpectValue: '1900:01:01 00:00:00'    }],
  ["OffsetTime",                           { oldExpectValue: "2023:01:25",               newExpectValue: '2023:01:25'             }],
  ["OffsetTimeOriginal",                   { oldExpectValue: "ject",                     newExpectValue: 'ject'                   }],
  ["OffsetTimeDigitized",                  { oldExpectValue: "cirtize",                  newExpectValue: 'cirtize'                }],
  ["ComponentsConfiguration",              { oldExpectValue: "Y R G B",                  newExpectValue: "Y R G B"                }],
  ["CompressedBitsPerPixel",               { oldExpectValue: "25",                       newExpectValue: 25                       }],
  ["ShutterSpeedValue",                    { oldExpectValue: "1.50 EV (1/3 sec.)",       newExpectValue: 1.50                     }],
  ["ApertureValue",                        { oldExpectValue: "16.00 EV (f/256.0)",       newExpectValue: 16.00                    }],
  ["BrightnessValue",                      { oldExpectValue: "1.20 EV (7.87 cd/m^2)",    newExpectValue: 1.20                     }],
  ["ExposureBiasValue",                    { oldExpectValue: "4.00 EV",                  newExpectValue: 4.00                     }],
  ["MaxApertureValue",                     { oldExpectValue: "1.60 EV (f/1.7)",          newExpectValue: 1.60                     }],
  ["SubjectDistance",                      { oldExpectValue: "0.5 m",                    newExpectValue: 0.5                      }],
  ["MeteringMode",                         { oldExpectValue: "Unknown",                  newExpectValue: 0                        }],
  ["LightSource",                          { oldExpectValue: "Daylight",                 newExpectValue: 1                        }],
  ["Flash",                                { oldExpectValue: "Flash fired, auto mode, return light detected, red-eye reduction mode", newExpectValue: 95 }],
  ["FocalLength",                          { oldExpectValue: "31.0 mm",                  newExpectValue: 31.0                     }],
  ["SubjectArea",                          { oldExpectValue: "(x,y) = (45,23)",          newExpectValue: [45, 23]                 }],
  ["MakerNote",                            { oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["UserComment",                          { oldExpectValue: "place for user comments",  newExpectValue: "place for user comments"}],
  ["SubsecTime",                           { oldExpectValue: "427000",                   newExpectValue: '427000'                 }],
  ["SubsecTimeOriginal",                   { oldExpectValue: "123456",                   newExpectValue: '123456'                 }],
  ["SubsecTimeDigitized",                  { oldExpectValue: "999999",                   newExpectValue: '999999'                 }],
  ["FlashpixVersion",                      { oldExpectValue: "FlashPix Version 1.0",     newExpectValue: "FlashPix Version 1.0"   }],
  ["ColorSpace",                           { oldExpectValue: "Adobe RGB",                newExpectValue: 2                        }],
  ["PixelXDimension",                      { oldExpectValue: "0",                        newExpectValue: 0                        }],
  ["PixelYDimension",                      { oldExpectValue: "0",                        newExpectValue: 0                        }],
  ["RelatedSoundFile",                     { oldExpectValue: "abc",                      newExpectValue: 'abc'                    }],
  ["FlashEnergy",                          { oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["SpatialFrequencyResponse",             { oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["FocalPlaneXResolution",                { oldExpectValue: "102",                      newExpectValue: 102                      }],
  ["FocalPlaneYResolution",                { oldExpectValue: "81",                       newExpectValue: 81                       }],
  ["FocalPlaneResolutionUnit",             { oldExpectValue: "Centimeter",               newExpectValue: 3                        }],
  ["SubjectLocation",                      { oldExpectValue: "23, 112",                  newExpectValue: [23, 112]                }],
  ["ExposureIndex",                        { oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["SensingMethod",                        { oldExpectValue: "Color sequential linear sensor",  newExpectValue: 8                 }],
  ["FileSource",                           { oldExpectValue: "Internal error (unknown value 1)",newExpectValue: [1]               }],
  ["SceneType",                            { oldExpectValue: "Directly photographed",    newExpectValue: [1]                      }],
  ["CFAPattern",                           { oldExpectValue: "4 bytes undefined data",   newExpectValue: [48, 50, 49, 48]         }],
  ["CustomRendered",                       { oldExpectValue: "Custom process",           newExpectValue: 1                        }],
  ["ExposureMode",                         { oldExpectValue: "Auto bracket",             newExpectValue: 2                        }],
  ["WhiteBalance",                         { oldExpectValue: "Auto white balance",       newExpectValue: 0                        }],
  ["DigitalZoomRatio",                     { oldExpectValue: "23",                       newExpectValue: 23                       }],
  ["FocalLengthIn35mmFilm",                { oldExpectValue: "12",                       newExpectValue: 12                       }],
  ["SceneCaptureType",                     { oldExpectValue: "Night scene",              newExpectValue: 3                        }],
  ["GainControl",                          { oldExpectValue: "High gain down",           newExpectValue: 4                        }],
  ["Contrast",                             { oldExpectValue: "Hard",                     newExpectValue: 2                        }],
  ["Saturation",                           { oldExpectValue: "High saturation",          newExpectValue: 2                        }],
  ["Sharpness",                            { oldExpectValue: "Hard",                     newExpectValue: 2                        }],
  ["DeviceSettingDescription",             { oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["SubjectDistanceRange",                 { oldExpectValue: "Distant view",             newExpectValue: 3                        }],
  ["ImageUniqueID",                        { oldExpectValue: "Image Unique ID",          newExpectValue: 'Image Unique ID'        }],
  ["CameraOwnerName",                      { oldExpectValue: "joseph",                   newExpectValue: 'joseph'                 }],
  ["BodySerialNumber",                     { oldExpectValue: "xoinc",                    newExpectValue: 'xoinc'                  }],
  ["LensSpecification",                    { oldExpectValue: "0.8, 2.5, 1.5, 2.5",       newExpectValue: [0.75,2.5,1.5,2.5]       }],
  ["LensMake",                             { oldExpectValue: "plex",                     newExpectValue: 'plex'                   }],
  ["LensModel",                            { oldExpectValue: "world",                    newExpectValue: 'world'                  }],
  ["LensSerialNumber",                     { oldExpectValue: "root",                     newExpectValue: 'root'                   }],
  ["CompositeImage",                       { oldExpectValue: "3",                        newExpectValue: 3                        }],
  ["SourceImageNumberOfCompositeImage",    { oldExpectValue: "11, 23",                   newExpectValue: [11, 23]                 }],
  ["SourceExposureTimesOfCompositeImage",  { oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["Gamma",                                { oldExpectValue: "1.5",                      newExpectValue: 1.5                      }],
  ["HwMnoteIsXmageSupported",              { oldExpectValue: "true",                     newExpectValue: true                     }],
  ["HwMnoteXmageMode",                     { oldExpectValue: "2",                        newExpectValue: 2                        }],
  ["HwMnoteXmageLeft",                     { oldExpectValue: "200",                      newExpectValue: 200                      }],
  ["HwMnoteXmageTop",                      { oldExpectValue: "231",                      newExpectValue: 231                      }],
  ["HwMnoteXmageRight",                    { oldExpectValue: "156",                      newExpectValue: 156                      }],
  ["HwMnoteXmageBottom",                   { oldExpectValue: "423",                      newExpectValue: 423                      }],
  ["HwMnoteCloudEnhancementMode",          { oldExpectValue: "3",                        newExpectValue: true                     }],
  ["HwMnoteCaptureMode",                   { oldExpectValue: "456321789",                newExpectValue: 456321789                }],
]);

export { 
  imageExifMetadatakey, 
  readAndWriteExifMetadata, 
  imageMakerNoteHwMetadatakey, 
  readAndWriteMakerNoteHwMetadata, 
  exifReadWriteValidationRules, 
  DNGExifReadWriteValidationRules,
  imageOnlyMakerNoteHwMetadata,
  readOnlyMakerNoteHwMetadata, 
  exifReadOnlyValidationRules, 
  testExifMetadata, 
  testHuaweiMakerNoteMetadata, 
  exifWriteExpectedValueRules,
};