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


const TAG = 'Xts.ImageISOSpeedLatitude';
let fdNumber: number;
async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}
let jpgImageSourceApi:image.ImageSource;
let pngImageSourceApi:image.ImageSource;
let heicImageSourceApi:image.ImageSource;


async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function ImageISOSpeedLatitudeSupp() {
  describe('ImageISOSpeedLatitudeSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif.png');
      heicImageSourceApi = await getImageSource('test_exif_v3.heic');
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
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_001
     * @tc.desc       ImageWriteImageMetadata cover normal jpg "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect(result.exifMetadata?.isoSpeedLatitudeyyy).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_002
     * @tc.desc       ImageWriteImageMetadata cover normal jpg "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect(result.exifMetadata?.isoSpeedLatitudeyyy).assertEqual(100);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_003
     * @tc.desc       ImageWriteImageMetadata cover abnormal jpg "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudeyyy);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_004
     * @tc.desc       ImageWriteImageMetadata cover abnormal jpg "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudeyyy);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_005
     * @tc.desc       ImageWriteImageMetadata cover abnormal png "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_006
     * @tc.desc       ImageWriteImageMetadata cover normal png "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_007
     * @tc.desc       ImageWriteImageMetadata cover abnormal png "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudeyyy);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_008
     * @tc.desc       ImageWriteImageMetadata cover abnormal png "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudeyyy);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_009
     * @tc.desc       ImageWriteImageMetadata cover normal heic "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect(result.exifMetadata?.isoSpeedLatitudeyyy).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0010
     * @tc.desc       ImageWriteImageMetadata cover normal heic "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect(result.exifMetadata?.isoSpeedLatitudeyyy).assertEqual(100);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0011
     * @tc.desc       ImageWriteImageMetadata cover abnormal heic "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudeyyy);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0012
     * @tc.desc       ImageWriteImageMetadata cover abnormal heic "ISOSpeedLatitudeyyy"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_YYY_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudeyyy= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudeyyy);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudeyyy);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_001
     * @tc.desc       ImageWriteImageMetadata cover normal jpg "ISOSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect(result.exifMetadata?.isoSpeedLatitudezzz).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_002
     * @tc.desc       ImageWriteImageMetadata cover normal jpg "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect(result.exifMetadata?.isoSpeedLatitudezzz).assertEqual(100);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_003
     * @tc.desc       ImageWriteImageMetadata cover abnormal jpg "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudezzz);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_004
     * @tc.desc       ImageWriteImageMetadata cover abnormal jpg "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudezzz);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_005
     * @tc.desc       ImageWriteImageMetadata cover normal png "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_006
     * @tc.desc       ImageWriteImageMetadata cover normal png "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_007
     * @tc.desc       ImageWriteImageMetadata cover abnormal png "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudezzz);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_008
     * @tc.desc       ImageWriteImageMetadata cover abnormal png "ISOSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudezzz);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail()
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_009
     * @tc.desc       ImageWriteImageMetadata cover normal heic "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect(result.exifMetadata?.isoSpeedLatitudezzz).assertEqual(0);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0010
     * @tc.desc       ImageWriteImageMetadata cover normal heic "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect(result.exifMetadata?.isoSpeedLatitudezzz).assertEqual(100);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0011
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0011
     * @tc.desc       ImageWriteImageMetadata cover abnormal heic "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudezzz);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0012
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0012
     * @tc.desc       ImageWriteImageMetadata cover abnormal heic "isoSpeedLatitudezzz"
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_ISO_SPEED_LATITUDE_ZZZ_0012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.isoSpeedLatitudezzz= null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata resultFir is:`,resultFir.exifMetadata?.isoSpeedLatitudezzz);
        await heicImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await heicImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.isoSpeedLatitudezzz);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
  });
}