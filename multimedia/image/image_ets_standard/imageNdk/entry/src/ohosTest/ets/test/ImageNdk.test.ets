/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium'
import ndkTest, { IImageInfo } from 'libImageNdk.so'
import image from "@ohos.multimedia.image";
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';

interface picTypeValue {
  name:string
  fileName:string
  value?:string
  initValue?:string
  modifyData?:string
  compareData?:string
  errorData?: string
}

interface exifData {
  key:string
  jpegData:string
  webpData?:string
  webpData0?:string
  pngData?:string
  dngData?:string
  heifData?:string
  onlyRead?:boolean
}

interface modifyData {
  key:string
  modifyData:string
  compareData?:string
  canSetAny?:boolean
}

const Data: Array<exifData> = [
  {key: image.PropertyKey.NEW_SUBFILE_TYPE, jpegData: "3", webpData: "3", pngData: "3", dngData: "1", heifData: "3"},
  {key: image.PropertyKey.SUBFILE_TYPE, jpegData: "2", webpData: "2", pngData: "2", dngData: "1", heifData: "2"},
  {key: image.PropertyKey.IMAGE_WIDTH, jpegData: "0", webpData: "3456", pngData: "0", dngData: "256", heifData: "0"},
  {key: image.PropertyKey.IMAGE_LENGTH, jpegData: "0", webpData: "4608", pngData: "0", dngData: "192", heifData: "0"},
  {key: image.PropertyKey.BITS_PER_SAMPLE, jpegData: "1, 1, 1", webpData: "8, 8, 8", pngData: "1, 1, 1", dngData: "8, 8, 8", heifData: "1, 1, 1"},
  {key: image.PropertyKey.COMPRESSION, jpegData: "Uncompressed", webpData: "Uncompressed", pngData: "Uncompressed", dngData: "Uncompressed", heifData: "Uncompressed"},
  {key: image.PropertyKey.PHOTOMETRIC_INTERPRETATION, jpegData: "Reversed mono", webpData: "Reversed mono", pngData: "Reversed mono", dngData: "RGB", heifData: "Reversed mono"},
  {key: image.PropertyKey.IMAGE_DESCRIPTION, jpegData: "_cuva%s\\d", webpData: "cuva", pngData: "_cuva%s\\d", dngData: "_cuva", heifData: "_cuva%s\\d"},
  {key: image.PropertyKey.MAKE, jpegData: "华为", webpData: "华为", pngData: "华为", dngData: "HUAWEI", heifData: "华为"},
  {key: image.PropertyKey.MODEL, jpegData: "TNY-AL00", webpData0: "TNY-AL00", pngData: "TNY-AL00", dngData: "MNA-AL00", heifData: "TNY-AL00"},
  {key: image.PropertyKey.STRIP_OFFSETS, jpegData: "123", webpData: "123", pngData: "123", dngData: "10348", heifData: "123"},
  {key: image.PropertyKey.ORIENTATION, jpegData: "Top-left", webpData: "Top-right", pngData: "Top-left", dngData: "Top-left", heifData: "Top-left"},
  {key: image.PropertyKey.SAMPLES_PER_PIXEL, jpegData: "0", webpData: "23", pngData: "0", dngData: "3", heifData: "0"},
  {key: image.PropertyKey.ROWS_PER_STRIP, jpegData: "123", webpData: "123", pngData: "123", dngData: "192", heifData: "123"},
  {key: image.PropertyKey.STRIP_BYTE_COUNTS, jpegData: "123", webpData: "123", pngData: "123", dngData: "147456", heifData: "123"},
  {key: image.PropertyKey.X_RESOLUTION, jpegData: " 0", webpData: "72", pngData: " 0", dngData: "72", heifData: " 0"},
  {key: image.PropertyKey.Y_RESOLUTION, jpegData: " 0", webpData: "72", pngData: " 0", dngData: "72", heifData: " 0"},
  {key: image.PropertyKey.PLANAR_CONFIGURATION, jpegData: "Chunky format", webpData: "Chunky format", pngData: "Chunky format", dngData: "Chunky format", heifData: "Chunky format"},
  {key: image.PropertyKey.RESOLUTION_UNIT, jpegData: "Inch", webpData: "Inch", pngData: "Inch", dngData: "Inch", heifData: "Inch"},
  {key: image.PropertyKey.TRANSFER_FUNCTION, jpegData: "3 bytes undefined data", 
    webpData: "1 bytes undefined data", pngData: "3 bytes undefined data", dngData: "2", heifData: "3 bytes undefined data"},
  {key: image.PropertyKey.SOFTWARE, jpegData: "华为", webpData: "TNY-AL00", pngData: "华为", dngData: "HUAWEI/MNA-AL00/HWMNA:12/HUAWEIMNA-AL00/104.0.0.56C00:user/release-keys", heifData: "华为"},
  {key: image.PropertyKey.DATE_TIME, jpegData: "2024:12:31", webpData: "2022:06:02 15:51:35", pngData: "2024:12:31", dngData: "2024:04:18 18:18:43", heifData: "2024:12:31"},
  {key: image.PropertyKey.ARTIST, jpegData: "None", webpData: "Bogdan Hrastnik", pngData: "None", dngData: "Joseph.Xu", heifData: "None"},
  {key: image.PropertyKey.WHITE_POINT, jpegData: "252, 0/0", webpData: "124, 0/0", pngData: "252, 0/0", dngData: "124.2", heifData: "252, 0/0"},
  {key: image.PropertyKey.PRIMARY_CHROMATICITIES, jpegData: " 0", webpData: "124", pngData: " 0", dngData: "124", heifData: " 0"},
  {key: image.PropertyKey.PHOTO_MODE, jpegData: "252", webpData: "123", pngData: "252", dngData: "252", heifData: "252"},
  {key: image.PropertyKey.JPEG_INTERCHANGE_FORMAT, jpegData: "2798", webpData0: "1252", pngData: "2798", dngData: "10344", heifData: "2798", onlyRead: true},
  {key: image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH, jpegData: "4", webpData0: "24042", pngData: "4", dngData: "4", heifData: "4", onlyRead: true},
  {key: image.PropertyKey.YCBCR_COEFFICIENTS, jpegData: "0.299, 0.587, 0.114", 
    webpData: "0.299, 0.587, 0.114", pngData: "0.299, 0.587, 0.114", dngData: "0.299, 0.587, 0.114", heifData: "0.299, 0.587, 0.114"},
  {key: image.PropertyKey.YCBCR_SUB_SAMPLING, jpegData: "3, 2", webpData: "3, 3", pngData: "3, 2", dngData: "3, 2", heifData: "3, 2"},
  {key: image.PropertyKey.YCBCR_POSITIONING, jpegData: "Centered", webpData: "Centered", pngData: "Centered", dngData: "Centered", heifData: "Centered"},
  {key: image.PropertyKey.REFERENCE_BLACK_WHITE, jpegData: "222,  0, 1.5,  0, 25.2, 25.2", 
    webpData: "221, 255,  0, 255,  0, 255", pngData: "222,  0, 1.5,  0, 25.2, 25.2", dngData: "221", heifData: "222,  0, 1.5,  0, 25.2, 25.2"},
  {key: image.PropertyKey.COPYRIGHT, jpegData: "undefined (Photographer) - [None] (Editor)", 
    webpData: "ABB (Photographer) - [None] (Editor)", 
    pngData: "undefined (Photographer) - [None] (Editor)", 
    dngData: "Hw (Photographer) - [None] (Editor)", 
    heifData: "undefined (Photographer) - [None] (Editor)"},
  {key: image.PropertyKey.EXPOSURE_TIME, jpegData: "1/34 sec.", webpData: "1/33 sec.", pngData: "1/34 sec.", dngData: "1/100 sec.", heifData: "1/34 sec."},
  {key: image.PropertyKey.F_NUMBER, jpegData: "f/1.0", webpData: "f/1.8", pngData: "f/1.0", dngData: "f/2.0", heifData: "f/1.0"},
  {key: image.PropertyKey.EXPOSURE_PROGRAM, jpegData: "Not defined", webpData: "Normal program", pngData: "Not defined", dngData: "Normal program", heifData: "Not defined"},
  {key: image.PropertyKey.SPECTRAL_SENSITIVITY, jpegData: "abc", webpData: "sensitivity", pngData: "abc", dngData: "sensitivity", heifData: "abc"},
  {key: image.PropertyKey.GPS_VERSION_ID, jpegData: "2.2.0.0", webpData: "2.2.0.0", pngData: "2.2.0.0", dngData: "2.2.0.0", heifData: "2.2.0.0"},
  {key: image.PropertyKey.GPS_LATITUDE_REF, jpegData: "N", webpData: "N", pngData: "N", dngData: "N", heifData: "N"},
  {key: image.PropertyKey.GPS_LATITUDE, jpegData: "39, 54, 20", webpData: "39, 54, 20", pngData: "39, 54, 20", dngData: "39, 54, 20", heifData: "39, 54, 20"},
  {key: image.PropertyKey.GPS_LONGITUDE_REF, jpegData: "E", webpData: "W", pngData: "E", dngData: "E", heifData: "E"},
  {key: image.PropertyKey.GPS_LONGITUDE, jpegData: "120, 52, 26", webpData: "120, 52, 26", pngData: "120, 52, 26", dngData: "120, 52, 26", heifData: "120, 52, 26"},
  {key: image.PropertyKey.GPS_ALTITUDE_REF, jpegData: "Sea level", webpData: "Sea level reference", pngData: "Sea level", dngData: "Sea level reference", heifData: "Sea level"},
  {key: image.PropertyKey.GPS_ALTITUDE, jpegData: "0.00", webpData: "0.00", pngData: "0.00", dngData: "0.00", heifData: "0.00"},
  {key: image.PropertyKey.GPS_TIME_STAMP, jpegData: "11:37:58.00", webpData: "11:37:58.00", pngData: "11:37:58.00", dngData: "11:37:56.00", heifData: "11:37:58.00"},
  {key: image.PropertyKey.GPS_SATELLITES, jpegData: "xxx", webpData: "BBA", pngData: "xxx", dngData: "xxx", heifData: "xxx"},
  {key: image.PropertyKey.GPS_STATUS, jpegData: "A", webpData: "A", pngData: "A", dngData: "A", heifData: "A"},
  {key: image.PropertyKey.GPS_MEASURE_MODE, jpegData: "2", webpData: "2", pngData: "2", dngData: "2", heifData: "2"},
  {key: image.PropertyKey.GPS_DOP, jpegData: "182", webpData: "182", pngData: "182", dngData: "182", heifData: "182"},
  {key: image.PropertyKey.GPS_SPEED_REF, jpegData: "N", webpData: "K", pngData: "N", dngData: "K", heifData: "N"},
  {key: image.PropertyKey.GPS_SPEED, jpegData: "150", webpData: "150", pngData: "150", dngData: "150", heifData: "150"},
  {key: image.PropertyKey.GPS_TRACK_REF, jpegData: "T", webpData: "T", pngData: "T", dngData: "T", heifData: "T"},
  {key: image.PropertyKey.GPS_TRACK, jpegData: "38.0", webpData: "111", pngData: "38.0", dngData: "56", heifData: "38.0"},
  {key: image.PropertyKey.GPS_IMG_DIRECTION_REF, jpegData: "M", webpData: "M", pngData: "M", dngData: "M", heifData: "M"},
  {key: image.PropertyKey.GPS_IMG_DIRECTION, jpegData: "2.23", webpData: "2.23", pngData: "2.23", dngData: "2.23214", heifData: "2.23"},
  {key: image.PropertyKey.GPS_MAP_DATUM, jpegData: "xxx", webpData: "TEST", pngData: "xxx", dngData: "xxxx", heifData: "xxx"},
  {key: image.PropertyKey.GPS_DEST_LATITUDE_REF, jpegData: "N", webpData: "S", pngData: "N", dngData: "N", heifData: "N"},
  {key: image.PropertyKey.GPS_DEST_LATITUDE, jpegData: "33, 22, 11", webpData: "33, 22, 11", pngData: "33, 22, 11", dngData: "33, 22, 11", heifData: "33, 22, 11"},
  {key: image.PropertyKey.GPS_DEST_LONGITUDE_REF, jpegData: "E", webpData: "W", pngData: "E", dngData: "E", heifData: "E"},
  {key: image.PropertyKey.GPS_DEST_LONGITUDE, jpegData: "33, 22, 11", webpData: "33, 22, 11", pngData: "33, 22, 11", dngData: "33, 22, 11", heifData: "33, 22, 11"},
  {key: image.PropertyKey.GPS_DEST_BEARING_REF, jpegData: "T", webpData: "M", pngData: "T", dngData: "T", heifData: "T"},
  {key: image.PropertyKey.GPS_DEST_BEARING, jpegData: "2.0", webpData: "2.0", pngData: "2.0", dngData: " 0", heifData: "2.0"},
  {key: image.PropertyKey.GPS_DEST_DISTANCE_REF, jpegData: "N", webpData: "K", pngData: "N", dngData: "N", heifData: "N"},
  {key: image.PropertyKey.GPS_DEST_DISTANCE, jpegData: "10", webpData: "10", pngData: "10", dngData: "10", heifData: "10"},
  {key: image.PropertyKey.GPS_PROCESSING_METHOD, jpegData: "CELLID", webpData: "CELLID", pngData: "CELLID", dngData: "GPS", heifData: "CELLID"},
  {key: image.PropertyKey.GPS_AREA_INFORMATION, jpegData: "arexxx", webpData: "accxx", pngData: "arexxx", dngData: "23...15...57", heifData: "arexxx"},
  {key: image.PropertyKey.GPS_DATE_STAMP, jpegData: "2025:01:11", webpData: "2022:01:11", pngData: "2025:01:11", dngData: "2023:10:19", heifData: "2025:01:11"},
  {key: image.PropertyKey.GPS_DIFFERENTIAL, jpegData: "0", webpData: "1", pngData: "0", dngData: "1", heifData: "0"},
  {key: image.PropertyKey.GPS_H_POSITIONING_ERROR, jpegData: "2.5", webpData: " 2", pngData: "2.5", dngData: " 3", heifData: "2.5"},
  {key: image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY, jpegData: "1", webpData: "200", pngData: "1", dngData: "205", heifData: "1"},
  {key: image.PropertyKey.OECF, jpegData: "4 bytes undefined data", 
    webpData: "2 bytes undefined data", pngData: "4 bytes undefined data", dngData: "1 bytes undefined data", heifData: "4 bytes undefined data"},
  {key: image.PropertyKey.SENSITIVITY_TYPE, jpegData: "Standard output sensitivity (SOS) and ISO speed",
    webpData: "Standard output sensitivity (SOS) and ISO speed", 
    pngData: "Standard output sensitivity (SOS) and ISO speed", 
    dngData: "Standard output sensitivity (SOS) and ISO speed", 
    heifData: "Standard output sensitivity (SOS) and ISO speed"},
  {key: image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, jpegData: "5", webpData: "5", pngData: "5", dngData: "5", heifData: "5"},
  {key: image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX, jpegData: "123", webpData: "241", pngData: "123", dngData: "241", heifData: "123"},
  {key: image.PropertyKey.ISO_SPEED, jpegData: "1", webpData: "200", pngData: "1", dngData: "205", heifData: "1"},
  {key: image.PropertyKey.ISO_SPEED_LATITUDE_YYY, jpegData: "1456", webpData: "3", pngData: "1456", dngData: "3", heifData: "1456"},
  {key: image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ, jpegData: "1456", webpData: "3", pngData: "1456", dngData: "3", heifData: "1456"},
  {key: image.PropertyKey.EXIF_VERSION, jpegData: "Exif Version 1.1", webpData: "Exif Version 1.1", pngData: "Exif Version 1.1", dngData: "Exif Version 2.2", heifData: "Exif Version 1.1"},
  {key: image.PropertyKey.DATE_TIME_ORIGINAL, jpegData: "2024:01:25 05:51:34", 
    webpData: "2022:06:02 15:51:35", pngData: "2024:01:25 05:51:34", dngData: "2024:04:18 18:18:43", heifData: "2024:01:25 05:51:34"},
  {key: image.PropertyKey.DATE_TIME_DIGITIZED, jpegData: "2022:06:02 15:51:34", 
    webpData: "2022:06:02 15:51:35", pngData: "2022:06:02 15:51:34", dngData: "2023:01:19 10:39:58", heifData: "2022:06:02 15:51:34"},
  {key: image.PropertyKey.OFFSET_TIME, jpegData: "2024:01:25", webpData: "111", pngData: "2024:01:25", dngData: "xx", heifData: "2024:01:25"},
  {key: image.PropertyKey.OFFSET_TIME_ORIGINAL, jpegData: "chex", webpData: "00xx", pngData: "chex", dngData: "xx", heifData: "chex"},
  {key: image.PropertyKey.OFFSET_TIME_DIGITIZED, jpegData: "cfh", webpData: "abs", pngData: "cfh", dngData: "xx", heifData: "cfh"},
  {key: image.PropertyKey.COMPONENTS_CONFIGURATION, jpegData: "Y R G B", webpData: "Y R G B", pngData: "Y R G B", dngData: "R G B -", heifData: "Y R G B"},
  {key: image.PropertyKey.COMPRESSED_BITS_PER_PIXEL, jpegData: "24", webpData: "0.95", pngData: "24", dngData: "1.5", heifData: "24"},
  {key: image.PropertyKey.SHUTTER_SPEED, jpegData: "2.50 EV (1/6 sec.)", 
    webpData: "14.00 EV (1/16384 sec.)", pngData: "2.50 EV (1/6 sec.)", dngData: "6.64 EV (1/100 sec.)", heifData: "2.50 EV (1/6 sec.)"},
  {key: image.PropertyKey.APERTURE_VALUE, jpegData: "4.00 EV (f/4.0)", 
    webpData: "1.69 EV (f/1.8)", pngData: "4.00 EV (f/4.0)", dngData: "2.00 EV (f/2.0)", heifData: "4.00 EV (f/4.0)"},
  {key: image.PropertyKey.BRIGHTNESS_VALUE, jpegData: "2.50 EV (19.38 cd/m^2)",
    webpData: "0.00 EV (3.43 cd/m^2)", pngData: "2.50 EV (19.38 cd/m^2)", dngData: "2.50 EV (19.38 cd/m^2)", heifData: "2.50 EV (19.38 cd/m^2)"},
  {key: image.PropertyKey.EXPOSURE_BIAS_VALUE, jpegData: "23.00 EV", webpData: "0.00 EV", pngData: "23.00 EV", dngData: "23.00 EV", heifData: "23.00 EV"},
  {key: image.PropertyKey.MAX_APERTURE_VALUE, jpegData: "2.50 EV (f/2.4)", webpData: "1.69 EV (f/1.8)", pngData: "2.50 EV (f/2.4)", dngData: "0.08 EV (f/1.0)", heifData: "2.50 EV (f/2.4)"},
  {key: image.PropertyKey.SUBJECT_DISTANCE, jpegData: "2.5 m", webpData: "25.0 m", pngData: "2.5 m", dngData: "2.5 m", heifData: "2.5 m"},
  {key: image.PropertyKey.METERING_MODE, jpegData: "Pattern", webpData: "Pattern", pngData: "Pattern", dngData: "Pattern", heifData: "Pattern"},
  {key: image.PropertyKey.LIGHT_SOURCE, jpegData: "Daylight", webpData: "Daylight", pngData: "Daylight", dngData: "Fluorescent", heifData: "Daylight"},
  {key: image.PropertyKey.FLASH, jpegData: "Strobe return light not detected", 
    webpData: "Flash did not fire, auto mode", pngData: "Strobe return light not detected", dngData: "Strobe return light not detected", heifData: "Strobe return light not detected"},
  {key: image.PropertyKey.FOCAL_LENGTH, jpegData: "0.0 mm", webpData: "31.0 mm", pngData: "0.0 mm", dngData: "6.3 mm", heifData: "0.0 mm"},
  {key: image.PropertyKey.SUBJECT_AREA, jpegData: "(x,y) = (12,13)", 
    webpData: "(x,y) = (10,20)", pngData: "(x,y) = (12,13)", dngData: "Within rectangle (width 2318, height 1390) around (x,y) = (2009,1506)", heifData: "(x,y) = (12,13)"},
  {key: image.PropertyKey.MAKER_NOTE, jpegData:'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' +
            'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
            'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
            'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,' +
            'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
            'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
            'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
            'HwMnoteSceneTextConf:11', 
            webpData: "HwMnoteCaptureMode:1,HwMnoteBurstNumber:2," +
            "HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7," +
            "HwMnoteFacePointer:122,HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3," +
            "HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8," +
            "HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8," +
            "HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,HwMnoteSceneStageConf:3," +
            "HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,HwMnoteSceneSnowConf:7," +
            "HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,HwMnoteSceneTextConf:11",
            pngData:'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
            'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
            'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
            'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
            'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
            'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,' +
            'HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
            'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
            'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
            'HwMnoteSceneTextConf:11',
            dngData:'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
            'HwMnoteFrontCamera:' +
            '3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,' +
            'HwMnoteWindSnapshotMode:8,HwMnoteFacePointer:166,HwMnoteFaceVersion:1,' +
            'HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
            'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
            'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:300,' +
            'HwMnoteSceneVersion:1,' + 'HwMnoteSceneFoodConf:2,' +
            'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
            'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
            'HwMnoteSceneTextConf:11',
            heifData:'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
            'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' + 'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
            'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
            'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
            'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
            'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,' +
            'HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' + 'HwMnoteSceneStageConf:3,' +
            'HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
            'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
            'HwMnoteSceneTextConf:11'},
  {key: image.PropertyKey.SCENE_POINTER, jpegData: "256", webpData: "256", pngData: "256", dngData: "300", heifData: "256", onlyRead: true},
  {key: image.PropertyKey.SCENE_VERSION, jpegData: "1", webpData: "1", pngData: "1", dngData: "1", heifData: "1", onlyRead: true},
  {key: image.PropertyKey.SCENE_FOOD_CONF, jpegData: "2", webpData: "2", pngData: "2", dngData: "2", heifData: "2", onlyRead: true},
  {key: image.PropertyKey.SCENE_STAGE_CONF, jpegData: "3", webpData: "3", pngData: "3", dngData: "3", heifData: "3", onlyRead: true},
  {key: image.PropertyKey.SCENE_BLUE_SKY_CONF, jpegData: "4", webpData: "4", pngData: "4", dngData: "4", heifData: "4", onlyRead: true},
  {key: image.PropertyKey.SCENE_GREEN_PLANT_CONF, jpegData: "5", webpData: "5", pngData: "5", dngData: "5", heifData: "5", onlyRead: true},
  {key: image.PropertyKey.SCENE_BEACH_CONF, jpegData: "6", webpData: "6", pngData: "6", dngData: "6", heifData: "6", onlyRead: true},
  {key: image.PropertyKey.SCENE_SNOW_CONF, jpegData: "7", webpData: "7", pngData: "7", dngData: "7", heifData: "7", onlyRead: true},
  {key: image.PropertyKey.SCENE_SUNSET_CONF, jpegData: "8", webpData: "8", pngData: "8", dngData: "8", heifData: "8", onlyRead: true},
  {key: image.PropertyKey.SCENE_FLOWERS_CONF, jpegData: "9", webpData: "9", pngData: "9", dngData: "9", heifData: "9", onlyRead: true},
  {key: image.PropertyKey.SCENE_NIGHT_CONF, jpegData: "10", webpData: "10", pngData: "10", dngData: "10", heifData: "10", onlyRead: true},
  {key: image.PropertyKey.SCENE_TEXT_CONF, jpegData: "11", webpData: "11", pngData: "11", dngData: "11", heifData: "11", onlyRead: true},
  {key: image.PropertyKey.FACE_POINTER, jpegData: "122", webpData: "122", pngData: "122", dngData: "166", heifData: "122", onlyRead: true},
  {key: image.PropertyKey.FACE_VERSION, jpegData: "1", webpData: "1", pngData: "1", dngData: "1", heifData: "1", onlyRead: true},
  {key: image.PropertyKey.FACE_COUNT, jpegData: "2", webpData: "2", pngData: "2", dngData: "2", heifData: "2", onlyRead: true},
  {key: image.PropertyKey.FACE_CONF, jpegData: "3", webpData: "3", pngData: "3", dngData: "3", heifData: "3", onlyRead: true},
  {key: image.PropertyKey.FACE_SMILE_SCORE, jpegData: "1 2 3 4 5 6 7 8", webpData: "1 2 3 4 5 6 7 8", pngData: "1 2 3 4 5 6 7 8", dngData: "1 2 3 4 5 6 7 8", heifData: "1 2 3 4 5 6 7 8", onlyRead: true},
  {key: image.PropertyKey.FACE_RECT, jpegData: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8", 
    webpData: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8", pngData: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8", dngData: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8", heifData: "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8", onlyRead: true},
  {key: image.PropertyKey.FACE_LEYE_CENTER, jpegData: "1 2 3 4", webpData: "1 2 3 4", pngData: "1 2 3 4", dngData: "1 2 3 4", heifData: "1 2 3 4", onlyRead: true},
  {key: image.PropertyKey.FACE_REYE_CENTER, jpegData: "5 6 7 8", webpData: "5 6 7 8", pngData: "5 6 7 8", dngData: "5 6 7 8", heifData: "5 6 7 8", onlyRead: true},
  {key: image.PropertyKey.FACE_MOUTH_CENTER, jpegData: "1 2 3 4 5 6 7 8", webpData: "1 2 3 4 5 6 7 8", pngData: "1 2 3 4 5 6 7 8", dngData: "1 2 3 4 5 6 7 8", heifData: "1 2 3 4 5 6 7 8", onlyRead: true},
  {key: image.PropertyKey.CAPTURE_MODE, jpegData: "1", webpData: "1", pngData: "1", dngData: "1", heifData: "1"},
  {key: image.PropertyKey.BURST_NUMBER, jpegData: "2", webpData: "2", pngData: "2", dngData: "2", heifData: "2", onlyRead: true},
  {key: image.PropertyKey.FRONT_CAMERA, jpegData: "3", webpData: "3", pngData: "3", dngData: "3", heifData: "3", onlyRead: true},
  {key: image.PropertyKey.ROLL_ANGLE, jpegData: "4", webpData: "4", pngData: "4", dngData: "4", heifData: "4", onlyRead: true},
  {key: image.PropertyKey.PITCH_ANGLE, jpegData: "5", webpData: "5", pngData: "5", dngData: "5", heifData: "5", onlyRead: true},
  {key: image.PropertyKey.PHYSICAL_APERTURE, jpegData: "6", webpData: "6", pngData: "6", dngData: "6", heifData: "6", onlyRead: true},
  {key: image.PropertyKey.FOCUS_MODE, jpegData: "7", webpData: "7", pngData: "7", dngData: "7", heifData: "7", onlyRead: true},
  {key: image.PropertyKey.USER_COMMENT, jpegData: "place for user comments", 
    webpData: "place for user comments.", pngData: "place for user comments", dngData: "comm", heifData: "place for user comments"},
  {key: image.PropertyKey.SUBSEC_TIME, jpegData: "123456", webpData: "123456", pngData: "123456", dngData: "427000", heifData: "123456"},
  {key: image.PropertyKey.SUBSEC_TIME_ORIGINAL, jpegData: "427000", webpData: "543792", pngData: "427000", dngData: "427000", heifData: "427000"},
  {key: image.PropertyKey.SUBSEC_TIME_DIGITIZED, jpegData: "427000", webpData: "427000", pngData: "427000", dngData: "427000", heifData: "427000"},
  {key: image.PropertyKey.FLASHPIX_VERSION, jpegData: "FlashPix Version 1.0", 
    webpData: "FlashPix Version 1.0", pngData: "FlashPix Version 1.0", dngData: "FlashPix Version 1.0", heifData: "FlashPix Version 1.0"},
  {key: image.PropertyKey.COLOR_SPACE, jpegData: "sRGB", webpData: "sRGB", pngData: "sRGB", dngData: "Adobe RGB", heifData: "sRGB"},
  {key: image.PropertyKey.PIXEL_X_DIMENSION, jpegData: "123", webpData: "123", pngData: "123", dngData: "1000", heifData: "123"},
  {key: image.PropertyKey.PIXEL_Y_DIMENSION, jpegData: "234", webpData: "4608", pngData: "234", dngData: "2000", heifData: "234"},
  {key: image.PropertyKey.RELATED_SOUND_FILE, jpegData: "/usr/home", webpData: "abb", pngData: "/usr/home", dngData: "/usr/home/sound/sea.wav", heifData: "/usr/home"},
  {key: image.PropertyKey.FLASH_ENERGY, jpegData: "832", webpData: "832", pngData: "832", dngData: "832", heifData: "832"},
  {key: image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE, jpegData: "13", webpData: "13", pngData: "13", dngData: ".", heifData: "13"},
  {key: image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, jpegData: "1080", webpData: "1080", pngData: "1080", dngData: "1080", heifData: "1080"},
  {key: image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, jpegData: "880", webpData: "880", pngData: "880", dngData: "880", heifData: "880"},
  {key: image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT, jpegData: "Inch", webpData: "Centimeter", pngData: "Inch", dngData: "Centimeter", heifData: "Inch"},
  {key: image.PropertyKey.SUBJECT_LOCATION, jpegData: "0, 1", webpData: "5, 6", pngData: "0, 1", dngData: "2009, 1506, 2318, 1390", heifData: "0, 1"},
  {key: image.PropertyKey.EXPOSURE_INDEX, jpegData: "1.5", webpData: "1.5", pngData: "1.5", dngData: "1.5", heifData: "1.5"},
  {key: image.PropertyKey.SENSING_METHOD, jpegData: "Two-chip color area sensor", 
    webpData: "One-chip color area sensor", pngData: "Two-chip color area sensor", dngData: "Two-chip color area sensor", heifData: "Two-chip color area sensor"},
  {key: image.PropertyKey.FILE_SOURCE, jpegData: "DSC", webpData: "DSC", pngData: "DSC", dngData: "DSC", heifData: "DSC"},
  {key: image.PropertyKey.SCENE_TYPE, jpegData: "Directly photographed", 
    webpData: "Directly photographed", pngData: "Directly photographed", dngData: "Directly photographed", heifData: "Directly photographed"},
  {key: image.PropertyKey.CFA_PATTERN, jpegData: "1 bytes undefined data", 
    webpData: "1 bytes undefined data", pngData: "1 bytes undefined data", dngData: "1 bytes undefined data", heifData: "1 bytes undefined data"},
  {key: image.PropertyKey.CUSTOM_RENDERED, jpegData: "Normal process", webpData: "Custom process", pngData: "Normal process", dngData: "Custom process", heifData: "Normal process"},
  {key: image.PropertyKey.EXPOSURE_MODE, jpegData: "Auto exposure", webpData: "Auto exposure", pngData: "Auto exposure", dngData: "Auto exposure", heifData: "Auto exposure"},
  {key: image.PropertyKey.WHITE_BALANCE, jpegData: "Manual white balance", 
    webpData: "Auto white balance", pngData: "Manual white balance", dngData: "Manual white balance", heifData: "Manual white balance"},
  {key: image.PropertyKey.DIGITAL_ZOOM_RATIO, jpegData: "321", webpData: "1.00", pngData: "321", dngData: " 0", heifData: "321"},
  {key: image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM, jpegData: "2", webpData: "27", pngData: "2", dngData: "26", heifData: "2"},
  {key: image.PropertyKey.SCENE_CAPTURE_TYPE, jpegData: "Standard", webpData: "Standard", pngData: "Standard", dngData: "Standard", heifData: "Standard"},
  {key: image.PropertyKey.GAIN_CONTROL, jpegData: "Normal", webpData: "Normal", pngData: "Normal", dngData: "Normal", heifData: "Normal"},
  {key: image.PropertyKey.CONTRAST, jpegData: "Normal", webpData: "Normal", pngData: "Normal", dngData: "Normal", heifData: "Normal"},
  {key: image.PropertyKey.SATURATION, jpegData: "Normal", webpData: "Normal", pngData: "Normal", dngData: "Normal", heifData: "Normal"},
  {key: image.PropertyKey.SHARPNESS, jpegData: "Normal", webpData: "Normal", pngData: "Normal", dngData: "Normal", heifData: "Normal"},
  {key: image.PropertyKey.DEVICE_SETTING_DESCRIPTION, jpegData: "2xxx", webpData: "2", pngData: "2xxx", dngData: ".", heifData: "2xxx"},
  {key: image.PropertyKey.SUBJECT_DISTANCE_RANGE, jpegData: "Unknown", webpData: "Unknown", pngData: "Unknown", dngData: "Unknown", heifData: "Unknown"},
  {key: image.PropertyKey.IMAGE_UNIQUE_ID, jpegData: "FXIC012", webpData: "FXIC012", pngData: "FXIC012", dngData: "FXIC012", heifData: "FXIC012"},
  {key: image.PropertyKey.CAMERA_OWNER_NAME, jpegData: "c.uec", webpData: "2", pngData: "c.uec", dngData: "xx", heifData: "c.uec"},
  {key: image.PropertyKey.BODY_SERIAL_NUMBER, jpegData: "exoch", webpData: "x1", pngData: "exoch", dngData: "xx", heifData: "exoch"},
  {key: image.PropertyKey.LENS_SPECIFICATION, jpegData: "0.8, 2.5, 1.5, 0.5",
    webpData: " 1, 2.5,  3,  2", pngData: "0.8, 2.5, 1.5, 0.5", dngData: " 1, 1.5,  1,  2", heifData: "0.8, 2.5, 1.5, 0.5"},
  {key: image.PropertyKey.LENS_MAKE, jpegData: "xxwx", webpData: "aaa", pngData: "xxwx", dngData: "xxx", heifData: "xxwx"},
  {key: image.PropertyKey.LENS_MODEL, jpegData: "txaw", webpData: "xxx", pngData: "txaw", dngData: "xxx", heifData: "txaw"},
  {key: image.PropertyKey.LENS_SERIAL_NUMBER, jpegData: "qxhc", webpData: "111", pngData: "qxhc", dngData: "xxx", heifData: "qxhc"},
  {key: image.PropertyKey.COMPOSITE_IMAGE, jpegData: "2", webpData: "2", pngData: "2", dngData: "1", heifData: "2"},
  {key: image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, jpegData: "23, 34", webpData: "1234, 1", pngData: "23, 34", dngData: "1234", heifData: "23, 34"},
  {key: image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, jpegData: "xxxw", webpData: "123", pngData: "xxxw", dngData: ".", heifData: "xxxw"},
  {key: image.PropertyKey.GAMMA, jpegData: "2.5", webpData: "1.5", pngData: "2.5", dngData: "1.5", heifData: "2.5"},
  {key: image.PropertyKey.DNG_VERSION, jpegData: "2, 2, 3, 1", webpData: "1, 1, 2, 3", pngData: "2, 2, 3, 1", dngData: "0x01, 0x01, 0x02, 0x03", heifData: "2, 2, 3, 1"},
  {key: image.PropertyKey.DEFAULT_CROP_SIZE, jpegData: "153, 841", webpData: "12, 1", pngData: "153, 841", dngData: "1", heifData: "153, 841"},
  {key: image.PropertyKey.IS_XMAGE_SUPPORTED, jpegData: "default_exif_value", 
    webpData: "default_exif_value", pngData: "default_exif_value", dngData: "default_exif_value", heifData: "default_exif_value"},
  {key: image.PropertyKey.XMAGE_MODE, jpegData: "default_exif_value", webpData: "default_exif_value", pngData: "default_exif_value", dngData: "default_exif_value", heifData: "default_exif_value"},
  {key: image.PropertyKey.XMAGE_LEFT, jpegData: "default_exif_value", webpData: "default_exif_value", pngData: "default_exif_value", dngData: "default_exif_value", heifData: "default_exif_value"},
  {key: image.PropertyKey.XMAGE_TOP, jpegData: "default_exif_value", webpData: "default_exif_value", pngData: "default_exif_value", dngData: "default_exif_value", heifData: "default_exif_value"},
  {key: image.PropertyKey.XMAGE_RIGHT, jpegData: "default_exif_value", webpData: "default_exif_value", pngData: "default_exif_value", dngData: "default_exif_value", heifData: "default_exif_value"},
  {key: image.PropertyKey.XMAGE_BOTTOM, jpegData: "default_exif_value", webpData: "default_exif_value", pngData: "default_exif_value", dngData: "default_exif_value", heifData: "default_exif_value"},
  {key: image.PropertyKey.CLOUD_ENHANCEMENT_MODE, jpegData: "default_exif_value", 
    webpData: "default_exif_value", pngData: "default_exif_value", dngData: "default_exif_value", heifData: "default_exif_value"},
  {key: image.PropertyKey.WIND_SNAPSHOT_MODE, jpegData: "default_exif_value", webpData: "default_exif_value", pngData: "default_exif_value", dngData: "8", heifData: "default_exif_value", onlyRead: true}
]

const Data0: Array<exifData> = [
  {key: image.PropertyKey.IS_XMAGE_SUPPORTED, jpegData: "1"},
  {key: image.PropertyKey.XMAGE_MODE, jpegData: "1"},
  {key: image.PropertyKey.XMAGE_LEFT, jpegData: "1"},
  {key: image.PropertyKey.XMAGE_TOP, jpegData: "1"},
  {key: image.PropertyKey.XMAGE_RIGHT, jpegData: "1"},
  {key: image.PropertyKey.XMAGE_BOTTOM, jpegData: "1"},
  {key: image.PropertyKey.CLOUD_ENHANCEMENT_MODE, jpegData: "1"},
  {key: image.PropertyKey.WIND_SNAPSHOT_MODE, jpegData: "1"}
]

const ModifyData: Array<modifyData> = [
  {key: image.PropertyKey.BITS_PER_SAMPLE, modifyData: "1,1,1", compareData: "1, 1, 1"},
  {key: image.PropertyKey.ORIENTATION, modifyData: "1", compareData: "Top-left"},
  {key: image.PropertyKey.IMAGE_LENGTH, modifyData: "0", compareData: "0"},
  {key: image.PropertyKey.IMAGE_WIDTH, modifyData: "0", compareData: "0"},
  {key: image.PropertyKey.GPS_LATITUDE, modifyData: "39,54,20", compareData: "39, 54, 20"},
  {key: image.PropertyKey.GPS_LONGITUDE, modifyData: "120/1 52/1 26/1", compareData: "120, 52, 26"},
  {key: image.PropertyKey.GPS_LATITUDE_REF, modifyData: "N", compareData: "N"},
  {key: image.PropertyKey.GPS_LONGITUDE_REF, modifyData: "E", compareData: "E"},
  {key: image.PropertyKey.DATE_TIME_ORIGINAL, modifyData: "2024:01:25 05:51:34", compareData: "2024:01:25 05:51:34"},
  {key: image.PropertyKey.EXPOSURE_TIME, modifyData: "1/34", compareData: "1/34 sec."},
  {key: image.PropertyKey.SCENE_TYPE, modifyData: "1", compareData: "Directly photographed"},
  {key: image.PropertyKey.ISO_SPEED, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.F_NUMBER, modifyData: "1/1", compareData: "f/1.0"},
  {key: image.PropertyKey.DATE_TIME, modifyData: "2024:12:31", compareData: "2024:12:31"},
  {key: image.PropertyKey.GPS_TIME_STAMP, modifyData: "11/1 37/1 58/1", compareData: "11:37:58.00"},
  {key: image.PropertyKey.GPS_DATE_STAMP, modifyData: "2025:01:11", compareData: "2025:01:11"},
  {key: image.PropertyKey.IMAGE_DESCRIPTION, modifyData: "_cuva%s\\d", compareData: "_cuva%s\\d", canSetAny: true},
  {key: image.PropertyKey.MAKE, modifyData: "\u534e\u4e3a", compareData: "\u534e\u4e3a", canSetAny: true},
  {key: image.PropertyKey.MODEL, modifyData: "TNY-AL00", compareData: "TNY-AL00", canSetAny: true},
  {key: image.PropertyKey.PHOTO_MODE, modifyData: "252", compareData: "252"},
  {key: image.PropertyKey.SENSITIVITY_TYPE, modifyData: "5", compareData: "Standard output sensitivity (SOS) and ISO speed"},
  {key: image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, modifyData: "5", compareData: "5"},
  {key: image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX, modifyData: "123", compareData: "123"},
  {key: image.PropertyKey.APERTURE_VALUE, modifyData: "4/1", compareData: "4.00 EV (f/4.0)"},
  {key: image.PropertyKey.EXPOSURE_BIAS_VALUE, modifyData: "23/1", compareData: "23.00 EV"},
  {key: image.PropertyKey.METERING_MODE, modifyData: "5", compareData: "Pattern"},
  {key: image.PropertyKey.LIGHT_SOURCE, modifyData: "1", compareData: "Daylight"},
  {key: image.PropertyKey.FLASH, modifyData: "5", compareData: "Strobe return light not detected"},
  {key: image.PropertyKey.FOCAL_LENGTH, modifyData: "0/1", compareData: "0.0 mm"},
  {key: image.PropertyKey.USER_COMMENT, modifyData: "place for user comments", compareData: "place for user comments", canSetAny: true},
  {key: image.PropertyKey.PIXEL_X_DIMENSION, modifyData: "123", compareData: "123"},
  {key: image.PropertyKey.PIXEL_Y_DIMENSION, modifyData: "234", compareData: "234"},
  {key: image.PropertyKey.WHITE_BALANCE, modifyData: "1", compareData: "Manual white balance"},
  {key: image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM, modifyData: "2", compareData: "2"},
  {key: image.PropertyKey.COMPRESSION, modifyData: "1", compareData: "Uncompressed"},
  {key: image.PropertyKey.PHOTOMETRIC_INTERPRETATION, modifyData: "0", compareData: "Reversed mono"},
  {key: image.PropertyKey.STRIP_OFFSETS, modifyData: "123", compareData: "123"},
  {key: image.PropertyKey.SAMPLES_PER_PIXEL, modifyData: "0", compareData: "0"},
  {key: image.PropertyKey.ROWS_PER_STRIP, modifyData: "123", compareData: "123"},
  {key: image.PropertyKey.STRIP_BYTE_COUNTS, modifyData: "123", compareData: "123"},
  {key: image.PropertyKey.X_RESOLUTION, modifyData: "0/1", compareData: " 0"},
  {key: image.PropertyKey.Y_RESOLUTION, modifyData: "0/1", compareData: " 0"},
  {key: image.PropertyKey.PLANAR_CONFIGURATION, modifyData: "1", compareData: "Chunky format"},
  {key: image.PropertyKey.RESOLUTION_UNIT, modifyData: "2", compareData: "Inch"},
  {key: image.PropertyKey.TRANSFER_FUNCTION, modifyData: "abc", compareData: "3 bytes undefined data", canSetAny: true},
  {key: image.PropertyKey.SOFTWARE, modifyData: "\u534e\u4e3a", compareData: "\u534e\u4e3a", canSetAny: true},
  {key: image.PropertyKey.ARTIST, modifyData: "None", compareData: "None", canSetAny: true},
  {key: image.PropertyKey.WHITE_POINT, modifyData: "252/1", compareData: "252, 0/0"},
  {key: image.PropertyKey.PRIMARY_CHROMATICITIES, modifyData: "0/1", compareData: " 0"},
  {key: image.PropertyKey.YCBCR_COEFFICIENTS, modifyData: "299/1000 587/1000 114/1000", compareData: "0.299, 0.587, 0.114"},
  {key: image.PropertyKey.YCBCR_SUB_SAMPLING, modifyData: "3 2", compareData: "3, 2"},
  {key: image.PropertyKey.YCBCR_POSITIONING, modifyData: "1", compareData: "Centered"},
  {key: image.PropertyKey.REFERENCE_BLACK_WHITE, modifyData: "222 0 1.5 0 25.2 25.2", compareData: "222,  0, 1.5,  0, 25.2, 25.2"},
  {key: image.PropertyKey.COPYRIGHT, modifyData: "undefined", compareData: "undefined (Photographer) - [None] (Editor)", canSetAny: true},
  {key: image.PropertyKey.EXPOSURE_PROGRAM, modifyData: "0", compareData: "Not defined"},
  {key: image.PropertyKey.SPECTRAL_SENSITIVITY, modifyData: "abc", compareData: "abc", canSetAny: true},
  {key: image.PropertyKey.OECF, modifyData: "excc", compareData: "4 bytes undefined data", canSetAny: true},
  {key: image.PropertyKey.EXIF_VERSION, modifyData: "0110", compareData: "Exif Version 1.1"},
  {key: image.PropertyKey.DATE_TIME_DIGITIZED, modifyData: "2022:06:02 15:51:34", compareData: "2022:06:02 15:51:34"},
  {key: image.PropertyKey.COMPONENTS_CONFIGURATION, modifyData: "1456", compareData: "Y R G B"},
  {key: image.PropertyKey.SHUTTER_SPEED, modifyData: "5/2", compareData: "2.50 EV (1/6 sec.)"},
  {key: image.PropertyKey.BRIGHTNESS_VALUE, modifyData: "5/2", compareData: "2.50 EV (19.38 cd/m^2)"},
  {key: image.PropertyKey.MAX_APERTURE_VALUE, modifyData: "5/2", compareData: "2.50 EV (f/2.4)"},
  {key: image.PropertyKey.SUBJECT_DISTANCE, modifyData: "5/2", compareData: "2.5 m"},
  {key: image.PropertyKey.SUBJECT_AREA, modifyData: "12 13", compareData: "(x,y) = (12,13)"},
  {key: image.PropertyKey.SUBSEC_TIME, modifyData: "123456", compareData: "123456", canSetAny: true},
  {key: image.PropertyKey.SUBSEC_TIME_ORIGINAL, modifyData: "427000", compareData: "427000", canSetAny: true},
  {key: image.PropertyKey.SUBSEC_TIME_DIGITIZED, modifyData: "427000", compareData: "427000", canSetAny: true},
  {key: image.PropertyKey.FLASHPIX_VERSION, modifyData: "0100", compareData: "FlashPix Version 1.0"},
  {key: image.PropertyKey.COLOR_SPACE, modifyData: "1", compareData: "sRGB"},
  {key: image.PropertyKey.RELATED_SOUND_FILE, modifyData: "/usr/home", compareData: "/usr/home", canSetAny: true},
  {key: image.PropertyKey.FLASH_ENERGY, modifyData: "832/1", compareData: "832"},
  {key: image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE, modifyData: "13", compareData: "13", canSetAny: true},
  {key: image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, modifyData: "1080/1", compareData: "1080"},
  {key: image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, modifyData: "880/1", compareData: "880"},
  {key: image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT, modifyData: "2", compareData: "Inch"},
  {key: image.PropertyKey.SUBJECT_LOCATION, modifyData: "0 1", compareData: "0, 1"},
  {key: image.PropertyKey.EXPOSURE_INDEX, modifyData: "3/2", compareData: "1.5"},
  {key: image.PropertyKey.SENSING_METHOD, modifyData: "3", compareData: "Two-chip color area sensor"},
  {key: image.PropertyKey.FILE_SOURCE, modifyData: "3", compareData: "DSC", canSetAny: true},
  {key: image.PropertyKey.CFA_PATTERN, modifyData: "3", compareData: "1 bytes undefined data", canSetAny: true},
  {key: image.PropertyKey.CUSTOM_RENDERED, modifyData: "0", compareData: "Normal process"},
  {key: image.PropertyKey.EXPOSURE_MODE, modifyData: "0", compareData: "Auto exposure"},
  {key: image.PropertyKey.DIGITAL_ZOOM_RATIO, modifyData: "321/1", compareData: "321"},
  {key: image.PropertyKey.SCENE_CAPTURE_TYPE, modifyData: "0", compareData: "Standard"},
  {key: image.PropertyKey.GAIN_CONTROL, modifyData: "0", compareData: "Normal"},
  {key: image.PropertyKey.CONTRAST, modifyData: "0", compareData: "Normal"},
  {key: image.PropertyKey.SATURATION, modifyData: "0", compareData: "Normal"},
  {key: image.PropertyKey.SHARPNESS, modifyData: "0", compareData: "Normal"},
  {key: image.PropertyKey.DEVICE_SETTING_DESCRIPTION, modifyData: "2xxx", compareData: "2xxx", canSetAny: true},
  {key: image.PropertyKey.SUBJECT_DISTANCE_RANGE, modifyData: "0", compareData: "Unknown"},
  {key: image.PropertyKey.IMAGE_UNIQUE_ID, modifyData: "FXIC012", compareData: "FXIC012", canSetAny: true},
  {key: image.PropertyKey.GPS_VERSION_ID, modifyData: "2.2.0.0", compareData: "2.2.0.0"},
  {key: image.PropertyKey.GPS_ALTITUDE_REF, modifyData: "0", compareData: "Sea level"},
  {key: image.PropertyKey.GPS_ALTITUDE, modifyData: "0/100", compareData: "0.00"},
  {key: image.PropertyKey.GPS_SATELLITES, modifyData: "xxx", compareData: "xxx", canSetAny: true},
  {key: image.PropertyKey.GPS_STATUS, modifyData: "A", compareData: "A"},
  {key: image.PropertyKey.GPS_MEASURE_MODE, modifyData: "2", compareData: "2"},
  {key: image.PropertyKey.GPS_DOP, modifyData: "182/1", compareData: "182"},
  {key: image.PropertyKey.GPS_SPEED_REF, modifyData: "N", compareData: "N"},
  {key: image.PropertyKey.GPS_SPEED, modifyData: "150/1", compareData: "150"},
  {key: image.PropertyKey.GPS_TRACK_REF, modifyData: "T", compareData: "T"},
  {key: image.PropertyKey.GPS_TRACK, modifyData: "114/3", compareData: "38.0"},
  {key: image.PropertyKey.GPS_IMG_DIRECTION_REF, modifyData: "M", compareData: "M"},
  {key: image.PropertyKey.GPS_IMG_DIRECTION, modifyData: "125/56", compareData: "2.23"},
  {key: image.PropertyKey.GPS_MAP_DATUM, modifyData: "xxx", compareData: "xxx", canSetAny: true},
  {key: image.PropertyKey.GPS_DEST_LATITUDE_REF, modifyData: "N", compareData: "N"},
  {key: image.PropertyKey.GPS_DEST_LATITUDE, modifyData: "33/1 22/1 11/1", compareData: "33, 22, 11"},
  {key: image.PropertyKey.GPS_DEST_LONGITUDE_REF, modifyData: "E", compareData: "E"},
  {key: image.PropertyKey.GPS_DEST_LONGITUDE, modifyData: "33/1 22/1 11/1", compareData: "33, 22, 11"},
  {key: image.PropertyKey.GPS_DEST_BEARING_REF, modifyData: "T", compareData: "T"},
  {key: image.PropertyKey.GPS_DEST_BEARING, modifyData: "22/11", compareData: "2.0"},
  {key: image.PropertyKey.GPS_DEST_DISTANCE_REF, modifyData: "N", compareData: "N"},
  {key: image.PropertyKey.GPS_DEST_DISTANCE, modifyData: "10/1", compareData: "10"},
  {key: image.PropertyKey.GPS_PROCESSING_METHOD, modifyData: "CELLID", compareData: "CELLID", canSetAny: true},
  {key: image.PropertyKey.GPS_AREA_INFORMATION, modifyData: "arexxx", compareData: "arexxx", canSetAny: true},
  {key: image.PropertyKey.GPS_DIFFERENTIAL, modifyData: "0", compareData: "0"},
  {key: image.PropertyKey.BODY_SERIAL_NUMBER, modifyData: "exoch", compareData: "exoch", canSetAny: true},
  {key: image.PropertyKey.CAMERA_OWNER_NAME, modifyData: "c.uec", compareData: "c.uec", canSetAny: true},
  {key: image.PropertyKey.COMPOSITE_IMAGE, modifyData: "2", compareData: "2"},
  {key: image.PropertyKey.COMPRESSED_BITS_PER_PIXEL, modifyData: "24/1", compareData: "24"},
  {key: image.PropertyKey.DNG_VERSION, modifyData: "2 2 3 1", compareData: "2, 2, 3, 1"},
  {key: image.PropertyKey.DEFAULT_CROP_SIZE, modifyData: "153 841", compareData: "153, 841"},
  {key: image.PropertyKey.GAMMA, modifyData: "5/2", compareData: "2.5"},
  {key: image.PropertyKey.ISO_SPEED_LATITUDE_YYY, modifyData: "1456", compareData: "1456"},
  {key: image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ, modifyData: "1456", compareData: "1456"},
  {key: image.PropertyKey.LENS_MAKE, modifyData: "xxwx", compareData: "xxwx", canSetAny: true},
  {key: image.PropertyKey.LENS_MODEL, modifyData: "txaw", compareData: "txaw", canSetAny: true},
  {key: image.PropertyKey.LENS_SERIAL_NUMBER, modifyData: "qxhc", compareData: "qxhc", canSetAny: true},
  {key: image.PropertyKey.LENS_SPECIFICATION, modifyData: "3/4 5/2 3/2 1/2", compareData: "0.8, 2.5, 1.5, 0.5"},
  {key: image.PropertyKey.NEW_SUBFILE_TYPE, modifyData: "3", compareData: "3"},
  {key: image.PropertyKey.OFFSET_TIME, modifyData: "2024:01:25", compareData: "2024:01:25"},
  {key: image.PropertyKey.OFFSET_TIME_DIGITIZED, modifyData: "cfh", compareData: "cfh", canSetAny: true},
  {key: image.PropertyKey.OFFSET_TIME_ORIGINAL, modifyData: "chex", compareData: "chex", canSetAny: true},
  {key: image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, modifyData: "xxxw", compareData: "xxxw", canSetAny: true},
  {key: image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, modifyData: "23 34", compareData: "23, 34"},
  {key: image.PropertyKey.SUBFILE_TYPE, modifyData: "2", compareData: "2"},
  {key: image.PropertyKey.GPS_H_POSITIONING_ERROR, modifyData: "5/2", compareData: "2.5"},
  {key: image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.CAPTURE_MODE, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.MAKER_NOTE, modifyData: "1", compareData: "1", canSetAny: true},
  {key: image.PropertyKey.IS_XMAGE_SUPPORTED, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.XMAGE_MODE, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.XMAGE_LEFT, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.XMAGE_TOP, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.XMAGE_RIGHT, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.XMAGE_BOTTOM, modifyData: "1", compareData: "1"},
  {key: image.PropertyKey.CLOUD_ENHANCEMENT_MODE, modifyData: "1", compareData: "1"}
]

const domain = 0x0000;

async function sleep(delay: number): Promise<void> {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function imageNdkTest() {
  describe('ImageNdkTest', () => {
    let globalpixelmap: image.PixelMap;
    let outBuffer: ArrayBuffer = new ArrayBuffer(1200000)
    let testContext: common.UIAbilityContext;
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      console.info('afterEach case');
      await sleep(200);
    })

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    })

    let filePath: string;
    let fileFd: number;
    let buffer: ArrayBuffer;
    let filesDir: string | undefined

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE);
      fileFd = file.fd;
    }

    const getBuffer = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      buffer = bufferRead
    }

    const getImageSource = async(filename:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "Buffer"){
        await getBuffer(filename)
        imageSourceApi = ndkTest.CreateFromData(buffer)
      }else if(type === "Uri"){
        filePath = filesDir + '/' + filename
        imageSourceApi = ndkTest.CreateFromUri(filePath)
      }else if(type === "Rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(filename)
        imageSourceApi = ndkTest.CreateFromRawFile(rawFileDescriptor.fd, rawFileDescriptor.offset, rawFileDescriptor.length)
      }else{
        await getFd(filename);
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
        // fs.closeSync(fileFd) // getFd open fd，创建ImageSource后，close fd。
      }
      return imageSourceApi
    }

    const NDK_CreatePixelMap = async (TAG: string, type:string, filename: string, width: number, height: number,done:Function) => {
      try {
        await getFd(filename);
        let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
        if (type === 'Fd') {
          imageSourceApi = ndkTest.CreateFromFd(fileFd);
        }
        if (type === 'Buffer') {
          await getBuffer(filename);
          imageSourceApi = ndkTest.CreateFromData(buffer);
        }
        if (type === 'RawFile') {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `type = rawfile`)
          const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
          let rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename);
          let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
            rawFileDescriptor.offset, rawFileDescriptor.length);
        }
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
          const pixelMap:image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi)
          if (typeof pixelMap === "object") {
            let result: boolean = false;
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)

            const pixelMapInfo = ndkTest.testGetImageInfo();
            hilog.info(0x0000, 'testTag', '%{public}s', TAG + ' imageInfo :' + JSON.stringify(pixelMapInfo));
            let desiredPixelFormat: number = 3
            let alphaType: number = 0
            if (pixelMapInfo.pixelFormat === desiredPixelFormat &&
              pixelMapInfo.width === width &&
              pixelMapInfo.height === height &&
              pixelMapInfo.alphaType === alphaType) {
              result = true
            }
            expect(result).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s',TAG + `pixelMap failed: ${pixelMap}`)
            ndkTest.SourceRelease(imageSourceApi)
            expect(false).assertTrue();
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(TAG + "Test exception " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromUri = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `ndkTest： ` + JSON.stringify(ndkTest))
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath)
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromFd = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', `ndkTest： ` + JSON.stringify(ndkTest))
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromData = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', `ndkTest： ` + JSON.stringify(ndkTest))
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreateFromDataWithUserBuffer = async (TAG: string, filename: string, done: Function) => {
      hilog.info(0x0000, 'scaleTest', '%{public}s', `ndkTest： ` + JSON.stringify(ndkTest))
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromDataWithUserBuffer(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByUri = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                           Regionwidth: number, RegionHeight: number, width: number, height: number,
                                           desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      console.log('-------------------- NDK' + ndkTest)
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let result = ndkTest.AssertImageSize(width, height);
          expect(result == 0).assertTrue();
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap Size is equal to DesiredSize success :${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByFd = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                          Regionwidth: number, RegionHeight: number, width: number, height: number,
                                          desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let result = ndkTest.AssertImageSize(width, height);
          expect(result == 0).assertTrue();
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap Size is equal to DesiredSize success :${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi)
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapByData = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                            Regionwidth: number, RegionHeight: number, width: number, height: number,
                                            desiredPixelFormat: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let result = ndkTest.AssertImageSize(width, height);
          expect(result == 0).assertTrue();
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap Size is equal to DesiredSize success :${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }


    const NDK_CreatePixelMapListByUri = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                               Regionwidth: number, RegionHeight: number, width: number, height: number,
                                               desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByFd = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                              Regionwidth: number, RegionHeight: number, width: number, height: number,
                                              desiredPixelFormat: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByData = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                                Regionwidth: number, RegionHeight: number, width: number, height: number,
                                                desiredPixelFormat: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList: Array<image.PixelMap> | number = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach(pixelMap => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }


    const NDK_GetDelayTime = async (TAG: string, filename: string, type: string, done: Function) => {
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);

      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const delayTime: Array<number> | number = ndkTest.GetDelayTime(imageSourceApi)
        if (Array.isArray(delayTime)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `delayTime success:${delayTime}`)
          ndkTest.SourceRelease(imageSourceApi);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `delayTime failed: ${delayTime}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByUri = async (TAG: string, index: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByFd = async (TAG: string, index: number, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByData = async (TAG: string, index: number, filename: string, done: Function) => {
      await getBuffer(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const imageInfo: image.ImageInfo | number = ndkTest.GetImageInfo(imageSourceApi, index)
        if (typeof imageInfo === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imageInfo}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageProperty = async (TAG: string, filename: string, type: string, done: Function) => {
      let key = image.PropertyKey.SCENE_TYPE;
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      const imagePropertyRes: String | number = ndkTest.GetImageProperty(imageSourceApi, key);
      if (typeof imagePropertyRes === "string") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo success: ${imagePropertyRes}`)
        ndkTest.SourceRelease(imageSourceApi);
        done()
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imageInfo failed: ${imagePropertyRes}`)
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done()
      }
    }

    const NDK_ModifyImagePropertyByUri = async (TAG: string, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      let propertyModifyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, image.PropertyKey.ORIENTATION, "4");
      if (propertyModifyRes === 0) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes success:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes failed:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_ModifyImagePropertyByFd = async (TAG: string, filename: string, done: Function) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      let propertyModifyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, image.PropertyKey.ORIENTATION, "4");
      if (propertyModifyRes === 0) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes success:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        done();
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `imagePropertyRes failed:` +
        JSON.stringify(propertyModifyRes))
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetFrameCount = async (TAG: string, filename: string, type: string, done: Function) => {

      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const frameCount: Array<number> = ndkTest.GetFrameCount(imageSourceApi)
        ndkTest.SourceRelease(imageSourceApi);
        if (Object.values(frameCount)[1] === 0) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `frameCount success: ${Object.values(frameCount)[1]}`)
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `frameCount failed: ${Object.values(frameCount)[1]}`)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_SourceRelease = async (TAG: string, filename: string, type: string, done: Function) => {
      await getFd(filename);
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromUri(filePath);
      if (type === 'Fd') {
        imageSourceApi = ndkTest.CreateFromFd(fileFd);
      }
      if (type === 'Buffer') {
        await getBuffer(filename);
        imageSourceApi = ndkTest.CreateFromData(buffer);
      }
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        const release = ndkTest.SourceRelease(imageSourceApi)
        if (release === 0) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `release success ${release}`)
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `release failed: ${release}`)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed: ${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_GetImageInfoByOption = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                            Regionwidth: number, RegionHeight: number, width: number, height: number,
                                            desiredPixelFormat: number, done: Function) => {
      let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
      ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
      ndkTest.DecodingOptionsSetIndex(options, index);
      ndkTest.DecodingOptionsSetRotate(options, rotate);
      ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
      ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
      hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `set DecodingOptions success:${options}`)
      const targetFromat: Number = ndkTest.DecodingOptionsGetPixelFormat(options);
      if (targetFromat === desiredPixelFormat) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsFormat success:${targetFromat}`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsFormat failed:${targetFromat}`)
        expect(false).assertTrue();
      }

      const targetIndex: number = ndkTest.DecodingOptionsGetIndex(options);
      if (targetIndex === index) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsIndex success:${targetIndex}`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsIndex failed:${targetIndex}`)
        expect(false).assertTrue();
      }

      const targetRotate: number = ndkTest.DecodingOptionsGetRotate(options);
      if (targetRotate === rotate) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRotate success:${targetRotate}`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRotate failed:${targetRotate}`)
        expect(false).assertTrue();
      }

      const targetSize: image.Size = ndkTest.DecodingOptionsGetDesiredSize(options);
      if (Object.values(targetSize)[0] === width) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsWidth success`);
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsWidth failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetSize)[1] === height) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsHeight success`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsHeight failed`)
        expect(false).assertTrue();
      }

      const targetRegion: image.Region = ndkTest.DecodingOptionsGetDesiredRegion(options);
      if (Object.values(targetRegion)[0] === x) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsX success`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsX failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[1] === y) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsY success`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsY failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[2] === Regionwidth) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionwidth success`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionwidth failed`)
        expect(false).assertTrue();
      }
      if (Object.values(targetRegion)[3] === RegionHeight) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionHeight success`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get DecodingOptionsRegionHeight failed`)
        expect(false).assertTrue();
      }
      done();
    }

    const NDK_CreateFromRawFile = async (TAG: string, filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      resourceMgr.getRawFd(filename).then((rawFileDescriptor: resourceManager.RawFileDescriptor) => {
        let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
          rawFileDescriptor.offset, rawFileDescriptor.length);
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
          done();
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed:${imageSourceApi}`)
          expect(false).assertTrue();
          done();
        }
      }).catch((error: BusinessError) => {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source error: ${error.code}`)
        expect(false).assertTrue();
        done()
      })
    }

    const NDK_CreatePixelMapByRawFile = async (TAG: string, index: number, rotate: number, x: number, y: number, Regionwidth: number,
                                               RegionHeight: number, width: number, height: number, desiredPixelFormat: number,
                                               filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      const rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename)
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
        rawFileDescriptor.offset, rawFileDescriptor.length);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMap = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          ndkTest.PixelMapRelease(pixelMap);
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi)
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NDK_CreatePixelMapListByRawFile = async (TAG: string, index: number, rotate: number, x: number, y: number,
                                                   Regionwidth: number, RegionHeight: number, width: number, height: number,
                                                   desiredPixelFormat: number, filename: string, done: Function) => {
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager;
      const rawFileDescriptor: resourceManager.RawFileDescriptor = await resourceMgr.getRawFd(filename)
      let imageSourceApi: image.ImageSource = ndkTest.CreateFromRawFile(rawFileDescriptor.fd,
        rawFileDescriptor.offset, rawFileDescriptor.length);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetPixelFormat(options, desiredPixelFormat);
        ndkTest.DecodingOptionsSetIndex(options, index);
        ndkTest.DecodingOptionsSetRotate(options, rotate);
        ndkTest.DecodingOptionsSetDesiredSize(options, width, height);
        ndkTest.DecodingOptionsSetDesiredRegion(options, x, y, Regionwidth, RegionHeight);
        const pixelMapList = ndkTest.CreatePixelMapList(imageSourceApi, options)
        if (Array.isArray(pixelMapList)) {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList success :${pixelMapList}`)
          ndkTest.SourceRelease(imageSourceApi);
          pixelMapList.forEach((pixelMap) => {
            ndkTest.PixelMapRelease(pixelMap);
          });
          done()
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMapList failed: ${pixelMapList}`)
          expect(false).assertTrue();
          ndkTest.SourceRelease(imageSourceApi);
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const compResult = (res: Number, done: Function) => {
      if (res === -1 || res === 62980115 || res === 1) {
        expect(false).assertTrue();
        done()
      } else {
        done()
      }
    }

    const compResultC = (res: Number, done: Function) => {

      if (res !== 0) {
        done()
      } else {
        expect(false).assertTrue();
        done()
      }
    }

    const closeFile = (fileFd: number) => {
      try {
        fs.closeSync(fileFd)
      } catch (e) {
        console.log("close failed FD ", fileFd)

      }
    }


    const NDK_Packer = async (TAG: string, filename: string, done: Function, apiType: string, dataSource: string,
                              quality: number, mimeType: string, counterExample: boolean): Promise<void> => {

      hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} start`)
      const parker: image.ImagePacker = ndkTest.PackerCreate()
      hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} create packer `)
      if (parker) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} create packer success`)
        await getFd(filename);
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} getFd`)
        const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
        hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} imageSource ${imageSourceApi}`)
        if (imageSourceApi) {
          let packOpts: image.PackingOption = ndkTest.CreatePackingOptions()
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} createPackOpts ${imageSourceApi}`)
          const resQuality: number = ndkTest.PackingOptionsSetQuality(packOpts, quality)
          const resMimeType: number = ndkTest.PackingOptionsSetMimeType(packOpts, mimeType)
          ndkTest.PackingOptionsSetNeedsPackProperties(packOpts, 1)
          hilog.info(0x0000, 'scaleTest', '%{public}s', ` ${TAG} res1 res2 test ${resQuality} ${resMimeType}`)
          let res: number
          if (resQuality && resMimeType) {
            expect(false).assertTrue();
          }
          if (dataSource === "pixelMap") {
            const imagesource: image.ImageSource = ndkTest.CreateFromFd(fileFd)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} imageSource ${imagesource}`)
            const DecodingOptions: image.DecodingOptions = ndkTest.CreateDecodingOptions()
            const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imagesource, DecodingOptions)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} pixelMap ${pixelMap}`)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} packOpts ${packOpts}`)
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} parker ${parker}`)
            if (apiType === "packing") {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromPixelMap`)
              res = ndkTest.PackToDataFromPixelMap(parker, packOpts, pixelMap, outBuffer)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromPixelMap ${res}`)
            } else {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} .PackToFileFromPixelMap`)
              res = ndkTest.PackToFileFromPixelMap(parker, packOpts, pixelMap, fileFd)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} .PackToFileFromPixelMap ${res}`)
            }
            hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} 444 `)
          } else {
            if (apiType === "packing") {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromImageSource`)
              res = ndkTest.PackToDataFromImageSource(parker, packOpts, imageSourceApi, outBuffer)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToDataFromImageSource res  ${res}`)
            } else {
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToFileFromImageSource`)
              res = ndkTest.PackToFileFromImageSource(parker, packOpts, imageSourceApi, fileFd)
              hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} PackToFileFromImageSource ${res}`)
            }
          }
          closeFile(fileFd)
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} packresult ${res}`)
          if (counterExample) {
            return compResultC(res, done)
          }
          return compResult(res, done)
        } else {
          closeFile(fileFd)
          hilog.info(0x0000, 'scaleTest', '%{public}s', `${TAG} failed `)
          expect().assertFail()
          done()
        }
      } else {
        closeFile(fileFd)
        expect().assertFail()
        done();
      }
    }

    const CreatePixelMapByHdr = async (TAG: string, done: Function) => {
      await getBuffer("text.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredDynamicRange(options, 2);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let pixelmapDynamic: number = ndkTest.GetPixelMapDynamicRange(pixelMap);
          if (pixelmapDynamic != 0) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `CreatePixelMapByHdr pixelmapDynamic is not zero`)
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `CreatePixelMapByHdr pixelmapDynamic is zero`)
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const PixelMapToSdr = async (TAG: string, done: Function) => {
      await getBuffer("text.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredDynamicRange(options, 2);
        const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
        if (typeof pixelMap === "object") {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap success :${pixelMap}`)
          let pixelmapDynamic: number = ndkTest.GetPixelMapDynamicRange(pixelMap);
          if (pixelmapDynamic != 0) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `PixelMapToSdr pixelmapDynamic is not zero`)
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `PixelMapToSdr pixelmapDynamic is zero`)
            let res:number = ndkTest.PixelMapToSdr(pixelMap);
            expect(res == 0).assertTrue();
            ndkTest.SourceRelease(imageSourceApi);
            ndkTest.PixelMapRelease(pixelMap);
            done()
          }
        } else {
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `pixelMap failed: ${pixelMap}`)
          ndkTest.SourceRelease(imageSourceApi);
          expect(false).assertTrue();
          done()
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const DecodingOptionsDesiredDynamic = async (TAG: string, desiredDynamicRange: number, done: Function) => {
      let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
      ndkTest.DecodingOptionsSetDesiredDynamicRange(options, desiredDynamicRange);

      const targetDynamic: number = ndkTest.DecodingOptionsGetDesiredDynamicRange(options);
      if (targetDynamic === desiredDynamicRange) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange success:${targetDynamic}`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange failed:${targetDynamic}`)
        expect(false).assertTrue();
      }
      done();
    }

    const PackingOptionsDesiredDynamic = async (TAG: string, desiredDynamicRange: number, done: Function) => {
      let options: image.PackingOption = ndkTest.CreatePackingOptions();
      ndkTest.PackingOptionsSetDesiredDynamicRange(options, desiredDynamicRange);

      const targetDynamic: number = ndkTest.PackingOptionsGetDesiredDynamicRange(options);
      if (targetDynamic === desiredDynamicRange) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange success:${targetDynamic}`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get desiredDynamicRange failed:${targetDynamic}`)
        expect(false).assertTrue();
      }
      done();
    }

    const PackingOptionsNeedsPackProperties = async (TAG: string, needsPackProperties: number, done: Function) => {
      let options: image.PackingOption = ndkTest.CreatePackingOptions();
      ndkTest.PackingOptionsSetNeedsPackProperties(options, needsPackProperties);

      const target: number = ndkTest.PackingOptionsGetNeedsPackProperties(options);
      if (needsPackProperties === target) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get needsPackProperties success:${target}`)
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `Get needsPackProperties failed:${target}`)
        expect(false).assertTrue();
      }
      done();
    }

    const CheckImageSourceDynamicRange = async (TAG: string, done: Function) => {
      await getBuffer("test.jpg");
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromData(buffer);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let sourceDynamic:number = ndkTest.GetImageSourceDynamicRange(imageSourceApi);
        if (sourceDynamic != 0) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      } else {
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG + `create image source failed :${imageSourceApi}`)
        expect(false).assertTrue();
        done();
      }
    }

    const NATIVE_RegionDecode = async (TAG: string, RegionX: number, RegionY: number,
                                          RegionWidth: number, RegionHeight: number, desiredWidth: number, desiredHeight: number,
                                          filename: string, done: Function, cropStrategy?: number) => {
      await getFd(filename);
      const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
      if (typeof imageSourceApi === "object") {
        hilog.info(0x0000, 'Native_RegionDecodeTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`)
        let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
        ndkTest.DecodingOptionsSetDesiredSize(options, desiredWidth, desiredHeight);
        ndkTest.DecodingOptionsSetDesiredRegion(options, RegionX, RegionY, RegionWidth, RegionHeight);
        if (cropStrategy != undefined) {
          ndkTest.DecodingOptionsGetIndex(options);
          ndkTest.DecodingOptionsSetCropAndScaleStrategy(options, cropStrategy);
          const targetCropStrategy: number = ndkTest.DecodingOptionsGetCropAndScaleStrategy(options);
          expect(targetCropStrategy == cropStrategy).assertTrue();
        }
      const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
      if (typeof pixelMap === "object") {
        ndkTest.SourceRelease(imageSourceApi)
        ndkTest.PixelMapRelease(pixelMap);
        done()
      } else {
        ndkTest.SourceRelease(imageSourceApi);
        expect(false).assertTrue();
        done()
      }
    } else {
        expect(false).assertTrue();
        done()
    }
  }

  const NDK_GetImagePropertyWithNull = async (TAG: string, imageSourceApi: image.ImageSource, key:string, compareValue:string|undefined) => {
      let result = true
      const imagePropertyRes: String | number = ndkTest.NewGetImagePropertyWithNull(imageSourceApi, key)
      if(typeof imagePropertyRes === "string"){
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`image info success: ${imagePropertyRes}`)
        if(imagePropertyRes === compareValue){
          result = true
        }else{
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`compare value error, getValue: ${imagePropertyRes}, compareValue: ${compareValue}`)
          result = false
        }
      }else{
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`image info fail: ${imagePropertyRes}`)
        result = false
      }
      return result
    }

    const NewModifyImageProperty = async (TAG: string, imageSourceApi: image.ImageSource, key: string, modifyValue: string | undefined, value: string | undefined) => {
      let result = true
      const imagePropertyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, key, modifyValue)
      if(imagePropertyRes === 0){
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`modify image info success: ${imagePropertyRes}`)
        const imagePropertyRes0: String | number = ndkTest.NewGetImagePropertyWithNull(imageSourceApi, key)
        if(typeof imagePropertyRes0 === "string"){
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`get image info success: ${imagePropertyRes0}`)
          if(imagePropertyRes0 === value){
            result = true
          }else{
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`compare value error, getValue: ${imagePropertyRes0}, compareValue: ${value}`)
            result = false
          }
        }else{
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`get info fail: ${imagePropertyRes0}`)
          result = false
        }
      }else{
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`modify image info fail: ${imagePropertyRes}`)
        result = false
      }
      return result
    }

    const NewModifyImagePropertyErr = async (TAG: string, imageSourceApi: image.ImageSource, key: string, modifyValue: string | undefined) => {
      let result = true
      const imagePropertyRes0: String | number = ndkTest.NewGetImagePropertyWithNull(imageSourceApi, key)
      hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`get image info success: ${imagePropertyRes0}`)

      const imagePropertyRes: Number = ndkTest.ModifyImageProperty(imageSourceApi, key, modifyValue)
      if(imagePropertyRes === 401){
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`modify image info error: ${imagePropertyRes}`)
        const imagePropertyRes1: String | number = ndkTest.NewGetImagePropertyWithNull(imageSourceApi, key)
        if(typeof imagePropertyRes1 === "string"){
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`get image info success: ${imagePropertyRes1}`)
          if(imagePropertyRes0 === imagePropertyRes1){
            result = true
          }else{
            hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`compare value error, getValue: ${imagePropertyRes1}, compareValue: ${imagePropertyRes0}`)
            result = false
          }
        }else{
          hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`get info fail: ${imagePropertyRes1}`)
          result = false
        }
      }else{
        hilog.info(0x0000, 'scaleTest', '%{public}s', TAG+`modify image info fail: ${imagePropertyRes}`)
        result = false
      }
      return result
    }

    const testNewGetMimeTypeWithNull = async (mimeType: string, testTag: string, done: Function) => {
      let packingOps: image.PackingOption = ndkTest.CreatePackingOptions();
      let res: number = ndkTest.PackingOptionsSetMimeType(packingOps, mimeType);
      if(res){
        hilog.info(domain, testTag, `PackingOptionsSetMimeType fail`);
        expect(false).assertTrue();
        done();
        return
      }
      let res1: String | Number = ndkTest.NewPackingOptionsGetMimeType(packingOps);
      await ndkTest.ReleasePackingOptions(packingOps)
      if(typeof res1 === "string"){
        if(res1 != mimeType){
          hilog.info(domain, testTag, `NewPackingOptionsGetMimeType res: ` + res1);
          expect(false).assertTrue();
          done();
          return
        }
        done();
      } else{
          hilog.info(domain, testTag, `NewPackingOptionsGetMimeType fail`);
          expect(false).assertTrue();
          done();
      }
    }

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0100
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0100', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0200
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0200', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0300
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0300', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0400
     * @tc.name      : testInitializationOptions
     * @tc.desc      : 1.testInitializationOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptions_0400', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testInitializationOptions(6, 4, 3, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0100
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0100', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0200
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0200', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0300
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0300', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0400
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0400', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 3, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0500
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0500', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0600
     * @tc.name      : testCreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0600', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 1)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0700
     * @tc.name      : testICreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0700', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 2)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0800
     * @tc.name      : testICreatePixelmap
     * @tc.desc      : 1.testCreatePixelmap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmap_0800', Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelmap(6, 4, 4, 3)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_ReadPixels_0100
     * @tc.name      : testReadPixels
     * @tc.desc      : 1.testReadPixels
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_ReadPixels_0100', Level.LEVEL0, (done: Function) => {
      let pixelmapResult: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(pixelmapResult).assertEqual(0)
      let readBuffer = new ArrayBuffer(96);
      let result: number = ndkTest.testReadPixels(readBuffer)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_WritePixels_0100
     * @tc.name      : testWritePixels
     * @tc.desc      : 1.testWritePixels
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_WritePixels_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let result: number = ndkTest.testWritePixels(color)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_GetImageInfo_0100
     * @tc.name      : testGetImageInfo
     * @tc.desc      : 1.testGetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_GetImageInfo_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let imageInfo: IImageInfo = ndkTest.testGetImageInfo()
      hilog.info(0x0000, 'testTag', '%{public}s', `imageInfo:${JSON.stringify(imageInfo)}`);
      expect(imageInfo).not().assertNull();
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Opacity_0100
     * @tc.name      : testOpacity
     * @tc.desc      : 1.testOpacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Opacity_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testOpacity(90)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Scale_0100
    * @tc.name      : testScale
    * @tc.desc      : 1.testScale
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Scale_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testScale(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Translate_0100
    * @tc.name      : testTranslate
    * @tc.desc      : 1.testTranslate
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Translate_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testTranslate(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Rotate_0100
    * @tc.name      : testRotate
    * @tc.desc      : 1.testRotate
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 3
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Rotate_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testRotate(90.0)
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Flip_0100
     * @tc.name      : testFlip
     * @tc.desc      : 1.testFlip
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Flip_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testFlip(true, true)
      expect(result).assertEqual(0)
      done();
    })

    /*
   * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Crop_0100
   * @tc.name      : testCrop
   * @tc.desc      : 1.testCrop
   * @tc.size      : MediumTest
   * @tc.type      : Function
   * @tc.level     : Level 3
   */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Crop_0100', Level.LEVEL0, (done: Function) => {
      let resultPixelmap: number = ndkTest.testCreatePixelmap(6, 4, 3, 1)
      expect(resultPixelmap).assertEqual(0)
      let result: number = ndkTest.testCrop(100, 100, 100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0100"
      try {
        await NDK_CreateFromUri(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0200'
      try {
        await NDK_CreateFromUri(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0300'
      try {
        await NDK_CreateFromUri(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0400"
      try {
        await NDK_CreateFromUri(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0500'
      try {
        await NDK_CreateFromUri(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0600'
      try {
        await NDK_CreateFromUri(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0700'
      try {
        await NDK_CreateFromUri(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800
     * @tc.name      : createImageSourceFromUri
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_URI_0800'
      try {
        await NDK_CreateFromUri(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0100'
      try {
        await NDK_CreateFromFd(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0200'
      try {
        await NDK_CreateFromFd(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0300'
      try {
        await NDK_CreateFromFd(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0400'
      try {
        await NDK_CreateFromFd(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0500'
      try {
        await NDK_CreateFromFd(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0600'
      try {
        await NDK_CreateFromFd(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0700'
      try {
        await NDK_CreateFromFd(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800
     * @tc.name      : createImageSourceFromFd
     * @tc.desc      : 1.get image fileFd
     *                 2.createImageSourceFromFd
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_FD_0800'
      try {
        await NDK_CreateFromFd(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0100'
      try {
        await NDK_CreateFromData(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0200'
      try {
        await NDK_CreateFromData(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0300"
      try {
        await NDK_CreateFromData(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0400'
      try {
        await NDK_CreateFromData(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0500'
      try {
        await NDK_CreateFromData(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0600'
      try {
        await NDK_CreateFromData(testTag, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0700"
      try {
        await NDK_CreateFromData(testTag, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800
     * @tc.name      : createImageSourceFromBuffer
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_BUFFER_0800'
      try {
        await NDK_CreateFromData(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_WITH_USER_BUFFER_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_WITH_USER_BUFFER_0100
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceWithUserBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_WITH_USER_BUFFER_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_WITH_USER_BUFFER_0100'
      try {
        await NDK_CreateFromDataWithUserBuffer(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0100'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0200'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0300'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0400'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0500'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0600'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0700'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYURI_0800'
      try {
        await NDK_CreatePixelMapByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_0900', "uri", "test5.jpg", 480, 360, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYURI_1000', "uri", "test7.png", 550, 550, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0100'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0200'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0300'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0400'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0500'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0600'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0700'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYFD_0800'
      try {
        await NDK_CreatePixelMapByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_0900', "Fd", "test6.gif", 480, 270, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYFD_1000', "Fd", "test8.bmp", 959, 959, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0100'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0200'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0300'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0400'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0500'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0600'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0700'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUNDK_SOURCENDK_CREATE_BYDATA_0800'
      try {
        await NDK_CreatePixelMapByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_0900', "Buffer", "test.webp", 1212, 681, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BYDATA_1000', "Buffer", "test.arw", 3074, 2728, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYURI_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYURI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYURI_0100'
      try {
        await NDK_CreatePixelMapListByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYURI_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromUri,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYURI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYURI_0100'
      try {
        await NDK_CreatePixelMapListByUri(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYFD_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYFD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYFD_0100'
      try {
        await NDK_CreatePixelMapListByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYFD_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYFD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYFD_0100'
      try {
        await NDK_CreatePixelMapListByFd(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYDATA_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYDATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'GIF_CREATE_RGBA8888LIST_BYDATA_0100'
      try {
        await NDK_CreatePixelMapListByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYDATA_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromData,3.CreateDecodingOptions,4.DecodingOptionsSetFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYDATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'WEBP_CREATE_RGBA8888LIST_BYDATA_0100'
      try {
        await NDK_CreatePixelMapListByData(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3,
          "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0100'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0200'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300
     * @tc.name      : GetDelayTime
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_DELAY_TIME_0300'
      try {
        await NDK_GetDelayTime(testTag, "test6.gif", "Buffer", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0100'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0200'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0300'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0400'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0500'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0600'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0700'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_URI_0800'
      try {
        await NDK_GetImageInfoByUri(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0100'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0200'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0300'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0400'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0500'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0600'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0700'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_FD_0800'
      try {
        await NDK_GetImageInfoByFd(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0100'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0200'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0300'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0400'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0500'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0600'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0700'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800
     * @tc.name      : GetImageInfo
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.GetImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_INFO_DATA_0800'
      try {
        await NDK_GetImageInfoByData(testTag, 0, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100'
      try {
        await NDK_GetImageProperty(testTag, "test_exif_v2.jpg", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200'
      try {
        await NDK_GetImageProperty(testTag, "test_exif_v2.jpg", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_URI_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.ModifyImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_URI_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'MODIFY_IMAGE_PROPERTY_URI_0100'
      try {
        await NDK_ModifyImagePropertyByUri(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_FD_0100
     * @tc.name      : GetImageProperty
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.ModifyImageProperty
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_FD_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'MODIFY_IMAGE_PROPERTY_FD_0100'
      try {
        await NDK_ModifyImagePropertyByFd(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100
     * @tc.name      : GetFrameCount
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromUri
     *                 3.GetFrameCount
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0100'
      try {
        await NDK_GetFrameCount(testTag, "test6.gif", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200
     * @tc.name      : GetFrameCount
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.GetFrameCount
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_FRAME_COUNT_0200'
      try {
        await NDK_GetFrameCount(testTag, "test6.gif", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromuri
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0100'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Uri", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromFd
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0200'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Fd", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300
     * @tc.name      : SourceRelease
     * @tc.desc      : 1.get image path
     *                 2.createImageSourceFromData
     *                 3.SourceRelease
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCERELEASE_0300'
      try {
        await NDK_SourceRelease(testTag, "test5.jpg", "Buffer", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100
     * @tc.name      : NDK_GetImageInfoByOption
     * @tc.desc      : 1.CreateDecodingOptions,2.DecodingOptionsSetPixelFormat,3.DecodingOptionsSetIndex,
     *                 4.DecodingOptionsSetRotate,5.DecodingOptionsSetDesiredSize,6.DecodingOptionsSetDesiredRegion,
     *                 7.DecodingOptionsGetPixelFormat,8.DecodingOptionsGetIndex9.DecodingOptionsGetRotate,
     *                 10.DecodingOptionsGetDesiredSize,11.DecodingOptionsGetDesiredRegion
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100'
      try {
        await NDK_GetImageInfoByOption('SUB_MULTIMEDIA_IMAGE_NDK_GETIMAGEINFOBYOPTION_TO_RGBA8888_0100', 0, 90, 0, 0, 100,
          200, 400, 600, 3, done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.ndkTest.Create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100', Level.LEVEL0, async (done: Function) => {
      try {
        const parker: image.ImagePacker = ndkTest.PackerCreate()
        if (parker) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_CREATE_0100:${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.ndkTest.Create
     2.ndkTest.Release
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      try {
        const parker: image.ImagePacker = ndkTest.PackerCreate()
        if (parker) {
          const release: number = ndkTest.PackerRelease(parker)
          if (release != undefined) {
            hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100 success`)
            done()
          } else {
            hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100 failed: `)
            expect(false).assertTrue();
            done()
          }
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, 'scaleTest', '%{public}s', `SUB_MULTIMEDIA_IMAGE_NDK_PACKING_RELEASE_0100:${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndke
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100,
          "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 100,
          "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0300", "test5.jpg", done, "packing", "imageSource", 10,
          "image/jpeg", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0400"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10, "image/jpeg", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0500"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0600", "test5.jpg", done, "packing", "pixelMap", 100,
          "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0700", "test5.jpg", done, "packing", "imageSource", 10,
          "image/webp", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0800"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10,
          "image/webp", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900"
      try {
        await NDK_Packer("SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_0900", "test5.jpg", done, "packing", "imageSource", 100,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01000"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 100,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "pixelMap", 10,
          "image/png", true)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACKING_JPG_01200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packing", "imageSource", 10,
          "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0300"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile",
          "imageSource", 10, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0400"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/jpeg", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0500"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0600"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0700"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          10, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0800"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/webp", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_0900"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "imageSource",
          100, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01000"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          100, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01100"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile",
          "imageSource", 10, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200
     * @tc.name      : sub_multimedia_image_imagepackendk_packing
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_PACK_TO_FILE_JPG_01200"
      try {
        await NDK_Packer(testTag, "test5.jpg", done, "packToFile", "pixelMap",
          10, "image/png", false)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0100'
      try {
        await NDK_CreateFromRawFile(testTag, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0200'
      try {
        await NDK_CreateFromRawFile(testTag, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0300'
      try {
        await NDK_CreateFromRawFile(testTag, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0400'
      try {
        await NDK_CreateFromRawFile(testTag, "test8.bmp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0500'
      try {
        await NDK_CreateFromRawFile(testTag, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0600'
      try {
        await NDK_CreateFromRawFile(testTag, "test.arw", done);
      }catch(error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0700'
      try {
        await NDK_CreateFromRawFile(testTag, "docx.ico", done);
      }catch(error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800
     * @tc.name      : createImageSourceFromRawFile
     * @tc.desc      : 1.get testPng.buffer
     *                 2.createImageSourceFromRawFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_BY_RAWFILE_0800'
      try {
        await NDK_CreateFromRawFile(testTag, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0100"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test5.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0200"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test7.png", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0300"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0400"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test8.bmp", done);
      }catch (error){
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0500"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600", Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0600"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.arw", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0700"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "docx.ico", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMap
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0800"
      try {
        await NDK_CreatePixelMapByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "SVG.svg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_0900', "RawFile", "docx.ico", 512, 512, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000
     * @tc.name      : CreatePixelMap
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreatePixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000", Level.LEVEL0, async (done: Function) => {
      await NDK_CreatePixelMap('SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_CREATE_RAWFILE_1000', "RawFile", "SVG.svg", 1593, 1594, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_GIF_CREATE_RGBA8888LIST_BYRAWFILE_0100"
      try {
        await NDK_CreatePixelMapListByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test6.gif", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100
     * @tc.name      : CreatePixelMapList
     * @tc.desc      : 1.getimagepath,2.createImageSourceFromRawFile,3.CreateDecodingOptions,4.DecodingOptionsSetPixelFormat，
     *                 5.DecodingOptionsSetIndex,6.DecodingOptionsSetRotate,7.DecodingOptionsSetDesiredSize,
     *                 8.DecodingOptionsSetDesiredRegion,9.CreatePixelMapList
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NDK_SOURCENDK_WEBP_CREATE_RGBA8888LIST_BYRAWFILE_0100"
      try {
        await NDK_CreatePixelMapListByRawFile(testTag, 0, 90, 0, 0, 100, 200, 400, 600, 3, "test.webp", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100
     * @tc.name      : sub_multimedia_image_create_hdr
     * @tc.desc      : 1.hdr pixelMap create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_CREATE_HDR_0100"
      try {
        await CreatePixelMapByHdr(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100
     * @tc.name      : sub_multimedia_pixelmap_tosdr
     * @tc.desc      : 1.hdr pixelMap create
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_PIXELMAP_TOSDR_0100"
      try {
        await PixelMapToSdr(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_get_decoding_dynamicrange_options
     * @tc.desc      : 1.decodingOptions dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0100"
      try {
        await DecodingOptionsDesiredDynamic(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_get_packing_dynamicrange_options
     * @tc.desc      : 1.packingOptions dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0100"
      try {
        await PackingOptionsDesiredDynamic(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100
     * @tc.name      : sub_multimedia_image_check_imagesource_dynamicrange
     * @tc.desc      : 1.imagesource_dynamicrange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_CHECK_IMAGESOURCE_DYNAMICRANGE_0100"
      try {
        await CheckImageSourceDynamicRange(testTag, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100
     * @tc.name      : sub_multimedia_image_get_packing_needs_pack_properties_options
     * @tc.desc      : 1.packingOptions needsPackProperties
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_NEEDSPACKPROPERTIES_0100"
      try {
        await PackingOptionsNeedsPackProperties(testTag, 1, done)
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0100'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0200'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done, image.CropAndScaleStrategy.SCALE_FIRST);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize,
                      5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300", 0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_REGIONDECODE_0300'
      try {
        let desiredSize: image.Size = { width: 960, height: 1440 };
        let desiredRegionSize: image.Size = { width: 800, height: 800 };
        let desiredRegion: image.Region = { size: desiredRegionSize, x: 0, y: 0 };
        await NATIVE_RegionDecode(testTag, desiredRegion.x, desiredRegion.y, desiredRegionSize.width, desiredRegionSize.height,
        desiredSize.width, desiredSize.height, "jpeg_test_1440x1920.jpg", done, image.CropAndScaleStrategy.CROP_FIRST);
      } catch (error) {
        hilog.info(0x0000, testTag, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_SET_AND_GET_CROP_REGION_0100
     * @tc.name     : CreatePixelMap
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetCropRegion,
                      5.DecodingOptionsGetCropRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_SET_CROP_REGION_0100", Level.LEVEL0, async (done: Function) => {
      const TAG = 'SUB_MULTIMEDIA_IMAGE_NATIVE_SET_CROP_REGION_0100'
      let cropRegionSize: image.Size = { width: 800, height: 800 };
      let cropRegion: image.Region = { size: cropRegionSize, x: 0, y: 0 };
      try {
        await getFd("jpeg_test_1440x1920.jpg");
        const imageSourceApi: image.ImageSource = ndkTest.CreateFromFd(fileFd);
        if (typeof imageSourceApi === "object") {
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `create image source success:${imageSourceApi}`);
          let options: image.DecodingOptions = ndkTest.CreateDecodingOptions();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `create image decodingOptions success`);
          ndkTest.DecodingOptionsSetCropRegion(options, cropRegion.x, cropRegion.y, cropRegionSize.width, cropRegionSize.height);
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `set image Crop Region success`);
          let getCropRegion = ndkTest.DecodingOptionsGetCropRegion(options);
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `get image Crop Region success:${JSON.stringify(getCropRegion)}`);
          expect(Object.values(getCropRegion)[0] === cropRegion.x).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `x is equal:${Object.values(getCropRegion)[0]}`);
          expect(Object.values(getCropRegion)[1] === cropRegion.y).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `y is equal:${Object.values(getCropRegion)[1]}`);
          expect(Object.values(getCropRegion)[2] === cropRegionSize.width).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `width is equal:${Object.values(getCropRegion)[2]}`);
          expect(Object.values(getCropRegion)[3] === cropRegionSize.height).assertTrue();
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `height is equal:${Object.values(getCropRegion)[3]}`);
          const pixelMap: image.PixelMap | number = ndkTest.CreatePixelMap(imageSourceApi, options)
          if (typeof pixelMap === "object") {
            ndkTest.SourceRelease(imageSourceApi)
            ndkTest.PixelMapRelease(pixelMap);
            done()
          } else {
            ndkTest.SourceRelease(imageSourceApi);
            expect(false).assertTrue();
            done()
          }
        } else {
          hilog.info(0x0000, 'Native_SetCropRegionTest', '%{public}s', TAG + `create image source fail:${imageSourceApi}`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.info(0x0000, TAG, `Test exception  ` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_GET_PROPERTY_WITH_NULL_0100
     * @tc.name     : GetPropertyWithNull
     * @tc.desc     : 1.check getproperty equal to setProperty
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_GET_PROPERTY_WITH_NULL_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_GET_PROPERTY_WITH_NULL_0100';
      let res = ndkTest.GetPropertyWithNull();
      expect(res == 0).assertTrue();
      hilog.info(0x0000, testTag, `GetPropertyWithNull success`);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_GET_MIMETYPE_WITH_NULL_0100
     * @tc.name     : GetMimeTypeWithNull
     * @tc.desc     : 1.check getMimeType equal to setMimeType
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_GET_MIMETYPE_WITH_NULL_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_GET_MIMETYPE_WITH_NULL_0100';
      let res = ndkTest.GetMimeTypeWithNull();
      expect(res == 0).assertTrue();
      hilog.info(0x0000, testTag, `GetMimeTypeWithNull success`);
      done();
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NATIVE_GET_IMAGE_PROPERTY_WITH_NULL_0100
     * @tc.name     : GetImagePropertyWithNull
     * @tc.desc     : 1.check GetImageProperty equal to picture's exif
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_NATIVE_GET_IMAGE_PROPERTY_WITH_NULL_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NATIVE_GET_IMAGE_PROPERTY_WITH_NULL_0100';
      await getFd("JpegFragmentMap.jpg");
      let res = ndkTest.GetImagePropertyWithNull(fileFd);
      expect(res == 0).assertTrue();
      hilog.info(0x0000, testTag, `GetImagePropertyWithNull success`);
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.desc      : 1.test Image getDecodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_0100";
      const srcSupportedFormatsList: Array<string> = await ndkTest.GetImageSourceSupportedFormats();
      const dstSupportedFormatsList: Array<string> = image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats;
      hilog.info(0x0000, testTag, `srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
      hilog.info(0x0000, testTag, `dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
      const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
      hilog.info(0x0000, testTag, "compare result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100
     * @tc.desc      : 1.test Image getEncodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_0100";
      const srcSupportedFormatsList: Array<string> = await ndkTest.GetImagePackerSupportedFormats();
      const dstSupportedFormatsList: Array<string> = image.createImagePacker().supportedFormats;
      hilog.info(0x0000, testTag, `srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
      hilog.info(0x0000, testTag, `dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
      const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
      hilog.info(0x0000, testTag, "compare result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.desc      : 1.test Image getDecodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100";
      const PARA_ERROR_CODE = 7700204;
      const ret: number = ndkTest.GetImageSourceSupportedFormatsError(true);
      hilog.info(0x0000, testTag, "GetImageSourceSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.desc      : 1.test Image getDecodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200";
      const PARA_ERROR_CODE = 7700204;
      const ret: number = ndkTest.GetImageSourceSupportedFormatsError(false);
      hilog.info(0x0000, testTag, "GetImageSourceSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100
     * @tc.desc      : 1.test Image getEncodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0100";
      const PARA_ERROR_CODE = 7800202;
      const ret: number = ndkTest.GetImagePackerSupportedFormatsError(true);
      hilog.info(0x0000, testTag, "GetImagePackerSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200
     * @tc.desc      : 1.test Image getEncodeSupportedFormats
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_NATIVE_ERROR_0200";
      const PARA_ERROR_CODE = 7800202;
      const ret: number = ndkTest.GetImagePackerSupportedFormatsError(false);
      hilog.info(0x0000, testTag, "GetImagePackerSupportedFormatsError result is: " + ret);
      expect(ret == PARA_ERROR_CODE).assertTrue();
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0100
     * @tc.desc      : 1.test Image getQuality
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0100', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0100";
      try {
        let packingOpts:image.PackingOption = ndkTest.CreatePackingOptions();
        const setQuality:number=ndkTest.PackingOptionsSetQuality(packingOpts,30);
        if(setQuality){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error` + setQuality);
          expect(false).assertTrue();
          done();
        }
        const resQuality:number=ndkTest.PackingOptionsGetQuality(packingOpts);
        if (resQuality!=30){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0200
     * @tc.desc      : 1.test Image getQuality
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0200', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0200";
      try {
        let packingOpts:image.PackingOption = ndkTest.CreatePackingOptions();
        const setQuality:number=ndkTest.PackingOptionsSetQuality(packingOpts,60);
        if(setQuality){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error` + setQuality);
          expect(false).assertTrue();
          done();
        }
        const resQuality:number=ndkTest.PackingOptionsGetQuality(packingOpts);
        if (resQuality!=60){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0300
     * @tc.desc      : 1.test Image getQuality
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0300', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0300";
      try {
        let packingOpts:image.PackingOption = ndkTest.CreatePackingOptions();
        const setQuality:number=ndkTest.PackingOptionsSetQuality(packingOpts,50);
        if(setQuality){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error` + setQuality);
          expect(false).assertTrue();
          done();
        }
        const resQuality:number=ndkTest.PackingOptionsGetQuality(packingOpts);
        if (resQuality!=50){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0400
     * @tc.desc      : 1.test Image getQuality
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0400', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0400";
      try {
        let packingOpts:image.PackingOption = ndkTest.CreatePackingOptions();
        const setQuality:number=ndkTest.PackingOptionsSetQuality(packingOpts,90);
        if(setQuality){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error` + setQuality);
          expect(false).assertTrue();
          done();
        }
        const resQuality:number=ndkTest.PackingOptionsGetQuality(packingOpts);
        if (resQuality!=90){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0500
     * @tc.desc      : 1.test Image getQuality
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0500', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0500";
      try {
        let packingOpts:image.PackingOption = ndkTest.CreatePackingOptions();
        const setQuality:number=ndkTest.PackingOptionsSetQuality(packingOpts,100);
        if(setQuality){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error` + setQuality);
          expect(false).assertTrue();
          done();
        }
        const resQuality:number=ndkTest.PackingOptionsGetQuality(packingOpts);
        if (resQuality!=100){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0600
     * @tc.desc      : 1.test Image getQuality
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0600', Level.LEVEL0, async (done: Function) => {
      let testTag = "SUB_MULTIMEDIA_IMAGE_GET_QUALITY_0600";
      try {
        let packingOpts:image.PackingOption = ndkTest.CreatePackingOptions();
        const setQuality:number=ndkTest.PackingOptionsSetQuality(packingOpts,0);
        if(setQuality){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error` + setQuality);
          expect(false).assertTrue();
          done();
        }
        const resQuality:number=ndkTest.PackingOptionsGetQuality(packingOpts);
        if (resQuality!=0){
          hilog.info(domain, testTag, `PackingOptionsSetQuality error`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0100';
      const filename = 'test_exif_v2.jpg'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < Data.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].jpegData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0200';
      const filename = 'test_exif_v2.jpg'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      try {
        for(let j = 0; j < Data.length; j++){
          const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].jpegData);
          if(!checkResult){
            ndkTest.SourceRelease(imageSourceApi)
            expect().assertFail()
            done()
            return
          }
        }
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0300';
      const filename = 'test_exif_v2.webp'
      const filename1 = 'test_webp_exif.webp'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      let imageSourceApi1: image.ImageSource = await getImageSource(filename1, 'Fd')
      let testData: string | undefined;
      let imageSource: image.ImageSource;
      try {
        for(let j = 0; j < Data.length; j++){
          if(Data[j].webpData){
            testData = Data[j].webpData
            imageSource = imageSourceApi
          }else{
            testData = Data[j].webpData0
            imageSource = imageSourceApi1
          }
          const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSource, Data[j].key, testData);
          if(!checkResult){
            closeFile(fileFd)
            ndkTest.SourceRelease(imageSourceApi)
            ndkTest.SourceRelease(imageSourceApi1)
            expect().assertFail()
            done()
            return
          }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        ndkTest.SourceRelease(imageSourceApi1)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0400';
      const filename = 'test_exif_v2.webp'
      const filename1 = 'test_webp_exif.webp'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      let imageSourceApi1: image.ImageSource = await getImageSource(filename1, 'Uri')
      let testData: string | undefined;
      let imageSource: image.ImageSource;
      try {
        for(let j = 0; j < Data.length; j++){
          if(Data[j].webpData){
            testData = Data[j].webpData
            imageSource = imageSourceApi
          }else{
            testData = Data[j].webpData0
            imageSource = imageSourceApi1
          }
          const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSource, Data[j].key, testData);
          if(!checkResult){
            ndkTest.SourceRelease(imageSourceApi)
            ndkTest.SourceRelease(imageSourceApi1)
            expect().assertFail()
            done()
            return
          }
        }
        ndkTest.SourceRelease(imageSourceApi)
        ndkTest.SourceRelease(imageSourceApi1)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0500';
      const filename = 'test_exif_v2.png'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < Data.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].pngData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0600';
      const filename = 'test_exif_v2.png'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      try {
        for(let j = 0; j < Data.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].pngData);
            if(!checkResult){
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0700
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0700';
      const filename = 'test_exif_v2.dng'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < Data.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].dngData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0800
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0800';
      const filename = 'test_exif_v2.dng'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      try {
        for(let j = 0; j < Data.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].dngData);
            if(!checkResult){
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0900
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_0900';
      const filename = 'test_exif_v2.heic'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < Data.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].heifData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1000
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1000';
      const filename = 'test_exif_v2.heic'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      try {
        for(let j = 0; j < Data.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data[j].key, Data[j].heifData);
            if(!checkResult){
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.getImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_GET_IMAGE_PROPERTY_1100';
      const filename = 'test_exif_v4.jpg'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < Data0.length; j++){
            const checkResult = await NDK_GetImagePropertyWithNull(testTag, imageSourceApi, Data0[j].key, Data0[j].jpegData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.modify ImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0100';
      const filename = 'test_exif_v3.jpg'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < ModifyData.length; j++){
            const checkResult = await NewModifyImageProperty(testTag, imageSourceApi, ModifyData[j].key, ModifyData[j].modifyData, ModifyData[j].compareData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0300
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.modify ImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0300';
      const filename = 'test_exif_v3.png'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < ModifyData.length; j++){
            const checkResult = await NewModifyImageProperty(testTag, imageSourceApi, ModifyData[j].key, ModifyData[j].modifyData, ModifyData[j].compareData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0400
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.modify ImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0400';
      const filename = 'test_exif_v3.dng'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < ModifyData.length; j++){
            const checkResult = await NewModifyImageProperty(testTag, imageSourceApi, ModifyData[j].key, ModifyData[j].modifyData, ModifyData[j].compareData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0500
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.modify ImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0500';
      const filename = 'test_exif_v3.heic'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Fd')
      try {
        for(let j = 0; j < ModifyData.length; j++){
            const checkResult = await NewModifyImageProperty(testTag, imageSourceApi, ModifyData[j].key, ModifyData[j].modifyData, ModifyData[j].compareData);
            if(!checkResult){
              closeFile(fileFd)
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        closeFile(fileFd)
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        closeFile(fileFd)
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0600
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.modify ImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_0600';
      const filename = 'test_exif_v3.heic'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      try {
        for(let j = 0; j < ModifyData.length; j++){
            const checkResult = await NewModifyImageProperty(testTag, imageSourceApi, ModifyData[j].key, ModifyData[j].modifyData, ModifyData[j].compareData);
            if(!checkResult){
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
        }
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0100
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.modify ImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0100';
      const filename = 'test_exif_v3.jpg'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      const errData = ['++++', 'afefefe', 'efeaef54515', ''];
      try {
        for(let j = 0; j < ModifyData.length; j++){
          if(ModifyData[j].canSetAny != true){
            for(let k = 0; k < errData.length; k++){
              const checkResult = await NewModifyImagePropertyErr(testTag, imageSourceApi, ModifyData[j].key, errData[k]);
              if(!checkResult){
                ndkTest.SourceRelease(imageSourceApi)
                expect().assertFail()
                done()
                return
              }
            }
          }
        }
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0200
     * @tc.desc      : 1.createImageSource（by Fd/Uri）
     *                 2.modify ImageProperty
     *				         3.compare value
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NDK_MODIFY_IMAGE_PROPERTY_ERR_0200';
      const filename = 'test_exif_v2.heic'
      let imageSourceApi: image.ImageSource = await getImageSource(filename, 'Uri')
      try {
        for(let j = 0; j < Data.length; j++){
          if(Data[j].onlyRead == true){
            const checkResult = await NewModifyImagePropertyErr(testTag, imageSourceApi, Data[j].key, Data[j].heifData);
            if(!checkResult){
              ndkTest.SourceRelease(imageSourceApi)
              expect().assertFail()
              done()
              return
            }
          }
        }
        ndkTest.SourceRelease(imageSourceApi)
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `createImageSource error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0100
     * @tc.desc     : 1.create packingOptions
     * 				  2.setMimeType
     * 				  3.check getMimeType is equal to setMimeType
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0100';
      let mimeType = "image/jpeg";
      try{
        await testNewGetMimeTypeWithNull(mimeType, testTag, done);
      } catch(e){
        hilog.info(domain, testTag, `Test exception: ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0200
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0200
     * @tc.desc     : 1.create packingOptions
     * 				  2.setMimeType
     * 				  3.check getMimeType is equal to setMimeType
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0200", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0200';
      let mimeType = "image/heif";
      try{
        await testNewGetMimeTypeWithNull(mimeType, testTag, done);
      } catch(e){
        hilog.info(domain, testTag, `Test exception: ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0300
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0300
     * @tc.desc     : 1.create packingOptions
     * 				  2.setMimeType
     * 				  3.check getMimeType is equal to setMimeType
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0300", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_GET_MIMETYPE_WITH_NULL_0300';
      let mimeType = "IMAGE/jpeg";
      try{
        await testNewGetMimeTypeWithNull(mimeType, testTag, done);
      } catch(e){
        hilog.info(domain, testTag, `Test exception: ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SET_MIMETYPE_ERROR_0100
     * @tc.name     : SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SET_MIMETYPE_ERROR_0100
     * @tc.desc     : 1.create packingOptions
     * 				        2.setMimeType null
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SET_MIMETYPE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_PACKINGOPTIONS_SET_MIMETYPE_ERROR_0100';
      let mimeType = ""
      try{
        let packingOps: image.PackingOption = ndkTest.CreatePackingOptions();
        let res: number = ndkTest.PackingOptionsSetMimeType(packingOps, mimeType);
        if(res != 401){
          hilog.info(domain, testTag, `PackingOptionsSetMimeType test errorCode fail`);
          expect(false).assertTrue();
          done();
          return
        }
        done();
      } catch(e){
        hilog.info(domain, testTag, `Test exception: ` + e);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0200
     * @tc.desc      : 1.decodingOptions get dynamicRange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0200"
      try {
        await DecodingOptionsDesiredDynamic(testTag, 0, done)
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })
	
	  /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0300
     * @tc.desc      : 1.decodingOptions get dynamicRange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_DECODINGOPTIONS_DYNAMICRANGE_0300"
      try {
        await DecodingOptionsDesiredDynamic(testTag, 2, done)
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })
	
	  /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0200
     * @tc.desc      : 1.packingOptions get dynamicRange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0200"
      try {
        await PackingOptionsDesiredDynamic(testTag, 0, done)
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })
	
	  /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0300
     * @tc.desc      : 1.packingOptions get dynamicRange
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_GET_PACKINGOPTIONS_DYNAMICRANGE_0300"
      try {
        await PackingOptionsDesiredDynamic(testTag, 2, done)
      } catch (error) {
        hilog.info(domain, testTag, `Test exception ` + error);
        expect().assertFail();
        done();
      }
    })

  })
}
