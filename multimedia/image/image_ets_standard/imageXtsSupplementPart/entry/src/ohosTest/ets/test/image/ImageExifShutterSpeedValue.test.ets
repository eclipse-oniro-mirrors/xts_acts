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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let jpgImageSourceApi: image.ImageSource;
let heifImageSourceApi: image.ImageSource;
const TAG = 'XtsImageExifShutterSpeedValue';
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

export default function ImageExifShutterSpeedValue() {
  describe('ImageExifShutterSpeedValue', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      heifImageSourceApi = await getImageSource('test_exif_v5.heic');
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
      await heifImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_001
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.shutterSpeedValue);
        expect(result.exifMetadata?.shutterSpeedValue).assertEqual(1);
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_002
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.shutterSpeedValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.shutterSpeedValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_003
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.shutterSpeedValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.shutterSpeedValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_004
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.shutterSpeedValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.shutterSpeedValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_005
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.shutterSpeedValue);
        expect(result.exifMetadata?.shutterSpeedValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_006
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.shutterSpeedValue);
        expect(result.exifMetadata?.shutterSpeedValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_007
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.shutterSpeedValue);
        expect(result.exifMetadata?.shutterSpeedValue).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_008
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.shutterSpeedValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.shutterSpeedValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_009
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.shutterSpeedValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.shutterSpeedValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_010
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.shutterSpeedValue);
        expect(result.exifMetadata?.shutterSpeedValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_011
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.shutterSpeedValue);
        expect(result.exifMetadata?.shutterSpeedValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_012
     * @tc.name       SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover shutterSpeedValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SHUTTER_SPEED_VALUE_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.shutterSpeedValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.shutterSpeedValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.shutterSpeedValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_001
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 5.6;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.apertureValue);
        expect(result.exifMetadata?.apertureValue).assertEqual(5.6);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_002
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.apertureValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.apertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_003
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.apertureValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.apertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_004
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.apertureValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.apertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_005
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.apertureValue);
        expect(result.exifMetadata?.apertureValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_006
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.apertureValue);
        expect(result.exifMetadata?.apertureValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_007
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 5.6;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.apertureValue);
        expect(result.exifMetadata?.apertureValue).assertEqual(5.6);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_008
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.apertureValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.apertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_009
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.apertureValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.apertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_010
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.apertureValue);
        expect(result.exifMetadata?.apertureValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_011
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.apertureValue);
        expect(result.exifMetadata?.apertureValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_APERTURE_VALUE_TEST_012
     * @tc.name       SUB_IMAGE_APERTURE_VALUE_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover apertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_APERTURE_VALUE_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_APERTURE_VALUE_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.apertureValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original metadata is:`, resultFir.exifMetadata?.apertureValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write metadata is:`, result.exifMetadata?.apertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_001
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.brightnessValue);
        expect(result.exifMetadata?.brightnessValue).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_002
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original brightnessValue metadata is:`, resultFir.exifMetadata?.brightnessValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write brightnessValue metadata is:`, result.exifMetadata?.brightnessValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_003
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original brightnessValue metadata is:`, resultFir.exifMetadata?.brightnessValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write brightnessValue metadata is:`, result.exifMetadata?.brightnessValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_004
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original brightnessValue metadata is:`, resultFir.exifMetadata?.brightnessValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write brightnessValue metadata is:`, result.exifMetadata?.brightnessValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_005
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.brightnessValue);
        expect(result.exifMetadata?.brightnessValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_006
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.brightnessValue);
        expect(result.exifMetadata?.brightnessValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_007
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.brightnessValue);
        expect(result.exifMetadata?.brightnessValue).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_008
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original brightnessValue metadata is:`, resultFir.exifMetadata?.brightnessValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write brightnessValue metadata is:`, result.exifMetadata?.brightnessValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_009
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original brightnessValue metadata is:`, resultFir.exifMetadata?.brightnessValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write brightnessValue metadata is:`, result.exifMetadata?.brightnessValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_010
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.brightnessValue);
        expect(result.exifMetadata?.brightnessValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_011
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.brightnessValue);
        expect(result.exifMetadata?.brightnessValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_BRIGHTNESS_VALUE_TEST_012
     * @tc.name       SUB_IMAGE_BRIGHTNESS_VALUE_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover brightnessValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_BRIGHTNESS_VALUE_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_BRIGHTNESS_VALUE_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.brightnessValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original brightnessValue metadata is:`, resultFir.exifMetadata?.brightnessValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write brightnessValue metadata is:`, result.exifMetadata?.brightnessValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_001
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureBiasValue);
        expect(result.exifMetadata?.exposureBiasValue).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_002
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original exposureBiasValue metadata is:`, resultFir.exifMetadata?.exposureBiasValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write exposureBiasValue metadata is:`, result.exifMetadata?.exposureBiasValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_003
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original exposureBiasValue metadata is:`, resultFir.exifMetadata?.exposureBiasValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write exposureBiasValue metadata is:`, result.exifMetadata?.exposureBiasValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_004
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original exposureBiasValue metadata is:`, resultFir.exifMetadata?.exposureBiasValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write exposureBiasValue metadata is:`, result.exifMetadata?.exposureBiasValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202"); // 曝光偏差值非负约束错误码
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_005
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureBiasValue);
        expect(result.exifMetadata?.exposureBiasValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_006
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureBiasValue);
        expect(result.exifMetadata?.exposureBiasValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_007
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureBiasValue);
        expect(result.exifMetadata?.exposureBiasValue).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_008
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original exposureBiasValue metadata is:`, resultFir.exifMetadata?.exposureBiasValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write exposureBiasValue metadata is:`, result.exifMetadata?.exposureBiasValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_009
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original exposureBiasValue metadata is:`, resultFir.exifMetadata?.exposureBiasValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write exposureBiasValue metadata is:`, result.exifMetadata?.exposureBiasValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_010
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureBiasValue);
        expect(result.exifMetadata?.exposureBiasValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_011
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureBiasValue);
        expect(result.exifMetadata?.exposureBiasValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_012
     * @tc.name       SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover exposureBiasValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXPOSURE_BIAS_VALUE_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureBiasValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original exposureBiasValue metadata is:`, resultFir.exifMetadata?.exposureBiasValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write exposureBiasValue metadata is:`, result.exifMetadata?.exposureBiasValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_001
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.maxApertureValue);
        expect(result.exifMetadata?.maxApertureValue).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_002
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original maxApertureValue metadata is:`, resultFir.exifMetadata?.maxApertureValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write maxApertureValue metadata is:`, result.exifMetadata?.maxApertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_003
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original maxApertureValue metadata is:`, resultFir.exifMetadata?.maxApertureValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write maxApertureValue metadata is:`, result.exifMetadata?.maxApertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_004
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original maxApertureValue metadata is:`, resultFir.exifMetadata?.maxApertureValue);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write maxApertureValue metadata is:`, result.exifMetadata?.maxApertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202"); // 最小F数非负约束错误码
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_005
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.maxApertureValue);
        expect(result.exifMetadata?.maxApertureValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_006
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.maxApertureValue);
        expect(result.exifMetadata?.maxApertureValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_007
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.maxApertureValue);
        expect(result.exifMetadata?.maxApertureValue).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_008
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original maxApertureValue metadata is:`, resultFir.exifMetadata?.maxApertureValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write maxApertureValue metadata is:`, result.exifMetadata?.maxApertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_009
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original maxApertureValue metadata is:`, resultFir.exifMetadata?.maxApertureValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write maxApertureValue metadata is:`, result.exifMetadata?.maxApertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_010
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.maxApertureValue);
        expect(result.exifMetadata?.maxApertureValue).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_011
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.maxApertureValue);
        expect(result.exifMetadata?.maxApertureValue).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_MAX_APERTURE_VALUE_TEST_012
     * @tc.name       SUB_IMAGE_MAX_APERTURE_VALUE_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover maxApertureValue (abnormal: exceed max value 1000000)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_MAX_APERTURE_VALUE_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MAX_APERTURE_VALUE_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.maxApertureValue = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original maxApertureValue metadata is:`, resultFir.exifMetadata?.maxApertureValue);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write maxApertureValue metadata is:`, result.exifMetadata?.maxApertureValue);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_001
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (normal value: 100 m)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistance);
        expect(result.exifMetadata?.subjectDistance).assertEqual(100);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_002
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (abnormal: undefined)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original subjectDistance metadata is:`, resultFir.exifMetadata?.subjectDistance);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write subjectDistance metadata is:`, result.exifMetadata?.subjectDistance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_003
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (abnormal: exceed max value 1000000)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original subjectDistance metadata is:`, resultFir.exifMetadata?.subjectDistance);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write subjectDistance metadata is:`, result.exifMetadata?.subjectDistance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_004
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (abnormal: negative value -1)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original subjectDistance metadata is:`, resultFir.exifMetadata?.subjectDistance);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write subjectDistance metadata is:`, result.exifMetadata?.subjectDistance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_005
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (normal value: 999999 m)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistance);
        expect(result.exifMetadata?.subjectDistance).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_006
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (normal value: 0 m)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistance);
        expect(result.exifMetadata?.subjectDistance).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_007
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (normal value: 100 m)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistance);
        expect(result.exifMetadata?.subjectDistance).assertEqual(100);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_008
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (abnormal: undefined)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original subjectDistance metadata is:`, resultFir.exifMetadata?.subjectDistance);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write subjectDistance metadata is:`, result.exifMetadata?.subjectDistance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_009
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (abnormal: negative value -1)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original subjectDistance metadata is:`, resultFir.exifMetadata?.subjectDistance);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write subjectDistance metadata is:`, result.exifMetadata?.subjectDistance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_010
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (normal value: 0 m)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistance);
        expect(result.exifMetadata?.subjectDistance).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_011
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (normal value: 999999 m)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 999999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistance);
        expect(result.exifMetadata?.subjectDistance).assertEqual(999999);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number     SUB_IMAGE_SUBJECT_DISTANCE_TEST_012
     * @tc.name       SUB_IMAGE_SUBJECT_DISTANCE_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover subjectDistance (abnormal: exceed max value 1000000)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SUBJECT_DISTANCE_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SUBJECT_DISTANCE_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistance = 1000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `original subjectDistance metadata is:`, resultFir.exifMetadata?.subjectDistance);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `after write subjectDistance metadata is:`, result.exifMetadata?.subjectDistance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    });
  })
}