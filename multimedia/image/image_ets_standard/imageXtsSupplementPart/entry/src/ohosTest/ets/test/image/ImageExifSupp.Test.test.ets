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
import { fileIo as fs } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';
import { sleep } from '../common';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


const TAG = 'ImageExifSuppTestSUPP';
let fdNumber: number;
async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

let pngImageSourceApi: image.ImageSource;
let jpgImageSourceApi: image.ImageSource;
let webpImageSourceApi: image.ImageSource;
let heicImageSourceApi: image.ImageSource;


async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageExifSuppTest() {
  describe('ImageExifSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg')
      webpImageSourceApi = await getImageSource('test_exif_v2.webp')
      heicImageSourceApi = await getImageSource('test_exif_v2.heic')
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await pngImageSourceApi.release();
      await jpgImageSourceApi.release();
      await webpImageSourceApi.release();
      await heicImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_001
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_002
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_003
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = -1/2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exposureTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(resultFir.exifMetadata?.exposureTime);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_004
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 1/2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(1/2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_005
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = -1/3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exposureTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(resultFir.exifMetadata?.exposureTime);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_006
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 65535;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(65535);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_007
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_008
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_009
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = -1/2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exposureTime);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(resultFir.exifMetadata?.exposureTime);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0010
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 1/2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(1/2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0011
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = -1/3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exposureTime);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(resultFir.exifMetadata?.exposureTime);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0012
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 65535;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(65535);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0013
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 1/65535;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exposureTime);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(resultFir.exifMetadata?.exposureTime);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0014
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = Infinity;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exposureTime);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(resultFir.exifMetadata?.exposureTime);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0015
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = 60;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(60);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0016
     * @tc.desc       ImageWriteImageMetadata cover normal exposureTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_TIME_0016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureTime = Infinity;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.exposureTime);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureTime);
        expect(result.exifMetadata?.exposureTime).assertEqual(resultFir.exifMetadata?.exposureTime);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })


    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_001
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 1.8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(1.8);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_002
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_003
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = -1/3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.fNumber);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(resultFir.exifMetadata?.fNumber);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_004
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 1/2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(1/2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_005
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 64;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(64);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_006
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 1.8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(1.8);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_007
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_008
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = -1/3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.fNumber);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(resultFir.exifMetadata?.fNumber);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_009
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 1/2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(1/2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0010
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 64;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(64);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0011
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 128;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(128);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0012
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0013
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = -2.8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.fNumber);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(resultFir.exifMetadata?.fNumber);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0014
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = Infinity;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.fNumber);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(resultFir.exifMetadata?.fNumber);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0015
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 128;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(128);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0016
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0017
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = -2.8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.fNumber);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(resultFir.exifMetadata?.fNumber);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0018
     * @tc.desc       ImageWriteImageMetadata cover normal fNumber
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_FNUMBER_0018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.fNumber = Infinity;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.fNumber);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.fNumber);
        expect(result.exifMetadata?.fNumber).assertEqual(resultFir.exifMetadata?.fNumber);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_001
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_002
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_003
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_004
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(3);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_005
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 4;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(4);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_006
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_007
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 6;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(6);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_008
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 7;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(7);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_009
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(8);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0010
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0011
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0012
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0013
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(3);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0014
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 4;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(4);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0015
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0016
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 6;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(6);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0017
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 7;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(7);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0018
     * @tc.desc       ImageWriteImageMetadata cover normal exposureProgram
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_EXPOSURE_PROGRAM_0018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureProgram = 8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.exposureProgram);
        expect(result.exifMetadata?.exposureProgram).assertEqual(8);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_001
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = "a".repeat(1000);
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("a".repeat(1000));
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_002
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.spectralSensitivity);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual(resultFir.exifMetadata?.spectralSensitivity);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_003
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = 'A';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("A");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_004
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.spectralSensitivity);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual(resultFir.exifMetadata?.spectralSensitivity);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_005
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = "RGB 400-700nm";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("RGB 400-700nm");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_006
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = "ISO 100";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("ISO 100");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_007
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = "a".repeat(100);
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("a".repeat(100));
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_008
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.spectralSensitivity);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual(resultFir.exifMetadata?.spectralSensitivity);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_009
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = 'A';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("A");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0010
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.spectralSensitivity);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual(resultFir.exifMetadata?.spectralSensitivity);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0011
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = "RGB 400-700nm";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("RGB 400-700nm");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0012
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SPECTRAL_SENSITIVITY_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.spectralSensitivity = 'ISO 100';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.spectralSensitivity);
        expect(result.exifMetadata?.spectralSensitivity).assertEqual("ISO 100");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_001
     * @tc.desc       ImageWriteImageMetadata cover normal spectralSensitivity
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = "N"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual("N");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_002
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_003
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual("S");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_004
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_005
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = "n";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_006
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = "NS";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_007
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = "N";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual("N");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_008
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_009
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual("S");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0010
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0011
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = "n";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0012
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_REF_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitudeRef = 'NS';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLatitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitudeRef);
        expect(result.exifMetadata?.gpsLatitudeRef).assertEqual(resultFir.exifMetadata?.gpsLatitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_001
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "E"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual("E");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_002
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_003
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = 'W';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual("W");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_004
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_005
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "e";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_006
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "EW";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_007
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "E";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual("E");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_008
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_009
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = 'W';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual("W");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0010
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0011
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "e";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0012
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = 'EW';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsLongitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual(resultFir.exifMetadata?.gpsLongitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0013
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = "69"
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual("69");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0014
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_REF_0014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitudeRef = '69';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitudeRef);
        expect(result.exifMetadata?.gpsLongitudeRef).assertEqual("69");
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_001
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 0
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_002
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_003
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_004
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLatitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 255;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_005
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_006
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 256;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_007
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_008
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_009
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0010
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 255;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0011
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0012
     * @tc.desc       ImageWriteImageMetadata cover normal gpsLongitudeRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_REF_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitudeRef = 256;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitudeRef);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitudeRef);
        expect(result.exifMetadata?.gpsAltitudeRef).assertEqual(resultFir.exifMetadata?.gpsAltitudeRef);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_001
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = 0
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_002
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = 8848;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(8848);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_003
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = 123.456;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(123.456);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_004
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = -0.000001;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitude);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(resultFir.exifMetadata?.gpsAltitude);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_005
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = Infinity;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitude);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(resultFir.exifMetadata?.gpsAltitude);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_006
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitude);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(resultFir.exifMetadata?.gpsAltitude);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_007
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_008
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = 8848;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(8848);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_009
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = 123.456;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(123.456);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0010
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = -0.000001;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitude);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(resultFir.exifMetadata?.gpsAltitude);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0011
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitude);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(resultFir.exifMetadata?.gpsAltitude);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0012
     * @tc.desc       ImageWriteImageMetadata cover normal gpsAltitude
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_ALTITUDE_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsAltitude = Infinity;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsAltitude);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsAltitude);
        expect(result.exifMetadata?.gpsAltitude).assertEqual(resultFir.exifMetadata?.gpsAltitude);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_001
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = '0';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('0');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_002
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = '8';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('8');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_003
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = '12';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('12');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_004
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = "5,7,9";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('5,7,9');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_005
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = "99";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('99');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_006
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsSatellites);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual(resultFir.exifMetadata?.gpsSatellites);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_007
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = '0';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('0');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_008
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = '8';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('8');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_009
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = '12';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('12');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0010
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = "5,7,9";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('5,7,9');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0011
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsSatellites);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual(resultFir.exifMetadata?.gpsSatellites);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0012
     * @tc.desc       ImageWriteImageMetadata cover normal gpsSatellites
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_SATELLITES_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSatellites = '99';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSatellites);
        expect(result.exifMetadata?.gpsSatellites).assertEqual('99');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_001
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = 'A';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual('A');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_002
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = 'V';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual('V');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_003
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = 'AA';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_004
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_005
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = "a";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_006
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_007
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = 'A';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual('A');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_008
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = 'V';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual('V');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_009
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = 'AA';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0010
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0011
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0012
     * @tc.desc       ImageWriteImageMetadata cover normal gpsStatus
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_STATUS_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsStatus = 'a';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsStatus);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsStatus);
        expect(result.exifMetadata?.gpsStatus).assertEqual(resultFir.exifMetadata?.gpsStatus);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_001
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = 'Copyright © 2025 Test Company';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('Copyright © 2025 Test Company (Photographer) - [None] (Editor)');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_002
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = '测试版权信息 2025 某某公司';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('测试版权信息 2025 某某公司 (Photographer) - [None] (Editor)');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_003
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = 'Copyright (C) 2025 测试';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('Copyright (C) 2025 测试 (Photographer) - [None] (Editor)');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_004
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.copyright);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual(resultFir.exifMetadata?.copyright);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_005
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = 'a'.repeat(1024);
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('a'.repeat(1024));
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_006
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.copyright);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual(resultFir.exifMetadata?.copyright);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_007
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = 'Copyright © 2025 Test Company';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('Copyright © 2025 Test Company (Photographer) - [None] (Editor)');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_008
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = '测试版权信息 2025 某某公司';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('测试版权信息 2025 某某公司 (Photographer) - [None] (Editor)');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_009
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = 'Copyright (C) 2025 测试';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('Copyright (C) 2025 测试 (Photographer) - [None] (Editor)');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0010
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.copyright);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual(resultFir.exifMetadata?.copyright);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0011
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = "";
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.copyright);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual(resultFir.exifMetadata?.copyright);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0012
     * @tc.desc       ImageWriteImageMetadata cover normal copyright
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_COPYRIGHT_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.copyright = 'a'.repeat(1024);
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.copyright);
        expect(result.exifMetadata?.copyright).assertEqual('a'.repeat(1024));
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_001
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [116, 24, 14];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[116,24,14]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_002
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_003
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [180, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[180,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_004
     * @tc.desc       ImageWriteImageMetadata gpsLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [-180, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_005
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [0, 59, 59.999];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,59,59.999]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_006
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [116, 24, 14];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[116,24,14]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_007
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_008
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [180, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[180,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_009
     * @tc.desc       ImageWriteImageMetadata gpsLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [-180, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_0010
     * @tc.desc       ImageReadImageMetadata gpsLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LONGITUDE_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLongitude = [0, 59, 59.999];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLongitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,59,59.999]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_001
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[2,0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_002
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [1, 1, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[1,1,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_003
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [0, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_004
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2,5,5,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[2,5,5,2]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_005
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [-1, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_006
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [0,1,2,3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,1,2,3]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_007
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_008
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2, 0, 0, 0, 1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_009
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0010
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2,5,6,0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[2,5,6,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0011
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0012
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[2,0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0013
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [1, 1, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[1,1,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0014
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [0, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0015
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2,5,5,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[2,5,5,2]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0016
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [-1, 0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0017
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [0,1,2,3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,1,2,3]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0018
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0019
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0019
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2, 0, 0, 0, 1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0020
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0020
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0020';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0021
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0021
     * @tc.desc       ImageReadImageMetadata gpsVersionID success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0021';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = [2,5,6,0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsVersionID);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsVersionID)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[2,5,6,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0022
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0022
     * @tc.desc       ImageWriteImageMetadata gpsVersionID Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_VERSION_ID_0022';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsVersionID = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_001
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [12, 30, 45];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[12,30,45]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_002
     * @tc.desc       ImageWriteImageMetadata gpsTimestamp Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_003
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [23, 59, 59.999];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[23,59,59.999]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_004
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [23, 59, 59];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[23,59,59]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_005
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [12, 30, 61];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[12,30,61]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_006
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [12, 30, 45];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `testWriteImageMetadata result is:`);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, `testWriteImageMetadata result is:`);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[12,30,45]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_007
     * @tc.desc       ImageWriteImageMetadata gpsTimestamp Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_008
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [23, 59, 59.999];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[23,59,59.999]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_009
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [23, 59, 59];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[23,59,59]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_0010
     * @tc.desc       ImageReadImageMetadata gpsTimestamp success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_TIMESTAMP_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsTimestamp = [12, 30, 61];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsTimestamp);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsTimestamp)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[12,30,61]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_001
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [39, 54, 26.76];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[39,54,26.76]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_002
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_003
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [90, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[90,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_004
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [30, 15.5, 20.25];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[30,15.5,20.25]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_005
     * @tc.desc       ImageWriteImageMetadata gpsLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [89.999, 59.999, 59.999];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_006
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [39, 54, 26.76];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[39,54,26.76]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_007
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_008
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [30, 15.5, 20.25];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[30,15.5,20.25]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_009
     * @tc.desc       ImageReadImageMetadata gpsLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [90, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsLatitude)
        console.info(TAG,testName,'resultStr:',resultStr)
        expect(resultStr).assertEqual('[90,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_0010
     * @tc.desc       ImageWriteImageMetadata gpsLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_GPS_LATITUDE_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsLatitude = [89.999, 59.999, 59.999];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start')
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
  });
}