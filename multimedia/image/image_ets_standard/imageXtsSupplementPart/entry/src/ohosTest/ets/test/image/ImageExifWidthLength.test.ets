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

const TAG = LOG_TAG + 'Xts.ImageWidthLengthSupp';
let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}
let webpImageSourceApi: image.ImageSource;
let jpgImageSourceApi: image.ImageSource;
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageWidthLengthSupp() {
  describe('ImageWidthLengthSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await webpImageSourceApi.release();
      await jpgImageSourceApi.release();
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_001
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect(result.exifMetadata?.imageWidth).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_002
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_003
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 1024;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_004
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect(result.exifMetadata?.imageWidth).assertEqual(firNWidthLength);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_005
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        // expect(result.exifMetadata?.imageWidth).assertEqual(firNWidthLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_006
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      sleep(1000);
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_007
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_008
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 1024;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect(result.exifMetadata?.imageWidth).assertEqual(1024);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_009
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect(result.exifMetadata?.imageWidth).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_010
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect(result.exifMetadata?.imageWidth).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_011
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect().assertFail();;
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_012
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_013
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 10000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        // expect(result.exifMetadata?.imageWidth).assertEqual('10000000000000000000000000000000000000000000000000000000000000');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_014
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 100000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageWidth);
        let firNWidthLength = resultFir.exifMetadata?.imageWidth;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageWidth);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_015
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect(result.exifMetadata?.imageLength).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_016
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 1024;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_017
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202')
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_018
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageLength);
        let firNWidthLength = resultFir.exifMetadata?.imageLength;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect(result.exifMetadata?.imageLength).assertEqual(firNWidthLength);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_019
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_019
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageLength);
        let firNWidthLength = resultFir.exifMetadata?.imageLength;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_020
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_020
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_020';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.imageLength);
        let firNWidthLength = resultFir.exifMetadata?.imageLength;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_021
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_021
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_021';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_022
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_022
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_022';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 1024;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect(result.exifMetadata?.imageLength).assertEqual(1024);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_023
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_023
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_023';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect(result.exifMetadata?.imageLength).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_024
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_024
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_024';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect(result.exifMetadata?.imageLength).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_025
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_025
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_025';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult is:`,resultFir.exifMetadata?.imageLength);
        let firNWidthLength = resultFir.exifMetadata?.imageLength;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_026
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_026
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_026';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = -100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageLength);
        let firNWidthLength = resultFir.exifMetadata?.imageLength;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_027
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_027
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_027';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 10000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageLength);
        let firNWidthLength = resultFir.exifMetadata?.imageLength;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_Width_Length_028
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_Width_Length_028
     * @tc.desc       ImageWriteImageMetadata cover normal WidthLength 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_Width_Length_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_Width_Length_028';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageLength = 100000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let resultFir = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageLength);
        let firNWidthLength = resultFir.exifMetadata?.imageLength;
        await imageSourceApi.writeImageMetadata(imageMetadata);
        let result = await imageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageLength);
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