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
const TAG = 'XtsImageExifDateTime';
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

export default function ImageExifDateTimeSupp() {
  describe('ImageExifDateTimeSupp', () => {
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
    afterAll(async() => {
      console.info('afterAll case');
      await jpgImageSourceApi.release();
      await heifImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_001
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "2024:07:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect(result.exifMetadata?.dateTimeOriginal).assertEqual("2024:07:07 13:45:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_002
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "9999:12:31 23:59:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect(result.exifMetadata?.dateTimeOriginal).assertEqual("9999:12:31 23:59:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_003
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "1970:01:01 00:00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect(result.exifMetadata?.dateTimeOriginal).assertEqual("1970:01:01 00:00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_004
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "2024:13:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_005
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "2024-07-07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_006
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_007
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "null"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_008
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_009
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "2024:07:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect(result.exifMetadata?.dateTimeOriginal).assertEqual("2024:07:07 13:45:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_010
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "9999:12:31 23:59:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect(result.exifMetadata?.dateTimeOriginal).assertEqual("9999:12:31 23:59:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_011
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "1970:01:01 00:00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect(result.exifMetadata?.dateTimeOriginal).assertEqual("1970:01:01 00:00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_012
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "2024:13:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_013
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_013
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "2024-07-07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_014
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_014
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_015
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_015
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal = "null"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_016
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_016
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeOriginal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_ORIGINAL_TEST_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeOriginal= undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeOriginal);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_001
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "2024:07:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect(result.exifMetadata?.dateTimeDigitized).assertEqual("2024:07:07 13:45:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_002
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "9999:12:31 23:59:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect(result.exifMetadata?.dateTimeDigitized).assertEqual("9999:12:31 23:59:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_003
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "1970:01:01 00:00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect(result.exifMetadata?.dateTimeDigitized).assertEqual("1970:01:01 00:00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_004
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "2024:13:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_005
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "2024-07-07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_006
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_007
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "null"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_008
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_009
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "2024:07:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect(result.exifMetadata?.dateTimeDigitized).assertEqual("2024:07:07 13:45:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_010
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "9999:12:31 23:59:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect(result.exifMetadata?.dateTimeDigitized).assertEqual("9999:12:31 23:59:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_011
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "1970:01:01 00:00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect(result.exifMetadata?.dateTimeDigitized).assertEqual("1970:01:01 00:00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_012
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "2024:13:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_013
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_013
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "2024-07-07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_014
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_014
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_015
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_015
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = "null"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_016
     * @tc.name       SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_016
     * @tc.desc       Test ImageWriteImageMetadata cover dateTimeDigitized
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_DATETIME_DIGITIZED_TEST_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTimeDigitized = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.dateTimeDigitized);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_001
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "2024:07:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect(result.exifMetadata?.offsetTime).assertEqual("2024:07:07 13:45:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_002
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "9999:12:31 23:59:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect(result.exifMetadata?.offsetTime).assertEqual("9999:12:31 23:59:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_003
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "1970:01:01 00:00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect(result.exifMetadata?.offsetTime).assertEqual("1970:01:01 00:00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_004
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "2024:13:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_005
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "2024-07-07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_006
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_007
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "null"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_008
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_009
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "2024:07:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect(result.exifMetadata?.offsetTime).assertEqual("2024:07:07 13:45:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_010
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "9999:12:31 23:59:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect(result.exifMetadata?.offsetTime).assertEqual("9999:12:31 23:59:59");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_011
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "1970:01:01 00:00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect(result.exifMetadata?.offsetTime).assertEqual("1970:01:01 00:00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_012
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "2024:13:07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_013
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_013
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "2024-07-07 13:45:59"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_014
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_014
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_015
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_015
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = "null"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_TEST_016
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_TEST_016
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_TEST_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTime = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTime);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTime);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_001
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (normal value: +08:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "+08:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("+08:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_002
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (boundary max: +14:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "+14:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("+14:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_003
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (boundary min: -12:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "-12:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("-12:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_004
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (abnormal: empty string)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_005
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (abnormal: undefined)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_006
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (normal value: +00:00 UTC)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "+00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("+00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_007
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (normal value: +08:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "+08:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("+08:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_008
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (boundary max: +14:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "+14:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("+14:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_009
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (boundary min: -12:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "-12:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("-12:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_010
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (abnormal: empty string)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeOriginal);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_011
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (abnormal: undefined)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeOriginal);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_012
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeOriginal (normal value: +00:00 UTC)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_ORIGINAL_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeOriginal = "+00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeOriginal);
        expect(result.exifMetadata?.offsetTimeOriginal).assertEqual("+00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_001
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_001
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (normal value: +08:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "+08:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("+08:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_002
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_002
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (boundary max: +14:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "+14:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("+14:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_003
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_003
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (boundary min: -12:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "-12:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("-12:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_004
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_004
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (abnormal: empty string)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeDigitized);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_005
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_005
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (abnormal: undefined)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeDigitized);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_006
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_006
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (normal value: +00:00 UTC)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "+00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("+00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_007
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_007
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (normal value: +08:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "+08:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("+08:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_008
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_008
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (boundary max: +14:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "+14:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("+14:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_009
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_009
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (boundary min: -12:00)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "-12:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("-12:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_010
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_010
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (abnormal: empty string)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeDigitized);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_011
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_011
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (abnormal: undefined)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = undefined
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.offsetTimeDigitized);
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_012
     * @tc.name       SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_012
     * @tc.desc       Test ImageWriteImageMetadata cover offsetTimeDigitized (normal value: +00:00 UTC)
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_OFFSET_TIME_DIGITIZED_TEST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.offsetTimeDigitized = "+00:00"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heifImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heifImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.offsetTimeDigitized);
        expect(result.exifMetadata?.offsetTimeDigitized).assertEqual("+00:00");
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
  })
}