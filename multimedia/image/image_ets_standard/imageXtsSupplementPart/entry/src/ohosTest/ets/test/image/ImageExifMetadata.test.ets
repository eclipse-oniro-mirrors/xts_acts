/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const UNSUPPORTED_METADATA = '7600202';


const TAG = 'Xts.ImageContrastTypeSupp';
let fdNumber: number;

async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

let jpgImageSourceApi: image.ImageSource;
let pngImageSourceApi: image.ImageSource;
let webpImageSourceApi: image.ImageSource;

export default function ImageExifMetadataTestSupp() {
  describe('ImageExifMetadataTestSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await jpgImageSourceApi.release();
      await pngImageSourceApi.release();
      await webpImageSourceApi.release();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_NEW_SUB_FILE_TYPE_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_NEW_SUB_FILE_TYPE_JPG_00001
     * @tc.desc       ExifMetadata setProperties NewSubfileType Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_NEW_SUB_FILE_TYPE_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_NEW_SUB_FILE_TYPE_JPG_00001';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "NewSubfileType": 0 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUB_FILE_TYPE_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUB_FILE_TYPE_JPG_00002
     * @tc.desc       ExifMetadata setProperties SubfileType Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUB_FILE_TYPE_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUB_FILE_TYPE_JPG_00002';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubfileType": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_WIDTH_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_WIDTH_JPG_00003
     * @tc.desc       ExifMetadata setProperties ImageWidth Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_WIDTH_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_WIDTH_JPG_00003';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ImageWidth": 4096 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_LENGTH_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_LENGTH_JPG_00004
     * @tc.desc       ExifMetadata setProperties ImageLength Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_LENGTH_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_LENGTH_JPG_00004';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ImageLength": 3072 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_BITS_PER_SAMPLE_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_BITS_PER_SAMPLE_JPG_00005
     * @tc.desc       ExifMetadata setProperties BitsPerSample Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_BITS_PER_SAMPLE_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_BITS_PER_SAMPLE_JPG_00005';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "BitsPerSample": [8, 8, 8] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSION_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSION_JPG_00006
     * @tc.desc       ExifMetadata setProperties Compression Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSION_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSION_JPG_00006';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Compression": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOMETRIC_INTERPRETATION_JPG_00007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOMETRIC_INTERPRETATION_JPG_00007
     * @tc.desc       ExifMetadata setProperties PhotometricInterpretation Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOMETRIC_INTERPRETATION_JPG_00007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOMETRIC_INTERPRETATION_JPG_00007';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "PhotometricInterpretation": 2 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_DESCRIPTION_JPG_00008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_DESCRIPTION_JPG_00008
     * @tc.desc       ExifMetadata setProperties ImageDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_DESCRIPTION_JPG_00008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_DESCRIPTION_JPG_00008';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ImageDescription": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_MAKE_JPG_00009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_MAKE_JPG_00009
     * @tc.desc       ExifMetadata setProperties Make Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_MAKE_JPG_00009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_MAKE_JPG_00009';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Make": [1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_MODEL_JPG_00010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_MODEL_JPG_00010
     * @tc.desc       ExifMetadata setProperties Model Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_MODEL_JPG_00010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_MODEL_JPG_00010';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Model": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_OFFSETS_JPG_00011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_OFFSETS_JPG_00011
     * @tc.desc       ExifMetadata setProperties StripOffsets Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_OFFSETS_JPG_00011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_OFFSETS_JPG_00011';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "StripOffsets": [1234] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_ORIENTATION_JPG_00012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_ORIENTATION_JPG_00012
     * @tc.desc       ExifMetadata setProperties Orientation Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_ORIENTATION_JPG_00012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_ORIENTATION_JPG_00012';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Orientation": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SAMPLES_PER_PIXEL_JPG_00013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SAMPLES_PER_PIXEL_JPG_00013
     * @tc.desc       ExifMetadata setProperties SamplesPerPixel Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SAMPLES_PER_PIXEL_JPG_00013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SAMPLES_PER_PIXEL_JPG_00013';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SamplesPerPixel": 3 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_ROWS_PER_STRIP_JPG_00014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_ROWS_PER_STRIP_JPG_00014
     * @tc.desc       ExifMetadata setProperties RowsPerStrip Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_ROWS_PER_STRIP_JPG_00014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_ROWS_PER_STRIP_JPG_00014';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "RowsPerStrip": 10 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_BYTE_COUNTS_JPG_00015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_BYTE_COUNTS_JPG_00015
     * @tc.desc       ExifMetadata setProperties StripByteCounts Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_BYTE_COUNTS_JPG_00015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_STRIP_BYTE_COUNTS_JPG_00015';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "StripByteCounts": [5120] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_X_RESOLUTION_JPG_00016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_X_RESOLUTION_JPG_00016
     * @tc.desc       ExifMetadata setProperties XResolution Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_X_RESOLUTION_JPG_00016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_X_RESOLUTION_JPG_00016';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "XResolution": 72 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_Y_RESOLUTION_JPG_00017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_Y_RESOLUTION_JPG_00017
     * @tc.desc       ExifMetadata setProperties YResolution Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_Y_RESOLUTION_JPG_00017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_Y_RESOLUTION_JPG_00017';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "YResolution": 72 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_PLANAR_CONFIGURATION_JPG_00018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_PLANAR_CONFIGURATION_JPG_00018
     * @tc.desc       ExifMetadata setProperties PlanarConfiguration Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_PLANAR_CONFIGURATION_JPG_00018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_PLANAR_CONFIGURATION_JPG_00018';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "PlanarConfiguration": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_RESOLUTION_UNIT_JPG_00019
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_RESOLUTION_UNIT_JPG_00019
     * @tc.desc       ExifMetadata setProperties ResolutionUnit Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_RESOLUTION_UNIT_JPG_00019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_RESOLUTION_UNIT_JPG_00019';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ResolutionUnit": 2 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_TRANSFER_FUNCTION_JPG_00020
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_TRANSFER_FUNCTION_JPG_00020
     * @tc.desc       ExifMetadata setProperties TransferFunction Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_TRANSFER_FUNCTION_JPG_00020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_TRANSFER_FUNCTION_JPG_00020';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "TransferFunction": [0, 255] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SOFTWARE_JPG_00021
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SOFTWARE_JPG_00021
     * @tc.desc       ExifMetadata setProperties Software Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SOFTWARE_JPG_00021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SOFTWARE_JPG_00021';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Software": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_JPG_00022
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_JPG_00022
     * @tc.desc       ExifMetadata setProperties DateTime Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_JPG_00022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_JPG_00022';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "DateTime": "Test Software" as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_ARTIST_JPG_00023
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_ARTIST_JPG_00023
     * @tc.desc       ExifMetadata setProperties Artist Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_ARTIST_JPG_00023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_ARTIST_JPG_00023';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Artist": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_POINT_JPG_00024
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_POINT_JPG_00024
     * @tc.desc       ExifMetadata setProperties WhitePoint Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_POINT_JPG_00024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_POINT_JPG_00024';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "WhitePoint": [0.313, 0.329] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_PRIMARY_CHROMATICITIES_JPG_00025
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_PRIMARY_CHROMATICITIES_JPG_00025
     * @tc.desc       ExifMetadata setProperties PrimaryChromaticities Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_PRIMARY_CHROMATICITIES_JPG_00025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_PRIMARY_CHROMATICITIES_JPG_00025';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "PrimaryChromaticities": [0.64, 0.33, 0.3, 0.6, 0.15, 0.06] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTO_MODE_JPG_00026
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTO_MODE_JPG_00026
     * @tc.desc       ExifMetadata setProperties PhotoMode Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTO_MODE_JPG_00026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTO_MODE_JPG_00026';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "PhotoMode": 0 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_JPG_00027
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_JPG_00027
     * @tc.desc       ExifMetadata setProperties JpegInterchangeFormat Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_JPG_00027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_JPG_00027';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "JpegInterchangeFormat": 1024 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_LENGTH_JPG_00028
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_LENGTH_JPG_00028
     * @tc.desc       ExifMetadata setProperties JpegInterchangeFormatLength Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_LENGTH_JPG_00028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_JPEG_INTERCHANGE_FORMAT_LENGTH_JPG_00028';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "JpegInterchangeFormatLength": 5120 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_COEFFICIENTS_JPG_00029
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_COEFFICIENTS_JPG_00029
     * @tc.desc       ExifMetadata setProperties YCbCrCoefficients Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_COEFFICIENTS_JPG_00029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_COEFFICIENTS_JPG_00029';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "YCbCrCoefficients": [0.299, 0.587, 0.114] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_SUB_SAMPLING_JPG_00030
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_SUB_SAMPLING_JPG_00030
     * @tc.desc       ExifMetadata setProperties YCbCrSubSampling Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_SUB_SAMPLING_JPG_00030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_SUB_SAMPLING_JPG_00030';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "YCbCrSubSampling": [2, 2] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_POSITIONING_JPG_00031
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_POSITIONING_JPG_00031
     * @tc.desc       ExifMetadata setProperties YCbCrPositioning Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_POSITIONING_JPG_00031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_YCB_CR_POSITIONING_JPG_00031';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "YCbCrPositioning": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_REFERENCE_BLACK_WHITE_JPG_00032
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_REFERENCE_BLACK_WHITE_JPG_00032
     * @tc.desc       ExifMetadata setProperties ReferenceBlackWhite Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_REFERENCE_BLACK_WHITE_JPG_00032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_REFERENCE_BLACK_WHITE_JPG_00032';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ReferenceBlackWhite": [0, 255, 0, 255, 0, 255] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COPYRIGHT_JPG_00033
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COPYRIGHT_JPG_00033
     * @tc.desc       ExifMetadata setProperties Copyright Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COPYRIGHT_JPG_00033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COPYRIGHT_JPG_00033';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Copyright": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_TIME_JPG_00034
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_TIME_JPG_00034
     * @tc.desc       ExifMetadata setProperties ExposureTime Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_TIME_JPG_00034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_TIME_JPG_00034';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ExposureTime": 0.01 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_F_NUMBER_JPG_00035
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_F_NUMBER_JPG_00035
     * @tc.desc       ExifMetadata setProperties FNumber Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_F_NUMBER_JPG_00035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_F_NUMBER_JPG_00035';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FNumber": 2.8 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_PROGRAM_JPG_00036
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_PROGRAM_JPG_00036
     * @tc.desc       ExifMetadata setProperties ExposureProgram Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_PROGRAM_JPG_00036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_PROGRAM_JPG_00036';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ExposureProgram": 2 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SPECTRAL_SENSITIVITY_JPG_00037
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SPECTRAL_SENSITIVITY_JPG_00037
     * @tc.desc       ExifMetadata setProperties SpectralSensitivity Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SPECTRAL_SENSITIVITY_JPG_00037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SPECTRAL_SENSITIVITY_JPG_00037';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SpectralSensitivity": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_VERSION_ID_JPG_00038
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_VERSION_ID_JPG_00038
     * @tc.desc       ExifMetadata setProperties GpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_VERSION_ID_JPG_00038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_VERSION_ID_JPG_00038';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsVersionID": [2, 3, 0, 0] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_REF_JPG_00039
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_REF_JPG_00039
     * @tc.desc       ExifMetadata setProperties GpsLatitudeRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_REF_JPG_00039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_REF_JPG_00039';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsLatitudeRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_JPG_00040
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_JPG_00040
     * @tc.desc       ExifMetadata setProperties GpsLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_JPG_00040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LATITUDE_JPG_00040';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsLatitude": [30, 1, 0] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_REF_JPG_00041
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_REF_JPG_00041
     * @tc.desc       ExifMetadata setProperties GpsLongitudeRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_REF_JPG_00041', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_REF_JPG_00041';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsLongitudeRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_JPG_00042
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_JPG_00042
     * @tc.desc       ExifMetadata setProperties GpsLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_JPG_00042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_LONGITUDE_JPG_00042';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsLongitude": [120, 1, 0] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_REF_JPG_00043
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_REF_JPG_00043
     * @tc.desc       ExifMetadata setProperties GpsAltitudeRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_REF_JPG_00043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_REF_JPG_00043';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsAltitudeRef": 0 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_JPG_00044
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_JPG_00044
     * @tc.desc       ExifMetadata setProperties GpsAltitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_JPG_00044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_ALTITUDE_JPG_00044';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsAltitude": [100, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TIMESTAMP_JPG_00045
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TIMESTAMP_JPG_00045
     * @tc.desc       ExifMetadata setProperties GpsTimestamp Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TIMESTAMP_JPG_00045', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TIMESTAMP_JPG_00045';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsTimestamp": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SATELLITES_JPG_00046
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SATELLITES_JPG_00046
     * @tc.desc       ExifMetadata setProperties GpsSatellites Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SATELLITES_JPG_00046', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SATELLITES_JPG_00046';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsSatellites": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_STATUS_JPG_00047
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_STATUS_JPG_00047
     * @tc.desc       ExifMetadata setProperties GpsStatus Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_STATUS_JPG_00047', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_STATUS_JPG_00047';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsStatus": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MEASURE_MODE_JPG_00048
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MEASURE_MODE_JPG_00048
     * @tc.desc       ExifMetadata setProperties GpsMeasureMode Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MEASURE_MODE_JPG_00048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MEASURE_MODE_JPG_00048';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsMeasureMode": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DOP_JPG_00049
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DOP_JPG_00049
     * @tc.desc       ExifMetadata setProperties GpsDop Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DOP_JPG_00049', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DOP_JPG_00049';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDop": [5, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_REF_JPG_00050
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_REF_JPG_00050
     * @tc.desc       ExifMetadata setProperties GpsSpeedRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_REF_JPG_00050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_REF_JPG_00050';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsSpeedRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_JPG_00051
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_JPG_00051
     * @tc.desc       ExifMetadata setProperties GpsSpeed Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_JPG_00051', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_SPEED_JPG_00051';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsSpeed": [60, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_REF_JPG_00052
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_REF_JPG_00052
     * @tc.desc       ExifMetadata setProperties GpsTrackRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_REF_JPG_00052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_REF_JPG_00052';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsTrackRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_JPG_00053
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_JPG_00053
     * @tc.desc       ExifMetadata setProperties GpsTrack Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_JPG_00053', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_TRACK_JPG_00053';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsTrack": [45, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_REF_JPG_00054
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_REF_JPG_00054
     * @tc.desc       ExifMetadata setProperties GpsImgDirectionRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_REF_JPG_00054', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_REF_JPG_00054';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsImgDirectionRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_JPG_00055
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_JPG_00055
     * @tc.desc       ExifMetadata setProperties GpsImgDirection Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_JPG_00055', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_IMG_DIRECTION_JPG_00055';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsImgDirection": [90, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MAP_DATUM_JPG_00056
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MAP_DATUM_JPG_00056
     * @tc.desc       ExifMetadata setProperties GpsMapDatum Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MAP_DATUM_JPG_00056', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_MAP_DATUM_JPG_00056';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsMapDatum": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_REF_JPG_00057
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_REF_JPG_00057
     * @tc.desc       ExifMetadata setProperties GpsDestLatitudeRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_REF_JPG_00057', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_REF_JPG_00057';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestLatitudeRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_JPG_00058
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_JPG_00058
     * @tc.desc       ExifMetadata setProperties GpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_JPG_00058', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LATITUDE_JPG_00058';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestLatitude": [31, 1, 0] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_REF_JPG_00059
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_REF_JPG_00059
     * @tc.desc       ExifMetadata setProperties GpsDestLongitudeRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_REF_JPG_00059', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_REF_JPG_00059';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestLongitudeRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_JPG_00060
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_JPG_00060
     * @tc.desc       ExifMetadata setProperties GpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_JPG_00060', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_LONGITUDE_JPG_00060';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestLongitude": [121, 1, 0] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_REF_JPG_00061
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_REF_JPG_00061
     * @tc.desc       ExifMetadata setProperties GpsDestBearingRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_REF_JPG_00061', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_REF_JPG_00061';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestBearingRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_JPG_00062
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_JPG_00062
     * @tc.desc       ExifMetadata setProperties GpsDestBearing Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_JPG_00062', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_BEARING_JPG_00062';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestBearing": [180, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_REF_JPG_00063
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_REF_JPG_00063
     * @tc.desc       ExifMetadata setProperties GpsDestDistanceRef Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_REF_JPG_00063', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_REF_JPG_00063';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestDistanceRef": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_JPG_00064
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_JPG_00064
     * @tc.desc       ExifMetadata setProperties GpsDestDistance Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_JPG_00064', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DEST_DISTANCE_JPG_00064';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDestDistance": [10, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_PROCESSING_METHOD_JPG_00065
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_PROCESSING_METHOD_JPG_00065
     * @tc.desc       ExifMetadata setProperties GpsProcessingMethod Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_PROCESSING_METHOD_JPG_00065', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_PROCESSING_METHOD_JPG_00065';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsProcessingMethod": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_AREA_INFORMATION_JPG_00066
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_AREA_INFORMATION_JPG_00066
     * @tc.desc       ExifMetadata setProperties GpsAreaInformation Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_AREA_INFORMATION_JPG_00066', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_AREA_INFORMATION_JPG_00066';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsAreaInformation": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DATE_STAMP_JPG_00067
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DATE_STAMP_JPG_00067
     * @tc.desc       ExifMetadata setProperties GpsDateStamp Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DATE_STAMP_JPG_00067', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DATE_STAMP_JPG_00067';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDateStamp": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DIFFERENTIAL_JPG_00068
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DIFFERENTIAL_JPG_00068
     * @tc.desc       ExifMetadata setProperties GpsDifferential Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DIFFERENTIAL_JPG_00068', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_DIFFERENTIAL_JPG_00068';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsDifferential": 0 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_H_POSITIONING_ERROR_JPG_00069
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_H_POSITIONING_ERROR_JPG_00069
     * @tc.desc       ExifMetadata setProperties GpsHPositioningError Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_H_POSITIONING_ERROR_JPG_00069', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GPS_H_POSITIONING_ERROR_JPG_00069';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GpsHPositioningError": [5, 1] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_RATINGS_JPG_00070
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_RATINGS_JPG_00070
     * @tc.desc       ExifMetadata setProperties IsoSpeedRatings Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_RATINGS_JPG_00070', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_RATINGS_JPG_00070';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "IsoSpeedRatings": 100 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOGRAPHIC_SENSITIVITY_JPG_00071
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOGRAPHIC_SENSITIVITY_JPG_00071
     * @tc.desc       ExifMetadata setProperties PhotographicSensitivity Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOGRAPHIC_SENSITIVITY_JPG_00071', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_PHOTOGRAPHIC_SENSITIVITY_JPG_00071';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "PhotographicSensitivity": 200 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_OECF_JPG_00072
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_OECF_JPG_00072
     * @tc.desc       ExifMetadata setProperties Oecf Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_OECF_JPG_00072', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_OECF_JPG_00072';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Oecf": [1, 2, 3, 4] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SENSITIVITY_TYPE_JPG_00073
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SENSITIVITY_TYPE_JPG_00073
     * @tc.desc       ExifMetadata setProperties SensitivityType Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SENSITIVITY_TYPE_JPG_00073', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SENSITIVITY_TYPE_JPG_00073';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SensitivityType": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_STANDARD_OUTPUT_SENSITIVITY_JPG_00074
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_STANDARD_OUTPUT_SENSITIVITY_JPG_00074
     * @tc.desc       ExifMetadata setProperties StandardOutputSensitivity Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_STANDARD_OUTPUT_SENSITIVITY_JPG_00074', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_STANDARD_OUTPUT_SENSITIVITY_JPG_00074';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "StandardOutputSensitivity": 100 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_RECOMMENDED_EXPOSURE_INDEX_JPG_00075
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_RECOMMENDED_EXPOSURE_INDEX_JPG_00075
     * @tc.desc       ExifMetadata setProperties RecommendedExposureIndex Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_RECOMMENDED_EXPOSURE_INDEX_JPG_00075', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_RECOMMENDED_EXPOSURE_INDEX_JPG_00075';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "RecommendedExposureIndex": 200 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_YYY_JPG_00076
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_YYY_JPG_00076
     * @tc.desc       ExifMetadata setProperties IsoSpeedLatitudeyyy Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_YYY_JPG_00076', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_YYY_JPG_00076';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "IsoSpeedLatitudeyyy": 100 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_ZZZ_JPG_00077
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_ZZZ_JPG_00077
     * @tc.desc       ExifMetadata setProperties IsoSpeedLatitudezzz Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_ZZZ_JPG_00077', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_ISO_SPEED_LATITUDE_ZZZ_JPG_00077';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "IsoSpeedLatitudezzz": 200 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_EXIF_VERSION_JPG_00078
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_EXIF_VERSION_JPG_00078
     * @tc.desc       ExifMetadata setProperties ExifVersion Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_EXIF_VERSION_JPG_00078', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_EXIF_VERSION_JPG_00078';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ExifVersion": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_ORIGINAL_JPG_00079
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_ORIGINAL_JPG_00079
     * @tc.desc       ExifMetadata setProperties DateTimeOriginal Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_ORIGINAL_JPG_00079', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_ORIGINAL_JPG_00079';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "DateTimeOriginal": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_DIGITIZED_JPG_00080
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_DIGITIZED_JPG_00080
     * @tc.desc       ExifMetadata setProperties DateTimeDigitized Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_DIGITIZED_JPG_00080', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DATE_TIME_DIGITIZED_JPG_00080';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "DateTimeDigitized": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_JPG_00081
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_JPG_00081
     * @tc.desc       ExifMetadata setProperties OffsetTime Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_JPG_00081', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_JPG_00081';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "OffsetTime": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_ORIGINAL_JPG_00082
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_ORIGINAL_JPG_00082
     * @tc.desc       ExifMetadata setProperties OffsetTimeOriginal Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_ORIGINAL_JPG_00082', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_ORIGINAL_JPG_00082';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "OffsetTimeOriginal": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_DIGITIZED_JPG_00083
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_DIGITIZED_JPG_00083
     * @tc.desc       ExifMetadata setProperties OffsetTimeDigitized Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_DIGITIZED_JPG_00083', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_OFFSET_TIME_DIGITIZED_JPG_00083';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "OffsetTimeDigitized": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPONENTS_CONFIGURATION_JPG_00084
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPONENTS_CONFIGURATION_JPG_00084
     * @tc.desc       ExifMetadata setProperties ComponentsConfiguration Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPONENTS_CONFIGURATION_JPG_00084', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPONENTS_CONFIGURATION_JPG_00084';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ComponentsConfiguration": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSED_BITS_PER_PIXEL_JPG_00085
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSED_BITS_PER_PIXEL_JPG_00085
     * @tc.desc       ExifMetadata setProperties CompressedBitsPerPixel Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSED_BITS_PER_PIXEL_JPG_00085', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPRESSED_BITS_PER_PIXEL_JPG_00085';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "CompressedBitsPerPixel": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHUTTER_SPEED_VALUE_JPG_00086
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHUTTER_SPEED_VALUE_JPG_00086
     * @tc.desc       ExifMetadata setProperties ShutterSpeedValue Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHUTTER_SPEED_VALUE_JPG_00086', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHUTTER_SPEED_VALUE_JPG_00086';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ShutterSpeedValue": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_APERTURE_VALUE_JPG_00087
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_APERTURE_VALUE_JPG_00087
     * @tc.desc       ExifMetadata setProperties ApertureValue Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_APERTURE_VALUE_JPG_00087', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_APERTURE_VALUE_JPG_00087';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ApertureValue": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_BRIGHTNESS_VALUE_JPG_00088
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_BRIGHTNESS_VALUE_JPG_00088
     * @tc.desc       ExifMetadata setProperties BrightnessValue Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_BRIGHTNESS_VALUE_JPG_00088', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_BRIGHTNESS_VALUE_JPG_00088';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "BrightnessValue": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_BIAS_VALUE_JPG_00089
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_BIAS_VALUE_JPG_00089
     * @tc.desc       ExifMetadata setProperties ExposureBiasValue Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_BIAS_VALUE_JPG_00089', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_BIAS_VALUE_JPG_00089';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ExposureBiasValue": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_MAX_APERTURE_VALUE_JPG_00090
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_MAX_APERTURE_VALUE_JPG_00090
     * @tc.desc       ExifMetadata setProperties MaxApertureValue Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_MAX_APERTURE_VALUE_JPG_00090', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_MAX_APERTURE_VALUE_JPG_00090';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "MaxApertureValue": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_JPG_00091
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_JPG_00091
     * @tc.desc       ExifMetadata setProperties SubjectDistance Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_JPG_00091', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_JPG_00091';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubjectDistance": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_METERING_MODE_JPG_00092
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_METERING_MODE_JPG_00092
     * @tc.desc       ExifMetadata setProperties MeteringMode Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_METERING_MODE_JPG_00092', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_METERING_MODE_JPG_00092';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "MeteringMode": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_LIGHT_SOURCE_JPG_00093
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_LIGHT_SOURCE_JPG_00093
     * @tc.desc       ExifMetadata setProperties LightSource Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_LIGHT_SOURCE_JPG_00093', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_LIGHT_SOURCE_JPG_00093';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "LightSource": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_JPG_00094
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_JPG_00094
     * @tc.desc       ExifMetadata setProperties Flash Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_JPG_00094', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_JPG_00094';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Flash": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_JPG_00095
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_JPG_00095
     * @tc.desc       ExifMetadata setProperties FocalLength Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_JPG_00095', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_JPG_00095';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FocalLength": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_AREA_JPG_00096
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_AREA_JPG_00096
     * @tc.desc       ExifMetadata setProperties SubjectArea Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_AREA_JPG_00096', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_AREA_JPG_00096';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubjectArea": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_MAKER_NOTE_JPG_00097
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_MAKER_NOTE_JPG_00097
     * @tc.desc       ExifMetadata setProperties MakerNote Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_MAKER_NOTE_JPG_00097', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_MAKER_NOTE_JPG_00097';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "MakerNote": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_USER_COMMENT_JPG_00098
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_USER_COMMENT_JPG_00098
     * @tc.desc       ExifMetadata setProperties UserComment Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_USER_COMMENT_JPG_00098', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_USER_COMMENT_JPG_00098';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "UserComment": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_JPG_00099
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_JPG_00099
     * @tc.desc       ExifMetadata setProperties SubsecTime Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_JPG_00099', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_JPG_00099';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubsecTime": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_ORIGINAL_JPG_00100
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_ORIGINAL_JPG_00100
     * @tc.desc       ExifMetadata setProperties SubsecTimeOriginal Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_ORIGINAL_JPG_00100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_ORIGINAL_JPG_00100';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubsecTimeOriginal": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_DIGITIZED_JPG_00101
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_DIGITIZED_JPG_00101
     * @tc.desc       ExifMetadata setProperties SubsecTimeDigitized Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_DIGITIZED_JPG_00101', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBSEC_TIME_DIGITIZED_JPG_00101';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubsecTimeDigitized": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FLASHPIX_VERSION_JPG_00102
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FLASHPIX_VERSION_JPG_00102
     * @tc.desc       ExifMetadata setProperties FlashpixVersion Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FLASHPIX_VERSION_JPG_00102', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FLASHPIX_VERSION_JPG_00102';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FlashpixVersion": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COLOR_SPACE_JPG_00103
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COLOR_SPACE_JPG_00103
     * @tc.desc       ExifMetadata setProperties ColorSpace Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COLOR_SPACE_JPG_00103', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COLOR_SPACE_JPG_00103';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ColorSpace": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_X_DIMENSION_JPG_00104
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_X_DIMENSION_JPG_00104
     * @tc.desc       ExifMetadata setProperties PixelXDimension Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_X_DIMENSION_JPG_00104', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_X_DIMENSION_JPG_00104';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "PixelXDimension": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_Y_DIMENSION_JPG_00105
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_Y_DIMENSION_JPG_00105
     * @tc.desc       ExifMetadata setProperties PixelYDimension Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_Y_DIMENSION_JPG_00105', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_PIXEL_Y_DIMENSION_JPG_00105';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "PixelYDimension": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_RELATED_SOUND_FILE_JPG_00106
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_RELATED_SOUND_FILE_JPG_00106
     * @tc.desc       ExifMetadata setProperties RelatedSoundFile Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_RELATED_SOUND_FILE_JPG_00106', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_RELATED_SOUND_FILE_JPG_00106';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "RelatedSoundFile": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_ENERGY_JPG_00107
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_ENERGY_JPG_00107
     * @tc.desc       ExifMetadata setProperties FlashEnergy Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_ENERGY_JPG_00107', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FLASH_ENERGY_JPG_00107';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FlashEnergy": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SPATIAL_FREQUENCY_RESPONSE_JPG_00108
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SPATIAL_FREQUENCY_RESPONSE_JPG_00108
     * @tc.desc       ExifMetadata setProperties SpatialFrequencyResponse Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SPATIAL_FREQUENCY_RESPONSE_JPG_00108', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SPATIAL_FREQUENCY_RESPONSE_JPG_00108';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SpatialFrequencyResponse": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_X_RESOLUTION_JPG_00109
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_X_RESOLUTION_JPG_00109
     * @tc.desc       ExifMetadata setProperties FocalPlaneXResolution Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_X_RESOLUTION_JPG_00109', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_X_RESOLUTION_JPG_00109';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FocalPlaneXResolution": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_Y_RESOLUTION_JPG_00110
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_Y_RESOLUTION_JPG_00110
     * @tc.desc       ExifMetadata setProperties FocalPlaneYResolution Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_Y_RESOLUTION_JPG_00110', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_Y_RESOLUTION_JPG_00110';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FocalPlaneYResolution": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_RESOLUTION_UNIT_JPG_00111
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_RESOLUTION_UNIT_JPG_00111
     * @tc.desc       ExifMetadata setProperties FocalPlaneResolutionUnit Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_RESOLUTION_UNIT_JPG_00111', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_PLANE_RESOLUTION_UNIT_JPG_00111';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FocalPlaneResolutionUnit": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_LOCATION_JPG_00112
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_LOCATION_JPG_00112
     * @tc.desc       ExifMetadata setProperties SubjectLocation Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_LOCATION_JPG_00112', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_LOCATION_JPG_00112';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubjectLocation": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_INDEX_JPG_00113
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_INDEX_JPG_00113
     * @tc.desc       ExifMetadata setProperties ExposureIndex Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_INDEX_JPG_00113', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_INDEX_JPG_00113';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ExposureIndex": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SENSING_METHOD_JPG_00114
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SENSING_METHOD_JPG_00114
     * @tc.desc       ExifMetadata setProperties SensingMethod Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SENSING_METHOD_JPG_00114', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SENSING_METHOD_JPG_00114';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SensingMethod": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FILE_SOURCE_JPG_00115
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FILE_SOURCE_JPG_00115
     * @tc.desc       ExifMetadata setProperties FileSource Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FILE_SOURCE_JPG_00115', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FILE_SOURCE_JPG_00115';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FileSource": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_TYPE_JPG_00116
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_TYPE_JPG_00116
     * @tc.desc       ExifMetadata setProperties SceneType Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_TYPE_JPG_00116', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_TYPE_JPG_00116';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SceneType": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CFA_PATTERN_JPG_00117
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CFA_PATTERN_JPG_00117
     * @tc.desc       ExifMetadata setProperties CfaPattern Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CFA_PATTERN_JPG_00117', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CFA_PATTERN_JPG_00117';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "CfaPattern": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CUSTOM_RENDERED_JPG_00118
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CUSTOM_RENDERED_JPG_00118
     * @tc.desc       ExifMetadata setProperties CustomRendered Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CUSTOM_RENDERED_JPG_00118', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CUSTOM_RENDERED_JPG_00118';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "CustomRendered": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_MODE_JPG_00119
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_MODE_JPG_00119
     * @tc.desc       ExifMetadata setProperties ExposureMode Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_MODE_JPG_00119', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_EXPOSURE_MODE_JPG_00119';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ExposureMode": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_BALANCE_JPG_00120
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_BALANCE_JPG_00120
     * @tc.desc       ExifMetadata setProperties WhiteBalance Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_BALANCE_JPG_00120', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_WHITE_BALANCE_JPG_00120';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "WhiteBalance": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DIGITAL_ZOOM_RATIO_JPG_00121
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DIGITAL_ZOOM_RATIO_JPG_00121
     * @tc.desc       ExifMetadata setProperties DigitalZoomRatio Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DIGITAL_ZOOM_RATIO_JPG_00121', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DIGITAL_ZOOM_RATIO_JPG_00121';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "DigitalZoomRatio": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35MM_FILM_JPG_00122
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35MM_FILM_JPG_00122
     * @tc.desc       ExifMetadata setProperties FocalLengthIn35mmFilm Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35MM_FILM_JPG_00122', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35MM_FILM_JPG_00122';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "FocalLengthIn35mmFilm": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00123
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00123
     * @tc.desc       ExifMetadata setProperties SceneCaptureType Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00123', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00123';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SceneCaptureType": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00124
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00124
     * @tc.desc       ExifMetadata setProperties GainControl Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00124', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00124';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "GainControl": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00125
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00125
     * @tc.desc       ExifMetadata setProperties Contrast Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00125', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00125';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Contrast": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00126
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00126
     * @tc.desc       ExifMetadata setProperties Saturation Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00126', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00126';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Saturation": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00127
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00127
     * @tc.desc       ExifMetadata setProperties Sharpness Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00127', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00127';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Sharpness": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00128
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00128
     * @tc.desc       ExifMetadata setProperties DeviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00128', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00128';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "DeviceSettingDescription": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00129
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00129
     * @tc.desc       ExifMetadata setProperties SubjectDistanceRange Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00129', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00129';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "SubjectDistanceRange": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00130
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00130
     * @tc.desc       ExifMetadata setProperties ImageUniqueId Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00130', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00130';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "ImageUniqueId": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CAMERA_OWNER_NAME_JPG_00131
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CAMERA_OWNER_NAME_JPG_00131
     * @tc.desc       ExifMetadata setProperties CameraOwnerName Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CAMERA_OWNER_NAME_JPG_00131', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CAMERA_OWNER_NAME_JPG_00131';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "CameraOwnerName": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_BODY_SERIAL_NUMBER_JPG_00132
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_BODY_SERIAL_NUMBER_JPG_00132
     * @tc.desc       ExifMetadata setProperties BodySerialNumber Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_BODY_SERIAL_NUMBER_JPG_00132', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_BODY_SERIAL_NUMBER_JPG_00132';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "BodySerialNumber": 1 as ESObject // Camera body serial number
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SPECIFICATION_JPG_00133
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SPECIFICATION_JPG_00133
     * @tc.desc       ExifMetadata setProperties LensSpecification Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SPECIFICATION_JPG_00133', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SPECIFICATION_JPG_00133';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "LensSpecification": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MAKE_JPG_00134
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MAKE_JPG_00134
     * @tc.desc       ExifMetadata setProperties LensMake Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MAKE_JPG_00134', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MAKE_JPG_00134';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "LensMake": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MODEL_JPG_00135
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MODEL_JPG_00135
     * @tc.desc       ExifMetadata setProperties LensModel Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MODEL_JPG_00135', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_MODEL_JPG_00135';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "LensModel": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SERIAL_NUMBER_JPG_00136
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SERIAL_NUMBER_JPG_00136
     * @tc.desc       ExifMetadata setProperties LensSerialNumber Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SERIAL_NUMBER_JPG_00136', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_LENS_SERIAL_NUMBER_JPG_00136';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "LensSerialNumber": ['a', 'b', 'c'] as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00137
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00137
     * @tc.desc       ExifMetadata setProperties CompositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00137', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00137';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "CompositeImage": 1 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE_JPG_00138
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE_JPG_00138
     * @tc.desc       ExifMetadata setProperties SourceImageNumberOfCompositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE_JPG_00138', Level.LEVEL1,
      async (done: Function) => {
        const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE_JPG_00138';
        try {
          let metaData = await jpgImageSourceApi.readImageMetadata();
          const setkey: Record<string, string | null> = {
            "SourceImageNumberOfCompositeImage": [1, 2, 3, 4, 5] as ESObject
          };
          console.info(TAG, testName, 'start');
          await metaData.exifMetadata?.setProperties(setkey);
          expect().assertFail();
        } catch (err) {
          console.error(TAG, testName, `Test failed: ${err.code}`);
          expect(err.code).assertEqual(UNSUPPORTED_METADATA);
        }
        done();
      });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_00139
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_00139
     * @tc.desc       ExifMetadata setProperties SourceExposureTimesOfCompositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_00139', Level.LEVEL1,
      async (done: Function) => {
        const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_00139';
        try {
          let metaData = await jpgImageSourceApi.readImageMetadata();
          const setkey: Record<string, string | null> = {
            "SourceExposureTimesOfCompositeImage": 128 as ESObject
          };
          console.info(TAG, testName, 'start');
          await metaData.exifMetadata?.setProperties(setkey);
          expect().assertFail();
        } catch (err) {
          console.error(TAG, testName, `Test failed: ${err.code}`);
          expect(err.code).assertEqual(UNSUPPORTED_METADATA);
        }
        done();
      });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAMMA_JPG_00140
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAMMA_JPG_00140
     * @tc.desc       ExifMetadata setProperties Gamma Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAMMA_JPG_00140', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAMMA_JPG_00140';
      try {
        let metaData = await jpgImageSourceApi.readImageMetadata();
        const setkey: Record<string, string | null> = {
          "Gamma": 1.54 as ESObject
        };
        console.info(TAG, testName, 'start');
        await metaData.exifMetadata?.setProperties(setkey);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    });
  });
}