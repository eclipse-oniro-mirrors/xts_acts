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
import {sleep } from '../common';

const TAG = 'Xts.MultimediaImage';
let fdNumber: number;
let gpsSpeed:string[] = ['66.66']
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}

let jpgImageSourceApi: image.ImageSource;
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function MultimediaImageTest() {
  describe('MultimediaImageTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
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
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_WRITE_IMAGE_METADATA_001
     * @tc.name       SUB_MEDIA_IMAGE_WRITE_IMAGE_METADATA_001
     * @tc.desc       writeImageMetadata cover 7700204
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_WRITE_IMAGE_METADATA_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_WRITE_IMAGE_METADATA_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsDop = 5;
      try {
        console.info(TAG,testName,`start:`);
        await jpgImageSourceApi.writeImageMetadata(null);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700204');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_001
     * @tc.name       SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_001
     * @tc.desc       readImageMetadata cover 7700204
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gpsSpeed = 66.66;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata(gpsSpeed, -1);
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.gpsSpeed);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700204');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_EXIF_METADATA_SET_BLOB_001
     * @tc.name       SUB_MEDIA_IMAGE_EXIF_METADATA_SET_BLOB_001
     * @tc.desc       setBlob cover 7600206
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_EXIF_METADATA_SET_BLOB_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_EXIF_METADATA_SET_BLOB_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let metaData = await imageSource.readImageMetadata(["ImageWidth", "ImageLength"]);
        metaData.exifMetadata?.setBlob(new ArrayBuffer(0))
        done();
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(error.code).assertEqual('7600206');
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_HUAWEI_METADATA_SET_BLOB_001
     * @tc.name       SUB_MEDIA_IMAGE_HUAWEI_METADATA_SET_BLOB_001
     * @tc.desc       setBlob cover 7600206
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_HUAWEI_METADATA_SET_BLOB_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_HUAWEI_METADATA_SET_BLOB_001';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        const pathUri = 'test_exif_v2.jpg'
        let array = new ArrayBuffer(30000);
        let path = `file://${testContext.filesDir}/${pathUri}`;``
        const fd = fs.openSync(path, fs.OpenMode.READ_ONLY);
        let readLength = await fs.read(fd.fd, array);
        await fs.close(fd);
        console.info(TAG, testName, `readLength: ${readLength}`);
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        };
        let imageSource: image.ImageSource = image.createImageSource(array, ops);
        let metaData = await imageSource.readImageMetadata(["ImageWidth", "ImageLength"]);
        metaData.makerNoteHuaweiMetadata?.setBlob(new ArrayBuffer(0))
        done();
      } catch (error) {
        console.info(TAG, testName, ' getHdrComposedPixelmapWithOptions error', error.message, error.code);
        expect(error.code).assertEqual('7600206');
        done();
      }
    })
  });
}