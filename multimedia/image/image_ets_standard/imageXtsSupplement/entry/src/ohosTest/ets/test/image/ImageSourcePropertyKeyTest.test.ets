/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { LOG_TAG, sleep } from '../common';

const TAG = LOG_TAG + 'ImageXts.ImagePropertyKey';
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
let pngImageSourceApi: image.ImageSource;
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}
export default function  ImageSourcePropertyKeyTest() {
  describe('ImageSourcePropertyKeyTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async() => {
      console.info('afterAll case');
      await webpImageSourceApi.release();
      await jpgImageSourceApi.release();
      await pngImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_001
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_001
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 72;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(72);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_002
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_002
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_003
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_003
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_004
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_004
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_005
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_005
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 72;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(72);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_006
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_006
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_007
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_007
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_008
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_008
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_009
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_009
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 72;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(72);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_010
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_010
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_011
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_011
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_012
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_012
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_013
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_013
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 72;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(72);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_014
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_014
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_015
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_015
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_016
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_016
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_017
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_017
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 72;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(72);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_018
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_018
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_019
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_019
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_020
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_020
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_020';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_021
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_021
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_021';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 72;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(72);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_022
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_022
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_022';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_023
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_023
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_023';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_024
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_024
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_024';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_025
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_025
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_025';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_026
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_026
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_026';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_027
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_027
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_027';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_028
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_028
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_028';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_029
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_029
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_029';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_030
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_030
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_030';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_031
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_031
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_031';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');;
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_032
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_032
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_032';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_033
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_033
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_033';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_034
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_034
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_034';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_035
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_035
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_035';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_036
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_036
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_036';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);;
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_037
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_037
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_037';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_038
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_038
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_038';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 10;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_039
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_039
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_039';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_040
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_040
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_040';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_041
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_041
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_041', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_041';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_042
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_042
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_042';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 10;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_043
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_043
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_043';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_044
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_044
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_044';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_045
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_045
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_045', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_045';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_046
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_046
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_046', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_046';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 10;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_047
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_047
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_047', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_047';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_048
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_048
     * @tc.desc       ImageWriteImageMetadata cover normal ResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_048';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.resolutionUnit);
        let firType = resultFir.exifMetadata?.resolutionUnit;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.resolutionUnit);
        expect(result.exifMetadata?.resolutionUnit).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_049
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_049
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_049', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_049';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_050
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_050
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_050';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_051
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_051
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_051', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_051';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_052
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_052
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_052';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_053
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_053
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_053', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_053';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_054
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_054
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_054', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_054';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_055
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_055
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_055', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_055';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_056
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_056
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_056', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_056';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_057
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_057
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_057', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_057';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_058
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_058
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_058', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_058';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_059
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_059
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_059', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_059';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_060
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_060
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_060', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_060';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_061
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_061
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_061', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_061';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_062
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_062
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_062', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_062';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_063
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_063
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_063', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_063';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_064
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_064
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_064', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_064';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_065
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_065
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_065', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_065';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_066
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_066
     * @tc.desc       ImageWriteImageMetadata cover normal PhotoMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_066', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PHOTOMODE_066';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photoMode = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.photoMode);
        let firType = resultFir.exifMetadata?.photoMode;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.photoMode);
        expect(result.exifMetadata?.photoMode).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_067
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_067
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_067', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_067';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_068
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_068
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_068', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_068';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_069
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_069
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_069', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_069';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_070
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_070
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_070', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_070';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_071
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_071
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_071', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_071';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_072
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_072
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_072', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_072';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_073
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_073
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_073', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_073';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_074
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_074
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_074', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_074';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_075
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_075
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_075', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_075';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_076
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_076
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_076', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_076';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_077
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_077
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_077', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_077';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_078
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_078
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_078', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_078';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_079
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_079
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_079', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_079';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_080
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_080
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_080', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_080';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_081
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_081
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_081', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_081';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_082
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_082
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_082', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_082';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_083
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_083
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_083', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_083';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_084
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_084
     * @tc.desc       ImageWriteImageMetadata cover normal YCbCrPositioning
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_084', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRPOSITIONING_084';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrPositioning = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yCbCrPositioning);
        let firType = resultFir.exifMetadata?.yCbCrPositioning;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yCbCrPositioning);
        expect(result.exifMetadata?.yCbCrPositioning).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_085
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_085
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_085', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_085';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_086
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_086
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_086', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_086';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_087
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_087
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_087', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_087';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_088
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_088
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_088', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_088';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_089
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_089
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_089', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_089';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_090
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_090
     * @tc.desc       ImageWriteImageMetadata cover normal XResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_090', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_XRESOLUTION_090';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.xResolution = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.xResolution);
        let firType = resultFir.exifMetadata?.xResolution;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.xResolution);
        expect(result.exifMetadata?.xResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_091
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_091
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_091', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_091';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_092
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_092
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_092', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_092';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_093
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_093
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_093', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_093';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_094
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_094
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_094', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_094';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_095
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_095
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_095', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_095';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_096
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_096
     * @tc.desc       ImageWriteImageMetadata cover normal YResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_096', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YRESOLUTION_096';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yResolution = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.yResolution);
        let firType = resultFir.exifMetadata?.yResolution;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.yResolution);
        expect(result.exifMetadata?.yResolution).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_097
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_097
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_097', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_097';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_098
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_098
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_098', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_098';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_099
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_099
     * @tc.desc       ImageWriteImageMetadata cover normal PlanarConfiguration
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_099', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PLANARCONFIGURATION_099';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.planarConfiguration = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.planarConfiguration);
        let firType = resultFir.exifMetadata?.planarConfiguration;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.planarConfiguration);
        expect(result.exifMetadata?.planarConfiguration).assertEqual(firType);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
  })
}