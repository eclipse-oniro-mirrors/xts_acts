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
import common from '@ohos.app.ability.common';
import { LOG_TAG, sleep } from '../common';

const TAG = LOG_TAG + 'Xts.ImageGPSDest';
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

export default function ImageGPSDest(){
  describe('ImageGPSDest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
    });
    beforeEach(async () => {
      await sleep(500);
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
      await sleep(500)
    });
    afterAll(async() => {
      console.info('afterAll case');
      await jpgImageSourceApi.release();
      await webpImageSourceApi.release();
      await pngImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_001
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_001
     * @tc.desc       ImageReadImageMetadata gpsDestLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [116, 19, 42];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsDestLongitude)
        console.info(TAG, testName, 'resultStr', resultStr);
        expect(resultStr).assertEqual('[116,19,42]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_002
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_002
     * @tc.desc       ImageReadImageMetadata gpsDestLongitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestLongitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsDestLongitude)
        console.info(TAG, testName, 'resultStr', resultStr);
        expect(resultStr).assertEqual('[0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_003
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_003
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_004
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_004
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_005
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_005
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_006
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_006
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [1.5, 2.5, 3.5];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_007
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_007
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [116, 19, 42];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_008
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_008
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_009
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_009
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_010
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_010
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_011
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_011
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_012
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_012
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [1.5, 2.5, 3.5];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_013
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_013
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [116, 19, 42];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_014
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_014
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_015
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_015
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_016
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_016
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_017
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_017
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_018
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_018
     * @tc.desc       ImageWriteImageMetadata gpsDestLongitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LONGITUDE_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLongitude = [1.5, 2.5, 3.5];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_001
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_001
     * @tc.desc       ImageReadImageMetadata gpsDestLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [116, 19, 42];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsDestLatitude)
        console.info(TAG, testName, 'resultStr', resultStr);
        expect(resultStr).assertEqual('[116,19,42]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_002
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_002
     * @tc.desc       ImageReadImageMetadata gpsDestLatitude success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestLatitude);
        let resultStr = JSON.stringify(result.exifMetadata?.gpsDestLatitude)
        console.info(TAG, testName, 'resultStr', resultStr);
        expect(resultStr).assertEqual('[0,0,0]');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_003
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_003
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_004
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_004
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_005
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_005
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_006
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_006
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [1.5, 2.5, 3.5];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_007
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_007
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [116, 19, 42];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_008
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_008
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_009
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_009
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_010
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_010
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_011
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_011
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_012
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_012
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [1.5, 2.5, 3.5];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_013
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_013
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [116, 19, 42];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_014
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_014
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [0, 0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_015
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_015
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_016
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_016
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_017
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_017
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_018
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_018
     * @tc.desc       ImageWriteImageMetadata gpsDestLatitude Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_DEST_LATITUDE_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestLatitude = [1.5, 2.5, 3.5];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,`start:`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
  });
}