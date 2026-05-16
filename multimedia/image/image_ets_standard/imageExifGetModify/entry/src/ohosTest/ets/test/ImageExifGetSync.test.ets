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

import hilog from '@ohos.hilog';
import { describe, it, expect, afterEach, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import json from '@ohos.util.json';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';


interface picTypeValue {
  name:string
  fileName:string
  value?:string
  initValue?:string
  modifyData?:string
  compareData?:string
  errorData?: string
}

interface errorCode {
  code: number
}

export default function imageExifGetSyncTest() {

  describe('imageExifGetSyncTest', () => {
    let filePath: string;
    let fdNumber: number
    const modfiyFileSuffixs = ["jpg", "webp", "png", "heic"]
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE)
      fdNumber = file.fd
    }

    const getBuffer = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    const getImageSource = async(fileName:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "buffer"){
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        const filePath = AppStorage.get('pathDir') + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = await image.createImageSource(rawFileDescriptor)
      }else if(type === "incremental") {
        const picBuffer = await getBuffer(fileName)
        imageSourceApi = image.CreateIncrementalSource(picBuffer)
      }else{
        await getFd(fileName);
        imageSourceApi = image.createImageSource(fdNumber);
        fs.closeSync(fdNumber) // getFd open fd，创建ImageSource后，close fd。
      }
      return imageSourceApi
    }

    const testGetExifSyncKeys = async (testTag: string, compareDataMap: Map<image.PropertyKey, string | undefined>,
                                  fileName:string, type:string): Promise<boolean> => {
      let checkResult = true;
      const keys = Array.from(compareDataMap.keys());
      for (const key of keys){
        const imageSourceApi = await getImageSource(fileName, type)
        if (imageSourceApi == undefined) {
          console.info(testTag + " create image source failed");
        } else {
          const expectedValue = compareDataMap.get(key)
          const result = imageSourceApi.getImagePropertySync(key)
          console.info(`key: %{public}s ExpectValue: %{public}s RealValue: %{public}s`, key, expectedValue, result)
          if(expectedValue != result){
            hilog.info(0x0000, testTag,
              `testGetExifSync error %{public}s %{public}s fileName: %{public}s result: %{public}s value: %{public}s`,
              testTag, key, fileName, result, expectedValue);
            checkResult = false;
          }
        }
        imageSourceApi.release();
      }
      return checkResult;
    }

    const testGetIncludeSync = async (testTag: string, key: image.PropertyKey, compareData: string | undefined,
                                  fileName:string, type:string) => {
      let checkResult = false
      const imageSourceApi = await getImageSource(fileName, type)
      if (imageSourceApi == undefined) {
        console.info(testTag + " create image source failed");
      } else {
        const result = imageSourceApi.getImagePropertySync(key)
        checkResult = result.includes(compareData == undefined ? testTag : compareData)
        if(!checkResult){
          hilog.info(0x0000, testTag,
            `testGetIncludeSync error %{public}s %{public}s fileName: %{public}s result: %{public}s value: %{public}s`,
            testTag, key, fileName, result, compareData);
        }
      }
      imageSourceApi.release();
      return checkResult
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0100
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0100'
      const fileName = 'test_exif_v5.jpg'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.NEW_SUBFILE_TYPE, "3"],
        [image.PropertyKey.SUBFILE_TYPE, "2"],
        [image.PropertyKey.IMAGE_WIDTH, "0"],
        [image.PropertyKey.IMAGE_LENGTH, "0"],
        [image.PropertyKey.BITS_PER_SAMPLE, "1, 1, 1"],
        [image.PropertyKey.COMPRESSION, "Uncompressed"],
        [image.PropertyKey.PHOTOMETRIC_INTERPRETATION, "Reversed mono"],
        [image.PropertyKey.IMAGE_DESCRIPTION, "_cuva%s\\d"],
        [image.PropertyKey.MAKE, "华为"],
        [image.PropertyKey.MODEL, "TNY-AL00"],
        [image.PropertyKey.STRIP_OFFSETS, "123"],
        [image.PropertyKey.ORIENTATION, "Top-left"],
        [image.PropertyKey.SAMPLES_PER_PIXEL, "0"],
        [image.PropertyKey.ROWS_PER_STRIP, "123"],
        [image.PropertyKey.STRIP_BYTE_COUNTS, "123"],
        [image.PropertyKey.X_RESOLUTION, " 0"],
        [image.PropertyKey.Y_RESOLUTION, " 0"],
        [image.PropertyKey.PLANAR_CONFIGURATION, "Chunky format"],
        [image.PropertyKey.RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.TRANSFER_FUNCTION, "3 bytes undefined data"],
        [image.PropertyKey.SOFTWARE, "华为"],
        [image.PropertyKey.DATE_TIME, "2024:12:31"],
        [image.PropertyKey.ARTIST, "None"],
        [image.PropertyKey.WHITE_POINT, "252, 0/0"],
        [image.PropertyKey.PRIMARY_CHROMATICITIES, " 0"],
        [image.PropertyKey.PHOTO_MODE, "252"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT, "2798"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH, "4"],
        [image.PropertyKey.YCBCR_COEFFICIENTS, "0.299, 0.587, 0.114"],
        [image.PropertyKey.YCBCR_SUB_SAMPLING, "3, 2"],
        [image.PropertyKey.YCBCR_POSITIONING, "Centered"],
        [image.PropertyKey.REFERENCE_BLACK_WHITE, "222,  0, 1.5,  0, 25.2, 25.2"],
        [image.PropertyKey.COPYRIGHT, "undefined (Photographer) - [None] (Editor)"],
        [image.PropertyKey.EXPOSURE_TIME, "1/34 sec."],
        [image.PropertyKey.F_NUMBER, "f/1.0"],
        [image.PropertyKey.EXPOSURE_PROGRAM, "Not defined"],
        [image.PropertyKey.SPECTRAL_SENSITIVITY, "abc"],
        [image.PropertyKey.GPS_VERSION_ID, "2.2.0.0"],
        [image.PropertyKey.GPS_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_LATITUDE, "39, 54, 20"],
        [image.PropertyKey.GPS_ALTITUDE_REF, "Sea level"],
        [image.PropertyKey.GPS_ALTITUDE, "0.00"],
        [image.PropertyKey.GPS_TIME_STAMP, "11:37:58.00"],
        [image.PropertyKey.GPS_SATELLITES, "xxx"],
        [image.PropertyKey.GPS_STATUS, "A"],
        [image.PropertyKey.GPS_MEASURE_MODE, "2"],
        [image.PropertyKey.GPS_DOP, "182"],
        [image.PropertyKey.GPS_SPEED_REF, "N"],
        [image.PropertyKey.GPS_SPEED, "150"],
        [image.PropertyKey.GPS_TRACK_REF, "T"],
        [image.PropertyKey.GPS_TRACK, "38.0"],
        [image.PropertyKey.GPS_IMG_DIRECTION_REF, "M"],
        [image.PropertyKey.GPS_IMG_DIRECTION, "2.23"],
        [image.PropertyKey.GPS_MAP_DATUM, "xxx"],
        [image.PropertyKey.GPS_DEST_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_DEST_LATITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_LONGITUDE_REF, "E"],
        [image.PropertyKey.GPS_DEST_LONGITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_BEARING_REF, "T"],
        [image.PropertyKey.GPS_DEST_BEARING, "2.0"],
        [image.PropertyKey.GPS_DEST_DISTANCE_REF, "N"],
        [image.PropertyKey.GPS_DEST_DISTANCE, "10"],
        [image.PropertyKey.GPS_PROCESSING_METHOD, "CELLID"],
        [image.PropertyKey.GPS_AREA_INFORMATION, "arexxx"],
        [image.PropertyKey.GPS_DATE_STAMP, "2025:01:11"],
        [image.PropertyKey.GPS_DIFFERENTIAL, "0"],
        [image.PropertyKey.GPS_H_POSITIONING_ERROR, "2.5"],
        [image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY, "1"],
        [image.PropertyKey.OECF, "4 bytes undefined data"],
        [image.PropertyKey.SENSITIVITY_TYPE, "Standard output sensitivity (SOS) and ISO speed"],
        [image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, "5"],
        [image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX, "123"],
        [image.PropertyKey.ISO_SPEED, "1"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_YYY, "1456"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ, "1456"],
        [image.PropertyKey.EXIF_VERSION, "Exif Version 1.1"],
        [image.PropertyKey.DATE_TIME_ORIGINAL, "2024:01:25 05:51:34"],
        [image.PropertyKey.DATE_TIME_DIGITIZED, "2022:06:02 15:51:34"],
        [image.PropertyKey.OFFSET_TIME, "2024:01:25"],
        [image.PropertyKey.OFFSET_TIME_DIGITIZED, "cfh"],
        [image.PropertyKey.OFFSET_TIME_ORIGINAL, "chex"],
        [image.PropertyKey.COMPONENTS_CONFIGURATION, "Y R G B"],
        [image.PropertyKey.COMPRESSED_BITS_PER_PIXEL, "24"],
        [image.PropertyKey.SHUTTER_SPEED, "2.50 EV (1/6 sec.)"],
        [image.PropertyKey.APERTURE_VALUE, "4.00 EV (f/4.0)"],
        [image.PropertyKey.BRIGHTNESS_VALUE, "2.50 EV (19.38 cd/m^2)"],
        [image.PropertyKey.EXPOSURE_BIAS_VALUE, "23.00 EV"],
        [image.PropertyKey.MAX_APERTURE_VALUE, "2.50 EV (f/2.4)"],
        [image.PropertyKey.SUBJECT_DISTANCE, "2.5 m"],
        [image.PropertyKey.METERING_MODE, "Pattern"],
        [image.PropertyKey.LIGHT_SOURCE, "Daylight"],
        [image.PropertyKey.FLASH, "Strobe return light not detected"],
        [image.PropertyKey.FOCAL_LENGTH, "0.0 mm"],
        [image.PropertyKey.SUBJECT_AREA, "(x,y) = (12,13)"],
        [image.PropertyKey.SCENE_POINTER, "256"],
        [image.PropertyKey.SCENE_VERSION, "1"],
        [image.PropertyKey.SCENE_FOOD_CONF, "2"],
        [image.PropertyKey.SCENE_STAGE_CONF, "3"],
        [image.PropertyKey.SCENE_BLUE_SKY_CONF, "4"],
        [image.PropertyKey.SCENE_GREEN_PLANT_CONF, "5"],
        [image.PropertyKey.SCENE_BEACH_CONF, "6"],
        [image.PropertyKey.SCENE_SNOW_CONF, "7"],
        [image.PropertyKey.SCENE_SUNSET_CONF, "8"],
        [image.PropertyKey.SCENE_FLOWERS_CONF, "9"],
        [image.PropertyKey.SCENE_NIGHT_CONF, "10"],
        [image.PropertyKey.SCENE_TEXT_CONF, "11"],
        [image.PropertyKey.FACE_POINTER, "122"],
        [image.PropertyKey.FACE_VERSION, "1"],
        [image.PropertyKey.FACE_COUNT, "2"],
        [image.PropertyKey.FACE_CONF, "3"],
        [image.PropertyKey.FACE_SMILE_SCORE, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_RECT, "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_LEYE_CENTER, "1 2 3 4"],
        [image.PropertyKey.FACE_MOUTH_CENTER, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.CAPTURE_MODE, "1"],
        [image.PropertyKey.BURST_NUMBER, "2"],
        [image.PropertyKey.FRONT_CAMERA, "3"],
        [image.PropertyKey.ROLL_ANGLE, "4"],
        [image.PropertyKey.PITCH_ANGLE, "5"],
        [image.PropertyKey.PHYSICAL_APERTURE, "6"],
        [image.PropertyKey.FOCUS_MODE, "7"],
        [image.PropertyKey.USER_COMMENT, "place for user comments"],
        [image.PropertyKey.SUBSEC_TIME, "123456"],
        [image.PropertyKey.SUBSEC_TIME_ORIGINAL, "427000"],
        [image.PropertyKey.SUBSEC_TIME_DIGITIZED, "427000"],
        [image.PropertyKey.FLASHPIX_VERSION, "FlashPix Version 1.0"],
        [image.PropertyKey.COLOR_SPACE, "sRGB"],
        [image.PropertyKey.PIXEL_X_DIMENSION, "123"],
        [image.PropertyKey.PIXEL_Y_DIMENSION, "234"],
        [image.PropertyKey.RELATED_SOUND_FILE, "/usr/home"],
        [image.PropertyKey.FLASH_ENERGY, "832"],
        [image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE, "13"],
        [image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, "1080"],
        [image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, "880"],
        [image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.SUBJECT_LOCATION, "0, 1"],
        [image.PropertyKey.EXPOSURE_INDEX, "1.5"],
        [image.PropertyKey.SENSING_METHOD, "Two-chip color area sensor"],
        [image.PropertyKey.FILE_SOURCE, "DSC"],
        [image.PropertyKey.SCENE_TYPE, "Directly photographed"],
        [image.PropertyKey.CFA_PATTERN, "1 bytes undefined data"],
        [image.PropertyKey.CUSTOM_RENDERED, "Normal process"],
        [image.PropertyKey.EXPOSURE_MODE, "Auto exposure"],
        [image.PropertyKey.WHITE_BALANCE, "Manual white balance"],
        [image.PropertyKey.DIGITAL_ZOOM_RATIO, "321"],
        [image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM, "2"],
        [image.PropertyKey.SCENE_CAPTURE_TYPE, "Standard"],
        [image.PropertyKey.GAIN_CONTROL, "Normal"],
        [image.PropertyKey.CONTRAST, "Normal"],
        [image.PropertyKey.SATURATION, "Normal"],
        [image.PropertyKey.SHARPNESS, "Normal"],
        [image.PropertyKey.DEVICE_SETTING_DESCRIPTION, "2xxx"],
        [image.PropertyKey.SUBJECT_DISTANCE_RANGE, "Unknown"],
        [image.PropertyKey.IMAGE_UNIQUE_ID, "FXIC012"],
        [image.PropertyKey.CAMERA_OWNER_NAME, "c.uec"],
        [image.PropertyKey.BODY_SERIAL_NUMBER, "exoch"],
        [image.PropertyKey.LENS_SPECIFICATION, "0.8, 2.5, 1.5, 0.5"],
        [image.PropertyKey.LENS_MAKE, "xxwx"],
        [image.PropertyKey.LENS_MODEL, "txaw"],
        [image.PropertyKey.LENS_SERIAL_NUMBER, "qxhc"],
        [image.PropertyKey.COMPOSITE_IMAGE, "2"],
        [image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, "23, 34"],
        [image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, "xxxw"],
        [image.PropertyKey.GAMMA, "2.5"],
        [image.PropertyKey.DNG_VERSION, "2, 2, 3, 1"],
        [image.PropertyKey.DEFAULT_CROP_SIZE, "153, 841"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0200
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0200'
      const fileName = 'test_exif_v5.webp'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.NEW_SUBFILE_TYPE, "3"],
        [image.PropertyKey.SUBFILE_TYPE, "2"],
        [image.PropertyKey.IMAGE_WIDTH, "3456"],
        [image.PropertyKey.IMAGE_LENGTH, "4608"],
        [image.PropertyKey.BITS_PER_SAMPLE, "8, 8, 8"],
        [image.PropertyKey.COMPRESSION, "Uncompressed"],
        [image.PropertyKey.PHOTOMETRIC_INTERPRETATION, "Reversed mono"],
        [image.PropertyKey.IMAGE_DESCRIPTION, "cuva"],
        [image.PropertyKey.MAKE, "华为"],
        [image.PropertyKey.STRIP_OFFSETS, "123"],
        [image.PropertyKey.ORIENTATION, "Top-right"],
        [image.PropertyKey.SAMPLES_PER_PIXEL, "23"],
        [image.PropertyKey.ROWS_PER_STRIP, "123"],
        [image.PropertyKey.STRIP_BYTE_COUNTS, "123"],
        [image.PropertyKey.X_RESOLUTION, "72"],
        [image.PropertyKey.Y_RESOLUTION, "72"],
        [image.PropertyKey.PLANAR_CONFIGURATION, "Chunky format"],
        [image.PropertyKey.RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.TRANSFER_FUNCTION, "1 bytes undefined data"],
        [image.PropertyKey.SOFTWARE, "TNY-AL00"],
        [image.PropertyKey.DATE_TIME, "2022:06:02 15:51:35"],
        [image.PropertyKey.ARTIST, "Bogdan Hrastnik"],
        [image.PropertyKey.WHITE_POINT, "124, 0/0"],
        [image.PropertyKey.PRIMARY_CHROMATICITIES, "124"],
        [image.PropertyKey.PHOTO_MODE, "123"],
        [image.PropertyKey.YCBCR_COEFFICIENTS, "0.299, 0.587, 0.114"],
        [image.PropertyKey.YCBCR_SUB_SAMPLING, "3, 3"],
        [image.PropertyKey.YCBCR_POSITIONING, "Centered"],
        [image.PropertyKey.REFERENCE_BLACK_WHITE, "221, 255,  0, 255,  0, 255"],
        [image.PropertyKey.COPYRIGHT, "ABB (Photographer) - [None] (Editor)"],
        [image.PropertyKey.EXPOSURE_TIME, "1/33 sec."],
        [image.PropertyKey.F_NUMBER, "f/1.8"],
        [image.PropertyKey.EXPOSURE_PROGRAM, "Normal program"],
        [image.PropertyKey.SPECTRAL_SENSITIVITY, "sensitivity"],
        [image.PropertyKey.GPS_VERSION_ID, "2.2.0.0"],
        [image.PropertyKey.GPS_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_LATITUDE, "39, 54, 20"],
        [image.PropertyKey.GPS_ALTITUDE_REF, "Sea level reference"],
        [image.PropertyKey.GPS_ALTITUDE, "0.00"],
        [image.PropertyKey.GPS_TIME_STAMP, "11:37:58.00"],
        [image.PropertyKey.GPS_SATELLITES, "BBA"],
        [image.PropertyKey.GPS_STATUS, "A"],
        [image.PropertyKey.GPS_MEASURE_MODE, "2"],
        [image.PropertyKey.GPS_DOP, "182"],
        [image.PropertyKey.GPS_SPEED_REF, "K"],
        [image.PropertyKey.GPS_SPEED, "150"],
        [image.PropertyKey.GPS_TRACK_REF, "T"],
        [image.PropertyKey.GPS_TRACK, "111"],
        [image.PropertyKey.GPS_IMG_DIRECTION_REF, "M"],
        [image.PropertyKey.GPS_IMG_DIRECTION, "2.23"],
        [image.PropertyKey.GPS_MAP_DATUM, "TEST"],
        [image.PropertyKey.GPS_DEST_LATITUDE_REF, "S"],
        [image.PropertyKey.GPS_DEST_LATITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_LONGITUDE_REF, "W"],
        [image.PropertyKey.GPS_DEST_LONGITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_BEARING_REF, "M"],
        [image.PropertyKey.GPS_DEST_BEARING, "2.0"],
        [image.PropertyKey.GPS_DEST_DISTANCE_REF, "K"],
        [image.PropertyKey.GPS_DEST_DISTANCE, "10"],
        [image.PropertyKey.GPS_PROCESSING_METHOD, "CELLID"],
        [image.PropertyKey.GPS_AREA_INFORMATION, "accxx"],
        [image.PropertyKey.GPS_DATE_STAMP, "2022:01:11"],
        [image.PropertyKey.GPS_DIFFERENTIAL, "1"],
        [image.PropertyKey.GPS_H_POSITIONING_ERROR, " 2"],
        [image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY, "200"],
        [image.PropertyKey.OECF, "2 bytes undefined data"],
        [image.PropertyKey.SENSITIVITY_TYPE, "Standard output sensitivity (SOS) and ISO speed"],
        [image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, "5"],
        [image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX, "241"],
        [image.PropertyKey.ISO_SPEED, "200"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_YYY, "3"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ, "3"],
        [image.PropertyKey.EXIF_VERSION, "Exif Version 1.1"],
        [image.PropertyKey.DATE_TIME_ORIGINAL, "2022:06:02 15:51:35"],
        [image.PropertyKey.DATE_TIME_DIGITIZED, "2022:06:02 15:51:35"],
        [image.PropertyKey.OFFSET_TIME, "111"],
        [image.PropertyKey.OFFSET_TIME_DIGITIZED, "abs"],
        [image.PropertyKey.OFFSET_TIME_ORIGINAL, "00xx"],
        [image.PropertyKey.COMPONENTS_CONFIGURATION, "Y R G B"],
        [image.PropertyKey.COMPRESSED_BITS_PER_PIXEL, "0.95"],
        [image.PropertyKey.SHUTTER_SPEED, "14.00 EV (1/16384 sec.)"],
        [image.PropertyKey.APERTURE_VALUE, "1.69 EV (f/1.8)"],
        [image.PropertyKey.BRIGHTNESS_VALUE, "0.00 EV (3.43 cd/m^2)"],
        [image.PropertyKey.EXPOSURE_BIAS_VALUE, "0.00 EV"],
        [image.PropertyKey.MAX_APERTURE_VALUE, "1.69 EV (f/1.8)"],
        [image.PropertyKey.SUBJECT_DISTANCE, "25.0 m"],
        [image.PropertyKey.METERING_MODE, "Pattern"],
        [image.PropertyKey.LIGHT_SOURCE, "Daylight"],
        [image.PropertyKey.FLASH, "Flash did not fire, auto mode"],
        [image.PropertyKey.FOCAL_LENGTH, "31.0 mm"],
        [image.PropertyKey.SUBJECT_AREA, "(x,y) = (10,20)"],
        [image.PropertyKey.SCENE_POINTER, "256"],
        [image.PropertyKey.SCENE_VERSION, "1"],
        [image.PropertyKey.SCENE_FOOD_CONF, "2"],
        [image.PropertyKey.SCENE_STAGE_CONF, "3"],
        [image.PropertyKey.SCENE_BLUE_SKY_CONF, "4"],
        [image.PropertyKey.SCENE_GREEN_PLANT_CONF, "5"],
        [image.PropertyKey.SCENE_BEACH_CONF, "6"],
        [image.PropertyKey.SCENE_SNOW_CONF, "7"],
        [image.PropertyKey.SCENE_SUNSET_CONF, "8"],
        [image.PropertyKey.SCENE_FLOWERS_CONF, "9"],
        [image.PropertyKey.SCENE_NIGHT_CONF, "10"],
        [image.PropertyKey.SCENE_TEXT_CONF, "11"],
        [image.PropertyKey.FACE_POINTER, "122"],
        [image.PropertyKey.FACE_VERSION, "1"],
        [image.PropertyKey.FACE_COUNT, "2"],
        [image.PropertyKey.FACE_CONF, "3"],
        [image.PropertyKey.FACE_SMILE_SCORE, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_RECT, "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_LEYE_CENTER, "1 2 3 4"],
        [image.PropertyKey.FACE_MOUTH_CENTER, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.CAPTURE_MODE, "1"],
        [image.PropertyKey.BURST_NUMBER, "2"],
        [image.PropertyKey.FRONT_CAMERA, "3"],
        [image.PropertyKey.ROLL_ANGLE, "4"],
        [image.PropertyKey.PITCH_ANGLE, "5"],
        [image.PropertyKey.PHYSICAL_APERTURE, "6"],
        [image.PropertyKey.FOCUS_MODE, "7"],
        [image.PropertyKey.USER_COMMENT, "place for user comments."],
        [image.PropertyKey.SUBSEC_TIME, "123456"],
        [image.PropertyKey.SUBSEC_TIME_ORIGINAL, "543792"],
        [image.PropertyKey.SUBSEC_TIME_DIGITIZED, "427000"],
        [image.PropertyKey.FLASHPIX_VERSION, "FlashPix Version 1.0"],
        [image.PropertyKey.COLOR_SPACE, "sRGB"],
        [image.PropertyKey.PIXEL_X_DIMENSION, "123"],
        [image.PropertyKey.PIXEL_Y_DIMENSION, "4608"],
        [image.PropertyKey.RELATED_SOUND_FILE, "abb"],
        [image.PropertyKey.FLASH_ENERGY, "832"],
        [image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE, "13"],
        [image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, "1080"],
        [image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, "880"],
        [image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT, "Centimeter"],
        [image.PropertyKey.SUBJECT_LOCATION, "5, 6"],
        [image.PropertyKey.EXPOSURE_INDEX, "1.5"],
        [image.PropertyKey.SENSING_METHOD, "One-chip color area sensor"],
        [image.PropertyKey.FILE_SOURCE, "DSC"],
        [image.PropertyKey.SCENE_TYPE, "Directly photographed"],
        [image.PropertyKey.CFA_PATTERN, "1 bytes undefined data"],
        [image.PropertyKey.CUSTOM_RENDERED, "Custom process"],
        [image.PropertyKey.EXPOSURE_MODE, "Auto exposure"],
        [image.PropertyKey.WHITE_BALANCE, "Auto white balance"],
        [image.PropertyKey.DIGITAL_ZOOM_RATIO, "1.00"],
        [image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM, "27"],
        [image.PropertyKey.SCENE_CAPTURE_TYPE, "Standard"],
        [image.PropertyKey.GAIN_CONTROL, "Normal"],
        [image.PropertyKey.CONTRAST, "Normal"],
        [image.PropertyKey.SATURATION, "Normal"],
        [image.PropertyKey.SHARPNESS, "Normal"],
        [image.PropertyKey.DEVICE_SETTING_DESCRIPTION, "2"],
        [image.PropertyKey.SUBJECT_DISTANCE_RANGE, "Unknown"],
        [image.PropertyKey.IMAGE_UNIQUE_ID, "FXIC012"],
        [image.PropertyKey.CAMERA_OWNER_NAME, "2"],
        [image.PropertyKey.BODY_SERIAL_NUMBER, "x1"],
        [image.PropertyKey.LENS_SPECIFICATION, " 1, 2.5,  3,  2"],
        [image.PropertyKey.LENS_MAKE, "aaa"],
        [image.PropertyKey.LENS_MODEL, "xxx"],
        [image.PropertyKey.LENS_SERIAL_NUMBER, "111"],
        [image.PropertyKey.COMPOSITE_IMAGE, "2"],
        [image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, "1234, 1"],
        [image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, "123"],
        [image.PropertyKey.GAMMA, "1.5"],
        [image.PropertyKey.DNG_VERSION, "1, 1, 2, 3"],
        [image.PropertyKey.DEFAULT_CROP_SIZE, "12, 1"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0300
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0300'
      const fileName = 'test_exif_v5.png'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.NEW_SUBFILE_TYPE, "3"],
        [image.PropertyKey.SUBFILE_TYPE, "2"],
        [image.PropertyKey.IMAGE_WIDTH, "0"],
        [image.PropertyKey.IMAGE_LENGTH, "0"],
        [image.PropertyKey.BITS_PER_SAMPLE, "1, 1, 1"],
        [image.PropertyKey.COMPRESSION, "Uncompressed"],
        [image.PropertyKey.PHOTOMETRIC_INTERPRETATION, "Reversed mono"],
        [image.PropertyKey.IMAGE_DESCRIPTION, "_cuva%s\\d"],
        [image.PropertyKey.MAKE, "华为"],
        [image.PropertyKey.MODEL, "TNY-AL00"],
        [image.PropertyKey.STRIP_OFFSETS, "123"],
        [image.PropertyKey.ORIENTATION, "Top-left"],
        [image.PropertyKey.SAMPLES_PER_PIXEL, "0"],
        [image.PropertyKey.ROWS_PER_STRIP, "123"],
        [image.PropertyKey.STRIP_BYTE_COUNTS, "123"],
        [image.PropertyKey.X_RESOLUTION, " 0"],
        [image.PropertyKey.Y_RESOLUTION, " 0"],
        [image.PropertyKey.PLANAR_CONFIGURATION, "Chunky format"],
        [image.PropertyKey.RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.TRANSFER_FUNCTION, "3 bytes undefined data"],
        [image.PropertyKey.SOFTWARE, "华为"],
        [image.PropertyKey.DATE_TIME, "2024:12:31"],
        [image.PropertyKey.ARTIST, "None"],
        [image.PropertyKey.WHITE_POINT, "252, 0/0"],
        [image.PropertyKey.PRIMARY_CHROMATICITIES, " 0"],
        [image.PropertyKey.PHOTO_MODE, "252"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT, "2798"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH, "4"],
        [image.PropertyKey.YCBCR_COEFFICIENTS, "0.299, 0.587, 0.114"],
        [image.PropertyKey.YCBCR_SUB_SAMPLING, "3, 2"],
        [image.PropertyKey.YCBCR_POSITIONING, "Centered"],
        [image.PropertyKey.REFERENCE_BLACK_WHITE, "222,  0, 1.5,  0, 25.2, 25.2"],
        [image.PropertyKey.COPYRIGHT, "undefined (Photographer) - [None] (Editor)"],
        [image.PropertyKey.EXPOSURE_TIME, "1/34 sec."],
        [image.PropertyKey.F_NUMBER, "f/1.0"],
        [image.PropertyKey.EXPOSURE_PROGRAM, "Not defined"],
        [image.PropertyKey.SPECTRAL_SENSITIVITY, "abc"],
        [image.PropertyKey.GPS_VERSION_ID, "2.2.0.0"],
        [image.PropertyKey.GPS_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_LATITUDE, "39, 54, 20"],
        [image.PropertyKey.GPS_ALTITUDE_REF, "Sea level"],
        [image.PropertyKey.GPS_ALTITUDE, "0.00"],
        [image.PropertyKey.GPS_TIME_STAMP, "11:37:58.00"],
        [image.PropertyKey.GPS_SATELLITES, "xxx"],
        [image.PropertyKey.GPS_STATUS, "A"],
        [image.PropertyKey.GPS_MEASURE_MODE, "2"],
        [image.PropertyKey.GPS_DOP, "182"],
        [image.PropertyKey.GPS_SPEED_REF, "N"],
        [image.PropertyKey.GPS_SPEED, "150"],
        [image.PropertyKey.GPS_TRACK_REF, "T"],
        [image.PropertyKey.GPS_TRACK, "38.0"],
        [image.PropertyKey.GPS_IMG_DIRECTION_REF, "M"],
        [image.PropertyKey.GPS_IMG_DIRECTION, "2.23"],
        [image.PropertyKey.GPS_MAP_DATUM, "xxx"],
        [image.PropertyKey.GPS_DEST_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_DEST_LATITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_LONGITUDE_REF, "E"],
        [image.PropertyKey.GPS_DEST_LONGITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_BEARING_REF, "T"],
        [image.PropertyKey.GPS_DEST_BEARING, "2.0"],
        [image.PropertyKey.GPS_DEST_DISTANCE_REF, "N"],
        [image.PropertyKey.GPS_DEST_DISTANCE, "10"],
        [image.PropertyKey.GPS_PROCESSING_METHOD, "CELLID"],
        [image.PropertyKey.GPS_AREA_INFORMATION, "arexxx"],
        [image.PropertyKey.GPS_DATE_STAMP, "2025:01:11"],
        [image.PropertyKey.GPS_DIFFERENTIAL, "0"],
        [image.PropertyKey.GPS_H_POSITIONING_ERROR, "2.5"],
        [image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY, "1"],
        [image.PropertyKey.OECF, "4 bytes undefined data"],
        [image.PropertyKey.SENSITIVITY_TYPE, "Standard output sensitivity (SOS) and ISO speed"],
        [image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, "5"],
        [image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX, "123"],
        [image.PropertyKey.ISO_SPEED, "1"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_YYY, "1456"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ, "1456"],
        [image.PropertyKey.EXIF_VERSION, "Exif Version 1.1"],
        [image.PropertyKey.DATE_TIME_ORIGINAL, "2024:01:25 05:51:34"],
        [image.PropertyKey.DATE_TIME_DIGITIZED, "2022:06:02 15:51:34"],
        [image.PropertyKey.OFFSET_TIME, "2024:01:25"],
        [image.PropertyKey.OFFSET_TIME_DIGITIZED, "cfh"],
        [image.PropertyKey.OFFSET_TIME_ORIGINAL, "chex"],
        [image.PropertyKey.COMPONENTS_CONFIGURATION, "Y R G B"],
        [image.PropertyKey.COMPRESSED_BITS_PER_PIXEL, "24"],
        [image.PropertyKey.SHUTTER_SPEED, "2.50 EV (1/6 sec.)"],
        [image.PropertyKey.APERTURE_VALUE, "4.00 EV (f/4.0)"],
        [image.PropertyKey.BRIGHTNESS_VALUE, "2.50 EV (19.38 cd/m^2)"],
        [image.PropertyKey.EXPOSURE_BIAS_VALUE, "23.00 EV"],
        [image.PropertyKey.MAX_APERTURE_VALUE, "2.50 EV (f/2.4)"],
        [image.PropertyKey.SUBJECT_DISTANCE, "2.5 m"],
        [image.PropertyKey.METERING_MODE, "Pattern"],
        [image.PropertyKey.LIGHT_SOURCE, "Daylight"],
        [image.PropertyKey.FLASH, "Strobe return light not detected"],
        [image.PropertyKey.FOCAL_LENGTH, "0.0 mm"],
        [image.PropertyKey.SUBJECT_AREA, "(x,y) = (12,13)"],
        [image.PropertyKey.SCENE_POINTER, "256"],
        [image.PropertyKey.SCENE_VERSION, "1"],
        [image.PropertyKey.SCENE_FOOD_CONF, "2"],
        [image.PropertyKey.SCENE_STAGE_CONF, "3"],
        [image.PropertyKey.SCENE_BLUE_SKY_CONF, "4"],
        [image.PropertyKey.SCENE_GREEN_PLANT_CONF, "5"],
        [image.PropertyKey.SCENE_BEACH_CONF, "6"],
        [image.PropertyKey.SCENE_SNOW_CONF, "7"],
        [image.PropertyKey.SCENE_SUNSET_CONF, "8"],
        [image.PropertyKey.SCENE_FLOWERS_CONF, "9"],
        [image.PropertyKey.SCENE_NIGHT_CONF, "10"],
        [image.PropertyKey.SCENE_TEXT_CONF, "11"],
        [image.PropertyKey.FACE_POINTER, "122"],
        [image.PropertyKey.FACE_VERSION, "1"],
        [image.PropertyKey.FACE_COUNT, "2"],
        [image.PropertyKey.FACE_CONF, "3"],
        [image.PropertyKey.FACE_SMILE_SCORE, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_RECT, "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_LEYE_CENTER, "1 2 3 4"],
        [image.PropertyKey.FACE_MOUTH_CENTER, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.CAPTURE_MODE, "1"],
        [image.PropertyKey.BURST_NUMBER, "2"],
        [image.PropertyKey.FRONT_CAMERA, "3"],
        [image.PropertyKey.ROLL_ANGLE, "4"],
        [image.PropertyKey.PITCH_ANGLE, "5"],
        [image.PropertyKey.PHYSICAL_APERTURE, "6"],
        [image.PropertyKey.FOCUS_MODE, "7"],
        [image.PropertyKey.USER_COMMENT, "place for user comments"],
        [image.PropertyKey.SUBSEC_TIME, "123456"],
        [image.PropertyKey.SUBSEC_TIME_ORIGINAL, "427000"],
        [image.PropertyKey.SUBSEC_TIME_DIGITIZED, "427000"],
        [image.PropertyKey.FLASHPIX_VERSION, "FlashPix Version 1.0"],
        [image.PropertyKey.COLOR_SPACE, "sRGB"],
        [image.PropertyKey.PIXEL_X_DIMENSION, "123"],
        [image.PropertyKey.PIXEL_Y_DIMENSION, "234"],
        [image.PropertyKey.RELATED_SOUND_FILE, "/usr/home"],
        [image.PropertyKey.FLASH_ENERGY, "832"],
        [image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE, "13"],
        [image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, "1080"],
        [image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, "880"],
        [image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.SUBJECT_LOCATION, "0, 1"],
        [image.PropertyKey.EXPOSURE_INDEX, "1.5"],
        [image.PropertyKey.SENSING_METHOD, "Two-chip color area sensor"],
        [image.PropertyKey.FILE_SOURCE, "DSC"],
        [image.PropertyKey.SCENE_TYPE, "Directly photographed"],
        [image.PropertyKey.CFA_PATTERN, "1 bytes undefined data"],
        [image.PropertyKey.CUSTOM_RENDERED, "Normal process"],
        [image.PropertyKey.EXPOSURE_MODE, "Auto exposure"],
        [image.PropertyKey.WHITE_BALANCE, "Manual white balance"],
        [image.PropertyKey.DIGITAL_ZOOM_RATIO, "321"],
        [image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM, "2"],
        [image.PropertyKey.SCENE_CAPTURE_TYPE, "Standard"],
        [image.PropertyKey.GAIN_CONTROL, "Normal"],
        [image.PropertyKey.CONTRAST, "Normal"],
        [image.PropertyKey.SATURATION, "Normal"],
        [image.PropertyKey.SHARPNESS, "Normal"],
        [image.PropertyKey.DEVICE_SETTING_DESCRIPTION, "2xxx"],
        [image.PropertyKey.SUBJECT_DISTANCE_RANGE, "Unknown"],
        [image.PropertyKey.IMAGE_UNIQUE_ID, "FXIC012"],
        [image.PropertyKey.CAMERA_OWNER_NAME, "c.uec"],
        [image.PropertyKey.BODY_SERIAL_NUMBER, "exoch"],
        [image.PropertyKey.LENS_SPECIFICATION, "0.8, 2.5, 1.5, 0.5"],
        [image.PropertyKey.LENS_MAKE, "xxwx"],
        [image.PropertyKey.LENS_MODEL, "txaw"],
        [image.PropertyKey.LENS_SERIAL_NUMBER, "qxhc"],
        [image.PropertyKey.COMPOSITE_IMAGE, "2"],
        [image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, "23, 34"],
        [image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, "xxxw"],
        [image.PropertyKey.GAMMA, "2.5"],
        [image.PropertyKey.DNG_VERSION, "2, 2, 3, 1"],
        [image.PropertyKey.DEFAULT_CROP_SIZE, "153, 841"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0400
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0400
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0400', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0400'
      const fileName = 'test_exif_v5.dng'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.NEW_SUBFILE_TYPE, "1"],
        [image.PropertyKey.SUBFILE_TYPE, "1"],
        [image.PropertyKey.IMAGE_WIDTH, "256"],
        [image.PropertyKey.IMAGE_LENGTH, "192"],
        [image.PropertyKey.BITS_PER_SAMPLE, "8, 8, 8"],
        [image.PropertyKey.COMPRESSION, "Uncompressed"],
        [image.PropertyKey.PHOTOMETRIC_INTERPRETATION, "RGB"],
        [image.PropertyKey.IMAGE_DESCRIPTION, "_cuva"],
        [image.PropertyKey.MAKE, "HUAWEI"],
        [image.PropertyKey.MODEL, "MNA-AL00"],
        [image.PropertyKey.STRIP_OFFSETS, "10348"],
        [image.PropertyKey.ORIENTATION, "Top-left"],
        [image.PropertyKey.SAMPLES_PER_PIXEL, "3"],
        [image.PropertyKey.ROWS_PER_STRIP, "192"],
        [image.PropertyKey.STRIP_BYTE_COUNTS, "147456"],
        [image.PropertyKey.X_RESOLUTION, "72"],
        [image.PropertyKey.Y_RESOLUTION, "72"],
        [image.PropertyKey.PLANAR_CONFIGURATION, "Chunky format"],
        [image.PropertyKey.RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.TRANSFER_FUNCTION, "2"],
        [image.PropertyKey.SOFTWARE, "HUAWEI/MNA-AL00/HWMNA:12/HUAWEIMNA-AL00/104.0.0.56C00:user/release-keys"],
        [image.PropertyKey.DATE_TIME, "2024:04:18 18:18:43"],
        [image.PropertyKey.ARTIST, "Joseph.Xu"],
        [image.PropertyKey.WHITE_POINT, "124.2"],
        [image.PropertyKey.PRIMARY_CHROMATICITIES, "124"],
        [image.PropertyKey.PHOTO_MODE, "252"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT, "10344"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH, "4"],
        [image.PropertyKey.YCBCR_COEFFICIENTS, "0.299, 0.587, 0.114"],
        [image.PropertyKey.YCBCR_SUB_SAMPLING, "3, 2"],
        [image.PropertyKey.YCBCR_POSITIONING, "Centered"],
        [image.PropertyKey.REFERENCE_BLACK_WHITE, "221"],
        [image.PropertyKey.COPYRIGHT, "Hw (Photographer) - [None] (Editor)"],
        [image.PropertyKey.EXPOSURE_TIME, "1/100 sec."],
        [image.PropertyKey.F_NUMBER, "f/2.0"],
        [image.PropertyKey.EXPOSURE_PROGRAM, "Normal program"],
        [image.PropertyKey.SPECTRAL_SENSITIVITY, "sensitivity"],
        [image.PropertyKey.GPS_VERSION_ID, "2.2.0.0"],
        [image.PropertyKey.GPS_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_LATITUDE, "39, 54, 20"],
        [image.PropertyKey.GPS_ALTITUDE_REF, "Sea level reference"],
        [image.PropertyKey.GPS_ALTITUDE, "0.00"],
        [image.PropertyKey.GPS_TIME_STAMP, "11:37:56.00"],
        [image.PropertyKey.GPS_SATELLITES, "xxx"],
        [image.PropertyKey.GPS_STATUS, "A"],
        [image.PropertyKey.GPS_MEASURE_MODE, "2"],
        [image.PropertyKey.GPS_DOP, "182"],
        [image.PropertyKey.GPS_SPEED_REF, "K"],
        [image.PropertyKey.GPS_SPEED, "150"],
        [image.PropertyKey.GPS_TRACK_REF, "T"],
        [image.PropertyKey.GPS_TRACK, "56"],
        [image.PropertyKey.GPS_IMG_DIRECTION_REF, "M"],
        [image.PropertyKey.GPS_IMG_DIRECTION, "2.23214"],
        [image.PropertyKey.GPS_MAP_DATUM, "xxxx"],
        [image.PropertyKey.GPS_DEST_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_DEST_LATITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_LONGITUDE_REF, "E"],
        [image.PropertyKey.GPS_DEST_LONGITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_BEARING_REF, "T"],
        [image.PropertyKey.GPS_DEST_BEARING, " 0"],
        [image.PropertyKey.GPS_DEST_DISTANCE_REF, "N"],
        [image.PropertyKey.GPS_DEST_DISTANCE, "10"],
        [image.PropertyKey.GPS_PROCESSING_METHOD, "GPS"],
        [image.PropertyKey.GPS_AREA_INFORMATION, "23...15...57"],
        [image.PropertyKey.GPS_DATE_STAMP, "2023:10:19"],
        [image.PropertyKey.GPS_DIFFERENTIAL, "1"],
        [image.PropertyKey.GPS_H_POSITIONING_ERROR, " 3"],
        [image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY, "205"],
        [image.PropertyKey.OECF, "1 bytes undefined data"],
        [image.PropertyKey.SENSITIVITY_TYPE, "Standard output sensitivity (SOS) and ISO speed"],
        [image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, "5"],
        [image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX, "241"],
        [image.PropertyKey.ISO_SPEED, "205"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_YYY, "3"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ, "3"],
        [image.PropertyKey.EXIF_VERSION, "Exif Version 2.2"],
        [image.PropertyKey.DATE_TIME_ORIGINAL, "2024:04:18 18:18:43"],
        [image.PropertyKey.DATE_TIME_DIGITIZED, "2023:01:19 10:39:58"],
        [image.PropertyKey.OFFSET_TIME, "xx"],
        [image.PropertyKey.OFFSET_TIME_DIGITIZED, "xx"],
        [image.PropertyKey.OFFSET_TIME_ORIGINAL, "xx"],
        [image.PropertyKey.COMPONENTS_CONFIGURATION, "R G B -"],
        [image.PropertyKey.COMPRESSED_BITS_PER_PIXEL, "1.5"],
        [image.PropertyKey.SHUTTER_SPEED, "6.64 EV (1/100 sec.)"],
        [image.PropertyKey.APERTURE_VALUE, "2.00 EV (f/2.0)"],
        [image.PropertyKey.BRIGHTNESS_VALUE, "2.50 EV (19.38 cd/m^2)"],
        [image.PropertyKey.EXPOSURE_BIAS_VALUE, "23.00 EV"],
        [image.PropertyKey.MAX_APERTURE_VALUE, "0.08 EV (f/1.0)"],
        [image.PropertyKey.SUBJECT_DISTANCE, "2.5 m"],
        [image.PropertyKey.METERING_MODE, "Pattern"],
        [image.PropertyKey.LIGHT_SOURCE, "Fluorescent"],
        [image.PropertyKey.FLASH, "Strobe return light not detected"],
        [image.PropertyKey.FOCAL_LENGTH, "6.3 mm"],
        [image.PropertyKey.SUBJECT_AREA, "Within rectangle (width 2318, height 1390) around (x,y) = (2009,1506)"],
        [image.PropertyKey.SCENE_POINTER, "300"],
        [image.PropertyKey.SCENE_VERSION, "1"],
        [image.PropertyKey.SCENE_FOOD_CONF, "2"],
        [image.PropertyKey.SCENE_STAGE_CONF, "3"],
        [image.PropertyKey.SCENE_BLUE_SKY_CONF, "4"],
        [image.PropertyKey.SCENE_GREEN_PLANT_CONF, "5"],
        [image.PropertyKey.SCENE_BEACH_CONF, "6"],
        [image.PropertyKey.SCENE_SNOW_CONF, "7"],
        [image.PropertyKey.SCENE_SUNSET_CONF, "8"],
        [image.PropertyKey.SCENE_FLOWERS_CONF, "9"],
        [image.PropertyKey.SCENE_NIGHT_CONF, "10"],
        [image.PropertyKey.SCENE_TEXT_CONF, "11"],
        [image.PropertyKey.FACE_POINTER, "166"],
        [image.PropertyKey.FACE_VERSION, "1"],
        [image.PropertyKey.FACE_COUNT, "2"],
        [image.PropertyKey.FACE_CONF, "3"],
        [image.PropertyKey.FACE_SMILE_SCORE, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_RECT, "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_LEYE_CENTER, "1 2 3 4"],
        [image.PropertyKey.FACE_MOUTH_CENTER, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.CAPTURE_MODE, "1"],
        [image.PropertyKey.BURST_NUMBER, "2"],
        [image.PropertyKey.FRONT_CAMERA, "3"],
        [image.PropertyKey.ROLL_ANGLE, "4"],
        [image.PropertyKey.PITCH_ANGLE, "5"],
        [image.PropertyKey.PHYSICAL_APERTURE, "6"],
        [image.PropertyKey.FOCUS_MODE, "7"],
        [image.PropertyKey.USER_COMMENT, "comm"],
        [image.PropertyKey.SUBSEC_TIME, "427000"],
        [image.PropertyKey.SUBSEC_TIME_ORIGINAL, "427000"],
        [image.PropertyKey.SUBSEC_TIME_DIGITIZED, "427000"],
        [image.PropertyKey.FLASHPIX_VERSION, "FlashPix Version 1.0"],
        [image.PropertyKey.COLOR_SPACE, "Adobe RGB"],
        [image.PropertyKey.PIXEL_X_DIMENSION, "1000"],
        [image.PropertyKey.PIXEL_Y_DIMENSION, "2000"],
        [image.PropertyKey.RELATED_SOUND_FILE, "/usr/home/sound/sea.wav"],
        [image.PropertyKey.FLASH_ENERGY, "832"],
        [image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE, "."],
        [image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, "1080"],
        [image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, "880"],
        [image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT, "Centimeter"],
        [image.PropertyKey.SUBJECT_LOCATION, "2009, 1506, 2318, 1390"],
        [image.PropertyKey.EXPOSURE_INDEX, "1.5"],
        [image.PropertyKey.SENSING_METHOD, "Two-chip color area sensor"],
        [image.PropertyKey.FILE_SOURCE, "DSC"],
        [image.PropertyKey.SCENE_TYPE, "Directly photographed"],
        [image.PropertyKey.CFA_PATTERN, "1 bytes undefined data"],
        [image.PropertyKey.CUSTOM_RENDERED, "Custom process"],
        [image.PropertyKey.EXPOSURE_MODE, "Auto exposure"],
        [image.PropertyKey.WHITE_BALANCE, "Manual white balance"],
        [image.PropertyKey.DIGITAL_ZOOM_RATIO, " 0"],
        [image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM, "26"],
        [image.PropertyKey.SCENE_CAPTURE_TYPE, "Standard"],
        [image.PropertyKey.GAIN_CONTROL, "Normal"],
        [image.PropertyKey.CONTRAST, "Normal"],
        [image.PropertyKey.SATURATION, "Normal"],
        [image.PropertyKey.SHARPNESS, "Normal"],
        [image.PropertyKey.DEVICE_SETTING_DESCRIPTION, "."],
        [image.PropertyKey.SUBJECT_DISTANCE_RANGE, "Unknown"],
        [image.PropertyKey.IMAGE_UNIQUE_ID, "FXIC012"],
        [image.PropertyKey.CAMERA_OWNER_NAME, "xx"],
        [image.PropertyKey.BODY_SERIAL_NUMBER, "xx"],
        [image.PropertyKey.LENS_SPECIFICATION, " 1, 1.5,  1,  2"],
        [image.PropertyKey.LENS_MAKE, "xxx"],
        [image.PropertyKey.LENS_MODEL, "xxx"],
        [image.PropertyKey.LENS_SERIAL_NUMBER, "xxx"],
        [image.PropertyKey.COMPOSITE_IMAGE, "1"],
        [image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, "1234"],
        [image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, "."],
        [image.PropertyKey.GAMMA, "1.5"],
        [image.PropertyKey.DNG_VERSION, "0x01, 0x01, 0x02, 0x03"],
        [image.PropertyKey.DEFAULT_CROP_SIZE, "1"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0500
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0500
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0500'
      const fileName = 'test_exif_v5.heic'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.NEW_SUBFILE_TYPE, "3"],
        [image.PropertyKey.SUBFILE_TYPE, "2"],
        [image.PropertyKey.IMAGE_WIDTH, "0"],
        [image.PropertyKey.IMAGE_LENGTH, "0"],
        [image.PropertyKey.BITS_PER_SAMPLE, "1, 1, 1"],
        [image.PropertyKey.COMPRESSION, "Uncompressed"],
        [image.PropertyKey.PHOTOMETRIC_INTERPRETATION, "Reversed mono"],
        [image.PropertyKey.IMAGE_DESCRIPTION, "_cuva%s\\d"],
        [image.PropertyKey.MAKE, "华为"],
        [image.PropertyKey.MODEL, "TNY-AL00"],
        [image.PropertyKey.STRIP_OFFSETS, "123"],
        [image.PropertyKey.ORIENTATION, "Top-left"],
        [image.PropertyKey.SAMPLES_PER_PIXEL, "0"],
        [image.PropertyKey.ROWS_PER_STRIP, "123"],
        [image.PropertyKey.STRIP_BYTE_COUNTS, "123"],
        [image.PropertyKey.X_RESOLUTION, " 0"],
        [image.PropertyKey.Y_RESOLUTION, " 0"],
        [image.PropertyKey.PLANAR_CONFIGURATION, "Chunky format"],
        [image.PropertyKey.RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.TRANSFER_FUNCTION, "3 bytes undefined data"],
        [image.PropertyKey.SOFTWARE, "华为"],
        [image.PropertyKey.DATE_TIME, "2024:12:31"],
        [image.PropertyKey.ARTIST, "None"],
        [image.PropertyKey.WHITE_POINT, "252, 0/0"],
        [image.PropertyKey.PRIMARY_CHROMATICITIES, " 0"],
        [image.PropertyKey.PHOTO_MODE, "252"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT, "2798"],
        [image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH, "4"],
        [image.PropertyKey.YCBCR_COEFFICIENTS, "0.299, 0.587, 0.114"],
        [image.PropertyKey.YCBCR_SUB_SAMPLING, "3, 2"],
        [image.PropertyKey.YCBCR_POSITIONING, "Centered"],
        [image.PropertyKey.REFERENCE_BLACK_WHITE, "222,  0, 1.5,  0, 25.2, 25.2"],
        [image.PropertyKey.COPYRIGHT, "undefined (Photographer) - [None] (Editor)"],
        [image.PropertyKey.EXPOSURE_TIME, "1/34 sec."],
        [image.PropertyKey.F_NUMBER, "f/1.0"],
        [image.PropertyKey.EXPOSURE_PROGRAM, "Not defined"],
        [image.PropertyKey.SPECTRAL_SENSITIVITY, "abc"],
        [image.PropertyKey.GPS_VERSION_ID, "2.2.0.0"],
        [image.PropertyKey.GPS_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_LATITUDE, "39, 54, 20"],
        [image.PropertyKey.GPS_ALTITUDE_REF, "Sea level"],
        [image.PropertyKey.GPS_ALTITUDE, "0.00"],
        [image.PropertyKey.GPS_TIME_STAMP, "11:37:58.00"],
        [image.PropertyKey.GPS_SATELLITES, "xxx"],
        [image.PropertyKey.GPS_STATUS, "A"],
        [image.PropertyKey.GPS_MEASURE_MODE, "2"],
        [image.PropertyKey.GPS_DOP, "182"],
        [image.PropertyKey.GPS_SPEED_REF, "N"],
        [image.PropertyKey.GPS_SPEED, "150"],
        [image.PropertyKey.GPS_TRACK_REF, "T"],
        [image.PropertyKey.GPS_TRACK, "38.0"],
        [image.PropertyKey.GPS_IMG_DIRECTION_REF, "M"],
        [image.PropertyKey.GPS_IMG_DIRECTION, "2.23"],
        [image.PropertyKey.GPS_MAP_DATUM, "xxx"],
        [image.PropertyKey.GPS_DEST_LATITUDE_REF, "N"],
        [image.PropertyKey.GPS_DEST_LATITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_LONGITUDE_REF, "E"],
        [image.PropertyKey.GPS_DEST_LONGITUDE, "33, 22, 11"],
        [image.PropertyKey.GPS_DEST_BEARING_REF, "T"],
        [image.PropertyKey.GPS_DEST_BEARING, "2.0"],
        [image.PropertyKey.GPS_DEST_DISTANCE_REF, "N"],
        [image.PropertyKey.GPS_DEST_DISTANCE, "10"],
        [image.PropertyKey.GPS_PROCESSING_METHOD, "CELLID"],
        [image.PropertyKey.GPS_AREA_INFORMATION, "arexxx"],
        [image.PropertyKey.GPS_DATE_STAMP, "2025:01:11"],
        [image.PropertyKey.GPS_DIFFERENTIAL, "0"],
        [image.PropertyKey.GPS_H_POSITIONING_ERROR, "2.5"],
        [image.PropertyKey.PHOTOGRAPHIC_SENSITIVITY, "1"],
        [image.PropertyKey.OECF, "4 bytes undefined data"],
        [image.PropertyKey.SENSITIVITY_TYPE, "Standard output sensitivity (SOS) and ISO speed"],
        [image.PropertyKey.STANDARD_OUTPUT_SENSITIVITY, "5"],
        [image.PropertyKey.RECOMMENDED_EXPOSURE_INDEX, "123"],
        [image.PropertyKey.ISO_SPEED, "1"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_YYY, "1456"],
        [image.PropertyKey.ISO_SPEED_LATITUDE_ZZZ, "1456"],
        [image.PropertyKey.EXIF_VERSION, "Exif Version 1.1"],
        [image.PropertyKey.DATE_TIME_ORIGINAL, "2024:01:25 05:51:34"],
        [image.PropertyKey.DATE_TIME_DIGITIZED, "2022:06:02 15:51:34"],
        [image.PropertyKey.OFFSET_TIME, "2024:01:25"],
        [image.PropertyKey.OFFSET_TIME_DIGITIZED, "cfh"],
        [image.PropertyKey.OFFSET_TIME_ORIGINAL, "chex"],
        [image.PropertyKey.COMPONENTS_CONFIGURATION, "Y R G B"],
        [image.PropertyKey.COMPRESSED_BITS_PER_PIXEL, "24"],
        [image.PropertyKey.SHUTTER_SPEED, "2.50 EV (1/6 sec.)"],
        [image.PropertyKey.APERTURE_VALUE, "4.00 EV (f/4.0)"],
        [image.PropertyKey.BRIGHTNESS_VALUE, "2.50 EV (19.38 cd/m^2)"],
        [image.PropertyKey.EXPOSURE_BIAS_VALUE, "23.00 EV"],
        [image.PropertyKey.MAX_APERTURE_VALUE, "2.50 EV (f/2.4)"],
        [image.PropertyKey.SUBJECT_DISTANCE, "2.5 m"],
        [image.PropertyKey.METERING_MODE, "Pattern"],
        [image.PropertyKey.LIGHT_SOURCE, "Daylight"],
        [image.PropertyKey.FLASH, "Strobe return light not detected"],
        [image.PropertyKey.FOCAL_LENGTH, "0.0 mm"],
        [image.PropertyKey.SUBJECT_AREA, "(x,y) = (12,13)"],
        [image.PropertyKey.SCENE_POINTER, "256"],
        [image.PropertyKey.SCENE_VERSION, "1"],
        [image.PropertyKey.SCENE_FOOD_CONF, "2"],
        [image.PropertyKey.SCENE_STAGE_CONF, "3"],
        [image.PropertyKey.SCENE_BLUE_SKY_CONF, "4"],
        [image.PropertyKey.SCENE_GREEN_PLANT_CONF, "5"],
        [image.PropertyKey.SCENE_BEACH_CONF, "6"],
        [image.PropertyKey.SCENE_SNOW_CONF, "7"],
        [image.PropertyKey.SCENE_SUNSET_CONF, "8"],
        [image.PropertyKey.SCENE_FLOWERS_CONF, "9"],
        [image.PropertyKey.SCENE_NIGHT_CONF, "10"],
        [image.PropertyKey.SCENE_TEXT_CONF, "11"],
        [image.PropertyKey.FACE_POINTER, "122"],
        [image.PropertyKey.FACE_VERSION, "1"],
        [image.PropertyKey.FACE_COUNT, "2"],
        [image.PropertyKey.FACE_CONF, "3"],
        [image.PropertyKey.FACE_SMILE_SCORE, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_RECT, "1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8"],
        [image.PropertyKey.FACE_LEYE_CENTER, "1 2 3 4"],
        [image.PropertyKey.FACE_MOUTH_CENTER, "1 2 3 4 5 6 7 8"],
        [image.PropertyKey.CAPTURE_MODE, "1"],
        [image.PropertyKey.BURST_NUMBER, "2"],
        [image.PropertyKey.FRONT_CAMERA, "3"],
        [image.PropertyKey.ROLL_ANGLE, "4"],
        [image.PropertyKey.PITCH_ANGLE, "5"],
        [image.PropertyKey.PHYSICAL_APERTURE, "6"],
        [image.PropertyKey.FOCUS_MODE, "7"],
        [image.PropertyKey.USER_COMMENT, "place for user comments"],
        [image.PropertyKey.SUBSEC_TIME, "123456"],
        [image.PropertyKey.SUBSEC_TIME_ORIGINAL, "427000"],
        [image.PropertyKey.SUBSEC_TIME_DIGITIZED, "427000"],
        [image.PropertyKey.FLASHPIX_VERSION, "FlashPix Version 1.0"],
        [image.PropertyKey.COLOR_SPACE, "sRGB"],
        [image.PropertyKey.PIXEL_X_DIMENSION, "123"],
        [image.PropertyKey.PIXEL_Y_DIMENSION, "234"],
        [image.PropertyKey.RELATED_SOUND_FILE, "/usr/home"],
        [image.PropertyKey.FLASH_ENERGY, "832"],
        [image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE, "13"],
        [image.PropertyKey.FOCAL_PLANE_X_RESOLUTION, "1080"],
        [image.PropertyKey.FOCAL_PLANE_Y_RESOLUTION, "880"],
        [image.PropertyKey.FOCAL_PLANE_RESOLUTION_UNIT, "Inch"],
        [image.PropertyKey.SUBJECT_LOCATION, "0, 1"],
        [image.PropertyKey.EXPOSURE_INDEX, "1.5"],
        [image.PropertyKey.SENSING_METHOD, "Two-chip color area sensor"],
        [image.PropertyKey.FILE_SOURCE, "DSC"],
        [image.PropertyKey.SCENE_TYPE, "Directly photographed"],
        [image.PropertyKey.CFA_PATTERN, "1 bytes undefined data"],
        [image.PropertyKey.CUSTOM_RENDERED, "Normal process"],
        [image.PropertyKey.EXPOSURE_MODE, "Auto exposure"],
        [image.PropertyKey.WHITE_BALANCE, "Manual white balance"],
        [image.PropertyKey.DIGITAL_ZOOM_RATIO, "321"],
        [image.PropertyKey.FOCAL_LENGTH_IN_35_MM_FILM, "2"],
        [image.PropertyKey.SCENE_CAPTURE_TYPE, "Standard"],
        [image.PropertyKey.GAIN_CONTROL, "Normal"],
        [image.PropertyKey.CONTRAST, "Normal"],
        [image.PropertyKey.SATURATION, "Normal"],
        [image.PropertyKey.SHARPNESS, "Normal"],
        [image.PropertyKey.DEVICE_SETTING_DESCRIPTION, "2xxx"],
        [image.PropertyKey.SUBJECT_DISTANCE_RANGE, "Unknown"],
        [image.PropertyKey.IMAGE_UNIQUE_ID, "FXIC012"],
        [image.PropertyKey.CAMERA_OWNER_NAME, "c.uec"],
        [image.PropertyKey.BODY_SERIAL_NUMBER, "exoch"],
        [image.PropertyKey.LENS_SPECIFICATION, "0.8, 2.5, 1.5, 0.5"],
        [image.PropertyKey.LENS_MAKE, "xxwx"],
        [image.PropertyKey.LENS_MODEL, "txaw"],
        [image.PropertyKey.LENS_SERIAL_NUMBER, "qxhc"],
        [image.PropertyKey.COMPOSITE_IMAGE, "2"],
        [image.PropertyKey.SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE, "23, 34"],
        [image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE, "xxxw"],
        [image.PropertyKey.GAMMA, "2.5"],
        [image.PropertyKey.DNG_VERSION, "2, 2, 3, 1"],
        [image.PropertyKey.DEFAULT_CROP_SIZE, "153, 841"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0600
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0600
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0600', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0600'
      const fileName = 'test_exif_v6.jpg'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.IS_XMAGE_SUPPORTED, "1"],
        [image.PropertyKey.XMAGE_MODE, "1"],
        [image.PropertyKey.XMAGE_LEFT, "1"],
        [image.PropertyKey.XMAGE_TOP, "1"],
        [image.PropertyKey.XMAGE_RIGHT, "1"],
        [image.PropertyKey.XMAGE_BOTTOM, "1"],
        [image.PropertyKey.CLOUD_ENHANCEMENT_MODE, "1"],
        [image.PropertyKey.WIND_SNAPSHOT_MODE, "1"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0700
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0700
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0700'
      const fileName = 'test_exif_v6.webp'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.IS_XMAGE_SUPPORTED, "1"],
        [image.PropertyKey.XMAGE_MODE, "1"],
        [image.PropertyKey.XMAGE_LEFT, "1"],
        [image.PropertyKey.XMAGE_TOP, "1"],
        [image.PropertyKey.XMAGE_RIGHT, "1"],
        [image.PropertyKey.XMAGE_BOTTOM, "1"],
        [image.PropertyKey.CLOUD_ENHANCEMENT_MODE, "1"],
        [image.PropertyKey.WIND_SNAPSHOT_MODE, "1"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0800
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0800
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0800', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0800'
      const fileName = 'test_exif_v6.png'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.IS_XMAGE_SUPPORTED, "1"],
        [image.PropertyKey.XMAGE_MODE, "1"],
        [image.PropertyKey.XMAGE_LEFT, "1"],
        [image.PropertyKey.XMAGE_TOP, "1"],
        [image.PropertyKey.XMAGE_RIGHT, "1"],
        [image.PropertyKey.XMAGE_BOTTOM, "1"],
        [image.PropertyKey.CLOUD_ENHANCEMENT_MODE, "1"],
        [image.PropertyKey.WIND_SNAPSHOT_MODE, "1"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0900
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0900
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0900', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_0900'
      const fileName = 'test_exif_v6.heic'

      const compareDataMap = new Map<image.PropertyKey, string | undefined>([
        [image.PropertyKey.IS_XMAGE_SUPPORTED, "1"],
        [image.PropertyKey.XMAGE_MODE, "1"],
        [image.PropertyKey.XMAGE_LEFT, "1"],
        [image.PropertyKey.XMAGE_TOP, "1"],
        [image.PropertyKey.XMAGE_RIGHT, "1"],
        [image.PropertyKey.XMAGE_BOTTOM, "1"],
        [image.PropertyKey.CLOUD_ENHANCEMENT_MODE, "1"],
        [image.PropertyKey.WIND_SNAPSHOT_MODE, "1"]
      ]);

      try {
        let result: boolean = true
        const checkResult = await testGetExifSyncKeys(testTag, compareDataMap, fileName,'fd');
        result = result && checkResult
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error ` + e);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_01000
     * @tc.number SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_01000
     * @tc.desc   1.create imageSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_01000', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_EXIF_GETIMAGEPROPERTY_SYNC_01000'
      const key = image.PropertyKey.MAKER_NOTE
      const values:Array<picTypeValue> = [{name: "jpeg", fileName: "test_exif_v5.jpg",
        value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' +
          'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,' +
          'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "webp", fileName: "test_exif_v5.webp", value: "HwMnoteCaptureMode:1,HwMnoteBurstNumber:2," +
          "HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7," +
          "HwMnoteFacePointer:122,HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3," +
          "HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8," +
          "HwMnoteFaceLeyeCenter:1 2 3 4,HwMnoteFaceReyeCenter:5 6 7 8,HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8," +
          "HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,HwMnoteSceneStageConf:3," +
          "HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,HwMnoteSceneSnowConf:7," +
          "HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,HwMnoteSceneTextConf:11"},
        {name: "png", fileName: "test_exif_v5.png", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
          'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:256,' +
          'HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "dng", fileName: "test_exif_v5.dng", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:' +
          '3,HwMnoteRollAngle:4,HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,HwMnoteFocusMode:7,' +
          'HwMnoteWindSnapshotMode:8,HwMnoteFacePointer:166,HwMnoteFaceVersion:1,' +
          'HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,HwMnoteScenePointer:300,' +
          'HwMnoteSceneVersion:1,' + 'HwMnoteSceneFoodConf:2,' +
          'HwMnoteSceneStageConf:3,HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'},
        {name: "heif", fileName: "test_exif_v5.heic", value: 'HwMnoteCaptureMode:1,HwMnoteBurstNumber:2,' +
          'HwMnoteFrontCamera:3,HwMnoteRollAngle:4,' + 'HwMnotePitchAngle:5,HwMnotePhysicalAperture:6,' +
          'HwMnoteFocusMode:7,HwMnoteFacePointer:122,' +
          'HwMnoteFaceVersion:1,HwMnoteFaceCount:2,HwMnoteFaceConf:3,HwMnoteFaceSmileScore:1 2 3 4 5 6 7 8,' +
          'HwMnoteFaceRect:1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8,HwMnoteFaceLeyeCenter:1 2 3 4,' +
          'HwMnoteFaceReyeCenter:5 6 7 8,' + 'HwMnoteFaceMouthCenter:1 2 3 4 5 6 7 8,' +
          'HwMnoteScenePointer:256,HwMnoteSceneVersion:1,HwMnoteSceneFoodConf:2,' + 'HwMnoteSceneStageConf:3,' +
          'HwMnoteSceneBlueSkyConf:4,HwMnoteSceneGreenPlantConf:5,HwMnoteSceneBeachConf:6,' +
          'HwMnoteSceneSnowConf:7,HwMnoteSceneSunsetConf:8,HwMnoteSceneFlowersConf:9,HwMnoteSceneNightConf:10,' +
          'HwMnoteSceneTextConf:11'}]
      try {
        let result: boolean = true
        for(let i=0; i<values.length; i++){
          const checkResult = await testGetIncludeSync(testTag, key, values[i].value, values[i].fileName,'fd');
          result = result && checkResult
        }
        expect(result).assertTrue()
        done()
      } catch (e) {
        hilog.info(0x0000, testTag, `getImagePropertySync error MakerNote ` + e);
        expect().assertFail();
        done();
      }
    })

  })
}
