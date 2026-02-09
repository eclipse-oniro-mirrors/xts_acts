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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import ndkTest from 'libPictureNdk.so';
import image from "@ohos.multimedia.image";
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import { BusinessError } from '@kit.BasicServicesKit';

import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';

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
const testTag = 'pictureNdkTest';
const testFileJpg = 'JPEGISOSingle.jpg';
const testFileHeic = 'HEIFISOMultiChannelBaseColor0512V12.heic';
const testNoAuxiliaryPictureJpg = 'test.jpg';
const testFileWithFiveAuxiliaryPictureJpg = 'AllAuxiliaryPictures_exclude_fragment.jpg';
const testFileWithFiveAuxiliaryPictureHeic = 'all_auxtype.heic';
const testNoAuxiliaryPictureHeic = '0801_sdr2.heic';
const testFileUnrefocusHeic = "IMG_825866834_004.heic";
const testFileFragmentHeic = 'HeicFragmentMap.heic';
const testFileFragmentJpg = 'JpegFragmentMap.jpg';
const testFilePng = "test.png";
const testFileAllAuxiliaryPictures = "AllAuxiliaryPictures.jpg";

const testFileGainMap = 'GainMap.dat';
const testFileUnrefocus = 'UnrefocusMap.dat';
const testFileDepth = 'DepthMap.dat';
const testFileLinear = 'LinearMap.dat';
const testFileFragment = 'FragmentMap.dat';
const testFileGainMapSize: image.Size = { height: 960, width: 720 };
const testFileUnrefocusSize: image.Size = { height: 4096, width: 3072 };
const testFileDepthSize: image.Size = { height: 4096, width: 3072 };
const testFileLinearSize: image.Size = { height: 4096, width: 3072 };
const testFileFragmentSize: image.Size = { height: 4096, width: 3072 };

const imageFormatPng = 'image/png';
const imageFormatJpeg = 'image/jpeg';
const imageFormatHeif = 'image/heif';

const imageWidthKey = 'ImageWidth';
const imageLengthKey = 'ImageLength';
const imageWidthValue = '20';
const imageHeightValue = "512";
const imageLengthValue = '15';
const fragmentImageWidthKey = 'FragmentImageWidth';
const fragmentImageHeightKey = 'FragmentImageHeight';
const fragmentImageWidthValue = '512';
const fragmentImageHeightValue = '512';
const xInOriginalKey = "XInOriginal";
const yInOriginalKey = "YInOriginal";
const xInOriginalValue = '0';
const yInOriginalValue = '0';
const orientationKey = 'Orientation';
const orientationValue = '1';

const imageWidthKeyErr ="ImageWidthErr";
const imageHeightKeyErr ="ImageHeightErr";
const imageLengthKeyErr = 'ImageLengthErr';
const imageWidthValueErr = "-1";
const imageHeightValueErr = "-1";
const fragmentImageWidthKeyErr = "FragmentImageWidthErr";
const fragmentImageHeightKeyErr = "FragmentImageHeightErr";
const fragmentImageWidthValueErr = "-1";
const fragmentImageHeightValueErr = "-1";
const xInOriginalKeyErr = "XInOriginalErr";
const yInOriginalKeyErr = "YInOriginalErr";
const xInOriginalValueErr = "-1";
const yInOriginalValueErr = "-1";
const orientationKeyErr = "OrientationErr";
const orientationValueErr = "-1";

const testAllAuxiliaryPicturesExcludeFragmentJpg = "AllAuxiliaryPictures_exclude_fragment.jpg";

let isSupportHEIFDecode: boolean;
let isSupportVPE: boolean;
let fileDir: string | undefined;

enum ErrorCode {
  /** operation success */
  IMAGE_SUCCESS = 0,
  /** invalid parameter */
  IMAGE_BAD_PARAMETER = 401,
  /** unsupported metadata */
  IMAGE_UNSUPPORTED_METADATA = 7600202,
  /** encode failed */
  IMAGE_ENCODE_FAILED = 7800301,
  /** decode failed */
  IMAGE_DECODE_FAILED = 7700301,
};

interface ExifInfo {
  key: string,
  value: string
}

const metadataDefaultAllKey: Array<ExifInfo> = [
  {key: "ApertureValue", value: "2.00 EV (f/2.0)"},
  {key: "BitsPerSample", value: "8, 8, 8"},
  {key: "BrightnessValue", value: "-2.00 EV (0.86 cd/m^2)"},
  {key: "ColorSpace", value: "Uncalibrated"},
  {key: "ComponentsConfiguration", value: "Y Cb Cr -"},
  {key: "Contrast", value: "Normal"},
  {key: "CustomRendered", value: "Custom process"},
  {key: "DateTimeDigitized", value: "2024:01:11 09:39:58"},
  {key: "DateTimeOriginal", value: "2024:01:11 09:39:58"},
  {key: "ExposureBiasValue", value: "0.00 EV"},
  {key: "ExposureMode", value: "Auto exposure"},
  {key: "ExposureProgram", value: "Normal program"},
  {key: "ExposureTime", value: "1/590 sec."},
  {key: "FNumber", value: "f/2.0"},
  {key: "FileSource", value: "DSC"},
  {key: "Flash", value: "Flash did not fire"},
  {key: "FlashpixVersion", value: "FlashPix Version 1.0"},
  {key: "FocalLength", value: "6.3 mm"},
  {key: "FocalLengthIn35mmFilm", value: "27"},
  {key: "GPSAltitude", value: "0.00"},
  {key: "GPSAltitudeRef", value: "Sea level reference"},
  {key: "GPSDateStamp", value: "2024:01:11"},
  {key: "GPSTimeStamp", value: "01:39:58.00"},
  {key: "GPSVersionID", value: "2.2.0.0"},
  {key: "GainControl", value: "Normal"},
  {key: "HwMnoteBurstNumber", value: "default_exif_value"},
  {key: "HwMnoteCaptureMode", value: "0"},
  {key: "HwMnoteCloudEnhancementMode", value: "default_exif_value"},
  {key: "HwMnoteFaceConf", value: "default_exif_value"},
  {key: "HwMnoteFaceCount", value: "default_exif_value"},
  {key: "HwMnoteFaceLeyeCenter", value: "default_exif_value"},
  {key: "HwMnoteFaceMouthCenter", value: "default_exif_value"},
  {key: "HwMnoteFacePointer", value: "188"},
  {key: "HwMnoteFaceRect", value: "default_exif_value"},
  {key: "HwMnoteFaceReyeCenter", value: "default_exif_value"},
  {key: "HwMnoteFaceSmileScore", value: "default_exif_value"},
  {key: "HwMnoteFaceVersion", value: "1207959808"},
  {key: "HwMnoteFocusMode", value: "default_exif_value"},
  {key: "HwMnoteFrontCamera", value: "0"},
  {key: "HwMnoteIsXmageSupported", value: "1"},
  {key: "HwMnotePhysicalAperture", value: "1"},
  {key: "HwMnotePitchAngle", value: "-83"},
  {key: "HwMnoteRollAngle", value: "26"},
  {key: "HwMnoteSceneBeachConf", value: "default_exif_value"},
  {key: "HwMnoteSceneBlueSkyConf", value: "default_exif_value"},
  {key: "HwMnoteSceneFlowersConf", value: "default_exif_value"},
  {key: "HwMnoteSceneFoodConf", value: "default_exif_value"},
  {key: "HwMnoteSceneGreenPlantConf", value: "default_exif_value"},
  {key: "HwMnoteSceneNightConf", value: "default_exif_value"},
  {key: "HwMnoteScenePointer", value: "170"},
  {key: "HwMnoteSceneSnowConf", value: "default_exif_value"},
  {key: "HwMnoteSceneStageConf", value: "default_exif_value"},
  {key: "HwMnoteSceneSunsetConf", value: "default_exif_value"},
  {key: "HwMnoteSceneTextConf", value: "default_exif_value"},
  {key: "HwMnoteSceneVersion", value: "1207959808"},
  {key: "HwMnoteWindSnapshotMode", value: "default_exif_value"},
  {key: "HwMnoteXmageBottom", value: "0"},
  {key: "HwMnoteXmageLeft", value: "0"},
  {key: "HwMnoteXmageMode", value: "0"},
  {key: "HwMnoteXmageRight", value: "0"},
  {key: "HwMnoteXmageTop", value: "0"},
  {key: "ISOSpeedRatings", value: "160"},
  {key: "ImageDescription", value: "_cuva"},
  {key: "ImageLength", value: "4000"},
  {key: "ImageWidth", value: "3000"},
  {key: "LightSource", value: "Daylight"},
  {key: "MakerNote", value: "HwMnoteScenePointer:170,HwMnoteSceneVersion:1207959808,HwMnoteFacePointer:188,HwMnoteFaceVersion:1207959808,HwMnoteCaptureMode:0,HwMnoteFrontCamera:0,HwMnoteRollAngle:26,HwMnotePitchAngle:-83,HwMnotePhysicalAperture:1,HwMnoteIsXmageSupported:1,HwMnoteXmageMode:0,HwMnoteXmageLeft:0,HwMnoteXmageTop:0,HwMnoteXmageRight:0,HwMnoteXmageBottom:0"},
  {key: "MeteringMode", value: "Pattern"},
  {key: "MicroVideoPresentationTimestampUS", value: "default_exif_value"},
  {key: "MovingPhotoId", value: "default_exif_value"},
  {key: "MovingPhotoVersion", value: "default_exif_value"},
  {key: "Orientation", value: "Unknown value 0"},
  {key: "PhotographicSensitivity", value: "160"},
  {key: "PixelXDimension", value: "4000"},
  {key: "PixelYDimension", value: "3000"},
  {key: "ResolutionUnit", value: "Inch"},
  {key: "Saturation", value: "Normal"},
  {key: "SceneCaptureType", value: "Standard"},
  {key: "SceneType", value: "Directly photographed"},
  {key: "SensingMethod", value: "One-chip color area sensor"},
  {key: "Sharpness", value: "Normal"},
  {key: "ShutterSpeedValue", value: "29.00 EV (1/536870912 sec.)"},
  {key: "Software", value: "MNA-AL00 4.0.0.120(C00E116R3P7)"},
  {key: "SubjectDistanceRange", value: "Unknown"},
  {key: "SubsecTime", value: "427000"},
  {key: "SubsecTimeDigitized", value: "427000"},
  {key: "SubsecTimeOriginal", value: "427000"},
  {key: "WhiteBalance", value: "Auto white balance"},
  {key: "XResolution", value: "72"},
  {key: "YCbCrPositioning", value: "Centered"},
  {key: "YResolution", value: "72"},
]

