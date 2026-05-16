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

const TAG = LOG_TAG + 'Xts.DescriptionSupp';
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
export default function ImageDescriptionSupp() {
  describe('ImageDescriptionSupp', () => {
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
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_001
     * @tc.desc       ImageWriteImageMetadata cover normal ImageDescription
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageDescription);
        let firImageDescription = resultFir.exifMetadata?.imageDescription;
        await  webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_002
     * @tc.desc       ImageWriteImageMetadata cover normal ImageDescription
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = '1024';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_003
     * @tc.desc       ImageWriteImageMetadata cover normal ImageDescription
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = 'test';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_004
     * @tc.desc       ImageWriteImageMetadata cover normal imageDescription ''
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_005
     * @tc.desc       ImageWriteImageMetadata cover normal imageDescription 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = '10000000000000000000000000000000000000000000000000000000000000';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.make);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_006
     * @tc.desc       ImageWriteImageMetadata cover normal imageDescription
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_007
     * @tc.desc       ImageWriteImageMetadata cover normal imageDescription
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.imageDescription);
        let firImageDescription = resultFir.exifMetadata?.imageDescription;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_008
     * @tc.desc       ImageWriteImageMetadata cover normal imageDescription
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = 'test';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect(result.exifMetadata?.imageDescription).assertEqual('test');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_009
     * @tc.desc       ImageWriteImageMetadata cover normal imageDescription 1025
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.make = '100000000000000000000000000000000000000000000000000000000000000';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.make);
        expect(result.exifMetadata?.make).assertEqual('100000000000000000000000000000000000000000000000000000000000000');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ImageDescription_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ImageDescription_010
     * @tc.desc       ImageWriteImageMetadata cover normal imageDescription 1024
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ImageDescription_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ImageDescription_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageDescription = '10000000000000000000000000000000000000000000000000000000000000';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.imageDescription);
        expect(result.exifMetadata?.imageDescription).assertEqual('10000000000000000000000000000000000000000000000000000000000000');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })




    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_001
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await  webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_002
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_003
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_004
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_005
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_006
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_007
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 4;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_008
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_009
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 6;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_010
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 7;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_011
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_012
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 9;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_013
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_013
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await  jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_014
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_014
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_015
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_015
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect(result.exifMetadata?.photometricInterpretation).assertEqual(firImageDescription);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_016
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_016
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect(result.exifMetadata?.photometricInterpretation).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_017
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_017
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect(result.exifMetadata?.photometricInterpretation).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_018
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_018
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect(result.exifMetadata?.photometricInterpretation).assertEqual(3);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_019
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_019
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 4;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_020
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_020
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_020';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect(result.exifMetadata?.photometricInterpretation).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_021
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_021
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_021';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 6;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect(result.exifMetadata?.photometricInterpretation).assertEqual(6);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_022
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_022
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_022';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 7;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_023
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_023
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_023';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect(result.exifMetadata?.photometricInterpretation).assertEqual(8);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_024
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_024
     * @tc.desc       ImageWriteImageMetadata cover normal PhotometricInterpretation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_PhotometricInterpretation_024';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.photometricInterpretation = 9;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.photometricInterpretation);
        let firImageDescription = resultFir.exifMetadata?.photometricInterpretation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.photometricInterpretation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_001
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await  jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_002
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_003
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_004
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(1);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_005
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(2);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_006
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(3);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_007
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 4;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(4);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_008
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(5);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_009
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 6;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(6);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_010
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 7;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(7);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_011
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect(result.exifMetadata?.orientation).assertEqual(8);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_orientation_012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_orientation_012
     * @tc.desc       ImageWriteImageMetadata cover normal orientation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_orientation_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_orientation_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.orientation = 9;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata FirResult  is:`,resultFir.exifMetadata?.orientation);
        let firImageDescription = resultFir.exifMetadata?.orientation;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testReadImageMetadata result is:`,result.exifMetadata?.orientation);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
  });
}