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
import { image } from '@kit.ImageKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { PixelMapFormat } from '@kit.MediaLibraryKit';
import { colorSpaceManager } from '@kit.ArkGraphics2D';
const TAG = 'Xts.ImageMetadataTest';

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

export default function ImageMetadataTest() {
  describe('ImageMetadataTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
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
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0100
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0100
     * @tc.desc      createAuxiliaryPictureUsingAllocator the third parameter is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0100';
      let mAuxiliaryPicture: image.AuxiliaryPicture | undefined;
      try {
        let auxiliaryPictureInfo: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          size: { width: 100, height: 100 },
          pixelFormat:PixelMapFormat.RGBA_8888,
          rowStride:0,
          colorSpace:colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
        };
        mAuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxiliaryPictureInfo, image.AllocatorType.AUTO, null);
        console.info(TAG, testName, 'createAuxiliaryPictureUsingAllocator success');
        let res = mAuxiliaryPicture.getAuxiliaryPictureInfo();
        expect(res.pixelFormat).assertEqual(auxiliaryPictureInfo.pixelFormat);
        await mAuxiliaryPicture!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0200
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0200
     * @tc.desc      createAuxiliaryPictureUsingAllocator the third parameter is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0200';
      let mAuxiliaryPicture: image.AuxiliaryPicture | undefined;
      try {
        let auxiliaryPictureInfo: image.AuxiliaryPictureInfo = {
          auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
          size: { width: 100, height: 100 },
          pixelFormat:PixelMapFormat.RGBA_8888,
          rowStride:0,
          colorSpace:colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
        };
        mAuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxiliaryPictureInfo, image.AllocatorType.AUTO, undefined);
        console.info(TAG, testName, 'createAuxiliaryPictureUsingAllocator success');
        let res = mAuxiliaryPicture.getAuxiliaryPictureInfo();
        expect(res.pixelFormat).assertEqual(auxiliaryPictureInfo.pixelFormat);
        await mAuxiliaryPicture!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0300
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0300
     * @tc.desc      createAuxiliaryPictureUsingAllocator the first parameter is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0300';
      let mAuxiliaryPicture: image.AuxiliaryPicture | undefined;
      try {
        mAuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600206);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0400
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0400
     * @tc.desc      createAuxiliaryPictureUsingAllocator the first parameter is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0400';
      let mAuxiliaryPicture: image.AuxiliaryPicture | undefined;
      try {
        mAuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600206);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0500
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0500
     * @tc.desc      createAuxiliaryPictureUsingAllocator pixelFormat
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_AUXILIARY_PICTURE_TEST_0500';
      let mAuxiliaryPicture: image.AuxiliaryPicture | undefined;
      let pixels: ArrayBuffer = new ArrayBuffer(0);
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.ASTC_4x4,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.ASTC_4x4,
      ];
      for (const format of formats) {
        try {
          let auxiliaryPictureInfo: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
            size: { width: 100, height: 100 },
            pixelFormat:format,
            rowStride:0,
            colorSpace:colorSpaceManager.create(colorSpaceManager.ColorSpace.SRGB)
          };
          mAuxiliaryPicture = image.createAuxiliaryPictureUsingAllocator(auxiliaryPictureInfo, image.AllocatorType.AUTO, pixels);
          expect().assertFail();
        } catch (error) {
          console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
          expect(Number(error.code)).assertEqual(7600206);
        }
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0100
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0100
     * @tc.desc      readImageMetadataByType cover exifMetadata
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0100';
      let imageSource = await getImageSource('test_exif_v2.jpg');
      try {
        let res = await imageSource.readImageMetadataByType();
        console.info(TAG, testName, 'readImageMetadataByType success', JSON.stringify(res));
        expect(res.exifMetadata != undefined).assertTrue();
        await imageSource!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0200
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0200
     * @tc.desc      readImageMetadataByType the first parameter is 空数组
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0200', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0200';
      let imageSource = await getImageSource('test_exif_v2.jpg');
      const metadataTypes = [image.MetadataType.EXIF_METADATA];
      try {
        let res = await imageSource.readImageMetadataByType([], 0);
        console.info(TAG, testName, 'readImageMetadataByType success', JSON.stringify(res));
        expect(res != undefined).assertTrue();
        await imageSource!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0300
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0300
     * @tc.desc      readImageMetadataByType the second parameter is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0300', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0300';
      let imageSource = await getImageSource('test_exif_v2.jpg');
      const metadataTypes = [image.MetadataType.EXIF_METADATA];
      try {
        let res = await imageSource.readImageMetadataByType(metadataTypes, undefined);
        expect(res != undefined).assertTrue();
        await imageSource!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0400
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0400
     * @tc.desc      readImageMetadataByType the second parameter is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0400', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0400';
      let imageSource = await getImageSource('test_exif_v2.jpg');
      const metadataTypes = [image.MetadataType.EXIF_METADATA];
      try {
        let res = await imageSource.readImageMetadataByType(metadataTypes, null);
        expect(res != undefined).assertTrue();
        await imageSource!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0500
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0500
     * @tc.desc      readImageMetadataByType the first parameter is null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0500', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0500';
      let imageSource = await getImageSource('test_exif_v2.jpg');
      try {
        let res = await imageSource.readImageMetadataByType(null, 0);
        console.info(TAG, testName, 'readImageMetadataByType success', JSON.stringify(res));
        expect(res != undefined).assertTrue();
        await imageSource!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0600
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0600
     * @tc.desc      readImageMetadataByType the first parameter is undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0600', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0600';
      let imageSource = await getImageSource('test_exif_v2.jpg');
      try {
        let res = await imageSource.readImageMetadataByType(undefined, 0);
        console.info(TAG, testName, 'readImageMetadataByType success', JSON.stringify(res));
        expect(res != undefined).assertTrue();
        await imageSource!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });/**
     * @tc.number    SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0700
     * @tc.name      SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0700
     * @tc.desc      readImageMetadataByType cover 7700204
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0700', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_READ_IMAGE_METADATA_BY_TYPE_0700';
      let imageSource = await getImageSource('test_exif_v2.jpg');
      try {
        const metadataTypes = [image.MetadataType.EXIF_METADATA];
        let res = await imageSource.readImageMetadataByType(metadataTypes, -100);
        console.info(TAG, testName, 'readImageMetadataByType success', JSON.stringify(res));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7700204);
        await imageSource!.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_0100
     * @tc.name      SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_0100
     * @tc.desc      createImageRawData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_0100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_MEDIA_CREATE_IMAGE_RAW_DATA_0100';
      let imageSource = await getImageSource('meta.dng');
      try {
        let res = await imageSource.createImageRawData();
        console.info(TAG, testName, 'createImageRawData success', JSON.stringify(res));
        expect(res.bitsPerPixel).assertEqual(16);
        await imageSource!.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}