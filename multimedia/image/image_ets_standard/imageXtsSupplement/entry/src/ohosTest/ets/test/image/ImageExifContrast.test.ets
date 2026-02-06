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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


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

export default function ImageContrastTypeSupp() {
  describe('ImageContrastTypeSupp', () => {
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
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 50;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect(result.exifMetadata?.focalLengthIn35mmFilm).assertEqual(50);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect(result.exifMetadata?.focalLengthIn35mmFilm).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 'abc' as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 50;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 'abc' as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalLengthIn35mmFilm);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalLengthIn35mmFilm);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect(result.exifMetadata?.sceneCaptureType).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect(result.exifMetadata?.sceneCaptureType).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect(result.exifMetadata?.sceneCaptureType).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect(result.exifMetadata?.sceneCaptureType).assertEqual(3);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SCENE_CAPTURE_TYPE_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sceneCaptureType = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sceneCaptureType);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sceneCaptureType);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect(result.exifMetadata?.gainControl).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect(result.exifMetadata?.gainControl).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect(result.exifMetadata?.gainControl).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect(result.exifMetadata?.gainControl).assertEqual(3);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {

        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00007
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_JPG_00007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 4;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect(result.exifMetadata?.gainControl).assertEqual(4);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00007
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_GAIN_CONTROL_PNG_00007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gainControl = 4;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.gainControl);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gainControl);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect(result.exifMetadata?.contrast).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect(result.exifMetadata?.contrast).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect(result.exifMetadata?.contrast).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_CONTRAST_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.contrast = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.contrast);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.contrast);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect(result.exifMetadata?.saturation).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect(result.exifMetadata?.saturation).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect(result.exifMetadata?.saturation).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SATURATION_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.saturation = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.saturation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.saturation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect(result.exifMetadata?.sharpness).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect(result.exifMetadata?.sharpness).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect(result.exifMetadata?.sharpness).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SHARPNESS_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sharpness = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sharpness);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sharpness);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect(result.exifMetadata?.subjectDistanceRange).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect(result.exifMetadata?.subjectDistanceRange).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect(result.exifMetadata?.subjectDistanceRange).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect(result.exifMetadata?.subjectDistanceRange).assertEqual(3);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {

        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00006
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_SUBJECT_DISTANCE_RANGE_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectDistanceRange = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectDistanceRange);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectDistanceRange);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00001
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = 'a';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.imageUniqueId);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.imageUniqueId);
        expect(result.exifMetadata?.imageUniqueId).assertEqual('a');
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00002
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.imageUniqueId);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.imageUniqueId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00003
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.imageUniqueId);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.imageUniqueId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00004
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.imageUniqueId);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.imageUniqueId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00005
     * @tc.desc       ImageWriteImageMetadata cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = 1 as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.imageUniqueId);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.imageUniqueId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00001
     * @tc.desc       ImageWriteImageMetadata focalLengthIn35mmFilm Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 50;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00002
     * @tc.desc       ImageWriteImageMetadata focalLengthIn35mmFilm Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00003
     * @tc.desc       ImageWriteImageMetadata focalLengthIn35mmFilm Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00004
     * @tc.desc       ImageWriteImageMetadata focalLengthIn35mmFilm Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00005
     * @tc.desc       ImageWriteImageMetadata focalLengthIn35mmFilm Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00006
     * @tc.desc       ImageWriteImageMetadata focalLengthIn35mmFilm Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_FOCAL_LENGTH_IN_35_MM_FILM_WEBP_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalLengthIn35mmFilm = 'abc' as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00001
     * @tc.desc       ImageWriteImageMetadata imageUniqueId Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = 'a';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00002
     * @tc.desc       ImageWriteImageMetadata imageUniqueId Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00003
     * @tc.desc       ImageWriteImageMetadata imageUniqueId Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00004
     * @tc.desc       ImageWriteImageMetadata imageUniqueId Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00005
     * @tc.desc       ImageWriteImageMetadata imageUniqueId Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_IMAGE_UNIQUE_ID_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageUniqueId = 1 as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00001
     * @tc.desc       ImageReadImageMetadata compositeImage Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.compositeImage);
        expect(result.exifMetadata?.compositeImage).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00002
     * @tc.desc       ImageReadImageMetadata compositeImage Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.compositeImage);
        expect(result.exifMetadata?.compositeImage).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00003
     * @tc.desc       ImageReadImageMetadata compositeImage Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.compositeImage);
        expect(result.exifMetadata?.compositeImage).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00004
     * @tc.desc       ImageReadImageMetadata compositeImage Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.compositeImage);
        expect(result.exifMetadata?.compositeImage).assertEqual(3);
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00005
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00006
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_JPG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00001
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00002
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00003
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00004
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00005
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00006
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_PNG_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00001
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00002
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00003
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00004
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00005
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00006
     * @tc.desc       ImageWriteImageMetadata compositeImage Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_COMPOSITE_IMAGE_WEBP_00006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.compositeImage = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00001
     * @tc.desc       ImageReadImageMetadata deviceSettingDescription success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_JPG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.deviceSettingDescription = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.deviceSettingDescription;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testReadImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00001
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.deviceSettingDescription = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00002
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.deviceSettingDescription = 1 as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00003
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.deviceSettingDescription = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00004
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_PNG_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.deviceSettingDescription = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00001
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.deviceSettingDescription = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00002
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.deviceSettingDescription = 1 as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00003
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.deviceSettingDescription = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00004
     * @tc.desc       ImageWriteImageMetadata deviceSettingDescription Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_TEST_DEVICE_SETTING_DESCRIPTION_WEBP_00004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.deviceSettingDescription = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Test failed: ${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    });
  });
}