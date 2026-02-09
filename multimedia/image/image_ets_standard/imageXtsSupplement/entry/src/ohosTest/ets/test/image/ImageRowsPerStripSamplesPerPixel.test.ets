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

const TAG = LOG_TAG + 'Xts.ImageRowsPerStripSamplesPerPixelSupp';
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
export default function ImageRowsPerStripSamplesPerPixelSupp() {
  describe('ImageRowsPerStripSamplesPerPixelSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await webpImageSourceApi.release();
      await jpgImageSourceApi.release();
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_001
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_002
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_003
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect().assertFail();;
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_004
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 100000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_005
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 10000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.rowsPerStrip);
        let firImageDescription = resultFir.exifMetadata?.rowsPerStrip;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_006
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect().assertFail();;
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_007
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect(result.exifMetadata?.rowsPerStrip).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_008
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect(result.exifMetadata?.rowsPerStrip).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_009
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 100000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect(result.exifMetadata?.rowsPerStrip).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700102');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_010
     * @tc.desc       ImageWriteImageMetadata cover normal rowsPerStrip 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ROWS_PER_STRIP_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 10000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.rowsPerStrip);
        expect(result.exifMetadata?.rowsPerStrip).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_001
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await  webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_002
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_003
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_004
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 100000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_005
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 10000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_006
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_007
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect(result.exifMetadata?.samplesPerPixel).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_008
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect(result.exifMetadata?.samplesPerPixel).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_009
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 100000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect(result.exifMetadata?.rowsPerStrip).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_010
     * @tc.desc       ImageWriteImageMetadata cover normal samplesPerPixel 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SAMPLES_PER_PIXEL_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.samplesPerPixel = 10000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.samplesPerPixel);
        expect(result.exifMetadata?.rowsPerStrip).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
  });
}