const getBuffer = (fileName: string) => {
  let filePath = getFilePath(fileName);
  let file = fs.openSync(filePath);
  const stats = fs.statSync(filePath);
  const fileSize = stats.size;
  const bufferRead = new ArrayBuffer(fileSize)
  fs.readSync(file.fd, bufferRead)
  return bufferRead
}

const testCreateImageSource = (caseName: string, fileName: string) => {
  let filePath = getFilePath(fileName);
  hilog.info(domain, testTag, caseName + `: image filePath ` + filePath);
  ndkTest.createTestImageSource(filePath);
}

const testCreatePictureByPixelMap = (caseName: string, fileName: string) => {
  testCreateImageSource(caseName, fileName)
  ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.RGBA_8888);
  let result: number = ndkTest.CreatePictureByPixelmap();
  expect(result).assertEqual(ErrorCode.IMAGE_SUCCESS);
}

const newCreatePictureByPixelMap = (caseName: string, fileName: string) => {
  if((!fileName.toLowerCase().endsWith('.heic')) || (fileName.toLowerCase().endsWith('.heic') && isSupportHEIFDecode)){
    testCreateImageSource(caseName, fileName)
    ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.RGBA_8888);
    let result: number = ndkTest.CreatePictureByPixelmap();
    expect(result).assertEqual(ErrorCode.IMAGE_SUCCESS);
    return true
  }else{
    return false
  }
}

const testCreatePictureByImageSource = (caseName: string, fileName: string, 
  inAuxTpyes: Array<image.AuxiliaryPictureType>) => {
  testCreateImageSource(caseName, fileName)
  ndkTest.CreatePictureDecodingOptions();
  ndkTest.SetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);
  ndkTest.CreatePictureByImageSource();
}

const testCreateAuxiliaryPicture = (auxType: image.AuxiliaryPictureType): image.AuxiliaryPicture => {
  let fileName = '';
  let auxSize: image.Size = {height: 180, width: 240};
  let auxBuffer = createFillBuffer(172800, 4);
  switch (auxType) {
    case image.AuxiliaryPictureType.GAINMAP: 
      fileName = testFileGainMap;
      auxSize = testFileGainMapSize;
      auxBuffer = getBuffer(fileName);
      break;
    default: 
      break;
  }
  let auxPicture: image.AuxiliaryPicture =
    ndkTest.CreateAuxiliaryPicture(auxBuffer, auxSize, auxType);
  return auxPicture;
}

