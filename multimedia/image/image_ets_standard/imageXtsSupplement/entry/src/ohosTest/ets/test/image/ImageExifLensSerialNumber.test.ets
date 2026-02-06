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


const TAG = 'Xts.ImageLensSerialNumber';
let fdNumber: number;
async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}
let IMAGE_SOURCE_UNSUPPORTED_METADATA ='7700202';
let jpgImageSourceApi:image.ImageSource;
let pngImageSourceApi:image.ImageSource;
let heicImageSourceApi:image.ImageSource;
let webpImageSourceApi:image.ImageSource;


async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageLensSerialNumberSupp() {
  describe('ImageLensSerialNumberSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
      heicImageSourceApi = await getImageSource('test_exif_v2.heic');
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
      await heicImageSourceApi.release();
      await webpImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_001
     * @tc.desc       ImageReadImageMetadata LensSerialNumber-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= 'abc';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.lensSerialNumber);
        expect(result.exifMetadata?.lensSerialNumber).assertEqual('abc');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_002
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_003
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_004
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_005
     * @tc.desc       ImageReadImageMetadata LensSerialNumber-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.lensSerialNumber= longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.lensSerialNumber);
        expect(result.exifMetadata?.lensSerialNumber).assertEqual(longStr);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_006
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= 'abc';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_007
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_008
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_009
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0010
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.lensSerialNumber= longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail()
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0011
     * @tc.desc       ImageReadImageMetadata LensSerialNumber-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= 'abc';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.lensSerialNumber);
        expect(result.exifMetadata?.lensSerialNumber).assertEqual('abc');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0012
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0013
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0014
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0015
     * @tc.desc       ImageReadImageMetadata LensSerialNumber-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.lensSerialNumber= longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.lensSerialNumber);
        expect(result.exifMetadata?.lensSerialNumber).assertEqual(longStr);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0016
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= 'abc';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0017
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0018
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0019
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0019
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.lensSerialNumber= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0020
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0020
     * @tc.desc       ImageWriteImageMetadata LensSerialNumber-Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_LENS_SERIAL_NUMBER_0020';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.lensSerialNumber= longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
  });
}