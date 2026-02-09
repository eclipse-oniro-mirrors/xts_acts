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

const TAG = LOG_TAG + 'Xts.ImageGPSDestBearingRef';
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

export default function ImageGPSDestBearingRef() {
  describe('ImageGPSDestBearingRef', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async() => {
      console.info('afterAll case');
      await jpgImageSourceApi.release();
      await webpImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_001
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_001
     * @tc.desc       ImageGPSDestBearingRef cover normal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = 'T';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestBearingRef);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_002
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_002
     * @tc.desc       ImageGPSDestBearingRef cover normal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = 'M';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestBearingRef);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_003
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_003
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_004
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_004
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_005
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_005
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = '1';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_006
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_006
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = '好';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await webpImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_007
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_007
     * @tc.desc       ImageGPSDestBearingRef cover normal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = 'T';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestBearingRef);
        expect(result.exifMetadata?.gpsDestBearingRef).assertEqual('T');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_008
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_008
     * @tc.desc       ImageGPSDestBearingRef cover normal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = 'M';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsDestBearingRef);
        expect(result.exifMetadata?.gpsDestBearingRef).assertEqual('M');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_009
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_009
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_010
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_010
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_011
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_011
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = '1';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_012
     * @tc.name       SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_012
     * @tc.desc       ImageGPSDestBearingRef cover abnormal gpsDestBearingRef
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GPS_DEST_BEARING_REF_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDestBearingRef = '好';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.gpsDestBearingRef);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
  });
}