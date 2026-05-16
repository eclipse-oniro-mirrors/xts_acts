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
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'Xts.ImageNewSubFileType';
let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
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

export default function ImageNewSubFileTypeSupp() {
  describe('ImageNewSubFileTypeSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_001
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect(result.exifMetadata?.newSubfileType).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_002
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect(result.exifMetadata?.newSubfileType).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_003
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.newSubfileType);
        let firNSubfileType = resultFir.exifMetadata?.newSubfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_004
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.newSubfileType);
        let firNSubfileType = resultFir.exifMetadata?.newSubfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_005
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.newSubfileType);
        let firNSubfileType = resultFir.exifMetadata?.newSubfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect(result.exifMetadata?.newSubfileType).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_006
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`firReadImageMetadata Result is:`,resultFir.exifMetadata?.newSubfileType);
        let firNSubfileType = resultFir.exifMetadata?.newSubfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`secReadImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_007
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.newSubfileType);
        let firNSubfileType = resultFir.exifMetadata?.newSubfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_008
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.newSubfileType);
        let firNSubfileType = resultFir.exifMetadata?.newSubfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_009
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.newSubfileType);
        let firNSubfileType = resultFir.exifMetadata?.newSubfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_010
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_011
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_012
     * @tc.desc       ImageWriteImageMetadata cover normal newSubfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_NEW_SUB_FILE_TYPE_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.newSubfileType = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.newSubfileType);
        expect(result.exifMetadata?.newSubfileType).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_001
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect(result.exifMetadata?.subfileType).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_002
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_003
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_004
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_005
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_006
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_007
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_008
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect(result.exifMetadata?.subfileType).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_009
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_010
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_011
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_012
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_013
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 10000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();;
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_014
     * @tc.desc       ImageWriteImageMetadata cover normal subfileType 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUB_FILE_TYPE_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subfileType = 100000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.subfileType);
        let firNSubfileType = resultFir.exifMetadata?.subfileType;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.subfileType);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
  });
}