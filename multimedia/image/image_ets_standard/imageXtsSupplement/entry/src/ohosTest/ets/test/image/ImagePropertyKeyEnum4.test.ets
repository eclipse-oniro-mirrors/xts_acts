/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.fileio'
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';

const TAG = 'Image.PropertyKey4'
let fdNumber: number;
async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG,'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG,"image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG,"image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG,"image case open fd err " + err);
  })
}

export default function ImagePropertyKeyTest4() {
  describe('ImagePropertyKeyTest4', ()=>{
    beforeAll(async ()=>{
      console.info('beforeAll case');
    });
    beforeEach(async ()=>{
      console.info('beforeEach case');
    });
    afterEach(async ()=>{
      console.info('afterEach case');
    });
    afterAll(()=>{
      console.info('afterAll case');
    });

      /**
       * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_001
       * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_001
       * @tc.desc   PhotoAccessHelper_Photo property enum
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_001', Level.LEVEL1, async (done:Function)=> {
        console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_001---------')
        expect(image.PropertyKey.FACE_SMILE_SCORE).assertEqual('HwMnoteFaceSmileScore');
        expect(image.PropertyKey.FACE_RECT).assertEqual('HwMnoteFaceRect');
        expect(image.PropertyKey.FACE_LEYE_CENTER).assertEqual('HwMnoteFaceLeyeCenter');
        expect(image.PropertyKey.FACE_REYE_CENTER).assertEqual('HwMnoteFaceReyeCenter');
        expect(image.PropertyKey.FACE_MOUTH_CENTER).assertEqual('HwMnoteFaceMouthCenter');
        console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_001,end here---------')
        done();
      })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_002
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_002
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_002', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_002---------')
      expect(image.PropertyKey.CAPTURE_MODE).assertEqual('HwMnoteCaptureMode');
      expect(image.PropertyKey.BURST_NUMBER).assertEqual('HwMnoteBurstNumber');
      expect(image.PropertyKey.FRONT_CAMERA).assertEqual('HwMnoteFrontCamera');
      expect(image.PropertyKey.ROLL_ANGLE).assertEqual('HwMnoteRollAngle');
      expect(image.PropertyKey.PITCH_ANGLE).assertEqual('HwMnotePitchAngle');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_002,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_003
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_003
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_003', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_003---------')
      expect(image.PropertyKey.PHYSICAL_APERTURE).assertEqual('HwMnotePhysicalAperture');
      expect(image.PropertyKey.FOCUS_MODE).assertEqual('HwMnoteFocusMode');
      expect(image.PropertyKey.USER_COMMENT).assertEqual('UserComment');
      expect(image.PropertyKey.SUBSEC_TIME).assertEqual('SubsecTime');
      expect(image.PropertyKey.SUBSEC_TIME_ORIGINAL).assertEqual('SubsecTimeOriginal')
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_003,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_004
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_004
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_004', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_004---------')
      expect(image.PropertyKey.SUBSEC_TIME_DIGITIZED).assertEqual('SubsecTimeDigitized');
      expect(image.PropertyKey.FLASHPIX_VERSION).assertEqual('FlashpixVersion');
      expect(image.PropertyKey.COLOR_SPACE).assertEqual('ColorSpace');
      expect(image.PropertyKey.PIXEL_X_DIMENSION).assertEqual('PixelXDimension');
      expect(image.PropertyKey.PIXEL_Y_DIMENSION).assertEqual('PixelYDimension');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_004,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_005
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_005
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_005', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_005---------')
      expect(image.PropertyKey.RELATED_SOUND_FILE).assertEqual('RelatedSoundFile');
      expect(image.PropertyKey.FLASH_ENERGY).assertEqual('FlashEnergy');
      expect(image.PropertyKey.SPATIAL_FREQUENCY_RESPONSE).assertEqual('SpatialFrequencyResponse');
      expect(image.PropertyKey.SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE).assertEqual('SourceExposureTimesOfCompositeImage');
      expect(image.PropertyKey.GAMMA).assertEqual('Gamma');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_005,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_006
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_006
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_006', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_006---------')
      expect(image.PropertyKey.DNG_VERSION).assertEqual('DNGVersion');
      expect(image.PropertyKey.DEFAULT_CROP_SIZE).assertEqual('DefaultCropSize');
      expect(image.PropertyKey.GIF_LOOP_COUNT).assertEqual('GIFLoopCount');
      expect(image.PropertyKey.IS_XMAGE_SUPPORTED).assertEqual('HwMnoteIsXmageSupported');
      expect(image.PropertyKey.XMAGE_MODE).assertEqual('HwMnoteXmageMode');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_006,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_007
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_007
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_007', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_007---------')
      expect(image.PropertyKey.XMAGE_LEFT).assertEqual('HwMnoteXmageLeft');
      expect(image.PropertyKey.XMAGE_TOP).assertEqual('HwMnoteXmageTop');
      expect(image.PropertyKey.XMAGE_RIGHT).assertEqual('HwMnoteXmageRight');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_007,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_008
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_008
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_008', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_008---------')
      expect(image.PropertyKey.XMAGE_BOTTOM).assertEqual('HwMnoteXmageBottom');
      expect(image.PropertyKey.CLOUD_ENHANCEMENT_MODE).assertEqual('HwMnoteCloudEnhancementMode');
      expect(image.PropertyKey.WIND_SNAPSHOT_MODE).assertEqual('HwMnoteWindSnapshotMode');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_008,end here---------')
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_009
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_009
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_009', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_009---------')
      expect(image.PropertyKey.NEW_SUBFILE_TYPE).assertEqual('NewSubfileType');
      expect(image.PropertyKey.SUBFILE_TYPE).assertEqual('SubfileType');
      expect(image.PropertyKey.IMAGE_WIDTH).assertEqual('ImageWidth');
      expect(image.PropertyKey.IMAGE_LENGTH).assertEqual('ImageLength');
      expect(image.PropertyKey.BITS_PER_SAMPLE).assertEqual('BitsPerSample');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_009,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_010
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_010
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_010', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_010---------')
      expect(image.PropertyKey.COMPRESSION).assertEqual('Compression');
      expect(image.PropertyKey.PHOTOMETRIC_INTERPRETATION).assertEqual('PhotometricInterpretation');
      expect(image.PropertyKey.IMAGE_DESCRIPTION).assertEqual('ImageDescription');
      expect(image.PropertyKey.MAKE).assertEqual('Make');
      expect(image.PropertyKey.MODEL).assertEqual('Model');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_010,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_011
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_011
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_011', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_011---------')
      expect(image.PropertyKey.STRIP_OFFSETS).assertEqual('StripOffsets');
      expect(image.PropertyKey.ORIENTATION).assertEqual('Orientation');
      expect(image.PropertyKey.SAMPLES_PER_PIXEL).assertEqual('SamplesPerPixel');
      expect(image.PropertyKey.ROWS_PER_STRIP).assertEqual('RowsPerStrip');
      expect(image.PropertyKey.STRIP_BYTE_COUNTS).assertEqual('StripByteCounts');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_011,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_012
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_012
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_012', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_012---------')
      expect(image.PropertyKey.X_RESOLUTION).assertEqual('XResolution');
      expect(image.PropertyKey.Y_RESOLUTION).assertEqual('YResolution');
      expect(image.PropertyKey.PLANAR_CONFIGURATION).assertEqual('PlanarConfiguration');
      expect(image.PropertyKey.RESOLUTION_UNIT).assertEqual('ResolutionUnit');
      expect(image.PropertyKey.TRANSFER_FUNCTION).assertEqual('TransferFunction');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_012,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_013
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_013
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_013', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_013---------')
      expect(image.PropertyKey.SOFTWARE).assertEqual('Software');
      expect(image.PropertyKey.DATE_TIME).assertEqual('DateTime');
      expect(image.PropertyKey.ARTIST).assertEqual('Artist');
      expect(image.PropertyKey.WHITE_POINT).assertEqual('WhitePoint');
      expect(image.PropertyKey.PRIMARY_CHROMATICITIES).assertEqual('PrimaryChromaticities');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_013,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_014
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_014
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_014', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_014---------')
      expect(image.PropertyKey.PHOTO_MODE).assertEqual('PhotoMode');
      expect(image.PropertyKey.JPEG_INTERCHANGE_FORMAT).assertEqual('JPEGInterchangeFormat');
      expect(image.PropertyKey.JPEG_INTERCHANGE_FORMAT_LENGTH).assertEqual('JPEGInterchangeFormatLength');
      expect(image.PropertyKey.YCBCR_COEFFICIENTS).assertEqual('YCbCrCoefficients');
      expect(image.PropertyKey.YCBCR_SUB_SAMPLING).assertEqual('YCbCrSubSampling');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_014,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_015
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_015
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_015', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_015---------')
      expect(image.PropertyKey.YCBCR_POSITIONING).assertEqual('YCbCrPositioning');
      expect(image.PropertyKey.REFERENCE_BLACK_WHITE).assertEqual('ReferenceBlackWhite');
      expect(image.PropertyKey.COPYRIGHT).assertEqual('Copyright');
      expect(image.PropertyKey.EXPOSURE_TIME).assertEqual('ExposureTime');
      expect(image.PropertyKey.F_NUMBER).assertEqual('FNumber');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_015,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_016
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_016
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_016', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_016---------')
      expect(image.PropertyKey.EXPOSURE_PROGRAM).assertEqual('ExposureProgram');
      expect(image.PropertyKey.SPECTRAL_SENSITIVITY).assertEqual('SpectralSensitivity');
      expect(image.PropertyKey.GPS_VERSION_ID).assertEqual('GPSVersionID');
      expect(image.PropertyKey.GPS_LATITUDE_REF).assertEqual('GPSLatitudeRef');
      expect(image.PropertyKey.GPS_LATITUDE).assertEqual('GPSLatitude');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_016,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_017
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_017
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_017', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_017---------')
      expect(image.PropertyKey.GPS_LONGITUDE_REF).assertEqual('GPSLongitudeRef');
      expect(image.PropertyKey.GPS_LONGITUDE).assertEqual('GPSLongitude');
      expect(image.PropertyKey.GPS_ALTITUDE_REF).assertEqual('GPSAltitudeRef');
      expect(image.PropertyKey.GPS_ALTITUDE).assertEqual('GPSAltitude');
      expect(image.PropertyKey.GPS_TIME_STAMP).assertEqual('GPSTimeStamp');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_017,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_018
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_018
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_018', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_018---------')
      expect(image.PropertyKey.GPS_SATELLITES).assertEqual('GPSSatellites');
      expect(image.PropertyKey.GPS_STATUS).assertEqual('GPSStatus');
      expect(image.PropertyKey.GPS_MEASURE_MODE).assertEqual('GPSMeasureMode');
      expect(image.PropertyKey.GPS_DOP).assertEqual('GPSDOP');
      expect(image.PropertyKey.GPS_SPEED_REF).assertEqual('GPSSpeedRef');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_018,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_019
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_019
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_019', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_019---------')
      expect(image.PropertyKey.GPS_SPEED).assertEqual('GPSSpeed');
      expect(image.PropertyKey.GPS_TRACK_REF).assertEqual('GPSTrackRef');
      expect(image.PropertyKey.GPS_TRACK).assertEqual('GPSTrack');
      expect(image.PropertyKey.GPS_IMG_DIRECTION_REF).assertEqual('GPSImgDirectionRef');
      expect(image.PropertyKey.GPS_IMG_DIRECTION).assertEqual('GPSImgDirection');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_019,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_020
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_020
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_020', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_020---------')
      expect(image.PropertyKey.GPS_MAP_DATUM).assertEqual('GPSMapDatum');
      expect(image.PropertyKey.GPS_DEST_LATITUDE_REF).assertEqual('GPSDestLatitudeRef');
      expect(image.PropertyKey.GPS_DEST_LATITUDE).assertEqual('GPSDestLatitude');
      expect(image.PropertyKey.GPS_DEST_LONGITUDE_REF).assertEqual('GPSDestLongitudeRef');
      expect(image.PropertyKey.GPS_DEST_LONGITUDE).assertEqual('GPSDestLongitude');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_020,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_021
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_021
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_021', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_021---------')
      expect(image.PropertyKey.GPS_DEST_BEARING_REF).assertEqual('GPSDestBearingRef');
      expect(image.PropertyKey.GPS_DEST_BEARING).assertEqual('GPSDestBearing');
      expect(image.PropertyKey.GPS_DEST_DISTANCE_REF).assertEqual('GPSDestDistanceRef');
      expect(image.PropertyKey.GPS_DEST_DISTANCE).assertEqual('GPSDestDistance');
      expect(image.PropertyKey.GPS_PROCESSING_METHOD).assertEqual('GPSProcessingMethod');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_021,end here---------')
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_022
     * @tc.number SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_022
     * @tc.desc   PhotoAccessHelper_Photo property enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_022', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_022---------')
      expect(image.PropertyKey.GPS_AREA_INFORMATION).assertEqual('GPSAreaInformation');
      expect(image.PropertyKey.GPS_DATE_STAMP).assertEqual('GPSDateStamp');
      expect(image.PropertyKey.GPS_DIFFERENTIAL).assertEqual('GPSDifferential');
      expect(image.PropertyKey.GPS_H_POSITIONING_ERROR).assertEqual('GPSHPositioningError');
      console.info(TAG,'--------SUB_MEDIA_IMAGE_EXIF_PROPERTY_ENUM2_List_022,end here---------')
      done();
    })

  });
}