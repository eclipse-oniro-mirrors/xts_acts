import image from "@ohos.multimedia.image";

interface ModifyRule {
  key: string;
  modifyValue: string;
  oldExpectValue: string;
  newExpectValue: string | number | Array<number> | boolean;
}

interface ModifyRuleDNG {
  key: string;
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
  ["NewSubfileType",                      { key: "newSubfileType",                      modifyValue: '5',                    oldExpectValue: "5",                     newExpectValue: 5                         }],
  ["SubfileType",                         { key: "subfileType",                         modifyValue: '3',                    oldExpectValue: '3',                     newExpectValue: 3                         }],
  ["ImageWidth",                          { key: "imageWidth",                          modifyValue: '2000',                 oldExpectValue: "2000",                  newExpectValue: 2000                      }],
  ["ImageLength",                         { key: "imageLength",                         modifyValue: '1000',                 oldExpectValue: "1000",                  newExpectValue: 1000                      }],
  ["BitsPerSample",                       { key: "bitsPerSample",                       modifyValue: '3000, 4000, 5000',     oldExpectValue: '3000, 4000, 5000',      newExpectValue: [3000,4000,5000]          }],
  ["Compression",                         { key: "compression",                         modifyValue: '32773',                oldExpectValue: 'PackBits compression',  newExpectValue: 32773                     }],
  ["PhotometricInterpretation",           { key: "photometricInterpretation",           modifyValue: '1',                    oldExpectValue: 'Normal mono',           newExpectValue: 1                         }],
  ["ImageDescription",                    { key: "imageDescription",                    modifyValue: '@  @',                 oldExpectValue: '@  @',                  newExpectValue: '@  @'                    }],
  ["Make",                                { key: "make",                                modifyValue: 'APPLE',                oldExpectValue: 'APPLE',                 newExpectValue: 'APPLE'                   }],
  ["Model",                               { key: "model",                               modifyValue: '%s \\0',               oldExpectValue: '%s \\0',                newExpectValue: '%s \\0'                  }],
  ["StripOffsets",                        { key: "stripOffsets",                        modifyValue: '456',                  oldExpectValue: '456',                   newExpectValue: [456]                     }],
  ["Orientation",                         { key: "orientation",                         modifyValue: 'Left-bottom',          oldExpectValue: 'Left-bottom',           newExpectValue: 8                         }],
  ["SamplesPerPixel",                     { key: "samplesPerPixel",                     modifyValue: '3000',                 oldExpectValue: '3000',                  newExpectValue: 3000                      }],
  ["RowsPerStrip",                        { key: "rowsPerStrip",                        modifyValue: '345',                  oldExpectValue: '345',                   newExpectValue: 345                       }],
  ["StripByteCounts",                     { key: "stripByteCounts",                     modifyValue: '345',                  oldExpectValue: '345',                   newExpectValue: [345]                     }],
  ["XResolution",                         { key: "xResolution",                         modifyValue: '31/1',                 oldExpectValue: '31',                    newExpectValue: 31                        }],
  ["YResolution",                         { key: "yResolution",                         modifyValue: '31/1',                 oldExpectValue: '31',                    newExpectValue: 31                        }],
  ["PlanarConfiguration",                 { key: "planarConfiguration",                 modifyValue: '2',                    oldExpectValue: 'Planar format',         newExpectValue: 2                         }],
  ["ResolutionUnit",                      { key: "resolutionUnit",                      modifyValue: '3',                    oldExpectValue: 'Centimeter',            newExpectValue: 3                         }],
  ["TransferFunction",                    { key: "transferFunction",                    modifyValue: 'abc',                  oldExpectValue: '3 bytes undefined data',newExpectValue: '3 bytes undefined data'  }],
  ["Software",                            { key: "software",                            modifyValue: '%s \\0',               oldExpectValue: '%s \\0',                newExpectValue: '%s \\0'                  }],
  ["DateTime",                            { key: "dateTime",                            modifyValue: '1900:01:01',           oldExpectValue: '1900:01:01',            newExpectValue: '1900:01:01'              }],
  ["Artist",                              { key: "artist",                              modifyValue: '%s \\0',               oldExpectValue: '%s \\0',                newExpectValue: '%s \\0'                  }],
  ["WhitePoint",                          { key: "whitePoint",                          modifyValue: '252,1',                oldExpectValue: '252,  1',               newExpectValue: [252, 1]                  }],
  ["PrimaryChromaticities",               { key: "primaryChromaticities",               modifyValue: '31/1',                 oldExpectValue: '31',                    newExpectValue: [31]                      }],
  ["PhotoMode",                           { key: "photoMode",                           modifyValue: '13',                   oldExpectValue: '13',                    newExpectValue: 13                        }],
  ["YCbCrCoefficients",                   { key: "yCbCrCoefficients",                   modifyValue: '3/2 4/2 9/3',          oldExpectValue: '1.5, 2.0, 3.0',         newExpectValue: [1.5,2.0,3.0]             }],
  ["YCbCrSubSampling",                    { key: "yCbCrSubSampling",                    modifyValue: '4 5',                  oldExpectValue: '4, 5',                  newExpectValue: [4,5]                     }],
  ["YCbCrPositioning",                    { key: "yCbCrPositioning",                    modifyValue: '2',                    oldExpectValue: 'Co-sited',              newExpectValue: 2                         }],
  ["ReferenceBlackWhite",                 { key: "referenceBlackWhite",                 modifyValue: '3 255 0 255 0 255',    oldExpectValue: ' 3, 255,  0, 255,  0, 255',newExpectValue: [3,255,0,255,0,255]    }],
  ["Copyright",                           { key: "copyright",                           modifyValue: 'joseph',               oldExpectValue: 'joseph (Photographer) - [None] (Editor)', newExpectValue: 'joseph (Photographer) - [None] (Editor)' }],
  ["ExposureTime",                        { key: "exposureTime",                        modifyValue: '1/60',                 oldExpectValue: '1/60 sec.',             newExpectValue: 1/60                      }],
  ["FNumber",                             { key: "fNumber",                             modifyValue: '1/30',                 oldExpectValue: 'f/0.03',                newExpectValue: 0.03333333333333333       }],
  ["ExposureProgram",                     { key: "exposureProgram",                     modifyValue: '8',                    oldExpectValue: 'Landscape mode (for landscape photos with the background in focus)', newExpectValue: 8 }],
  ["SpectralSensitivity",                 { key: "spectralSensitivity",                 modifyValue: '1234',                 oldExpectValue: '1234',                  newExpectValue: '1234'                    }],
  ["ISOSpeedRatings",                     { key: "isoSpeedRatings",                     modifyValue: '1234',                 oldExpectValue: '1234',                  newExpectValue: 1234                      }],
  ["GPSVersionID",                        { key: "gpsVersionID",                        modifyValue: '2.2.0.1',              oldExpectValue: '2.2.0.1',               newExpectValue: [2,2, 0, 1]               }],
  ["GPSLatitudeRef",                      { key: "gpsLatitudeRef",                      modifyValue: 'S',                    oldExpectValue: 'S',                     newExpectValue: 'S'                       }],
  ["GPSLatitude",                         { key: "gpsLatitude",                         modifyValue: '114,3',                oldExpectValue: '38.0,  0,  0',          newExpectValue: [38.0, 0, 0]              }],
  ["GPSLongitudeRef",                     { key: "gpsLongitudeRef",                     modifyValue: 'W',                    oldExpectValue: 'W',                     newExpectValue: 'W'                       }],
  ["GPSLongitude",                        { key: "gpsLongitude",                        modifyValue: '114,3',                oldExpectValue: '38.0,  0,  0',          newExpectValue: [38, 0, 0]                }],
  ["GPSAltitudeRef",                      { key: "gpsAltitudeRef",                      modifyValue: '1',                    oldExpectValue: 'Sea level reference',   newExpectValue: 1                         }],
  ["GPSAltitude",                         { key: "gpsAltitude",                         modifyValue: '100/100',              oldExpectValue: '1.00',                  newExpectValue: 1.00                      }],
  ["GPSTimeStamp",                        { key: "gpsTimestamp",                        modifyValue: '12 54 20',             oldExpectValue: '12:54:20.00',           newExpectValue: [12, 54, 20]              }],
  ["GPSSatellites",                       { key: "gpsSatellites",                       modifyValue: 'a b c',                oldExpectValue: 'a b c',                 newExpectValue: 'a b c'                   }],
  ["GPSStatus",                           { key: "gpsStatus",                           modifyValue: 'V',                    oldExpectValue: 'V',                     newExpectValue: 'V'                       }],
  ["GPSMeasureMode",                      { key: "gpsMeasureMode",                      modifyValue: '3',                    oldExpectValue: '3',                     newExpectValue: '3'                       }],
  ["GPSDOP",                              { key: "gpsDop",                              modifyValue: '100/100',              oldExpectValue: '1.00',                  newExpectValue: 1.00                      }],
  ["GPSSpeedRef",                         { key: "gpsSpeedRef",                         modifyValue: 'K',                    oldExpectValue: 'K',                     newExpectValue: 'K'                       }],
  ["GPSSpeed",                            { key: "gpsSpeed",                            modifyValue: '0/1',                  oldExpectValue: ' 0',                    newExpectValue: 0                         }],
  ["GPSTrackRef",                         { key: "gpsTrackRef",                         modifyValue: 'M',                    oldExpectValue: 'M',                     newExpectValue: 'M'                       }],
  ["GPSTrack",                            { key: "gpsTrack",                            modifyValue: '3.5',                  oldExpectValue: '3.5',                   newExpectValue: 3.5                       }],
  ["GPSImgDirectionRef",                  { key: "gpsImgDirectionRef",                  modifyValue: 'T',                    oldExpectValue: 'T',                     newExpectValue: 'T'                       }],
  ["GPSImgDirection",                     { key: "gpsImgDirection",                     modifyValue: '2.5',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["GPSMapDatum",                         { key: "gpsMapDatum",                         modifyValue: '%s\\0',                oldExpectValue: '%s\\0',                 newExpectValue: '%s\\0'                   }],
  ["GPSDestLatitudeRef",                  { key: "gpsDestLatitudeRef",                  modifyValue: 'S',                    oldExpectValue: 'S',                     newExpectValue: 'S'                       }],
  ["GPSDestLatitude",                     { key: "gpsDestLatitude",                     modifyValue: '0/1 0/1 0/1',          oldExpectValue: ' 0,  0,  0',            newExpectValue: [0, 0, 0]                 }],
  ["GPSDestLongitudeRef",                 { key: "gpsDestLongitudeRef",                 modifyValue: 'W',                    oldExpectValue: 'W',                     newExpectValue: 'W'                       }],
  ["GPSDestLongitude",                    { key: "gpsDestLongitude",                    modifyValue: '0/1 0/1 0/1',          oldExpectValue: ' 0,  0,  0',            newExpectValue: [0, 0, 0]                 }],
  ["GPSDestBearingRef",                   { key: "gpsDestBearingRef",                   modifyValue: 'M',                    oldExpectValue: 'M',                     newExpectValue: 'M'                       }],
  ["GPSDestBearing",                      { key: "gpsDestBearing",                      modifyValue: '2.5',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["GPSDestDistanceRef",                  { key: "gpsDestDistanceRef",                  modifyValue: 'K',                    oldExpectValue: 'K',                     newExpectValue: 'K'                       }],
  ["GPSDestDistance",                     { key: "gpsDestDistance",                     modifyValue: '2.5',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["GPSProcessingMethod",                 { key: "gpsProcessingMethod",                 modifyValue: 'XXX',                  oldExpectValue: 'XXX',                   newExpectValue: 'XXX'                     }],
  ["GPSAreaInformation",                  { key: "gpsAreaInformation",                  modifyValue: 'client',               oldExpectValue: 'client',                newExpectValue: 'client'                  }],
  ["GPSDateStamp",                        { key: "gpsDateStamp",                        modifyValue: '1900:01:01',           oldExpectValue: '1900:01:01',            newExpectValue: '1900:01:01'              }],
  ["GPSDifferential",                     { key: "gpsDifferential",                     modifyValue: '1',                    oldExpectValue: '1',                     newExpectValue: 1                         }],
  ["GPSHPositioningError",                { key: "gpsHPositioningError",                modifyValue: '1/2',                  oldExpectValue: '0.5',                   newExpectValue: 0.5                       }],
  ["PhotographicSensitivity",             { key: "photographicSensitivity",             modifyValue: '1234',                 oldExpectValue: '1234',                  newExpectValue: [1234]                    }],
  ["OECF",                                { key: "oecf",                                modifyValue: 'ab',                   oldExpectValue: '2 bytes undefined data',newExpectValue: [97, 98]                  }],
  ["SensitivityType",                     { key: "sensitivityType",                     modifyValue: '0',                    oldExpectValue: 'Unknown',               newExpectValue: 0                         }],
  ["StandardOutputSensitivity",           { key: "standardOutputSensitivity",           modifyValue: '1000',                 oldExpectValue: '1000',                  newExpectValue: 1000                      }],
  ["RecommendedExposureIndex",            { key: "recommendedExposureIndex",            modifyValue: '2147483647',           oldExpectValue: '2147483647',            newExpectValue: 2147483647                }],
  ["ISOSpeedLatitudeyyy",                 { key: "isoSpeedLatitudeyyy",                 modifyValue: '123',                  oldExpectValue: '123',                   newExpectValue: 123                       }],
  ["ISOSpeedLatitudezzz",                 { key: "isoSpeedLatitudezzz",                 modifyValue: '123',                  oldExpectValue: '123',                   newExpectValue: 123                       }],
  ["ExifVersion",                         { key: "exifVersion",                         modifyValue: '0120',                 oldExpectValue: 'Exif Version 1.2',      newExpectValue: "Exif Version 1.2"        }],
  ["DateTimeOriginal",                    { key: "dateTimeOriginal",                    modifyValue: '1900:01:01 00:00:00',  oldExpectValue: '1900:01:01 00:00:00',   newExpectValue: '1900:01:01 00:00:00'     }],
  ["DateTimeDigitized",                   { key: "dateTimeDigitized",                   modifyValue: '1900:01:01 00:00:00',  oldExpectValue: '1900:01:01 00:00:00',   newExpectValue: '1900:01:01 00:00:00'     }],
  ["OffsetTime",                          { key: "offsetTime",                          modifyValue: '2023:01:25',           oldExpectValue: '2023:01:25',            newExpectValue: '2023:01:25'              }],
  ["OffsetTimeOriginal",                  { key: "offsetTimeOriginal",                  modifyValue: 'ject',                 oldExpectValue: 'ject',                  newExpectValue: 'ject'                    }],
  ["OffsetTimeDigitized",                 { key: "offsetTimeDigitized",                 modifyValue: 'cirtize',              oldExpectValue: 'cirtize',               newExpectValue: 'cirtize'                 }],
  ["ComponentsConfiguration",             { key: "componentsConfiguration",             modifyValue: '1256',                 oldExpectValue: 'Y Cb G B',              newExpectValue: "Y Cb G B"                }],
  ["CompressedBitsPerPixel",              { key: "compressedBitsPerPixel",              modifyValue: '25',                   oldExpectValue: '25',                    newExpectValue: 25                        }],
  ["ShutterSpeedValue",                   { key: "shutterSpeedValue",                   modifyValue: '3/2',                  oldExpectValue: '1.50 EV (1/3 sec.)',    newExpectValue: 1.50                      }],
  ["ApertureValue",                       { key: "apertureValue",                       modifyValue: '16',                   oldExpectValue: '16.00 EV (f/256.0)',    newExpectValue: 16.00                     }],
  ["BrightnessValue",                     { key: "brightnessValue",                     modifyValue: '6/5',                  oldExpectValue: '1.20 EV (7.87 cd/m^2)', newExpectValue: 1.20                      }],
  ["ExposureBiasValue",                   { key: "exposureBiasValue",                   modifyValue: '4',                    oldExpectValue: '4.00 EV',               newExpectValue: 4.00                      }],
  ["MaxApertureValue",                    { key: "maxApertureValue",                    modifyValue: '8/5',                  oldExpectValue: '1.60 EV (f/1.7)',       newExpectValue: 1.60                      }],
  ["SubjectDistance",                     { key: "subjectDistance",                     modifyValue: '1/2',                  oldExpectValue: '0.5 m',                 newExpectValue: 0.5                       }],
  ["MeteringMode",                        { key: "meteringMode",                        modifyValue: '0',                    oldExpectValue: 'Unknown',               newExpectValue: 0                         }],
  ["LightSource",                         { key: "lightSource",                         modifyValue: 'Daylight',             oldExpectValue: 'Daylight',              newExpectValue: 1                         }],
  ["Flash",                               { key: "flash",                               modifyValue: '95',                   oldExpectValue: 'Flash fired, auto mode, return light detected, red-eye reduction mode', newExpectValue: 95 }],
  ["FocalLength",                         { key: "focalLength",                         modifyValue: '31/1',                 oldExpectValue: '31.0 mm',               newExpectValue: 31.0                      }],
  ["SubjectArea",                         { key: "subjectArea",                         modifyValue: '45 23',                oldExpectValue: '(x,y) = (45,23)',       newExpectValue: [45, 23]                  }],
  ["MakerNote",                           { key: "makerNote",                           modifyValue: '123',                  oldExpectValue: '123',                   newExpectValue: [49, 50, 51]              }],
  ["UserComment",                         { key: "userComment",                         modifyValue: '456',                  oldExpectValue: '456',                   newExpectValue: "456"                     }],
  ["SubsecTime",                          { key: "subsecTime",                          modifyValue: '427000',               oldExpectValue: '427000',                newExpectValue: '427000'                  }],
  ["SubsecTimeOriginal",                  { key: "subsecTimeOriginal",                  modifyValue: '123456',               oldExpectValue: '123456',                newExpectValue: '123456'                  }],
  ["SubsecTimeDigitized",                 { key: "subsecTimeDigitized",                 modifyValue: '999999',               oldExpectValue: '999999',                newExpectValue: '999999'                  }],
  ["FlashpixVersion",                     { key: "flashpixVersion",                     modifyValue: '0101',                 oldExpectValue: 'FlashPix Version 1.01', newExpectValue: "FlashPix Version 1.01"   }],
  ["ColorSpace",                          { key: "colorSpace",                          modifyValue: '2',                    oldExpectValue: 'Adobe RGB',             newExpectValue: 2                         }],
  ["PixelXDimension",                     { key: "pixelXDimension",                     modifyValue: '0',                    oldExpectValue: '0',                     newExpectValue: 0                         }],
  ["PixelYDimension",                     { key: "pixelYDimension",                     modifyValue: '0',                    oldExpectValue: '0',                     newExpectValue: 0                         }],
  ["RelatedSoundFile",                    { key: "relatedSoundFile",                    modifyValue: 'abc',                  oldExpectValue: 'abc',                   newExpectValue: 'abc'                     }],
  ["FlashEnergy",                         { key: "flashEnergy",                         modifyValue: '5/2',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["SpatialFrequencyResponse",            { key: "spatialFrequencyResponse",            modifyValue: 'corn',                 oldExpectValue: 'corn',                  newExpectValue: [99, 111, 114 , 110]      }],
  ["FocalPlaneXResolution",               { key: "focalPlaneXResolution",               modifyValue: '102/1',                oldExpectValue: '102',                   newExpectValue: 102                       }],
  ["FocalPlaneYResolution",               { key: "focalPlaneYResolution",               modifyValue: '81/1',                 oldExpectValue: '81',                    newExpectValue: 81                        }],
  ["FocalPlaneResolutionUnit",            { key: "focalPlaneResolutionUnit",            modifyValue: '3',                    oldExpectValue: 'Centimeter',            newExpectValue: 3                         }],
  ["SubjectLocation",                     { key: "subjectLocation",                     modifyValue: '23 112',               oldExpectValue: '23, 112',               newExpectValue: [23, 112]                 }],
  ["ExposureIndex",                       { key: "exposureIndex",                       modifyValue: '5/2',                  oldExpectValue: '2.5',                   newExpectValue: 2.5                       }],
  ["SensingMethod",                       { key: "sensingMethod",                       modifyValue: '8',                    oldExpectValue: 'Color sequential linear sensor', newExpectValue: 8                }],
  ["FileSource",                          { key: "fileSource",                          modifyValue: '4',                    oldExpectValue: 'Internal error (unknown value 4)', newExpectValue: [4]            }],
  ["SceneType",                           { key: "sceneType",                           modifyValue: 'Directly photographed',oldExpectValue: 'Directly photographed', newExpectValue: [1]                       }],
  ["CFAPattern",                          { key: "cfaPattern",                          modifyValue: 'ab',                   oldExpectValue: '2 bytes undefined data',newExpectValue: [97, 98]                  }],
  ["CustomRendered",                      { key: "customRendered",                      modifyValue: '1',                    oldExpectValue: 'Custom process',        newExpectValue: 1                         }],
  ["ExposureMode",                        { key: "exposureMode",                        modifyValue: '2',                    oldExpectValue: 'Auto bracket',          newExpectValue: 2                         }],
  ["WhiteBalance",                        { key: "whiteBalance",                        modifyValue: '0',                    oldExpectValue: 'Auto white balance',    newExpectValue: 0                         }],
  ["DigitalZoomRatio",                    { key: "digitalZoomRatio",                    modifyValue: '23/1',                 oldExpectValue: '23',                    newExpectValue: 23                        }],
  ["FocalLengthIn35mmFilm",               { key: "focalLengthIn35mmFilm",               modifyValue: '12',                   oldExpectValue: '12',                    newExpectValue: 12                        }],
  ["SceneCaptureType",                    { key: "sceneCaptureType",                    modifyValue: '3',                    oldExpectValue: 'Night scene',           newExpectValue: 3                         }],
  ["GainControl",                         { key: "gainControl",                         modifyValue: '4',                    oldExpectValue: 'High gain down',        newExpectValue: 4                         }],
  ["Contrast",                            { key: "contrast",                            modifyValue: '2',                    oldExpectValue: 'Hard',                  newExpectValue: 2                         }],
  ["Saturation",                          { key: "saturation",                          modifyValue: '2',                    oldExpectValue: 'High saturation',       newExpectValue: 2                         }],
  ["Sharpness",                           { key: "sharpness",                           modifyValue: '2',                    oldExpectValue: 'Hard',                  newExpectValue: 2                         }],
  ["DeviceSettingDescription",            { key: "deviceSettingDescription",            modifyValue: 'coxex',                oldExpectValue: 'coxex',                 newExpectValue: [99, 111, 120, 101, 120]  }],
  ["SubjectDistanceRange",                { key: "subjectDistanceRange",                modifyValue: '3',                    oldExpectValue: 'Distant view',          newExpectValue: 3                         }],
  ["ImageUniqueID",                       { key: "imageUniqueId",                       modifyValue: 'xxx',                  oldExpectValue: 'xxx',                   newExpectValue: 'xxx'                     }],
  ["CameraOwnerName",                     { key: "cameraOwnerName",                     modifyValue: 'joseph',               oldExpectValue: 'joseph',                newExpectValue: 'joseph'                  }],
  ["BodySerialNumber",                    { key: "bodySerialNumber",                    modifyValue: 'xoinc',                oldExpectValue: 'xoinc',                 newExpectValue: 'xoinc'                   }],
  ["LensSpecification",                   { key: "lensSpecification",                   modifyValue: '3/4 5/2 3/2 5/2',      oldExpectValue: '0.8, 2.5, 1.5, 2.5',    newExpectValue: [0.75,2.5,1.5,2.5]        }],
  ["LensMake",                            { key: "lensMake",                            modifyValue: 'plex',                 oldExpectValue: 'plex',                  newExpectValue: 'plex'                    }],
  ["LensModel",                           { key: "lensModel",                           modifyValue: 'world',                oldExpectValue: 'world',                 newExpectValue: 'world'                   }],
  ["LensSerialNumber",                    { key: "lensSerialNumber",                    modifyValue: 'root',                 oldExpectValue: 'root',                  newExpectValue: 'root'                    }],
  ["CompositeImage",                      { key: "compositeImage",                      modifyValue: '3',                    oldExpectValue: '3',                     newExpectValue: 3                         }],
  ["SourceImageNumberOfCompositeImage",   { key: "sourceImageNumberOfCompositeImage",   modifyValue: '11 23',                oldExpectValue: '11, 23',                newExpectValue: [11, 23]                  }],
  ["SourceExposureTimesOfCompositeImage", { key: "sourceExposureTimesOfCompositeImage", modifyValue: 'xixe',                 oldExpectValue: 'xixe',                  newExpectValue: [120, 105, 120, 101]      }],
  ["Gamma",                               { key: "gamma",                               modifyValue: '3/2',                  oldExpectValue: '1.5',                   newExpectValue: 1.5                       }],
  ["HwMnoteIsXmageSupported",             { key: "isXmageSupported",                    modifyValue: '100',                  oldExpectValue: '100',                   newExpectValue: true                      }],
  ["HwMnoteXmageMode",                    { key: "xmageWatermarkMode",                  modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageLeft",                    { key: "xmageLeft",                           modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageTop",                     { key: "xmageTop",                            modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageRight",                   { key: "xmageRight",                          modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteXmageBottom",                  { key: "xmageBottom",                         modifyValue: '2',                    oldExpectValue: '2',                     newExpectValue: 2                         }],
  ["HwMnoteCloudEnhancementMode",         { key: "isCloudEnhanced",                     modifyValue: '1',                    oldExpectValue: '1',                     newExpectValue: true                      }],
  ["HwMnoteCaptureMode",                  { key: "captureMode",                         modifyValue: '123456',               oldExpectValue: '123456',                newExpectValue: 123456                    }],
]);

// 可读写DNG EXIF属性的验证规则映射表
const DNGExifReadWriteValidationRules = new Map<string, ModifyRuleDNG>([
  ["NewSubfileType",                      { key: "newSubfileType", oldExpectValue: "1",                           newExpectValue: 0                           }],
  ["SubfileType",                         { key: "subfileType", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ImageWidth",                          { key: "imageWidth", oldExpectValue: "160",                         newExpectValue: 5984                        }],
  ["ImageLength",                         { key: "imageLength", oldExpectValue: "120",                         newExpectValue: 4000                        }],
  ["BitsPerSample",                       { key: "bitsPerSample", oldExpectValue: '8, 8, 8',                     newExpectValue: [16]                        }],
  ["Compression",                         { key: "compression", oldExpectValue: 'JPEG compression',            newExpectValue: 7                           }],
  ["PhotometricInterpretation",           { key: "photometricInterpretation", oldExpectValue: 'YCbCr',                       newExpectValue: 32803                       }],
  ["ImageDescription",                    { key: "imageDescription", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Make",                                { key: "make", oldExpectValue: 'Leica Camera AG',             newExpectValue: 'Leica Camera AG'           }],
  ["Model",                               { key: "model", oldExpectValue: 'LEICA M (Typ 240)',           newExpectValue: 'LEICA M (Typ 240)'         }],
  ["StripOffsets",                        { key: "stripOffsets", oldExpectValue: '4096',                        newExpectValue: [17854]                     }],
  ["Orientation",                         { key: "orientation", oldExpectValue: 'Top-left',                    newExpectValue: 1                           }],
  ["SamplesPerPixel",                     { key: "samplesPerPixel", oldExpectValue: '3',                           newExpectValue: 1                           }],
  ["RowsPerStrip",                        { key: "rowsPerStrip", oldExpectValue: '120',                         newExpectValue: 4000                        }],
  ["StripByteCounts",                     { key: "stripByteCounts", oldExpectValue: '12919',                       newExpectValue: [24739144]                  }],
  ["XResolution",                         { key: "xResolution", oldExpectValue: '72',                          newExpectValue: 300                         }],
  ["YResolution",                         { key: "yResolution", oldExpectValue: '72',                          newExpectValue: 300                         }],
  ["PlanarConfiguration",                 { key: "planarConfiguration", oldExpectValue: 'Chunky format',               newExpectValue: 1                           }],
  ["ResolutionUnit",                      { key: "resolutionUnit", oldExpectValue: 'Inch',                        newExpectValue: 2                           }],
  ["TransferFunction",                    { key: "transferFunction", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Software",                            { key: "software", oldExpectValue: '        2.0.2.5',             newExpectValue: '        2.0.2.5'           }],
  ["DateTime",                            { key: "dateTime", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Artist",                              { key: "artist", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["WhitePoint",                          { key: "whitePoint", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["PrimaryChromaticities",               { key: "primaryChromaticities", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["PhotoMode",                           { key: "photoMode", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["YCbCrCoefficients",                   { key: "yCbCrCoefficients", oldExpectValue: '0.299, 0.587, 0.114',         newExpectValue: [0.299,0.587,0.114]         }],
  ["YCbCrSubSampling",                    { key: "yCbCrSubSampling", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["YCbCrPositioning",                    { key: "yCbCrPositioning", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ReferenceBlackWhite",                 { key: "referenceBlackWhite", oldExpectValue: ' 0, 255, 128, 255, 128, 255', newExpectValue: [0,255,128,255,128,255]     }],
  ["Copyright",                           { key: "copyright", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureTime",                        { key: "exposureTime", oldExpectValue: '1/4000 sec.',                 newExpectValue: 0.00025                     }],
  ["FNumber",                             { key: "fNumber", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureProgram",                     { key: "exposureProgram", oldExpectValue: 'Aperture priority',           newExpectValue: 3                           }],
  ["SpectralSensitivity",                 { key: "spectralSensitivity", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ISOSpeedRatings",                     { key: "isoSpeedRatings", oldExpectValue: '200',                         newExpectValue: 200                         }],
  ["GPSVersionID",                        { key: "gpsVersionID", oldExpectValue: '2.2.0.0',                     newExpectValue: [2,2,0,0]                   }],
  ["GPSLatitudeRef",                      { key: "gpsLatitudeRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSLatitude",                         { key: "gpsLatitude", oldExpectValue: ' 0,  0, 0.000',               newExpectValue: [0,0,0]                     }],
  ["GPSLongitudeRef",                     { key: "gpsLongitudeRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSLongitude",                        { key: "gpsLongitude", oldExpectValue: ' 0,  0, 0.000',               newExpectValue: [0,0,0]                     }],
  ["GPSAltitudeRef",                      { key: "gpsAltitudeRef", oldExpectValue: 'Sea level',                   newExpectValue: 0                           }],
  ["GPSAltitude",                         { key: "gpsAltitude", oldExpectValue: '0.00',                        newExpectValue: 0                           }],
  ["GPSTimeStamp",                        { key: "gpsTimestamp", oldExpectValue: '00:00:00.00',                 newExpectValue: [0,0,0]                     }],
  ["GPSSatellites",                       { key: "gpsSatellites", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSStatus",                           { key: "gpsStatus", oldExpectValue: 'V',                           newExpectValue: "V"                         }],
  ["GPSMeasureMode",                      { key: "gpsMeasureMode", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDOP",                              { key: "gpsDop", oldExpectValue: '0.00',                        newExpectValue: 0                           }],
  ["GPSSpeedRef",                         { key: "gpsSpeedRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSSpeed",                            { key: "gpsSpeed", oldExpectValue: '0.00',                        newExpectValue: 0                           }],
  ["GPSTrackRef",                         { key: "gpsTrackRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSTrack",                            { key: "gpsTrack", oldExpectValue: ' 0',                          newExpectValue: 0                           }],
  ["GPSImgDirectionRef",                  { key: "gpsImgDirectionRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSImgDirection",                     { key: "gpsImgDirection", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSMapDatum",                         { key: "gpsMapDatum", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLatitudeRef",                  { key: "gpsDestLatitudeRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLatitude",                     { key: "gpsDestLatitude", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLongitudeRef",                 { key: "gpsDestLongitudeRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestLongitude",                    { key: "gpsDestLongitude", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestBearingRef",                   { key: "gpsDestBearingRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestBearing",                      { key: "gpsDestBearing", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestDistanceRef",                  { key: "gpsDestDistanceRef", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDestDistance",                     { key: "gpsDestDistance", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSProcessingMethod",                 { key: "gpsProcessingMethod", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSAreaInformation",                  { key: "gpsAreaInformation", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSDateStamp",                        { key: "gpsDateStamp", oldExpectValue: '2000:00:00',                  newExpectValue: '2000:00:00'                }],
  ["GPSDifferential",                     { key: "gpsDifferential", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["GPSHPositioningError",                { key: "gpsHPositioningError", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["PhotographicSensitivity",             { key: "photographicSensitivity", oldExpectValue: '200',                         newExpectValue: [200]                       }],
  ["OECF",                                { key: "oecf", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SensitivityType",                     { key: "sensitivityType", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["StandardOutputSensitivity",           { key: "standardOutputSensitivity", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["RecommendedExposureIndex",            { key: "recommendedExposureIndex", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ISOSpeedLatitudeyyy",                 { key: "isoSpeedLatitudeyyy", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ISOSpeedLatitudezzz",                 { key: "isoSpeedLatitudezzz", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExifVersion",                         { key: "exifVersion", oldExpectValue: 'Exif Version 2.3',            newExpectValue: "Exif Version 2.3"          }],
  ["DateTimeOriginal",                    { key: "dateTimeOriginal", oldExpectValue: '2015:09:18 07:58:04',         newExpectValue: '2015:09:18 07:58:04'       }],
  ["DateTimeDigitized",                   { key: "dateTimeDigitized", oldExpectValue: '2015:09:18 07:58:04',         newExpectValue: '2015:09:18 07:58:04'       }],
  ["OffsetTime",                          { key: "offsetTime", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["OffsetTimeOriginal",                  { key: "offsetTimeOriginal", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["OffsetTimeDigitized",                 { key: "offsetTimeDigitized", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ComponentsConfiguration",             { key: "componentsConfiguration", oldExpectValue: 'Y Cb Cr -',                   newExpectValue: " Y Cb Cr-"                 }],
  ["CompressedBitsPerPixel",              { key: "compressedBitsPerPixel", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ShutterSpeedValue",                   { key: "shutterSpeedValue", oldExpectValue: '12.00 EV (1/4096 sec.)',      newExpectValue: 12                          }],
  ["ApertureValue",                       { key: "apertureValue", oldExpectValue: '2.50 EV (f/2.4)',             newExpectValue: 2.5                         }],
  ["BrightnessValue",                     { key: "brightnessValue", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureBiasValue",                   { key: "exposureBiasValue", oldExpectValue: '0.33 EV',                     newExpectValue: 0.33203125                  }],
  ["MaxApertureValue",                    { key: "maxApertureValue", oldExpectValue: '0.97 EV (f/1.4)',             newExpectValue: 0.96875                     }],
  ["SubjectDistance",                     { key: "subjectDistance", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["MeteringMode",                        { key: "meteringMode", oldExpectValue: 'Center-weighted average',     newExpectValue: 2                           }],
  ["LightSource",                         { key: "lightSource", oldExpectValue: 'Unknown',                     newExpectValue: 0                           }],
  ["Flash",                               { key: "flash", oldExpectValue: 'Flash did not fire',          newExpectValue: 0                           }],
  ["FocalLength",                         { key: "focalLength", oldExpectValue: '35.0 mm',                     newExpectValue: 35                          }],
  ["SubjectArea",                         { key: "subjectArea", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["MakerNote",                           { key: "makerNote", oldExpectValue: null,                          newExpectValue: makernoteDNG                }],
  ["UserComment",                         { key: "userComment", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubsecTime",                          { key: "subsecTime", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubsecTimeOriginal",                  { key: "subsecTimeOriginal", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubsecTimeDigitized",                 { key: "subsecTimeDigitized", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FlashpixVersion",                     { key: "flashpixVersion", oldExpectValue: 'FlashPix Version 1.0',        newExpectValue: undefined                   }],
  ["ColorSpace",                          { key: "colorSpace", oldExpectValue: 'sRGB',                        newExpectValue: 1                           }],
  ["PixelXDimension",                     { key: "pixelXDimension", oldExpectValue: '5984',                        newExpectValue: 5984                        }],
  ["PixelYDimension",                     { key: "pixelYDimension", oldExpectValue: '4000',                        newExpectValue: 4000                        }],
  ["RelatedSoundFile",                    { key: "relatedSoundFile", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FlashEnergy",                         { key: "flashEnergy", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SpatialFrequencyResponse",            { key: "spatialFrequencyResponse", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FocalPlaneXResolution",               { key: "focalPlaneXResolution", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FocalPlaneYResolution",               { key: "focalPlaneYResolution", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FocalPlaneResolutionUnit",            { key: "focalPlaneResolutionUnit", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubjectLocation",                     { key: "subjectLocation", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["ExposureIndex",                       { key: "exposureIndex", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SensingMethod",                       { key: "sensingMethod", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["FileSource",                          { key: "fileSource", oldExpectValue: 'DSC',                         newExpectValue: [3]                         }],
  ["SceneType",                           { key: "sceneType", oldExpectValue: 'Directly photographed',       newExpectValue: [1]                         }],
  ["CFAPattern",                          { key: "cfaPattern", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["CustomRendered",                      { key: "customRendered", oldExpectValue: 'Normal process',              newExpectValue: 0                           }],
  ["ExposureMode",                        { key: "exposureMode", oldExpectValue: 'Auto exposure',               newExpectValue: 0                           }],
  ["WhiteBalance",                        { key: "whiteBalance", oldExpectValue: 'Auto white balance',          newExpectValue: 0                           }],
  ["DigitalZoomRatio",                    { key: "digitalZoomRatio", oldExpectValue: ' 0',                          newExpectValue: 0                           }],
  ["FocalLengthIn35mmFilm",               { key: "focalLengthIn35mmFilm", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SceneCaptureType",                    { key: "sceneCaptureType", oldExpectValue: 'Standard',                    newExpectValue: 0                           }],
  ["GainControl",                         { key: "gainControl", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Contrast",                            { key: "contrast", oldExpectValue: 'Normal',                      newExpectValue: 0                           }],
  ["Saturation",                          { key: "saturation", oldExpectValue: 'Normal',                      newExpectValue: 0                           }],
  ["Sharpness",                           { key: "sharpness", oldExpectValue: 'Normal',                      newExpectValue: 0                           }],
  ["DeviceSettingDescription",            { key: "deviceSettingDescription", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SubjectDistanceRange",                { key: "subjectDistanceRange", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["CameraOwnerName",                     { key: "cameraOwnerName", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["BodySerialNumber",                    { key: "bodySerialNumber", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["LensSpecification",                   { key: "lensSpecification", oldExpectValue: '35, 35, 1.4, 16.0',           newExpectValue: [35,35,1.4,16]              }],
  ["LensMake",                            { key: "lensMake", oldExpectValue: 'Leica Camera AG',             newExpectValue: 'Leica Camera AG'           }],
  ["LensModel",                           { key: "lensModel", oldExpectValue: 'Summilux-M 1:1.4/35 ASPH.',   newExpectValue: 'Summilux-M 1:1.4/35 ASPH.' }],
  ["LensSerialNumber",                    { key: "lensSerialNumber", oldExpectValue: '-------',                     newExpectValue: '-------'                   }],
  ["CompositeImage",                      { key: "compositeImage", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SourceImageNumberOfCompositeImage",   { key: "sourceImageNumberOfCompositeImage", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["SourceExposureTimesOfCompositeImage", { key: "sourceExposureTimesOfCompositeImage", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["Gamma",                               { key: "gamma", oldExpectValue: null,                          newExpectValue: undefined                   }],
  ["HwMnoteIsXmageSupported",             { key: "isXmageSupported", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageMode",                    { key: "xmageWatermarkMode", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageLeft",                    { key: "xmageLeft", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageTop",                     { key: "xmageTop", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageRight",                   { key: "xmageRight", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteXmageBottom",                  { key: "xmageBottom", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteCloudEnhancementMode",         { key: "isCloudEnhanced", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
  ["HwMnoteCaptureMode",                  { key: "captureMode", oldExpectValue: 'default_exif_value',          newExpectValue: undefined                   }],
]);

interface ReadOnlyMetaDataRule {
  key: string;
  newExpectValue: string | object | boolean | number | number[] | number[][] | undefined;
}

const linearizationTable: number[] = [];
for (let i: number = 0; i < 16384; i++) {
  linearizationTable.push(i);
}

const dngMetadataMap = new Map<image.DngPropertyKey, ReadOnlyMetaDataRule>([
  [image.DngPropertyKey.DNG_VERSION,                      { key: "dngVersion",                newExpectValue: [1, 4, 0, 0] }],
  [image.DngPropertyKey.DNG_BACKWARD_VERSION,             { key: "dngBackwardVersion",        newExpectValue: [1, 4, 0, 0] }],
  [image.DngPropertyKey.UNIQUE_CAMERA_MODEL,              { key: "uniqueCameraModel",         newExpectValue: "FakeCamera ModelX" }],
  [image.DngPropertyKey.LOCALIZED_CAMERA_MODEL,           { key: "localizedCameraModel",      newExpectValue: "VirtualCamera ModelX" }],
  [image.DngPropertyKey.CFA_PLANE_COLOR,                  { key: "cfaPlaneColor",             newExpectValue: [0, 1, 2] }],
  [image.DngPropertyKey.CFA_LAYOUT,                       { key: "cfaLayout",                 newExpectValue: 1 }],
  [image.DngPropertyKey.LINEARIZATION_TABLE,              { key: "linearizationTable",        newExpectValue: linearizationTable }],
  [image.DngPropertyKey.BLACK_LEVEL_REPEAT_DIM,           { key: "blackLevelRepeatDim",       newExpectValue: [2, 2] }],
  [image.DngPropertyKey.BLACK_LEVEL,                      { key: "blackLevel",                newExpectValue: [256, 256, 256, 256] }],
  [image.DngPropertyKey.BLACK_LEVEL_DELTA_H,              { key: "blackLevelDeltaH",          newExpectValue: new Array(32).fill(0) }],
  [image.DngPropertyKey.BLACK_LEVEL_DELTA_V,              { key: "blackLevelDeltaV",          newExpectValue: new Array(32).fill(0) }],
  [image.DngPropertyKey.WHITE_LEVEL,                      { key: "whiteLevel",                newExpectValue: [16383] }],
  [image.DngPropertyKey.DEFAULT_SCALE,                    { key: "defaultScale",              newExpectValue: [1, 1] }],
  [image.DngPropertyKey.DEFAULT_CROP_ORIGIN,              { key: "defaultCropOrigin",         newExpectValue: [0, 0] }],
  [image.DngPropertyKey.DEFAULT_CROP_SIZE,                { key: "defaultCropSize",           newExpectValue: [32, 32] }],
  [image.DngPropertyKey.COLOR_MATRIX1,                    { key: "colorMatrix1",              newExpectValue: [0.8920000195503235, -0.42800000309944153, -0.09200000017881393, -0.4449999928474426, 1.2339999675750732, 0.1860000044107437, -0.04800000041723251, 0.1940000057220459, 0.6039999723434448] }],
  [image.DngPropertyKey.COLOR_MATRIX2,                    { key: "colorMatrix2",              newExpectValue: [0.8920000195503235, -0.42800000309944153, -0.09200000017881393, -0.4449999928474426, 1.2339999675750732, 0.1860000044107437, -0.04800000041723251, 0.1940000057220459, 0.6039999723434448] }],
  [image.DngPropertyKey.CAMERA_CALIBRATION1,              { key: "cameraCalibration1",        newExpectValue: [1, 0, 0, 0, 1, 0, 0, 0, 1] }],
  [image.DngPropertyKey.CAMERA_CALIBRATION2,              { key: "cameraCalibration2",        newExpectValue: [1, 0, 0, 0, 1, 0, 0, 0, 1] }],
  [image.DngPropertyKey.REDUCTION_MATRIX1,                { key: "reductionMatrix1",          newExpectValue: [1, 0, 0, 0, 1, 0, 0, 0, 1] }],
  [image.DngPropertyKey.REDUCTION_MATRIX2,                { key: "reductionMatrix2",          newExpectValue: [1, 0, 0, 0, 1, 0, 0, 0, 1] }],
  [image.DngPropertyKey.ANALOG_BALANCE,                   { key: "analogBalance",             newExpectValue: [1, 1, 1] }],
  [image.DngPropertyKey.AS_SHOT_NEUTRAL,                  { key: "asShotNeutral",             newExpectValue: [0.5, 1, 0.6000000238418579] }],
  [image.DngPropertyKey.AS_SHOT_WHITEXY,                  { key: "asShotWhiteXY",             newExpectValue: [0.3127000033855438, 0.32899999618530273] }],
  [image.DngPropertyKey.BASELINE_EXPOSURE,                { key: "baselineExposure",          newExpectValue: 0 }],
  [image.DngPropertyKey.BASELINE_NOISE,                   { key: "baselineNoise",             newExpectValue: 1 }],
  [image.DngPropertyKey.BASELINE_SHARPNESS,               { key: "baselineSharpness",         newExpectValue: 1 }],
  [image.DngPropertyKey.BAYER_GREEN_SPLIT,                { key: "bayerGreenSplit",           newExpectValue: 0 }],
  [image.DngPropertyKey.LINEAR_RESPONSE_LIMIT,            { key: "linearResponseLimit",       newExpectValue: 1 }],
  [image.DngPropertyKey.CAMERA_SERIAL_NUMBER,             { key: "cameraSerialNumber",        newExpectValue: "SN_FAKE_2025" }],
  [image.DngPropertyKey.LENS_INFO,                        { key: "lensInfo",                  newExpectValue: [50, 1.7999999523162842, 50, 1.7999999523162842] }],
  [image.DngPropertyKey.CHROMA_BLUR_RADIUS,               { key: "chromaBlurRadius",          newExpectValue: 0 }],
  [image.DngPropertyKey.ANTI_ALIAS_STRENGTH,              { key: "antiAliasStrength",         newExpectValue: 1 }],
  [image.DngPropertyKey.SHADOW_SCALE,                     { key: "shadowScale",               newExpectValue: 1 }],
  [image.DngPropertyKey.DNG_PRIVATE_DATA,                 { key: "dngPrivateData",            newExpectValue: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] }],
  [image.DngPropertyKey.MAKER_NOTE_SAFETY,                { key: "makerNoteSafety",           newExpectValue: 1 }],
  [image.DngPropertyKey.CALIBRATION_ILLUMINANT1,          { key: "calibrationIlluminant1",    newExpectValue: 21 }],
  [image.DngPropertyKey.CALIBRATION_ILLUMINANT2,          { key: "calibrationIlluminant2",    newExpectValue: 23 }],
  [image.DngPropertyKey.BEST_QUALITY_SCALE,               { key: "bestQualityScale",          newExpectValue: 1 }],
  [image.DngPropertyKey.RAW_DATA_UNIQUE_ID,               { key: "rawDataUniqueID",           newExpectValue: "CE70B9D6BAA1207B3ABBA6C9FFF84924" }],
  [image.DngPropertyKey.ORIGINAL_RAW_FILE_NAME,           { key: "originalRawFileName",       newExpectValue: "FAKE_0001.NEF" }],
  [image.DngPropertyKey.ORIGINAL_RAW_FILE_DATA,           { key: "originalRawFileData",       newExpectValue: [70,65,75,69,95,82,65,87] }],
  [image.DngPropertyKey.ACTIVE_AREA,                      { key: "activeArea",                newExpectValue: [16, 16, 48, 48] }],
  [image.DngPropertyKey.MASKED_AREAS,                     { key: "maskedAreas",               newExpectValue: [0, 0, 16, 64, 48, 0, 64, 64] }],
  [image.DngPropertyKey.AS_SHOT_ICC_PROFILE,              { key: "asShotICCProfile",          newExpectValue: [0,0,0,128,0,0,0,0,0,0,0,0,109,110,116,114,82,71,66,32] }],
  [image.DngPropertyKey.AS_SHOT_PRE_PROFILE_MATRIX,       { key: "asShotPreProfileMatrix",    newExpectValue: [1, 0, 0, 0, 1, 0, 0, 0, 1] }],
  [image.DngPropertyKey.CURRENT_ICC_PROFILE,              { key: "currentICCProfile",         newExpectValue: [0,0,0,128,0,0,0,0,0,0,0,0,109,110,116,114,82,71,66,32] }],
  [image.DngPropertyKey.CURRENT_PRE_PROFILE_MATRIX,       { key: "currentPreProfileMatrix",   newExpectValue: [1, 0, 0, 0, 1, 0, 0, 0, 1] }],
  [image.DngPropertyKey.COLORIMETRIC_REFERENCE,           { key: "colorimetricReference",     newExpectValue: 1 }],
  [image.DngPropertyKey.CAMERA_CALIBRATION_SIGNATURE,     { key: "cameraCalibrationSignature",newExpectValue: "FakeCalibSig_v1" }],
  [image.DngPropertyKey.PROFILE_CALIBRATION_SIGNATURE,    { key: "profileCalibrationSignature", newExpectValue: "FakeProfileSig_v1" }],
  [image.DngPropertyKey.EXTRA_CAMERA_PROFILES,            { key: "extraCameraProfiles",       newExpectValue: [0] }],
  [image.DngPropertyKey.AS_SHOT_PROFILE_NAME,             { key: "asShotProfileName",         newExpectValue: "Adobe Standard" }],
  [image.DngPropertyKey.NOISE_REDUCTION_APPLIED,          { key: "noiseReductionApplied",     newExpectValue: 0 }],
  [image.DngPropertyKey.PROFILE_NAME,                     { key: "profileName",               newExpectValue: "Adobe Standard" }],
  [image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DIMS,         { key: "profileHueSatMapDims",      newExpectValue: [3, 3, 3] }],
  [image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DATA1,        { key: "profileHueSatMapData1",     newExpectValue: new Array(27).fill(1) }],
  [image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DATA2,        { key: "profileHueSatMapData2",     newExpectValue: new Array(27).fill(1) }],
  [image.DngPropertyKey.PROFILE_TONE_CURVE,               { key: "profileToneCurve",          newExpectValue: [0, 0, 1, 1] }],
  [image.DngPropertyKey.PROFILE_EMBED_POLICY,             { key: "profileEmbedPolicy",        newExpectValue: 0 }],
  [image.DngPropertyKey.PROFILE_COPYRIGHT,                { key: "profileCopyright",          newExpectValue: "Copyright (c) Fake Company 2025" }],
  [image.DngPropertyKey.FORWARD_MATRIX1,                  { key: "forwardMatrix1",            newExpectValue: [0.9642000198364258, 0, 0, 0, 1, 0, 0, 0, 0.8251000046730042] }],
  [image.DngPropertyKey.FORWARD_MATRIX2,                  { key: "forwardMatrix2",            newExpectValue: [0.9642000198364258, 0, 0, 0, 1, 0, 0, 0, 0.8251000046730042] }],
  [image.DngPropertyKey.PREVIEW_APPLICATION_NAME,         { key: "previewApplicationName",    newExpectValue: "Fake DNG Generator" }],
  [image.DngPropertyKey.PREVIEW_APPLICATION_VERSION,      { key: "previewApplicationVersion", newExpectValue: "1.0" }],
  [image.DngPropertyKey.PREVIEW_SETTINGS_NAME,            { key: "previewSettingsName",       newExpectValue: "Default" }],
  [image.DngPropertyKey.PREVIEW_SETTINGS_DIGEST,          { key: "previewSettingsDigest",     newExpectValue: "CE70B9D6BAA1207B3ABBA6C9FFF84924" }],
  [image.DngPropertyKey.PREVIEW_COLOR_SPACE,              { key: "previewColorSpace",         newExpectValue: 2 }],
  [image.DngPropertyKey.PREVIEW_DATE_TIME,                { key: "previewDateTime",           newExpectValue: "2026:01:19 12:00:00" }],
  [image.DngPropertyKey.RAW_IMAGE_DIGEST,                 { key: "rawImageDigest",            newExpectValue: "CE70B9D6BAA1207B3ABBA6C9FFF84924" }],
  [image.DngPropertyKey.ORIGINAL_RAW_FILE_DIGEST,         { key: "originalRawFileDigest",     newExpectValue: "CE70B9D6BAA1207B3ABBA6C9FFF84924" }],
  [image.DngPropertyKey.SUB_TILE_BLOCK_SIZE,              { key: "subTileBlockSize",          newExpectValue: [1, 1] }],
  [image.DngPropertyKey.ROW_INTERLEAVE_FACTOR,            { key: "rowInterleaveFactor",       newExpectValue: 1 }],
  [image.DngPropertyKey.PROFILE_LOOK_TABLE_DIMS,          { key: "profileLookTableDims",      newExpectValue: [3, 3, 3] }],
  [image.DngPropertyKey.PROFILE_LOOK_TABLE_DATA,          { key: "profileLookTableData",      newExpectValue: new Array(27).fill(0.5) }],
  [image.DngPropertyKey.OPCODE_LIST1,                     { key: "opcodeList1",               newExpectValue: [0,0,0,4,0,0,0,9,1,3,0,0,0,0,0,1,0,0,20,40] }],
  [image.DngPropertyKey.OPCODE_LIST2,                     { key: "opcodeList2",               newExpectValue: [0,0,0,4,0,0,0,9,1,3,0,0,0,0,0,1,0,0,20,40] }],
  [image.DngPropertyKey.OPCODE_LIST3,                     { key: "opcodeList3",               newExpectValue: [0,0,0,4,0,0,0,9,1,3,0,0,0,0,0,1,0,0,20,40] }],
  [image.DngPropertyKey.NOISE_PROFILE,                    { key: "noiseProfile",              newExpectValue: [1, 0, 1, 0, 1, 0] }],
  [image.DngPropertyKey.ORIGINAL_DEFAULT_FINAL_SIZE,      { key: "originalDefaultFinalSize",  newExpectValue: [64, 64] }],
  [image.DngPropertyKey.ORIGINAL_BEST_QUALITY_FINAL_SIZE, { key: "originalBestQualityFinalSize", newExpectValue: [64, 64] }],
  [image.DngPropertyKey.ORIGINAL_DEFAULT_CROP_SIZE,       { key: "originalDefaultCropSize",   newExpectValue: [64, 64] }],
  [image.DngPropertyKey.PROFILE_HUE_SAT_MAP_ENCODING,     { key: "profileHueSatMapEncoding",  newExpectValue: 0 }],
  [image.DngPropertyKey.PROFILE_LOOK_TABLE_ENCODING,      { key: "profileLookTableEncoding",  newExpectValue: 0 }],
  [image.DngPropertyKey.BASELINE_EXPOSURE_OFFSET,         { key: "baselineExposureOffset",    newExpectValue: 0 }],
  [image.DngPropertyKey.DEFAULT_BLACK_RENDER,             { key: "defaultBlackRender",        newExpectValue: 0 }],
  [image.DngPropertyKey.NEW_RAW_IMAGE_DIGEST,             { key: "newRawImageDigest",         newExpectValue: "CE70B9D6BAA1207B3ABBA6C9FFF84924" }],
  [image.DngPropertyKey.RAW_TO_PREVIEW_GAIN,              { key: "rawToPreviewGain",          newExpectValue: 1 }],
  [image.DngPropertyKey.DEFAULT_USER_CROP,                { key: "defaultUserCrop",           newExpectValue: [0, 0, 1, 1] }]
]);

const webpMetadataMap = new Map<image.WebPPropertyKey, ReadOnlyMetaDataRule>([
  [image.WebPPropertyKey.CANVAS_WIDTH,         { key: "canvasWidth",        newExpectValue: [64,64,64]    }],
  [image.WebPPropertyKey.CANVAS_HEIGHT,        { key: "canvasHeight",       newExpectValue: [63,63,63]    }],
  [image.WebPPropertyKey.DELAY_TIME,           { key: "delayTime",          newExpectValue: [100,100,150] }],
  [image.WebPPropertyKey.UNCLAMPED_DELAY_TIME, { key: "unclampedDelayTime", newExpectValue: [100,1,150]   }],
  [image.WebPPropertyKey.LOOP_COUNT,           { key: "loopCount",          newExpectValue: [9,9,9]       }]
]);

const gifMetadataMap = new Map<image.GifPropertyKey, ReadOnlyMetaDataRule>([
  [image.GifPropertyKey.GIF_DELAY_TIME, { key: "delayTime", newExpectValue: 100 }],
  [image.GifPropertyKey.GIF_DISPOSAL_TYPE, { key: "disposalType", newExpectValue: 1 }],
  [image.GifPropertyKey.GIF_HAS_GLOBAL_COLOR_MAP, { key: "hasGlobalColorMap", newExpectValue: true }],
  [image.GifPropertyKey.GIF_CANVAS_WIDTH, { key: "canvasWidth", newExpectValue: 480 }],
  [image.GifPropertyKey.GIF_CANVAS_HEIGHT, { key: "canvasHeight", newExpectValue: 270 }],
  [image.GifPropertyKey.GIF_LOOP_COUNT, { key: "loopCount", newExpectValue: 0 }],
  [image.GifPropertyKey.GIF_UNCLAMPED_DELAY_TIME, { key: "unclampedDelayTime", newExpectValue: 40 }]
]);

const heifsMetadataMap = new Map<image.HeifsPropertyKey, ReadOnlyMetaDataRule>([
  [image.HeifsPropertyKey.HEIFS_DELAY_TIME, { key: "heifsDelayTime", newExpectValue: 20 }],
  [image.HeifsPropertyKey.HEIFS_UNCLAMPED_DELAY_TIME, { key: "heifsUnclampedDelayTime", newExpectValue: 20 }],
  [image.HeifsPropertyKey.HEIFS_CANVAS_HEIGHT, { key: "heifsCanvasHeight", newExpectValue: 720 }],
  [image.HeifsPropertyKey.HEIFS_CANVAS_WIDTH, { key: "heifsCanvasWidth", newExpectValue: 1280 }]
]);

const avisMetadataMap = new Map<image.AvisPropertyKey, ReadOnlyMetaDataRule>([
  [image.AvisPropertyKey.DELAY_TIME, { key: "delayTime", newExpectValue: 100 }]
]);

const pngMetadataMap = new Map<image.PngPropertyKey, ReadOnlyMetaDataRule>([
  [image.PngPropertyKey.X_PIXELS_PER_METER, { key: "xPixelsPerMeter", newExpectValue: 3780 }],
  [image.PngPropertyKey.MODIFICATION_TIME, { key: "modificationTime", newExpectValue: "2026-03-19 10:05:00" }],
  [image.PngPropertyKey.SOFTWARE, { key: "software", newExpectValue: "Python pypng Script" }],
  [image.PngPropertyKey.COPYRIGHT, { key: "copyright", newExpectValue: "Copyright (C) 2026 QA Team" }],
  [image.PngPropertyKey.CREATION_TIME, { key: "creationTime", newExpectValue: "2026-03-19 10:00:00" }],
  [image.PngPropertyKey.SRGB_INTENT, { key: "sRGBIntent", newExpectValue: 0 }],
  [image.PngPropertyKey.AUTHOR, { key: "author", newExpectValue: "Test Engineer" }],
  [image.PngPropertyKey.INTERLACE_TYPE, { key: "interlaceType", newExpectValue: 0 }],
  [image.PngPropertyKey.WARNING, { key: "warning", newExpectValue: "Do not modify this metadata!" }],
  [image.PngPropertyKey.Y_PIXELS_PER_METER, { key: "yPixelsPerMeter", newExpectValue: 3780 }],
  [image.PngPropertyKey.GAMMA, { key: "gamma", newExpectValue: 0.45455 }],
  [image.PngPropertyKey.DESCRIPTION, { key: "description", newExpectValue: "This image contains all possible metadata fields" }],
  [image.PngPropertyKey.TITLE, { key: "title", newExpectValue: "Complete Test Image" }],
  [image.PngPropertyKey.COMMENT, { key: "comment", newExpectValue: "Generated for testing purposes" }],
  [image.PngPropertyKey.DISCLAIMER, { key: "disclaimer", newExpectValue: "For internal use only" }],
  [image.PngPropertyKey.CHROMATICITIES, { key: "chromaticities", newExpectValue: [0.3127,0.329,0.64,0.33,0.3,0.6,0.15,0.06] }]
]);

const jfifMetadataMap = new Map<image.JfifPropertyKey, ReadOnlyMetaDataRule>([
  [image.JfifPropertyKey.DENSITY_UNIT, { key: "densityUnit", newExpectValue: 1 }],
  [image.JfifPropertyKey.X_DENSITY, { key: "xDensity", newExpectValue: 72 }],
  [image.JfifPropertyKey.Y_DENSITY, { key: "yDensity", newExpectValue: 72 }],
  [image.JfifPropertyKey.VERSION, { key: "isProgressive", newExpectValue: false }],
  [image.JfifPropertyKey.IS_PROGRESSIVE, { key: "version", newExpectValue: [1,1] }]
]);

const tiffMetadataMap = new Map<image.TiffPropertyKey, ReadOnlyMetaDataRule>([
  [image.TiffPropertyKey.DOCUMENT_NAME, { key: "documentName", newExpectValue: undefined }],
  [image.TiffPropertyKey.PHOTOMETRIC_INTERPRETATION, { key: "photometricInterpretation", newExpectValue: 2 }],
  [image.TiffPropertyKey.SOFTWARE, { key: "software", newExpectValue: "Adobe Photoshop Lightroom Classic 7.4 (Macintosh)" }],
  [image.TiffPropertyKey.COPYRIGHT, { key: "copyright", newExpectValue: "Copyright (c) 2025 Test" }],
  [image.TiffPropertyKey.ORIENTATION, { key: "orientation", newExpectValue: undefined }],
  [image.TiffPropertyKey.RESOLUTION_UNIT, { key: "resolutionUnit", newExpectValue: 2 }],
  [image.TiffPropertyKey.COPYRIGHT, { key: "copyright", newExpectValue: undefined }],
  [image.TiffPropertyKey.DATE_TIME, { key: "dateTime", newExpectValue: "2018:10:27 16:20:29" }],
  [image.TiffPropertyKey.IMAGE_DESCRIPTION, { key: "imageDescription", newExpectValue: undefined }],
  [image.TiffPropertyKey.Y_RESOLUTION, { key: "yResolution", newExpectValue: 300 }],
  [image.TiffPropertyKey.X_RESOLUTION, { key: "xResolution", newExpectValue: 300 }],
  [image.TiffPropertyKey.WHITE_POINT, { key: "whitePoint", newExpectValue: undefined }],
  [image.TiffPropertyKey.TILE_LENGTH, { key: "tileLength", newExpectValue: undefined }],
  [image.TiffPropertyKey.TRANSFER_FUNCTION, { key: "transferFunction", newExpectValue: undefined}],
  [image.TiffPropertyKey.TILE_WIDTH, { key: "tileWidth", newExpectValue: undefined }],
  [image.TiffPropertyKey.MAKE, { key: "make", newExpectValue: "Canon" }],
  [image.TiffPropertyKey.MODEL, { key: "model", newExpectValue: "Canon EOS Rebel T6" }],
  [image.TiffPropertyKey.HOST_COMPUTER, { key: "hostComputer", newExpectValue: undefined }],
  [image.TiffPropertyKey.COMPRESSION, { key: "compression", newExpectValue: 1 }],
  [image.TiffPropertyKey.PRIMARY_CHROMATICITIES, { key: "primaryChromaticities", newExpectValue: undefined }],
  [image.TiffPropertyKey.ARTIST, { key: "artist", newExpectValue: undefined }]
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
  key: string;
  oldExpectValue: string;
  newExpectValue: string | number | Array<number> | ArrayBuffer | boolean;
}

// 写入元数据后的预期值验证规则映射表
const exifWriteExpectedValueRules = new Map<string, ModifyRule1>([
  ["NewSubfileType",                       { key: "newSubfileType",                      oldExpectValue: "5",                        newExpectValue: 5                        }],
  ["SubfileType",                          { key: "subfileType",                         oldExpectValue: "3",                        newExpectValue: 3                        }],
  ["ImageWidth",                           { key: "imageWidth",                          oldExpectValue: "65535",                    newExpectValue: 65535                    }],
  ["ImageLength",                          { key: "imageLength",                         oldExpectValue: "65535",                    newExpectValue: 65535                    }],
  ["BitsPerSample",                        { key: "bitsPerSample",                       oldExpectValue: "65535, 65535, 65535",      newExpectValue: [65535,65535,65535]      }],
  ["Compression",                          { key: "compression",                         oldExpectValue: "PackBits compression",     newExpectValue: 32773                    }],
  ["PhotometricInterpretation",            { key: "photometricInterpretation",           oldExpectValue: "Normal mono",              newExpectValue: 1                        }],
  ["ImageDescription",                     { key: "imageDescription",                    oldExpectValue: "@  @",                     newExpectValue: '@  @'                   }],
  ["Make",                                 { key: "make",                                oldExpectValue: "APPLE",                    newExpectValue: 'APPLE'                  }],
  ["Model",                                { key: "model",                               oldExpectValue: "%s \\0",                   newExpectValue: '%s \\0'                 }],
  ["StripOffsets",                         { key: "stripOffsets",                        oldExpectValue: "456",                      newExpectValue: [456]                    }],
  ["Orientation",                          { key: "orientation",                         oldExpectValue: "Top-left",                 newExpectValue: 1                        }],
  ["SamplesPerPixel",                      { key: "samplesPerPixel",                     oldExpectValue: "65535",                    newExpectValue: 65535                    }],
  ["RowsPerStrip",                         { key: "rowsPerStrip",                        oldExpectValue: "345",                      newExpectValue: 345                      }],
  ["StripByteCounts",                      { key: "stripByteCounts",                     oldExpectValue: "345",                      newExpectValue: [345]                    }],
  ["XResolution",                          { key: "xResolution",                         oldExpectValue: "31",                       newExpectValue: 31                       }],
  ["YResolution",                          { key: "yResolution",                         oldExpectValue: "31",                       newExpectValue: 31                       }],
  ["PlanarConfiguration",                  { key: "planarConfiguration",                 oldExpectValue: "Planar format",            newExpectValue: 2                        }],
  ["ResolutionUnit",                       { key: "resolutionUnit",                      oldExpectValue: "Centimeter",               newExpectValue: 3                        }],
  ["TransferFunction",                     { key: "transferFunction",                    oldExpectValue: "3 bytes undefined data",   newExpectValue: '3 bytes undefined data' }],
  ["Software",                             { key: "software",                            oldExpectValue: "%s \\0",                   newExpectValue: '%s \\0'                 }],
  ["DateTime",                             { key: "dateTime",                            oldExpectValue: "1900:01:01",               newExpectValue: '1900:01:01'             }],
  ["Artist",                               { key: "artist",                              oldExpectValue: "%s \\0",                   newExpectValue: '%s \\0'                 }],
  ["WhitePoint",                           { key: "whitePoint",                          oldExpectValue: "252,  1",                  newExpectValue: [252, 1]                 }],
  ["PrimaryChromaticities",                { key: "primaryChromaticities",               oldExpectValue: "31",                       newExpectValue: [31]                     }],
  ["PhotoMode",                            { key: "photoMode",                           oldExpectValue: "13",                       newExpectValue: 13                       }],
  ["YCbCrCoefficients",                    { key: "yCbCrCoefficients",                   oldExpectValue: "1.5,  2,  3",              newExpectValue: [1.5,2.0,3.0]            }],
  ["YCbCrSubSampling",                     { key: "yCbCrSubSampling",                    oldExpectValue: "4, 5",                     newExpectValue: [4,5]                    }],
  ["YCbCrPositioning",                     { key: "yCbCrPositioning",                    oldExpectValue: "Co-sited",                 newExpectValue: 2                        }],
  ["ReferenceBlackWhite",                  { key: "referenceBlackWhite",                 oldExpectValue: " 3, 255,  0, 255,  0, 255",newExpectValue: [3,255,0,255,0,255]      }],
  ["Copyright",                            { key: "copyright",                           oldExpectValue: "joseph (Photographer) - [None] (Editor)", newExpectValue: 'joseph (Photographer) - [None] (Editor)' }],
  ["ExposureTime",                         { key: "exposureTime",                        oldExpectValue: "1/60 sec.",                newExpectValue: 0.0166667                }],
  ["FNumber",                              { key: "fNumber",                             oldExpectValue: "f/0.03",                   newExpectValue: 0.0333333                }],
  ["ExposureProgram",                      { key: "exposureProgram",                     oldExpectValue: "Landscape mode (for landscape photos with the background in focus)", newExpectValue: 8 }],
  ["SpectralSensitivity",                  { key: "spectralSensitivity",                 oldExpectValue: "1234",                     newExpectValue: '1234'                   }],
  ["ISOSpeedRatings",                      { key: "isoSpeedRatings",                     oldExpectValue: "3200",                     newExpectValue: 3200                     }],
  ["GPSVersionID",                         { key: "gpsVersionID",                        oldExpectValue: "2.2.0.1",                  newExpectValue: [2,2,0,1]                }],
  ["GPSLatitudeRef",                       { key: "gpsLatitudeRef",                      oldExpectValue: "S",                        newExpectValue: 'S'                      }],
  ["GPSLatitude",                          { key: "gpsLatitude",                         oldExpectValue: "38,  0,  0",               newExpectValue: [38.0, 0, 0]             }],
  ["GPSLongitudeRef",                      { key: "gpsLongitudeRef",                     oldExpectValue: "W",                        newExpectValue: 'W'                      }],
  ["GPSLongitude",                         { key: "gpsLongitude",                        oldExpectValue: "38,  0,  0",               newExpectValue: [38, 0, 0]               }],
  ["GPSAltitudeRef",                       { key: "gpsAltitudeRef",                      oldExpectValue: "Sea level reference",      newExpectValue: 1                        }],
  ["GPSAltitude",                          { key: "gpsAltitude",                         oldExpectValue: " 1",                       newExpectValue: 1.00                     }],
  ["GPSTimeStamp",                         { key: "gpsTimestamp",                        oldExpectValue: "12:54:20.00",              newExpectValue: [12, 54, 20]             }],
  ["GPSSatellites",                        { key: "gpsSatellites",                       oldExpectValue: "a b c",                    newExpectValue: 'a b c'                  }],
  ["GPSStatus",                            { key: "gpsStatus",                           oldExpectValue: "V",                        newExpectValue: 'V'                      }],
  ["GPSMeasureMode",                       { key: "gpsMeasureMode",                      oldExpectValue: "3",                        newExpectValue: '3'                      }],
  ["GPSDOP",                               { key: "gpsDop",                              oldExpectValue: "1.5",                      newExpectValue: 1.5                      }],
  ["GPSSpeedRef",                          { key: "gpsSpeedRef",                         oldExpectValue: "K",                        newExpectValue: 'K'                      }],
  ["GPSSpeed",                             { key: "gpsSpeed",                            oldExpectValue: " 0",                       newExpectValue: 0                        }],
  ["GPSTrackRef",                          { key: "gpsTrackRef",                         oldExpectValue: "M",                        newExpectValue: 'M'                      }],
  ["GPSTrack",                             { key: "gpsTrack",                            oldExpectValue: "3.5",                      newExpectValue: 3.5                      }],
  ["GPSImgDirectionRef",                   { key: "gpsImgDirectionRef",                  oldExpectValue: "T",                        newExpectValue: 'T'                      }],
  ["GPSImgDirection",                      { key: "gpsImgDirection",                     oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["GPSMapDatum",                          { key: "gpsMapDatum",                         oldExpectValue: "%s\\0",                    newExpectValue: '%s\\0'                  }],
  ["GPSDestLatitudeRef",                   { key: "gpsDestLatitudeRef",                  oldExpectValue: "S",                        newExpectValue: 'S'                      }],
  ["GPSDestLatitude",                      { key: "gpsDestLatitude",                     oldExpectValue: " 0,  0,  0",               newExpectValue: [0, 0, 0]                }],
  ["GPSDestLongitudeRef",                  { key: "gpsDestLongitudeRef",                 oldExpectValue: "W",                        newExpectValue: 'W'                      }],
  ["GPSDestLongitude",                     { key: "gpsDestLongitude",                    oldExpectValue: " 0,  0,  0",               newExpectValue: [0, 0, 0]                }],
  ["GPSDestBearingRef",                    { key: "gpsDestBearingRef",                   oldExpectValue: "M",                        newExpectValue: 'M'                      }],
  ["GPSDestBearing",                       { key: "gpsDestBearing",                      oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["GPSDestDistanceRef",                   { key: "gpsDestDistanceRef",                  oldExpectValue: "K",                        newExpectValue: 'K'                      }],
  ["GPSDestDistance",                      { key: "gpsDestDistance",                     oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["GPSProcessingMethod",                  { key: "gpsProcessingMethod",                 oldExpectValue: "XXX",                      newExpectValue: 'XXX'                    }],
  ["GPSAreaInformation",                   { key: "gpsAreaInformation",                  oldExpectValue: "client",                   newExpectValue: 'client'                 }],
  ["GPSDateStamp",                         { key: "gpsDateStamp",                        oldExpectValue: "1900:01:01",               newExpectValue: '1900:01:01'             }],
  ["GPSDifferential",                      { key: "gpsDifferential",                     oldExpectValue: "1",                        newExpectValue: 1                        }],
  ["GPSHPositioningError",                 { key: "gpsHPositioningError",                oldExpectValue: "0.5",                      newExpectValue: 0.5                      }],
  ["PhotographicSensitivity",              { key: "photographicSensitivity",             oldExpectValue: "3200",                     newExpectValue: [3200]                   }],
  ["OECF",                                 { key: "oecf",                                oldExpectValue: "4 bytes undefined data",   newExpectValue: [48, 50, 49, 48]         }],
  ["SensitivityType",                      { key: "sensitivityType",                     oldExpectValue: "Unknown",                  newExpectValue: 0                        }],
  ["StandardOutputSensitivity",            { key: "standardOutputSensitivity",           oldExpectValue: "1000",                     newExpectValue: 1000                     }],
  ["RecommendedExposureIndex",             { key: "recommendedExposureIndex",            oldExpectValue: "2147483647",               newExpectValue: 2147483647               }],
  ["ISOSpeedLatitudeyyy",                  { key: "isoSpeedLatitudeyyy",                 oldExpectValue: "123",                      newExpectValue: 123                      }],
  ["ISOSpeedLatitudezzz",                  { key: "isoSpeedLatitudezzz",                 oldExpectValue: "123",                      newExpectValue: 123                      }],
  ["ExifVersion",                          { key: "exifVersion",                         oldExpectValue: "Exif Version 2.1",         newExpectValue: "Exif Version 2.1"       }],
  ["DateTimeOriginal",                     { key: "dateTimeOriginal",                    oldExpectValue: "1900:01:01 00:00:00",      newExpectValue: '1900:01:01 00:00:00'    }],
  ["DateTimeDigitized",                    { key: "dateTimeDigitized",                   oldExpectValue: "1900:01:01 00:00:00",      newExpectValue: '1900:01:01 00:00:00'    }],
  ["OffsetTime",                           { key: "offsetTime",                          oldExpectValue: "2023:01:25",               newExpectValue: '2023:01:25'             }],
  ["OffsetTimeOriginal",                   { key: "offsetTimeOriginal",                  oldExpectValue: "ject",                     newExpectValue: 'ject'                   }],
  ["OffsetTimeDigitized",                  { key: "offsetTimeDigitized",                 oldExpectValue: "cirtize",                  newExpectValue: 'cirtize'                }],
  ["ComponentsConfiguration",              { key: "componentsConfiguration",             oldExpectValue: "Y R G B",                  newExpectValue: "Y R G B"                }],
  ["CompressedBitsPerPixel",               { key: "compressedBitsPerPixel",              oldExpectValue: "25",                       newExpectValue: 25                       }],
  ["ShutterSpeedValue",                    { key: "shutterSpeedValue",                   oldExpectValue: "1.50 EV (1/3 sec.)",       newExpectValue: 1.50                     }],
  ["ApertureValue",                        { key: "apertureValue",                       oldExpectValue: "16.00 EV (f/256.0)",       newExpectValue: 16.00                    }],
  ["BrightnessValue",                      { key: "brightnessValue",                     oldExpectValue: "1.20 EV (7.87 cd/m^2)",    newExpectValue: 1.20                     }],
  ["ExposureBiasValue",                    { key: "exposureBiasValue",                   oldExpectValue: "4.00 EV",                  newExpectValue: 4.00                     }],
  ["MaxApertureValue",                     { key: "maxApertureValue",                    oldExpectValue: "1.60 EV (f/1.7)",          newExpectValue: 1.60                     }],
  ["SubjectDistance",                      { key: "subjectDistance",                     oldExpectValue: "0.5 m",                    newExpectValue: 0.5                      }],
  ["MeteringMode",                         { key: "meteringMode",                        oldExpectValue: "Unknown",                  newExpectValue: 0                        }],
  ["LightSource",                          { key: "lightSource",                         oldExpectValue: "Daylight",                 newExpectValue: 1                        }],
  ["Flash",                                { key: "flash",                               oldExpectValue: "Flash fired, auto mode, return light detected, red-eye reduction mode", newExpectValue: 95 }],
  ["FocalLength",                          { key: "focalLength",                         oldExpectValue: "31.0 mm",                  newExpectValue: 31.0                     }],
  ["SubjectArea",                          { key: "subjectArea",                         oldExpectValue: "(x,y) = (45,23)",          newExpectValue: [45, 23]                 }],
  ["MakerNote",                            { key: "makerNote",                           oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["UserComment",                          { key: "userComment",                         oldExpectValue: "place for user comments",  newExpectValue: "place for user comments"}],
  ["SubsecTime",                           { key: "subsecTime",                          oldExpectValue: "427000",                   newExpectValue: '427000'                 }],
  ["SubsecTimeOriginal",                   { key: "subsecTimeOriginal",                  oldExpectValue: "123456",                   newExpectValue: '123456'                 }],
  ["SubsecTimeDigitized",                  { key: "subsecTimeDigitized",                 oldExpectValue: "999999",                   newExpectValue: '999999'                 }],
  ["FlashpixVersion",                      { key: "flashpixVersion",                     oldExpectValue: "FlashPix Version 1.0",     newExpectValue: "FlashPix Version 1.0"   }],
  ["ColorSpace",                           { key: "colorSpace",                          oldExpectValue: "Adobe RGB",                newExpectValue: 2                        }],
  ["PixelXDimension",                      { key: "pixelXDimension",                     oldExpectValue: "0",                        newExpectValue: 0                        }],
  ["PixelYDimension",                      { key: "pixelYDimension",                     oldExpectValue: "0",                        newExpectValue: 0                        }],
  ["RelatedSoundFile",                     { key: "relatedSoundFile",                    oldExpectValue: "abc",                      newExpectValue: 'abc'                    }],
  ["FlashEnergy",                          { key: "flashEnergy",                         oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["SpatialFrequencyResponse",             { key: "spatialFrequencyResponse",            oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["FocalPlaneXResolution",                { key: "focalPlaneXResolution",               oldExpectValue: "102",                      newExpectValue: 102                      }],
  ["FocalPlaneYResolution",                { key: "focalPlaneYResolution",               oldExpectValue: "81",                       newExpectValue: 81                       }],
  ["FocalPlaneResolutionUnit",             { key: "focalPlaneResolutionUnit",            oldExpectValue: "Centimeter",               newExpectValue: 3                        }],
  ["SubjectLocation",                      { key: "subjectLocation",                     oldExpectValue: "23, 112",                  newExpectValue: [23, 112]                }],
  ["ExposureIndex",                        { key: "exposureIndex",                       oldExpectValue: "2.5",                      newExpectValue: 2.5                      }],
  ["SensingMethod",                        { key: "sensingMethod",                       oldExpectValue: "Color sequential linear sensor",  newExpectValue: 8                 }],
  ["FileSource",                           { key: "fileSource",                          oldExpectValue: "Internal error (unknown value 1)",newExpectValue: [1]               }],
  ["SceneType",                            { key: "sceneType",                           oldExpectValue: "Directly photographed",    newExpectValue: [1]                      }],
  ["CFAPattern",                           { key: "cfaPattern",                          oldExpectValue: "4 bytes undefined data",   newExpectValue: [48, 50, 49, 48]         }],
  ["CustomRendered",                       { key: "customRendered",                      oldExpectValue: "Custom process",           newExpectValue: 1                        }],
  ["ExposureMode",                         { key: "exposureMode",                        oldExpectValue: "Auto bracket",             newExpectValue: 2                        }],
  ["WhiteBalance",                         { key: "whiteBalance",                        oldExpectValue: "Auto white balance",       newExpectValue: 0                        }],
  ["DigitalZoomRatio",                     { key: "digitalZoomRatio",                    oldExpectValue: "23",                       newExpectValue: 23                       }],
  ["FocalLengthIn35mmFilm",                { key: "focalLengthIn35mmFilm",               oldExpectValue: "12",                       newExpectValue: 12                       }],
  ["SceneCaptureType",                     { key: "sceneCaptureType",                    oldExpectValue: "Night scene",              newExpectValue: 3                        }],
  ["GainControl",                          { key: "gainControl",                         oldExpectValue: "High gain down",           newExpectValue: 4                        }],
  ["Contrast",                             { key: "contrast",                            oldExpectValue: "Hard",                     newExpectValue: 2                        }],
  ["Saturation",                           { key: "saturation",                          oldExpectValue: "High saturation",          newExpectValue: 2                        }],
  ["Sharpness",                            { key: "sharpness",                           oldExpectValue: "Hard",                     newExpectValue: 2                        }],
  ["DeviceSettingDescription",             { key: "deviceSettingDescription",            oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["SubjectDistanceRange",                 { key: "subjectDistanceRange",                oldExpectValue: "Distant view",             newExpectValue: 3                        }],
  ["ImageUniqueID",                        { key: "imageUniqueId",                       oldExpectValue: "Image Unique ID",          newExpectValue: 'Image Unique ID'        }],
  ["CameraOwnerName",                      { key: "cameraOwnerName",                     oldExpectValue: "joseph",                   newExpectValue: 'joseph'                 }],
  ["BodySerialNumber",                     { key: "bodySerialNumber",                    oldExpectValue: "xoinc",                    newExpectValue: 'xoinc'                  }],
  ["LensSpecification",                    { key: "lensSpecification",                   oldExpectValue: "0.8, 2.5, 1.5, 2.5",       newExpectValue: [0.75,2.5,1.5,2.5]       }],
  ["LensMake",                             { key: "lensMake",                            oldExpectValue: "plex",                     newExpectValue: 'plex'                   }],
  ["LensModel",                            { key: "lensModel",                           oldExpectValue: "world",                    newExpectValue: 'world'                  }],
  ["LensSerialNumber",                     { key: "lensSerialNumber",                    oldExpectValue: "root",                     newExpectValue: 'root'                   }],
  ["CompositeImage",                       { key: "compositeImage",                      oldExpectValue: "3",                        newExpectValue: 3                        }],
  ["SourceImageNumberOfCompositeImage",    { key: "sourceImageNumberOfCompositeImage",   oldExpectValue: "11, 23",                   newExpectValue: [11, 23]                 }],
  ["SourceExposureTimesOfCompositeImage",  { key: "sourceExposureTimesOfCompositeImage", oldExpectValue: "0210",                     newExpectValue: [48, 50, 49, 48]         }],
  ["Gamma",                                { key: "gamma",                               oldExpectValue: "1.5",                      newExpectValue: 1.5                      }],
  ["HwMnoteIsXmageSupported",              { key: "isXmageSupported",                    oldExpectValue: "true",                     newExpectValue: true                     }],
  ["HwMnoteXmageMode",                     { key: "xmageWatermarkMode",                  oldExpectValue: "2",                        newExpectValue: 2                        }],
  ["HwMnoteXmageLeft",                     { key: "xmageLeft",                           oldExpectValue: "200",                      newExpectValue: 200                      }],
  ["HwMnoteXmageTop",                      { key: "xmageTop",                            oldExpectValue: "231",                      newExpectValue: 231                      }],
  ["HwMnoteXmageRight",                    { key: "xmageRight",                          oldExpectValue: "156",                      newExpectValue: 156                      }],
  ["HwMnoteXmageBottom",                   { key: "xmageBottom",                         oldExpectValue: "423",                      newExpectValue: 423                      }],
  ["HwMnoteCloudEnhancementMode",          { key: "isCloudEnhanced",                     oldExpectValue: "3",                        newExpectValue: true                     }],
  ["HwMnoteCaptureMode",                   { key: "captureMode",                         oldExpectValue: "456321789",                newExpectValue: 456321789                }],
]);

export {
  readAndWriteExifMetadata,
  readAndWriteMakerNoteHwMetadata,
  exifReadWriteValidationRules,
  DNGExifReadWriteValidationRules,
  imageOnlyMakerNoteHwMetadata,
  readOnlyMakerNoteHwMetadata,
  exifReadOnlyValidationRules,
  testExifMetadata,
  testHuaweiMakerNoteMetadata,
  exifWriteExpectedValueRules,
  ReadOnlyMetaDataRule,
  dngMetadataMap,
  webpMetadataMap,
  gifMetadataMap,
  heifsMetadataMap,
  pngMetadataMap,
  jfifMetadataMap,
  tiffMetadataMap,
  avisMetadataMap
};