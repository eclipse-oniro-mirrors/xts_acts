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
import { sleep, isEmpty } from '../common';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'Xts.ImageMake_BitsPerSample_StripOffsetsSupp';
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
  const jpgImageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(jpgImageSourceApi.getImageInfoSync()));
  return jpgImageSourceApi;
}
export default function ImageBitsPerSampleStripOffsetsSupp() {
  describe('ImageBitsPerSampleStripOffsetsSupp', () => {
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
    afterAll(async () => {
      console.info('afterAll case');

    });


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_001
     * @tc.desc       testExifMetadata.stripOffsets cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [8,8,8];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_002
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal[]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [123];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_003
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal [0]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_004
     * @tc.desc       testExifMetadata.stripOffsets cover normal [1]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_005
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [100000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.stripOffsets;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_006
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal  1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [10000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.stripOffsets;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_007
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal []
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_008
     * @tc.desc       testExifMetadata.stripOffsets cover normal [0,1,1]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [1,2,3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        let resultStr=JSON.stringify(result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_009
     * @tc.desc       testExifMetadata.stripOffsets cover normal [1]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect(result.exifMetadata?.stripOffsets).assertContain('1');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_010
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [100000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.stripOffsets;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_011
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [10000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.stripOffsets;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202')
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_012
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.stripOffsets;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_StripOffsets_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_StripOffsets_013
     * @tc.desc       testExifMetadata.stripOffsets cover abnormal -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_StripOffsets_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_StripOffsets_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.stripOffsets);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.stripOffsets;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.stripOffsets);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })




    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_001
     * @tc.desc       testExifMetadata.bitsPerSample cover normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [8,8,8];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_002
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal[]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [123];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_003
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal [0]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_004
     * @tc.desc       testExifMetadata.bitsPerSample cover normal [1]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_005
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [100000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.bitsPerSample;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_006
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal  1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [10000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.bitsPerSample;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_007
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal []
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_008
     * @tc.desc       testExifMetadata.bitsPerSample cover normal [0]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_009
     * @tc.desc       testExifMetadata.bitsPerSample cover normal [1]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_010
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [100000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.bitsPerSample;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_011
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [10000000000000000000000000000000000000000000000000000000000000];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.bitsPerSample;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202')
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_012
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.bitsPerSample;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_013
     * @tc.desc       testExifMetadata.bitsPerSample cover abnormal -1
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_bitsPerSample_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.bitsPerSample);
        let firNMake_Model_StripOffsets = resultFir.exifMetadata?.bitsPerSample;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.bitsPerSample);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
})
}