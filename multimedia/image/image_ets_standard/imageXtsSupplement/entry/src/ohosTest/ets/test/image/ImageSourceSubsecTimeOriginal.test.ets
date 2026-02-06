/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


const TAG = 'Xts.ImageSourcesubsecTimeOriginal';
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
let IMAGE_SOURCE_UNSUPPORTED_METADATA = '7700202';
let jpgImageSourceApi:image.ImageSource;
let pngImageSourceApi:image.ImageSource;
let webpImageSourceApi:image.ImageSource;
let heicImageSourceApi:image.ImageSource;

export default function ImageSourceSubsecTimeOriginalSupp() {
  describe('ImageSourceSubsecTimeOriginalSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      heicImageSourceApi = await getImageSource('test_exif_v2.heic');
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
      await heicImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_001
     * @tc.desc       ImageReadImageMetadata-subsecTimeOriginal-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = '123456';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.subsecTimeOriginal);
        expect(result.exifMetadata?.subsecTimeOriginal).assertContain('123456');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_002
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.subsecTimeOriginal);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_003
     * @tc.desc       ImageReadImageMetadata-subsecTimeOriginal-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.userComment = longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.subsecTimeOriginal);
        expect(result.exifMetadata?.userComment).assertEqual(longStr);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_004
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_005
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_006
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = 'place for user comments';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_007
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.userComment = longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_008
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_009
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_010
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_011
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = 'place for user comments';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_012
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.userComment = longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_013
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_014
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_015
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_016
     * @tc.desc       ImageReadImageMetadata-subsecTimeOriginal-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = '123456';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.subsecTimeOriginal);
        expect(result.exifMetadata?.subsecTimeOriginal).assertContain('123456');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_017
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.subsecTimeOriginal);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_018
     * @tc.desc       ImageReadImageMetadata-subsecTimeOriginal-SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      let longStr = '1'.repeat(524);
      testExifMetadata.userComment = longStr;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.subsecTimeOriginal);
        expect(result.exifMetadata?.userComment).assertEqual(longStr);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_019
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_019
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_020
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_020
     * @tc.desc       ImageWriteImageMetadata-subsecTimeOriginal-UNSUPPORTED_METADATA
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_SUBSEC_TIME_ORIGINAL_020';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subsecTimeOriginal = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.subsecTimeOriginal);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
      }
      done();
    })


  });
}