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

const TAG = 'Image.ImageSourceMetadataSupp'
let fdNumber: number;

async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
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

export default function ImageSourceMetadataSupp() {
  describe('ImageSourceMetadataSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
      AppStorage.delete('key');
    });


    /**
     * @tc.number     image_Source_readImageMetadata_001
     * @tc.name       image_Source_readImageMetadata_001
     * @tc.desc       readImageMetadata cover input normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_001';
      const imageSourceObj = await getImageSource('test.jpg');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.imageWidth +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect(error.code).assertUndefined();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_002
     * @tc.name       image_Source_readImageMetadata_002
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_002';
      const imageSourceObj = await getImageSource('test_exif_v2.jpg');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.imageWidth +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_003
     * @tc.name       image_Source_readImageMetadata_003
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_003';
      const imageSourceObj = await getImageSource('test_exif_v3.webp');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.imageWidth +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect(error.code).assertUndefined();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_004
     * @tc.name       image_Source_readImageMetadata_004
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_004';
      const imageSourceObj = await getImageSource('test_exif_v3.webp');
      try {
        let propertyKeys = ["photoMode", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.photoMode +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect(error.code).assertUndefined();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_005
     * @tc.name       image_Source_readImageMetadata_005
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_005';
      const imageSourceObj = await getImageSource('moving_test_loop0.gif');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.imageWidth +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect(error.code).assertUndefined();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_006
     * @tc.name       image_Source_readImageMetadata_006
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_006';
      const imageSourceObj = await getImageSource('test_exif_v2.jpg');
      try {
        let propertyKeys = ["photoMode", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.photoMode +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect(error.code).assertUndefined();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_007
     * @tc.name       image_Source_readImageMetadata_007
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_007';
      const imageSourceObj = await getImageSource('test_exif_v2.png');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.imageWidth +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_008
     * @tc.name       image_Source_readImageMetadata_008
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_008';
      const imageSourceObj = await getImageSource('test61.gif');
      try {
        let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.photoMode +
              " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message},`,JSON.stringify(error));
          expect(error.code).assertUndefined();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_009
     * @tc.name       image_Source_readImageMetadata_009
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_009';
      const imageSourceObj = await getImageSource('test_exif_v2.jpg');
      let propertyKeys = ["ImageWidth", "FlashpixVersion"];
      try {
        console.log(TAG,testName,"input ImageWidth", "FlashpixVersion");
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined ) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.imageWidth+
            " HwMnoteIsXmageSupported: " + metaData.makerNoteHuaweiMetadata?.isXmageSupported);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })
    /**
     * @tc.number     image_Source_readImageMetadata_010
     * @tc.name       image_Source_readImageMetadata_010
     * @tc.desc       readImageMetadata cover input abnormal error code
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('image_Source_readImageMetadata_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'image_Source_readImageMetadata_010';
      const imageSourceObj = await getImageSource('test_exif_v2.jpg');
      try {
        let propertyKeys = ["ImageWidth", "FlashpixVersion"];
        await imageSourceObj.readImageMetadata(propertyKeys).then((metaData: image.ImageMetadata) => {
          if (metaData != undefined && metaData.exifMetadata != undefined &&
            metaData.makerNoteHuaweiMetadata != undefined) {
            console.info(TAG,testName,"ImageWidth: " + metaData.exifMetadata.photoMode +
              " HwMnoteIsXmageSupported: " + metaData.exifMetadata.flash);
          }
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`ReadImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect(error.code).assertUndefined();
        })
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      await imageSourceObj.release();
      done();
    })







    /**
     * @tc.number     image_Source_writeImageMetadata_001
     * @tc.name       image_Source_writeImageMetadata_001
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.make = '1024';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_v2.jpg');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     image_Source_writeImageMetadata_002
     * @tc.name       image_Source_writeImageMetadata_002
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripOffsets = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_v2.jpg');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     image_Source_writeImageMetadata_003
     * @tc.name       image_Source_writeImageMetadata_003
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.stripByteCounts = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_v2.jpg');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_004
     * @tc.name       image_Source_writeImageMetadata_004
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_v2.jpg');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_005
     * @tc.name       image_Source_writeImageMetadata_005
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_v4.heic');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     image_Source_writeImageMetadata_006
     * @tc.name       image_Source_writeImageMetadata_006
     * @tc.desc       ImageWriteImageMetadata cover error code 7700102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('moving_test_loop0.gif');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700102');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_007
     * @tc.name       image_Source_writeImageMetadata_007
     * @tc.desc       ImageWriteImageMetadata cover error code 7700102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.rowsPerStrip = 1000000000000000000000000000000000000000000000000000000000000000;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test61.gif');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700102');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_008
     * @tc.name       image_Source_writeImageMetadata_008
     * @tc.desc       ImageWriteImageMetadata cover error code 7700102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test61.gif');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700102');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_009
     * @tc.name       image_Source_writeImageMetadata_009
     * @tc.desc       ImageWriteImageMetadata cover error code 7700102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test8.bmp');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700102');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_010
     * @tc.name       image_Source_writeImageMetadata_010
     * @tc.desc       ImageWriteImageMetadata cover error code 7700102
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_v4.heic');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_011
     * @tc.name       image_Source_writeImageMetadata_011
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_empty2.dng');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_012
     * @tc.name       image_Source_writeImageMetadata_012
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test_exif_v2.png');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_013
     * @tc.name       image_Source_writeImageMetadata_013
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.bitsPerSample = [];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        const imageSourceObj = await getImageSource('test.jpeg');
        await imageSourceObj.writeImageMetadata(imageMetadata);
        console.info(TAG,testName,`writeImageMetadata success `);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     image_Source_writeImageMetadata_014
     * @tc.name       image_Source_writeImageMetadata_014
     * @tc.desc       ImageWriteImageMetadata cover error code 7700202
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('image_Source_writeImageMetadata_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'image_Source_writeImageMetadata_014';
      const imageSourceObj = await getImageSource('test_exif_v2.jpg');
      let propertyKeys = ["ImageWidth", "HwMnoteIsXmageSupported"];
      let metaData = await imageSourceObj.readImageMetadata(propertyKeys);
      try {
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          metaData.exifMetadata.imageLength = 3072;
        }
        await imageSourceObj.writeImageMetadata(metaData).then(() => {
          console.info(TAG,testName,`write image metadata success.`);
        }).catch((error: BusinessError) => {
          console.error(TAG,testName,`writeImageMetadata failed error.code is ${error.code}, error.message is ${error.message}`);
          expect().assertFail();
        });
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

  })
}
