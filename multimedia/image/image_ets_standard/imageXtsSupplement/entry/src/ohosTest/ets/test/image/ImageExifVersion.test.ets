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
let heicImageSourceApi: image.ImageSource;
const TAG = 'XtsImageExifVersion';
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

export default function ImageExifVersionSupp() {
  describe('ImageExifVersionSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      heicImageSourceApi = await getImageSource('test_exif_v5.heic');
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
      await heicImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_001
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_001
     * @tc.desc       Test ImageExifVersion cover normal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = "2.3"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect(result.exifMetadata?.exifVersion).assertEqual("Exif Version 2.3");
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_002
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_002
     * @tc.desc       Test ImageExifVersion cover Abnormal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = "-2.3"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_003
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_003
     * @tc.desc       Test ImageExifVersion cover Abnormal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_004
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_004
     * @tc.desc       Test ImageExifVersion cover Abnormal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_005
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_005
     * @tc.desc       Test ImageExifVersion cover Abnormal with jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = "null";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_006
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_006
     * @tc.desc       Test ImageExifVersion cover normal with heic
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = "2.3"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect(result.exifMetadata?.exifVersion).assertEqual("Exif Version 2.3");
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_007
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_007
     * @tc.desc       Test ImageExifVersion cover normal with heic
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = "-2.3"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_008
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_008
     * @tc.desc       Test ImageExifVersion cover normal with heic
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = ""
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_009
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_009
     * @tc.desc       Test ImageExifVersion cover normal with heic
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_EXIF_VERSION_TEST_010
     * @tc.name       SUB_IMAGE_EXIF_VERSION_TEST_010
     * @tc.desc       Test ImageExifVersion cover normal with heic
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_EXIF_VERSION_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_EXIF_VERSION_TEST_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exifVersion = "null";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exifVersion);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exifVersion);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is `,err.code);
        expect(err.code).assertEqual("7700202");
      }
      done();
    })
  });
}