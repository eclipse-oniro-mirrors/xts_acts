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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import fs from '@ohos.file.fs';
import { common } from '@kit.AbilityKit';
import fileio from '@ohos.fileio'
import { BusinessError } from '@ohos.base';

const TAG = LOG_TAG + 'imageReadImageMetadataTestSyncSupp';

let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, ' image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, " image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, " image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, " image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, " createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function imageReadImageMetadataTestSupp() {
  describe('imageReadImageMetadataTestSupp', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_022
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_022
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:isXmageSupported=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_022';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.isXmageSupported=true;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
            expect(metaData.makerNoteHuaweiMetadata.isXmageSupported).assertTrue();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_023
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_023
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:isXmageSupported=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_023';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.isXmageSupported=false;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
            expect(metaData.makerNoteHuaweiMetadata.isXmageSupported).assertFalse();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_024
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_024
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:xmageWatermarkMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_024';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.xmageWatermarkMode = 8;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.xmageWatermarkMode);
            expect(Number(metaData.makerNoteHuaweiMetadata.xmageWatermarkMode)).assertEqual(8);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_025
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_025
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:xmageLeft
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_025';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.xmageLeft = 8;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.xmageLeft);
            expect(Number(metaData.makerNoteHuaweiMetadata.xmageLeft)).assertEqual(8);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_026
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_026
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:xmageTop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_026';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.xmageTop = 8;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.xmageTop);
            expect(Number(metaData.makerNoteHuaweiMetadata.xmageTop)).assertEqual(8);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_027
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_027
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:xmageRight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_027';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.xmageRight = 8;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.xmageRight);
            expect(Number(metaData.makerNoteHuaweiMetadata.xmageRight)).assertEqual(8);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_028
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_028
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:xmageBottom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_028';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.xmageBottom = 8;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.xmageBottom);
            expect(Number(metaData.makerNoteHuaweiMetadata.xmageBottom)).assertEqual(8);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_029
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_029
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:isCloudEnhanced:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_029';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.isCloudEnhanced =true;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isCloudEnhanced);
            expect(Number(metaData.makerNoteHuaweiMetadata.isCloudEnhanced)).assertEqual(1);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_030
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_030
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:isCloudEnhanced:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_030';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.isCloudEnhanced = false;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isCloudEnhanced);
            expect(Number(metaData.makerNoteHuaweiMetadata.isCloudEnhanced)).assertEqual(0);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_031
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_031
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:cloudLabel:'2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_031';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.cloudLabel = '2';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.cloudLabel);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_032
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_032
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:isWindSnapshot:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_032';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.isWindSnapshot = true;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isWindSnapshot);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_033
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_033
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:isWindSnapshot:false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_033';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.isWindSnapshot = false;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isWindSnapshot);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_034
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_034
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_034';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneVersion = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneVersion);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_035
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_035
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneFoodConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_035';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneFoodConfidence =1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneFoodConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_036
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_036
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneBeachConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_036';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneBeachConfidence =1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneBeachConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_037
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_037
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneBlueSkyConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_037';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneBlueSkyConfidence =1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneBlueSkyConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_038
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_038
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneStageConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_038';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneStageConfidence = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneStageConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_039
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_039
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneGreenPlantConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_039';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneGreenPlantConfidence = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneGreenPlantConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_040
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_040
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneSnowConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_040';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneSnowConfidence = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneSnowConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_041
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_041
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneSunsetConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_041', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_041';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneSunsetConfidence = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneSunsetConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_042
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_042
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneFlowersConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_042';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneFlowersConfidence = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneFlowersConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_043
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_043
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneNightConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_043';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneNightConfidence = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneNightConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_044
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_044
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:sceneTextConfidence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_044';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.sceneTextConfidence = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.sceneTextConfidence);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_045
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_045
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:faceCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_045', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_045';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.faceCount = 1;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.faceCount);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_046
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_046
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:faceConfidences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_046', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_046';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.faceConfidences = [1];
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.faceConfidences);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_047
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_047
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:faceSmileScores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_047', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_047';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.faceSmileScores = [1];
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.faceSmileScores);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_048
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_048
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:captureMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_048';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.burstNumber = 0;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.burstNumber);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_049
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_049
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:isFrontCamera
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_049', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_049';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.isFrontCamera = true;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isFrontCamera);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_050
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_050
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:rollAngle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_050';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.rollAngle = 0;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.rollAngle);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_051
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_051
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:pitchAngle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_051', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_051';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let makerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
        makerNoteHuaweiMetadata.pitchAngle = 0;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: makerNoteHuaweiMetadata
        };
        await imageSourceApi.writeImageMetadata(imageMetadata);
        console.info(TAG, testName, " writeImageMetadata success ");
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.pitchAngle);
            expect().assertFail();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_052
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_052
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:physicalAperture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_052';
      const imageSourceApi = await getImageSource('test_exif_readWrite_jpg_v2.jpg');
      try {
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.physicalAperture);
            expect(Number(metaData.makerNoteHuaweiMetadata.physicalAperture)).assertEqual(6);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_053
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_053
     * @tc.desc   readImageMetadata makerNoteHuaweiMetadata:focusMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_053', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_053';
      const imageSourceApi = await getImageSource('test_exif_readWrite_jpg_v2.jpg');
      try {
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.focusMode);
            expect(Number(metaData.makerNoteHuaweiMetadata.focusMode)).assertEqual(7);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_054
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_054
     * @tc.desc   readImageMetadata heifsMetadata:['heifsDelayTime']"]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_054', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_054';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.readImageMetadata().then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG, testName, " SUCCEED " ,metaData.heifsMetadata?.heifsDelayTime);
            expect(metaData.heifsMetadata?.heifsDelayTime).assertUndefined();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_055
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_055
     * @tc.desc   readImageMetadata cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_055', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_055';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.readImageMetadata(null,0).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.error(TAG, testName, "Expected to fail but succeeded with metaData:", metaData);
            expect(metaData != null).assertTrue();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed: ${JSON.stringify(error)}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_056
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_056
     * @tc.desc   readImageMetadata cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_056', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_056';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.readImageMetadata(undefined,0).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.error(TAG, testName, "Expected to fail but succeeded with metaData:", metaData);
            expect(metaData != null).assertTrue();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed: ${JSON.stringify(error)}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_057
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_057
     * @tc.desc   readImageMetadata cover null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_057', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_057';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceApi.readImageMetadata(propertyKeys,null).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.error(TAG, testName, "Expected to fail but succeeded with metaData:", metaData);
            expect(metaData != null).assertTrue();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed: ${JSON.stringify(error)}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_058
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_058
     * @tc.desc   readImageMetadata cover undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_058', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_058';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceApi.readImageMetadata(propertyKeys,undefined).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.error(TAG, testName, "Expected to fail but succeeded with metaData:", metaData);
            expect(metaData != null).assertTrue();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed: ${JSON.stringify(error)}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_059
     * @tc.number SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_059
     * @tc.desc   readImageMetadata cover []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_059', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_READ_IMAGE_METADATA_Supp_059';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        await imageSourceApi.readImageMetadata([],0).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.error(TAG, testName, "Expected to fail but succeeded with metaData:", metaData);
            expect(metaData != null).assertTrue();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `ReadImageMetadata failed: ${JSON.stringify(error)}`);
          expect().assertFail();
        })
      }catch (err) {
        console.error(TAG,testName,`Failed to create object: ${JSON.stringify(err)}`);
        expect().assertFail();
      }
      await imageSourceApi.release();
      done();
    })


  })
}