const testSetAuxiliaryPicture = (done: Function, auxType: image.AuxiliaryPictureType, caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    testCreatePictureByPixelMap(caseName, testFileJpg);
    let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(auxType);
    
    expect(ndkTest.SetAuxiliaryPicture(auxType, auxPicture)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(ndkTest.GetAuxiliaryPicture(auxType) != undefined).assertTrue();
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testCasesOfCreateAuxiliaryPicture = (done: Function, auxType: image.AuxiliaryPictureType,caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    testCreateAuxiliaryPicture(auxType);

    expect(ndkTest.AuxiliaryPictureGetType()).assertEqual(auxType);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testAuxiliaryPictureReadWritePixels = (done: Function, fileName: string,
  auxType: image.AuxiliaryPictureType, caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    let inAuxTpyes: Array<image.AuxiliaryPictureType> = [auxType];
    testCreatePictureByImageSource(caseName, fileName, inAuxTpyes);

    let auxPicture: image.AuxiliaryPicture = ndkTest.GetAuxiliaryPicture(auxType);
    expect(auxPicture != undefined).assertTrue();

    let info: ndkTest.IAuxInfo = ndkTest.AuxiliaryPictureGetInfo();
    let writeBuffer = createFillBuffer(info.width * info.height * 4, 4);
    let readBuffer: ArrayBuffer = new ArrayBuffer(writeBuffer.byteLength);
    expect(ndkTest.AuxiliaryPictureWritePixels(writeBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(compareArrayBuffer(readBuffer, writeBuffer)).assertTrue();
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testAuxiliaryPictureInfoSetTypeAndGetType = (done: Function, auxType: image.AuxiliaryPictureType,
  caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    ndkTest.CreateAuxiliaryPictureInfo();
    expect(ndkTest.AuxiliaryPictureInfoSetType(auxType)).assertEqual(ErrorCode.IMAGE_SUCCESS);

    expect(ndkTest.AuxiliaryPictureInfoGetType()).assertEqual(auxType);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testSetAndGetPixelFormatByCreateAuxInfo = (done: Function, pixelFormat: image.PixelMapFormat,
  caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    ndkTest.CreateAuxiliaryPictureInfo();
    expect(ndkTest.AuxiliaryPictureInfoSetPixelFormat(pixelFormat)).assertEqual(ErrorCode.IMAGE_SUCCESS);

    expect(ndkTest.AuxiliaryPictureInfoGetPixelFormat()).assertEqual(pixelFormat);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testSetAndGetPixelFormat = (done: Function, auxType: image.AuxiliaryPictureType, 
  pixelMapFormat: image.PixelMapFormat, caseName: string) => {
  hilog.info(domain, testTag, caseName +` begin`);
  try {
    testCreateAuxiliaryPicture(auxType);

    ndkTest.AuxiliaryPictureGetInfo();
    expect(ndkTest.AuxiliaryPictureInfoSetPixelFormat(pixelMapFormat)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    if (pixelMapFormat == image.PixelMapFormat.RGBA_F16) {
      expect(ndkTest.AuxiliaryPictureSetInfoToCtx()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
    } else {
      expect(ndkTest.AuxiliaryPictureSetInfoToCtx()).assertEqual(ErrorCode.IMAGE_SUCCESS);
      ndkTest.AuxiliaryPictureGetInfo();
      expect(ndkTest.AuxiliaryPictureInfoGetPixelFormat()).assertEqual(pixelMapFormat);
    }
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

const testPixelMapFormatInPicture = (done: Function, fileName: string, 
  pixelMapFormat: image.PixelMapFormat, caseName: string) => {
  hilog.info(domain, testTag, caseName + ` begin`);
  try {
    testCreateImageSource(caseName, fileName)
    if(pixelMapFormat == image.PixelMapFormat.ALPHA_8) {
      expect(ndkTest.createTestPixelmapByImageSource(pixelMapFormat)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
    } else {
      expect(ndkTest.createTestPixelmapByImageSource(pixelMapFormat)).assertEqual(ErrorCode.IMAGE_SUCCESS);
    }

    expect(ndkTest.CreatePictureByPixelmap()).assertEqual(ErrorCode.IMAGE_SUCCESS);
    expect(ndkTest.GetMainPixelmapInfo().pixelFormat).assertEqual(pixelMapFormat);
    done();
  } catch (err) {
    hilog.error(domain, testTag, caseName + `: Test exception ` + err);
    expect().assertFalse();
    done();
  }
}

function getFilePath(fileName: string): string {
  let filePath = AppStorage.get('pathDir') + "/" + fileName;
  return filePath;
}

function getCachePath(fileName: string): string {
  let filePath = AppStorage.get('cacheDir') + "/" + fileName;
  return filePath;
}

function compareArray(array1: Array<number>, array2: Array<number>): boolean {
  if (array1.length != array2.length) {
    return false;
  }

  for (let i = 0; i < array1.length; i++) {
    if (array1[i] != array2[i]) {
      return false;
    }
  }
  return true;
}

function compareArrayBuffer(buffer1: ArrayBuffer, buffer2: ArrayBuffer): boolean {
  if (buffer1.byteLength != buffer2.byteLength) {
    return false;
  }
  return ndkTest.compareArrayBuffer(buffer1, buffer2);
}

function compareArrayForLessTimes(buffer1: ArrayBuffer, buffer2: ArrayBuffer): boolean {
  if (buffer1.byteLength != buffer2.byteLength) {
    return false;
  }

  let view1 = new Uint8Array(buffer1);
  let view2 = new Uint8Array(buffer2);
  for (let i = 0; i < 100; i++) {
    if (view1[i] != view2[i]) {
      return false;
    }
  }
  return true;
}

function createDefaultExifMetadata(): image.Metadata {
  let metadata: image.Metadata = ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);
  ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue);
  ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue);
  return metadata;
}

function createDefaultFragmentMetadata(): image.Metadata {
  let metadata: image.Metadata = ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
  ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue);
  ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue);
  ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue);
  ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue);
  return metadata;
}

function createFillBuffer(size: number, value: number): ArrayBuffer {
  let buffer = new ArrayBuffer(size);
  let view = new Uint8Array(buffer);
  view.fill(value);
  return buffer;
}

async function sleep(delay: number): Promise<void> {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function pictureNdkTest() {
  describe('pictureNdkTest', () => {
    let isSupportHdr: boolean = false;
    fileDir = AppStorage.get('pathDir')
    beforeAll(async () => {
      isSupportHEIFDecode = 
        image.createImageSource(fileDir + '/' + 'test.jpg').supportedFormats.includes('image/heic')
      isSupportVPE = await fs.access("/sys_prod/etc/VideoProcessingEngine/Image_SR_Model_576x576_20240402.omc").then((res: boolean) => {
        if (res) {
          console.info("file exists");
          return true;
        } else {
          console.info("file not exists");
          return false;
        }
      }).catch((err: BusinessError) => {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        return false;
      });
      isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so').then((res: boolean) => {
        if (res) {
          console.info("file exists");
          return true;
        } else {
          console.info("file not exists");
          return false;
        }
      }).catch((err: BusinessError) => {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        return false;
      });
    })

    afterEach(() => {
      try {
        ndkTest.releaseTestContext();
      } catch (err) {
        hilog.error(domain, testTag, `afterEach: Test exception ` + err);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTUREDECODINGOPTIONS_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTUREDECODINGOPTIONS_0100
     * @tc.desc   Test create default picture decoding options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTUREDECODINGOPTIONS_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTUREDECODINGOPTIONS_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        testCreateAuxiliaryPicture(auxType);

        expect(ndkTest.AuxiliaryPictureGetType()).assertEqual(auxType);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTURE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTURE_0100
     * @tc.desc   Test create default picture by ImageSource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTURE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_CREATEPICTURE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testFileJpg);
        ndkTest.CreatePictureDecodingOptions();

        expect(ndkTest.CreatePictureByImageSource()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_0100
     * @tc.desc   Test set desired auxiliary pictures to decoding options.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
        testCreateAuxiliaryPicture(auxType);
        
        expect(ndkTest.AuxiliaryPictureGetType()).assertEqual(auxType);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_GETDESIREDAUXILIARYPICTURES_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_GETDESIREDAUXILIARYPICTURES_0100
     * @tc.desc   Test get desired AuxiliaryPicture from DecodingOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_GETDESIREDAUXILIARYPICTURES_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_GETDESIREDAUXILIARYPICTURES_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreatePictureDecodingOptions();
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
        ndkTest.SetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);
        let outAuxTpyes: Array<image.AuxiliaryPictureType> = ndkTest.GetDesiredAuxiliaryPictures();

        expect(compareArray(inAuxTpyes, outAuxTpyes)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_RELEASE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_RELEASE_0100
     * @tc.desc   Test release the created DecodingOptionsForPicture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_IMAGESOURCE_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreatePictureDecodingOptions();
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
          image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.UNREFOCUS_MAP,
          image.AuxiliaryPictureType.LINEAR_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
        ndkTest.SetDesiredAuxiliaryPictures(inAuxTpyes.length, inAuxTpyes);

        expect(ndkTest.ReleasePictureDecodingOptions()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0100
     * @tc.desc   Test inserting AuxiliaryPicture with GAIN_MAP type into Picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.GAINMAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0100`)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0200
     * @tc.desc   Test inserting AuxiliaryPicture with DEPTH_MAP type into Picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.DEPTH_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0200`)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0300
     * @tc.desc   Test inserting AuxiliaryPicture with UNREFOCUS_MAP type into Picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0300`)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0400
     * @tc.desc   Test inserting AuxiliaryPicture with LINEAR_MAP type into Picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.LINEAR_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0400`)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0500
     * @tc.desc   Test inserting AuxiliaryPicture with FRAGMENT_MAP type into Picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAuxiliaryPicture(done, image.AuxiliaryPictureType.FRAGMENT_MAP, 
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_0500`)
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0600
     * @tc.desc   Test set AuxiliaryPicture to picture. Type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let gainmapType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let depthType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(gainmapType);

        expect(ndkTest.SetAuxiliaryPictureErrorCode(depthType, auxPicture)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0700
     * @tc.desc   Test set AuxiliaryPicture to picture. The AuxiliaryPicture object is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETAUXILIARYPICTURE_ERROR_0700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let auxPicture: null = null;
        let depthType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
        expect(ndkTest.SetAuxiliaryPictureErrorCode(depthType, auxPicture)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0200
     * @tc.desc   Test get AuxiliaryPicture from picture failed Unable to get the correct type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
          image.AuxiliaryPictureType.UNREFOCUS_MAP];
        testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureJpg, inAuxTpyes);

        let noexistTypes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP,
          image.AuxiliaryPictureType.LINEAR_MAP,image.AuxiliaryPictureType.FRAGMENT_MAP];

        expect(ndkTest.GetAuxiliaryPicture(noexistTypes[0]) != undefined).assertFalse();
        expect(ndkTest.GetAuxiliaryPicture(noexistTypes[1]) != undefined).assertFalse();
        expect(ndkTest.GetAuxiliaryPicture(noexistTypes[2]) != undefined).assertFalse();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0400
     * @tc.desc   Test get  AuxiliaryPicture from picture failed Unable to get the correct type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
          image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
        testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureJpg, inAuxTpyes);

        let noexistTypes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP,
          image.AuxiliaryPictureType.LINEAR_MAP,image.AuxiliaryPictureType.FRAGMENT_MAP];

        expect(ndkTest.GetAuxiliaryPictureErrorCode(noexistTypes[0])).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.GetAuxiliaryPictureErrorCode(noexistTypes[1])).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.GetAuxiliaryPictureErrorCode(noexistTypes[2])).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_0500
     * @tc.desc   Test get AuxiliaryPicture from Picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let gainmapType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(gainmapType);

        ndkTest.SetAuxiliaryPicture(gainmapType, auxPicture);
        expect(ndkTest.GetAuxiliaryPicture(gainmapType) != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0600
     * @tc.desc   Prerequisite: Create an picture from PixelMap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETAUXILIARYPICTURE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testNoAuxiliaryPictureJpg);

        let gainmapType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        expect(ndkTest.GetAuxiliaryPictureErrorCode(gainmapType)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0100
     * @tc.desc   Test create exif metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        expect(ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA) != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0200
     * @tc.desc   Test create fragment metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_CREATE_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        expect(ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA) != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0100
     * @tc.desc   Test set ptoperty to exif metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);
        
        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0200
     * @tc.desc   Test set ptoperty to fragment metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0300
     * @tc.desc   Test set property to exif metadata with illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKeyErr, imageWidthValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0400
     * @tc.desc   Test set property to exif metadata with illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKeyErr, imageWidthValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(orientationKeyErr, orientationValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0500
     * @tc.desc   Test set property to exif metadata with illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKey, imageWidthValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0600
     * @tc.desc   Test set property to exif metadata with illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(imageWidthKey, imageWidthValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(imageHeightKeyErr, imageHeightValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(orientationKeyErr, orientationValueErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0700
     * @tc.desc   Test set property to fragment metadata with illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0700`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetPropertyErrorCode(xInOriginalKeyErr, xInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(yInOriginalKeyErr, yInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0800
     * @tc.desc   Test set property to fragment metadata with illegal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_SETPROPERTY_ERROR_0800`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageWidthKeyErr,fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageHeightKeyErr,fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(xInOriginalKeyErr, xInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(yInOriginalKeyErr, yInOriginalValue))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_GETPROPERTY_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_GETPROPERTY_0100
     * @tc.desc   Test get ptoperty from metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_GETPROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_GETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultExifMetadata();

        expect(ndkTest.MetadataGetProperty(imageLengthKey)).assertEqual(imageLengthValue);
        expect(ndkTest.MetadataGetProperty(imageWidthKey)).assertEqual(imageWidthValue);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0100
     * @tc.desc   Test set exif metadata to picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let inMetadata: image.Metadata = createDefaultExifMetadata();
        expect(inMetadata != undefined).assertTrue();
        expect(ndkTest.PictureSetMetadata(image.MetadataType.EXIF_METADATA, inMetadata))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0200
     * @tc.desc   Test set fragment metadata to picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SETMETADATA_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();
        expect(ndkTest.PictureSetMetadataErrorCode(image.MetadataType.FRAGMENT_METADATA, inMetadata))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_0100
     * @tc.desc   Test get exif metadata from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        let inMetadata: image.Metadata = createDefaultExifMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.PictureSetMetadata(exifType, inMetadata);

        expect(ndkTest.PictureGetMetadata(exifType) != undefined).assertTrue();
        expect(ndkTest.pictureMetadataGetProperty(exifType, imageLengthKey)).assertEqual(imageLengthValue);
        expect(ndkTest.pictureMetadataGetProperty(exifType, imageWidthKey)).assertEqual(imageWidthValue);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_ERROR_0200
     * @tc.desc   Test get metadata from picture with illegal type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMETADATA_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        let fragmentType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
        let inMetadata: image.Metadata = createDefaultExifMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.PictureSetMetadata(exifType, inMetadata);

        expect(ndkTest.PictureGetMetadataErrorCode(fragmentType)).assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMAINPIXELMAP_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMAINPIXELMAP_0100
     * @tc.desc   Test get MainPixelmap from Picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMAINPIXELMAP_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETMAINPIXELMAP_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testNoAuxiliaryPictureJpg);
        const auxInfo: ndkTest.IAuxInfo = ndkTest.GetMainPixelmapInfo();

        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);

        const mapInfo: ndkTest.IAuxInfo = ndkTest.GetMainPixelmapInfo();

        expect(mapInfo.width).assertEqual(auxInfo.width);
        expect(mapInfo.height).assertEqual(auxInfo.height);
        expect(mapInfo.pixelFormat).assertEqual(auxInfo.pixelFormat);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETGAINMAPPIXELMAP_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETGAINMAPPIXELMAP_0100
     * @tc.desc   Test get GainmapPixelmap from Picture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETGAINMAPPIXELMAP_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GETGAINMAPPIXELMAP_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        const auxInfo: ndkTest.IAuxInfo = ndkTest.GetGainmapPixelmapInfo();

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);

        const mapInfo: ndkTest.IAuxInfo = ndkTest.GetGainmapPixelmapInfo();

        expect(mapInfo.width).assertEqual(auxInfo.width);
        expect(mapInfo.height).assertEqual(auxInfo.height);
        expect(mapInfo.pixelFormat).assertEqual(auxInfo.pixelFormat);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_RELEASE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_RELEASE_0100
     * @tc.desc   Test release the created picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileJpg);

        expect(ndkTest.ReleasePicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0100
     * @tc.desc   Test release the EXIF metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultExifMetadata();

        expect(ndkTest.MetadataRelease()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0200
     * @tc.desc   Test release the FRAGMENT metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_METADATA_RELEASE_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultFragmentMetadata();

        expect(ndkTest.MetadataRelease()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0100
     * @tc.desc   Test the creation of AuxiliaryPicture with GAIN_MAP type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.GAINMAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0100')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0200
     * @tc.desc   Test the creation of AuxiliaryPicture with DEPTH_MAP type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.DEPTH_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0200')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0300
     * @tc.desc   Test the creation of AuxiliaryPicture with UNREFOCUS_MAP type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.UNREFOCUS_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0300')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0400
     * @tc.desc   Test the creation of AuxiliaryPicture with LINEAR_MAP type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.LINEAR_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0400')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0500
     * @tc.desc   Test the creation of AuxiliaryPicture with FRAGMENT_MAP type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testCasesOfCreateAuxiliaryPicture(done, image.AuxiliaryPictureType.FRAGMENT_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_0500')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_ERROR_0600
     * @tc.desc   Test the creation of AuxiliaryPicture with illegal type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_CREATE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxType: image.AuxiliaryPictureType = -1;
        let auxSize: image.Size = {height: 180, width: 240};
        let auxBuffer = createFillBuffer(172800, 4);

        expect(ndkTest.CreateAuxiliaryPictureErrorCode(auxBuffer, auxSize, auxType))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETMETADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETMETADATA_0100
     * @tc.desc   Test set fragment metadata to auxiliary picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETMETADATA_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);

        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();

        expect(ndkTest.AuxiliaryPictureSetMetadata(image.MetadataType.FRAGMENT_METADATA, inMetadata))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_0100
     * @tc.desc   Test get metadata from fragment auxiliary picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);

        let fragmentType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.AuxiliaryPictureSetMetadata(fragmentType, inMetadata);

        expect(ndkTest.AuxiliaryPictureGetMetadataErrorCode(fragmentType)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_ERROR_0200
     * @tc.desc   Test get metadata from fragment auxiliary picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETMETADATA_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
        try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);

        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        let fragmentType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
        let inMetadata: image.Metadata = createDefaultFragmentMetadata();
        expect(inMetadata != undefined).assertTrue();
        ndkTest.AuxiliaryPictureSetMetadata(fragmentType, inMetadata);

        expect(ndkTest.AuxiliaryPictureGetMetadataErrorCode(exifType)).assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
       } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
       }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_0100
     * @tc.desc   Test write pixels to AuxiliaryPicture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxSize: image.Size = testFileGainMapSize;
        let buffer = getBuffer(testFileGainMap);
        ndkTest.CreateAuxiliaryPicture(buffer, auxSize, image.AuxiliaryPictureType.GAINMAP);

        expect(ndkTest.AuxiliaryPictureWritePixels(buffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_ERROR_0200
     * @tc.desc   Test write pixels to AuxiliaryPicture.The pixel data buffer size is abnormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_WRITEPIXELS_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxSize: image.Size = testFileGainMapSize;
        let buffer = getBuffer(testFileGainMap);
        let writeBuffer = createFillBuffer(0, 0);
        ndkTest.CreateAuxiliaryPicture(buffer, auxSize, image.AuxiliaryPictureType.GAINMAP);
        expect(ndkTest.AuxiliaryPictureWritePixelsErrorCode(writeBuffer)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0100
     * @tc.desc   Test read pixels from AuxiliaryPicture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxSize: image.Size = testFileGainMapSize;
        let writeBuffer = getBuffer(testFileGainMap);
        let readBuffer: ArrayBuffer = new ArrayBuffer(writeBuffer.byteLength);

        ndkTest.CreateAuxiliaryPicture(writeBuffer, auxSize, image.AuxiliaryPictureType.GAINMAP);

        ndkTest.AuxiliaryPictureWritePixels(writeBuffer);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayBuffer(readBuffer, writeBuffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200
     * @tc.desc   Test read pixels from AuxiliaryPicture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.RGBA_8888);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300
     * @tc.desc   Test read pixels from AuxiliaryPicture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.NV12);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400
     * @tc.desc   Test read pixels from AuxiliaryPicture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_READPIXELS_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let filePath = getFilePath(testFileJpg);
        ndkTest.createTestImageSource(filePath);
        ndkTest.createTestPixelmapByImageSource(image.PixelMapFormat.NV21);

        let buffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        buffer = ndkTest.GetPixelmapBuffer(buffer);
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.AuxiliaryPictureWritePixels(buffer);
        let readBuffer: ArrayBuffer = new ArrayBuffer(10000 * 10000);
        expect(ndkTest.AuxiliaryPictureReadPixels(readBuffer)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(compareArrayForLessTimes(readBuffer, buffer)).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100
     * @tc.desc   Test set type to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0100`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: image.AuxiliaryPictureType.UNREFOCUS_MAP,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          let newType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
          expect(ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType).assertEqual(newType);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200
     * @tc.desc   Test set size to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0200`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: 30,
            height: 40,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().width).assertEqual(30);
          expect(ndkTest.AuxiliaryPictureGetInfo().height).assertEqual(40);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300
     * @tc.desc   Test set rowStride to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0300`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: 20,
            pixelFormat: ndkTest.AuxiliaryPictureGetInfo().pixelFormat
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().rowStride).assertEqual(20);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400
     * @tc.desc   Test set pixelFormat to AuxiliaryPictureInfo,then set AuxiliaryPictureInfo to
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0400`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testFileJpg, inAuxTpyes);
          ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
  
          let auxInfo: ndkTest.IAuxInfo = {
            auxiliaryPictureType: ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType,
            width: ndkTest.AuxiliaryPictureGetInfo().width,
            height: ndkTest.AuxiliaryPictureGetInfo().height,
            rowStride: ndkTest.AuxiliaryPictureGetInfo().rowStride,
            pixelFormat:  image.PixelMapFormat.RGBA_8888
          };
          ndkTest.AuxiliaryPictureSetInfo(auxInfo);
  
          expect(ndkTest.AuxiliaryPictureGetInfo().pixelFormat).assertEqual(auxInfo.pixelFormat);
          ndkTest.ReleaseAuxiliaryPicture();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500
     * @tc.desc   Test set auxiliaryPictureInfo to auxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_SETINFO_0500`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);

        let auxInfo: ndkTest.IAuxInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          width: 10,
          height: 20,
          rowStride: 30,
          pixelFormat: image.PixelMapFormat.RGBA_8888
        };
        expect(ndkTest.AuxiliaryPictureSetInfo(auxInfo)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100
     * @tc.desc   Test get auxiliaryPictureInfo from auxiliaryPicture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_GETINFO_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);

        let auxInfo: ndkTest.IAuxInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          width: 10,
          height: 20,
          rowStride: 30,
          pixelFormat: image.PixelMapFormat.RGBA_8888
        };
        ndkTest.AuxiliaryPictureSetInfo(auxInfo);

        expect(ndkTest.AuxiliaryPictureGetInfo().auxiliaryPictureType).assertEqual(auxInfo.auxiliaryPictureType);
        expect(ndkTest.AuxiliaryPictureGetInfo().width).assertEqual(auxInfo.width);
        expect(ndkTest.AuxiliaryPictureGetInfo().height).assertEqual(auxInfo.height);
        expect(ndkTest.AuxiliaryPictureGetInfo().rowStride).assertEqual(auxInfo.rowStride);
        expect(ndkTest.AuxiliaryPictureGetInfo().pixelFormat).assertEqual(auxInfo.pixelFormat);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100
     * @tc.desc   Test release the created (GAINMAP/DEPTH_MAP/UNREFOCUS_MAP/LINEAR_MAP/FRAGMENT_MAP) object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);
 
        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200
     * @tc.desc   Test release the AuxiliaryPicture added to picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTURE_RELEASE_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreatePictureByPixelMap(caseName, testFileWithFiveAuxiliaryPictureJpg);

        let auxPicture: image.AuxiliaryPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        auxPicture = testCreateAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP);
        ndkTest.SetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP, auxPicture);
        expect(ndkTest.ReleaseAuxiliaryPicture()).assertEqual(ErrorCode.IMAGE_SUCCESS);

        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100
     * @tc.desc   Test create auxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_CREATE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        expect(ndkTest.CreateAuxiliaryPictureInfo() != undefined).assertTrue();
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100
     * @tc.desc   Test set and get type from auxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.GAINMAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0100');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200
     * @tc.desc   Test set and get type from auxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.DEPTH_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0200');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300
     * @tc.desc   Test set and get type from auxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.UNREFOCUS_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0300');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400
     * @tc.desc   Test set and get type from auxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.LINEAR_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0400');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500
     * @tc.desc   Test set and get type from auxiliaryPictureInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testAuxiliaryPictureInfoSetTypeAndGetType(done, image.AuxiliaryPictureType.FRAGMENT_MAP,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_GETTYPE_0500');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600
     * @tc.desc   Test set illegal type to AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETTYPE_ERROR_0600`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();

        let auxType: number = -1;
        expect(ndkTest.AuxiliaryPictureInfoSetTypeErrorCode(auxType)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100
     * @tc.desc   Test set and get normal size about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETSIZE_GETSIZE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();
        let inSize: image.Size = {height: 15, width: 20};
        expect(ndkTest.AuxiliaryPictureInfoSetSize(inSize)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        let outSize: image.Size = ndkTest.AuxiliaryPictureInfoGetSize();
        expect(outSize.width).assertEqual(inSize.width);
        expect(outSize.height).assertEqual(inSize.height);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100
     * @tc.desc   Test set and get normal rowStride about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETROWSTRIDE_GETROWSTRIDE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();
        let rowStride = 40;
        expect(ndkTest.AuxiliaryPictureInfoSetRowStride(rowStride)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.AuxiliaryPictureInfoGetRowStride()).assertEqual(rowStride);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100
     * @tc.desc   Test release AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_RELEASE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreateAuxiliaryPictureInfo();

        expect(ndkTest.ReleaseAuxiliaryPictureInfo()).assertEqual(ErrorCode.IMAGE_SUCCESS);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100
     * @tc.desc   Test get exif metadata property from PictureMetadata that contains some wrong key values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetProperty(imageLengthKey)).assertEqual(imageLengthValue);
        expect(ndkTest.MetadataGetProperty(imageWidthKey)).assertEqual(imageWidthValue);
        expect(ndkTest.MetadataGetPropertyErrorCode(orientationKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200
     * @tc.desc   Test get exif metadata property from PictureMetadata that contains all wrong key values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0200`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA);

        expect(ndkTest.MetadataSetProperty(imageLengthKey, imageLengthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(imageWidthKey, imageWidthValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(orientationKey, orientationValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(imageLengthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(imageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(orientationKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300
     * @tc.desc   Test get fragment metadata property from PictureMetadata that contains some wrong key values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_0300`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageHeightKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetProperty(xInOriginalKey)).assertEqual(xInOriginalValue);
        expect(ndkTest.MetadataGetProperty(yInOriginalKey)).assertEqual(yInOriginalValue);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400
     * @tc.desc   Test get fragment metadata property from PictureMetadata that contains all wrong key values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_GETPROPERTY_ERROR_0400`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);

        expect(ndkTest.MetadataSetProperty(fragmentImageWidthKey, fragmentImageWidthValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(fragmentImageHeightKey, fragmentImageHeightValue))
          .assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(xInOriginalKey, xInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);
        expect(ndkTest.MetadataSetProperty(yInOriginalKey, yInOriginalValue)).assertEqual(ErrorCode.IMAGE_SUCCESS);

        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageWidthKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(fragmentImageHeightKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(xInOriginalKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        expect(ndkTest.MetadataGetPropertyErrorCode(yInOriginalKeyErr))
          .assertEqual(ErrorCode.IMAGE_UNSUPPORTED_METADATA);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100
     * @tc.desc   Test clone PictureMetadata
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTUREMETADATA_CLONE_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        createDefaultExifMetadata();

        expect(ndkTest.MetadataClone() != undefined).assertTrue();
        expect(ndkTest.clonedMetadataGetProperty(imageLengthKey))
          .assertEqual(ndkTest.MetadataGetProperty(imageLengthKey));
        expect(ndkTest.clonedMetadataGetProperty(imageWidthKey))
          .assertEqual(ndkTest.MetadataGetProperty(imageWidthKey));
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100
     * @tc.desc   Test set and get UNKNOWN pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.UNKNOWN,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0100');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200
     * @tc.desc   Test set and get RGB_565 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0200');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300
     * @tc.desc   Test set and get RGBA_8888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0300');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400
     * @tc.desc   Test set and get BGRA_8888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0400');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500
     * @tc.desc   Test set and get RGB_888 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0500');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600
     * @tc.desc   Test set and get ALPHA_8 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.ALPHA_8,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0600');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700
     * @tc.desc   Test set and get RGBA_F16 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0700');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800
     * @tc.desc   Test set and get NV21 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0800');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900
     * @tc.desc   Test set and get NV12 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_0900');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000
     * @tc.desc   Test set and get RGBA_1010102 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1000');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100
     * @tc.desc   Test set and get YCBCR_P010 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1100');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200
     * @tc.desc   Test set and get YCRCB_P010 pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200', Level.LEVEL0,
      async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormatByCreateAuxInfo(done, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1200');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1300')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1400')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1500')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1600')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1700')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1800')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_1900')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2000')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2100')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2200')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.GAINMAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2300')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2400')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2500')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2600')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2700')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2800')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_2900')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3000')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3100')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3200')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.DEPTH_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3300')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3400')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3500')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3600')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3700')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3800')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_3900')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4000')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4100')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4200')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.UNREFOCUS_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4300')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4400')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4500')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4600')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4700')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4800')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_4900')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5000')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5100')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5200')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.LINEAR_MAP, image.PixelMapFormat.NV12,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5300')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGB_565,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5400')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5500')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.BGRA_8888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5600')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGB_888,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5700')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_F16,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5800')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.RGBA_1010102,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_5900')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.YCBCR_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6000')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.YCRCB_P010,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6100')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200
     * @tc.desc   Test set and get pixelFormat about AuxiliaryPictureInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testSetAndGetPixelFormat(done, image.AuxiliaryPictureType.FRAGMENT_MAP, image.PixelMapFormat.NV21,
        'SUB_MULTIMEDIA_PICTURE_NDK_AUXILIARYPICTUREINFO_SETPIXELFORMAT_GETPIXELFORMAT_6200')
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.NV21,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0100`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.NV21,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0200`);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.RGB_565,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0300`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.RGB_565,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0400`);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.RGBA_8888,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0500`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.RGBA_8888,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0600`);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.BGRA_8888,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0700`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.BGRA_8888,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_0800`);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      testPixelMapFormatInPicture(done, testFileJpg, image.PixelMapFormat.NV12,
        `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_1900`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000
     * @tc.desc   Test create picture by pixelmap with different pixelMapFormat.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        testPixelMapFormatInPicture(done, testFileHeic, image.PixelMapFormat.NV12,
          `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_CREATEPICTUREBYPIXELMAP_2000`);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100
     * @tc.desc   Test get desired AuxiliaryPicture from DecodingOptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_IMAGESOURCE_SETDESIREDAUXILIARYPICTURES_ERROR_0100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.CreatePictureDecodingOptions();
        let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
        expect(ndkTest.SetDesiredAuxiliaryPictures(0, inAuxTpyes)).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900
     * @tc.desc   Test set property to fragment metadata with illegal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_0900`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageWidthKey,fragmentImageWidthValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.MetadataSetPropertyErrorCode(xInOriginalKey, xInOriginalValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000
     * @tc.desc   Test set property to fragment metadata with illegal value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_METADATA_SETPROPERTY_ERROR_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        ndkTest.MetadataCreate(image.MetadataType.FRAGMENT_METADATA);
        expect(ndkTest.MetadataSetPropertyErrorCode(fragmentImageHeightKeyErr, fragmentImageHeightValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        expect(ndkTest.MetadataSetPropertyErrorCode(yInOriginalKeyErr, yInOriginalValueErr))
          .assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0100`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0200`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0300`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.LINEAR_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0400`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0500`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testFileFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0600`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0700`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreateImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg)
          ndkTest.CreatePictureDecodingOptions();
          ndkTest.CreatePictureByImageSource();

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) == undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0800`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreatePictureByImageSource(caseName, testFileAllAuxiliaryPictures, inAuxTpyes);

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      if (!isSupportHdr) {
        hilog.info(domain, testTag, 'device is not support hdr');
        done();
      } else {
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_0900`;
        hilog.info(domain, testTag, caseName + ` begin`);
        try {
          let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
            image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
            image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
          testCreateImageSource(caseName, testFileAllAuxiliaryPictures)
          ndkTest.CreatePictureDecodingOptions();
          ndkTest.CreatePictureByImageSource();

          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
          expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000
     * @tc.desc   Test decode picture from jpg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1000`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testAllAuxiliaryPicturesExcludeFragmentJpg);
        expect(ndkTest.CreatePictureByImageSourceWithDecodingOptionIsNull()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100
     * @tc.desc   Test decode picture from png.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100', Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_JPG_ERROR_1100`;
      hilog.info(domain, testTag, caseName + ` begin`);
      try {
        testCreateImageSource(caseName, testFilePng);
        ndkTest.CreatePictureDecodingOptions();
        expect(ndkTest.CreatePictureByImageSourceErrorCode()).assertEqual(ErrorCode.IMAGE_DECODE_FAILED);
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100', Level.LEVEL0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0100`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200', Level.LEVEL0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0200`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.DEPTH_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300', Level.LEVEL0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0300`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.LINEAR_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400', Level.LEVEL0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0400`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.UNREFOCUS_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.FRAGMENT_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500', Level.LEVEL0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0500`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.GAINMAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.DEPTH_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.LINEAR_MAP) == undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(image.AuxiliaryPictureType.UNREFOCUS_MAP) == undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600', Level.LEVEL0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0600`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
                image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
                image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreatePictureByImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic, inAuxTpyes);
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700', Level.LEVEL0, async (done: Function) => {
          await sleep(1000);
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_0700`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              let inAuxTpyes: Array<image.AuxiliaryPictureType> = [image.AuxiliaryPictureType.GAINMAP,
                image.AuxiliaryPictureType.DEPTH_MAP, image.AuxiliaryPictureType.LINEAR_MAP,
                image.AuxiliaryPictureType.UNREFOCUS_MAP, image.AuxiliaryPictureType.FRAGMENT_MAP];
              testCreateImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic)
              ndkTest.CreatePictureDecodingOptions();
              ndkTest.CreatePictureByImageSource();
    
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[0]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[1]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[2]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[3]) != undefined).assertTrue();
              expect(ndkTest.GetAuxiliaryPicture(inAuxTpyes[4]) != undefined).assertTrue();
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
    
        /**
         * @tc.name   SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800
         * @tc.number SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800
         * @tc.desc   Test decode picture from heif.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800', Level.LEVEL0, async (done: Function) => {
          if (!isSupportHdr) {
            hilog.info(domain, testTag, 'device is not support hdr');
            done();
          } else {
            await sleep(1000);
            let caseName: string = `SUB_MULTIMEDIA_PICTURE_NATIVE_PICTURE_DECODE_HEIF_ERROR_0800`;
            hilog.info(domain, testTag, caseName + ` begin`);
            try {
              testCreateImageSource(caseName, testFileWithFiveAuxiliaryPictureHeic);
              expect(ndkTest.CreatePictureByImageSourceWithDecodingOptionIsNull()).assertEqual(ErrorCode.IMAGE_BAD_PARAMETER);
              done();
            } catch (err) {
              hilog.error(domain, testTag, caseName + `: Test exception ` + err);
              expect().assertFalse();
              done();
            }
          }
        })
	
    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0100
     * @tc.desc   Test get exif metadata from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0100`;
      let filename = 'test_exif_v2.jpg'
      let res = newCreatePictureByPixelMap(caseName, filename);
      if(!res){
        done();
        return
      }else{
        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        try {
          for(let i = 0; i < Data.length; i++){
              let PropertyValue = ndkTest.PictureMetadataGetPropertyWithNull(exifType, Data[i].key)
              if(PropertyValue != Data[i].jpegData){
                  console.log("compare value error file:" + filename + "get value: " + PropertyValue + " compare value: " + Data[i].jpegData);
                  expect.assertFail();
                  done()
                  return
              }
          }
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0200
     * @tc.desc   Test get exif metadata from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0200`;
      let filename = 'test_exif_v2.png'
      let res = newCreatePictureByPixelMap(caseName, filename);
      if(!res){
        done();
        return
      }else{
        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        try {
          for(let i = 0; i < Data.length; i++){
              let PropertyValue = ndkTest.PictureMetadataGetPropertyWithNull(exifType, Data[i].key)
              if(PropertyValue != Data[i].pngData){
                  console.log("compare value error file:" + filename + "get value: " + PropertyValue + " compare value: " + Data[i].pngData);
                  expect.assertFail();
                  done()
                  return
              }
          }
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0300
     * @tc.desc   Test get exif metadata from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0300', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0300`;
      let filename = 'test_exif_v2.heic'
      let res = newCreatePictureByPixelMap(caseName, filename);
      if(!res){
        done();
        return
      }else{
        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        try {
          for(let i = 0; i < Data.length; i++){
              let PropertyValue = ndkTest.PictureMetadataGetPropertyWithNull(exifType, Data[i].key)
              if(PropertyValue != Data[i].heifData){
                  console.log("compare value error file:" + filename + "get value: " + PropertyValue + " compare value: " + Data[i].heifData);
                  expect.assertFail();
                  done()
                  return
              }
          }
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0400
     * @tc.desc   Test get exif metadata from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0400', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_GET_EXIF_METADATA_0400`;
      let filename = 'test_exif_v4.jpg'
      let res = newCreatePictureByPixelMap(caseName, filename);
      if(!res){
        done();
        return
      }else{
        let exifType: image.MetadataType = image.MetadataType.EXIF_METADATA;
        try {
          for(let i = 0; i < Data0.length; i++){
              let PropertyValue = ndkTest.PictureMetadataGetPropertyWithNull(exifType, Data0[i].key)
              if(PropertyValue != Data0[i].jpegData){
                  console.log("compare value error file:" + filename + "get value: " + PropertyValue + " compare value: " + Data0[i].jpegData);
                  expect.assertFail();
                  done()
                  return
              }
          }
          done();
        } catch (err) {
          hilog.error(domain, testTag, caseName + `: Test exception ` + err);
          expect().assertFalse();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0100
     * @tc.desc   Test get exif metadata from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0100`;
      ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA)
      try {
        for(let i = 0; i < ModifyData.length; i++){
            let setRes = ndkTest.MetadataSetProperty(ModifyData[i].key, ModifyData[i].modifyData)
            if(setRes != ErrorCode.IMAGE_SUCCESS){
                expect.assertFail();
                done()
                return
            }
            let getRes = ndkTest.MetadataGetProperty(ModifyData[i].key)
            if(getRes != ModifyData[i].compareData){
                expect.assertFail();
                done()
                return
            }
        }
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0200
     * @tc.desc   Test get exif metadata from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0200', Level.LEVEL0, async (done: Function) => {
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_NDK_PICTURE_SET_EXIF_METADATA_0200`;
      ndkTest.MetadataCreate(image.MetadataType.EXIF_METADATA)
      try {
        for(let i = 0; i < Data.length; i++){
          if(Data[i].onlyRead == true){
            let setRes = ndkTest.MetadataSetPropertyErrorCode(Data[i].key, Data[i].jpegData)
            if(setRes != ErrorCode.IMAGE_UNSUPPORTED_METADATA){
                expect.assertFail();
                done()
                return
            }
          }
        }
        done();
      } catch (err) {
        hilog.error(domain, testTag, caseName + `: Test exception ` + err);
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0100
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0100
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0100', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0100`;
      let filePath = getFilePath("AllAuxiliaryPictures.jpg");
      let imageSource = ndkTest.CreateFromUri(filePath);
      if(imageSource == null)
      {
        hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
        expect().assertFail();
        done();
        return;
      }
      let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
      ndkTest.ImageSourceRelease(imageSource);
      if(picture == null)
      {
        hilog.error(domain, testTag, caseName + `: Create Picture failed`);
        expect().assertFail();
        done();
        return;
      }
      let hdrPixelMapInfo = ndkTest.GetHdrComposedPixelmapWithOptions(picture, image.PixelMapFormat.RGBA_1010102);
      ndkTest.PictureRelease(picture);
      if(hdrPixelMapInfo != null)
      {
        hilog.info(domain, testTag, caseName + `: Get HDR Composed PixelMap success, hdrPixelMapInfo: ` + JSON.stringify(hdrPixelMapInfo));
        let ret = hdrPixelMapInfo.isHdr && hdrPixelMapInfo.pixelFormat == image.PixelMapFormat.RGBA_1010102;
        expect(ret).assertTrue();
        done();
      } else{
        hilog.error(domain, testTag, caseName + `: Get HDR Composed PixelMap failed`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0200
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0200
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0200', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0200`;
        let filePath = getFilePath("all_auxtype.heic");
        let imageSource = ndkTest.CreateFromUri(filePath);
        if(imageSource == null)
        {
          hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
          expect().assertFail();
          done();
          return;
        }
        let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
        ndkTest.ImageSourceRelease(imageSource);
        if(picture == null)
        {
          hilog.error(domain, testTag, caseName + `: Create Picture failed`);
          expect().assertFail();
          done();
          return;
        }
        let hdrPixelMapInfo = ndkTest.GetHdrComposedPixelmapWithOptions(picture, image.PixelMapFormat.YCBCR_P010);
        ndkTest.PictureRelease(picture);
        if(hdrPixelMapInfo != null)
        {
          hilog.info(domain, testTag, caseName + `: Get HDR Composed PixelMap success, hdrPixelMapInfo: ` + JSON.stringify(hdrPixelMapInfo));
          let ret = hdrPixelMapInfo.isHdr && hdrPixelMapInfo.pixelFormat == image.PixelMapFormat.YCBCR_P010;
          expect(ret).assertTrue();
          done();
        } else{
          hilog.error(domain, testTag, caseName + `: Get HDR Composed PixelMap failed`);
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0300
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0300
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0300', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0300`;
      let filePath = getFilePath("AllAuxiliaryPictures.jpg");
      let imageSource = ndkTest.CreateFromUri(filePath);
      if(imageSource == null)
      {
        hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
        expect().assertFail();
        done();
        return;
      }
      let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
      ndkTest.ImageSourceRelease(imageSource);
      if(picture == null)
      {
        hilog.error(domain, testTag, caseName + `: Create Picture failed`);
        expect().assertFail();
        done();
        return;
      }
      let hdrPixelMapInfo = ndkTest.GetHdrComposedPixelmapWithOptions(picture, image.PixelMapFormat.YCRCB_P010);
      ndkTest.PictureRelease(picture);
      if(hdrPixelMapInfo != null)
      {
        hilog.info(domain, testTag, caseName + `: Get HDR Composed PixelMap success, hdrPixelMapInfo: ` + JSON.stringify(hdrPixelMapInfo));
        let ret = hdrPixelMapInfo.isHdr && hdrPixelMapInfo.pixelFormat == image.PixelMapFormat.YCRCB_P010;
        expect(ret).assertTrue();
        done();
      } else{
        hilog.error(domain, testTag, caseName + `: Get HDR Composed PixelMap failed`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0400
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0400
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0400', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0400`;
        let filePath = getFilePath("all_auxtype.heic");
        let imageSource = ndkTest.CreateFromUri(filePath);
        if(imageSource == null)
        {
          hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
          expect().assertFail();
          done();
          return;
        }
        let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
        ndkTest.ImageSourceRelease(imageSource);
        if(picture == null)
        {
          hilog.error(domain, testTag, caseName + `: Create Picture failed`);
          expect().assertFail();
          done();
          return;
        }
        let resultErr = ndkTest.GetHdrComposedPixelmapWithOptionsError(picture, image.PixelMapFormat.RGB_565);
        ndkTest.PictureRelease(picture);
        expect(resultErr == 7600201).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0500
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0500
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0500', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0500`;
      let filePath = getFilePath("AllAuxiliaryPictures.jpg");
      let imageSource = ndkTest.CreateFromUri(filePath);
      if(imageSource == null)
      {
        hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
        expect().assertFail();
        done();
        return;
      }
      let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
      ndkTest.ImageSourceRelease(imageSource);
      if(picture == null)
      {
        hilog.error(domain, testTag, caseName + `: Create Picture failed`);
        expect().assertFail();
        done();
        return;
      }
      let resultErr = ndkTest.GetHdrComposedPixelmapWithOptionsError(picture, image.PixelMapFormat.RGBA_8888);
      ndkTest.PictureRelease(picture);
      expect(resultErr == 7600201).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0600
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0600
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0600', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0600`;
        let filePath = getFilePath("all_auxtype.heic");
        let imageSource = ndkTest.CreateFromUri(filePath);
        if(imageSource == null)
        {
          hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
          expect().assertFail();
          done();
          return;
        }
        let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
        ndkTest.ImageSourceRelease(imageSource);
        if(picture == null)
        {
          hilog.error(domain, testTag, caseName + `: Create Picture failed`);
          expect().assertFail();
          done();
          return;
        }
        let resultErr = ndkTest.GetHdrComposedPixelmapWithOptionsError(picture, image.PixelMapFormat.NV12);
        ndkTest.PictureRelease(picture);
        expect(resultErr == 7600201).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0700
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0700
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0700', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0700`;
      let filePath = getFilePath("AllAuxiliaryPictures.jpg");
      let imageSource = ndkTest.CreateFromUri(filePath);
      if(imageSource == null)
      {
        hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
        expect().assertFail();
        done();
        return;
      }
      let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
      ndkTest.ImageSourceRelease(imageSource);
      if(picture == null)
      {
        hilog.error(domain, testTag, caseName + `: Create Picture failed`);
        expect().assertFail();
        done();
        return;
      }
      let result = ndkTest.GetHdrComposedPixelmapAndPixelMapTest(picture);
      ndkTest.PictureRelease(picture);
      if(typeof result == 'string')
      {
        hilog.error(domain, testTag, caseName + `: GetHdrComposedPixelmapAndPixelMapTest failed ` + result);
        expect().assertFail();
        done();
      } else{
        if(result != 0)
        {
          hilog.error(domain, testTag, caseName + `: GetHdrComposedPixelmapAndPixelMapTest failed, errorCode: ` + result);
        }
        expect(result == 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0800
     * @tc.number SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0800
     * @tc.desc   Test get HDR compose pixelmap from picture.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0800', Level.LEVEL0, async (done: Function) => {
      try{
        if(!isSupportVPE) {
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      };
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        let caseName: string = `SUB_MULTIMEDIA_PICTURE_PICTURE_GET_HDR_COMPOSE_PIXELMAP_0800`;
        let filePath = getFilePath("all_auxtype.heic");
        let imageSource = ndkTest.CreateFromUri(filePath);
        if(imageSource == null)
        {
          hilog.error(domain, testTag, caseName + `: Create ImageSource failed`);
          expect().assertFail();
          done();
          return;
        }
        let picture = ndkTest.CreatePictureByImageSourceWithOptions(imageSource);
        ndkTest.ImageSourceRelease(imageSource);
        if(picture == null)
        {
          hilog.error(domain, testTag, caseName + `: Create Picture failed`);
          expect().assertFail();
          done();
          return;
        }
        let result = ndkTest.GetHdrComposedPixelmapAndPixelMapTest(picture);
        ndkTest.PictureRelease(picture);
        if(typeof result == 'string')
        {
          hilog.error(domain, testTag, caseName + `: GetHdrComposedPixelmapAndPixelMapTest failed ` + result);
          expect().assertFail();
          done();
        } else{
          if(result != 0)
          {
            hilog.error(domain, testTag, caseName + `: GetHdrComposedPixelmapAndPixelMapTest failed, errorCode: ` + result);
          }
          expect(result == 0).assertTrue();
          done();
        }
      }
    })

  })
}