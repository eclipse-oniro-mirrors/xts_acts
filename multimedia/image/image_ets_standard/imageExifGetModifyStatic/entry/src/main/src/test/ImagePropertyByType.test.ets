import image from "@ohos.multimedia.image";

interface ReadOnlyMetaDataRule {
  key: string;
  newExpectValue: string | boolean | number | number[] | number[][];
}

const linearizationTable: number[] = [];
for (let i: number = 0; i < 16384; i++) {
  linearizationTable.push(i);
}
const blackLevelDeltaArr: number[] = [];
for (let i: number = 0; i < 32; i++) {
  linearizationTable.push(0);
}
const profileHueSatMapDataArr: number[] = [];
for (let i: number = 0; i < 27; i++) {
  linearizationTable.push(1);
}
const profileLookTableDataArr: number[] = [];
for (let i: number = 0; i < 27; i++) {
  linearizationTable.push(0.5);
}

const dngMetadataMap: Map<image.DngPropertyKey, ReadOnlyMetaDataRule> = new Map<image.DngPropertyKey, ReadOnlyMetaDataRule>([
  [image.DngPropertyKey.DNG_VERSION,                      { key: "dngVersion",                newExpectValue: [1, 4, 0, 0] }],
  [image.DngPropertyKey.DNG_BACKWARD_VERSION,             { key: "dngBackwardVersion",        newExpectValue: [1, 4, 0, 0] }],
  [image.DngPropertyKey.UNIQUE_CAMERA_MODEL,              { key: "uniqueCameraModel",         newExpectValue: "FakeCamera ModelX" }],
  [image.DngPropertyKey.LOCALIZED_CAMERA_MODEL,           { key: "localizedCameraModel",      newExpectValue: "VirtualCamera ModelX" }],
  [image.DngPropertyKey.CFA_PLANE_COLOR,                  { key: "cfaPlaneColor",             newExpectValue: [0, 1, 2] }],
  [image.DngPropertyKey.CFA_LAYOUT,                       { key: "cfaLayout",                 newExpectValue: 1 }],
  [image.DngPropertyKey.LINEARIZATION_TABLE,              { key: "linearizationTable",        newExpectValue: linearizationTable }],
  [image.DngPropertyKey.BLACK_LEVEL_REPEAT_DIM,           { key: "blackLevelRepeatDim",       newExpectValue: [2, 2] }],
  [image.DngPropertyKey.BLACK_LEVEL,                      { key: "blackLevel",                newExpectValue: [256, 256, 256, 256] }],
  [image.DngPropertyKey.BLACK_LEVEL_DELTA_H,              { key: "blackLevelDeltaH",          newExpectValue: blackLevelDeltaArr }],
  [image.DngPropertyKey.BLACK_LEVEL_DELTA_V,              { key: "blackLevelDeltaV",          newExpectValue: blackLevelDeltaArr }],
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
  [image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DATA1,        { key: "profileHueSatMapData1",     newExpectValue: profileHueSatMapDataArr }],
  [image.DngPropertyKey.PROFILE_HUE_SAT_MAP_DATA2,        { key: "profileHueSatMapData2",     newExpectValue: profileHueSatMapDataArr }],
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
  [image.DngPropertyKey.PROFILE_LOOK_TABLE_DATA,          { key: "profileLookTableData",      newExpectValue: profileLookTableDataArr }],
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

const webpMetadataMap: Map<image.WebPPropertyKey, ReadOnlyMetaDataRule> = new Map<image.WebPPropertyKey, ReadOnlyMetaDataRule>([
  [image.WebPPropertyKey.CANVAS_WIDTH,         { key: "canvasWidth",        newExpectValue: [64,64,64]    }],
  [image.WebPPropertyKey.CANVAS_HEIGHT,        { key: "canvasHeight",       newExpectValue: [63,63,63]    }],
  [image.WebPPropertyKey.DELAY_TIME,           { key: "delayTime",          newExpectValue: [100,100,150] }],
  [image.WebPPropertyKey.UNCLAMPED_DELAY_TIME, { key: "unclampedDelayTime", newExpectValue: [100,1,150]   }],
  [image.WebPPropertyKey.LOOP_COUNT,           { key: "loopCount",          newExpectValue: [9,9,9]       }]
]);

export {
  ReadOnlyMetaDataRule,
  dngMetadataMap,
  webpMetadataMap
};