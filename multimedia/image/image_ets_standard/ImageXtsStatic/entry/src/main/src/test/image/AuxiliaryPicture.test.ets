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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, Hypium, it, Level } from '../../../../hypium';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = 'xtsStatic_AuxiliaryPictureGetMetadataStaticTest';

let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function getAuxiliaryTypeTest(done: () => void, testName: string,AuxiliaryPictureType: image.AuxiliaryPictureType,
  callback: (res:image.AuxiliaryPictureType) => void) {
  try {

    let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
    const resourceMgr = context.resourceManager;
    console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
    const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
    console.info(TAG, testName,`rawFile success:`,rawFile);
    let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
    let auxSize: image.Size = { height: 180, width: 240 };
    let auxType: image.AuxiliaryPictureType = AuxiliaryPictureType;
    let auxPictureObj: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
    console.info(TAG,'Success get auxPictureObj ' +  JSON.stringify(auxPictureObj!));
    if (auxPictureObj != undefined) {
      let type: image.AuxiliaryPictureType |undefined = auxPictureObj!.getType();
      console.info(TAG,'Success get auxiliary picture type ' +  JSON.stringify(type!));
      callback(type!);
    } else {
      console.error(TAG,'Failed get auxiliary picture type ');
    }
    auxPictureObj!.release();
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
    expect().assertFail();
    done();
  }
}

export default function ImageAuxiliaryPictureGetMetadataStaticTest(): void {
  describe('ImageAuxiliaryPictureGetMetadataStaticTest', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string = '';
    let fdNumber: int;
    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath!);
      fdNumber = file.fd as int;
      return fdNumber;
    };
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
     * @tc.name   SUB_MEDIA_IMAGE_GET_AUXILIARY_PICTURE_INFO_getAuxiliaryPictureInfo_static_0100
     * @tc.number SUB_MEDIA_IMAGE_GET_AUXILIARY_PICTURE_INFO_getAuxiliaryPictureInfo_static_0100
     * @tc.desc   getAuxiliaryPictureInfo the auxiliaryPictureType emu the size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_GET_AUXILIARY_PICTURE_INFO_getAuxiliaryPictureInfo_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_AUXILIARY_PICTURE_INFO_getAuxiliaryPictureInfo_static_0100';
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const resourceMgr = context.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
      console.info(TAG, testName,`rawFile success:`,rawFile);
      let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      let auxSize: image.Size = { height: 180, width: 240 };

      const formats = [
        image.AuxiliaryPictureType.GAINMAP,
        image.AuxiliaryPictureType.DEPTH_MAP,
        image.AuxiliaryPictureType.UNREFOCUS_MAP,
        image.AuxiliaryPictureType.LINEAR_MAP,
        image.AuxiliaryPictureType.FRAGMENT_MAP];
      console.info(TAG, testName,`formats success:`,formats);
      for (const format of formats) {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        console.info(TAG, testName,`image.AuxiliaryPictureType success:`,auxType);
        let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG, testName,`auxPictureObj success:`,auxPictureObj);
        try {
          if (auxPictureObj != null) {
            let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
            let info: image.AuxiliaryPictureInfo = {
              auxiliaryPictureType: format,
              size: { height: 100, width: 200 },
              pixelFormat: image.PixelMapFormat.RGBA_8888,
              rowStride: 0,
              colorSpace: colorSpaceManager.create(colorSpaceName),
            };
            auxPictureObj.setAuxiliaryPictureInfo(info);
            let res:image.AuxiliaryPictureInfo | undefined = auxPictureObj.getAuxiliaryPictureInfo();
            console.info(TAG, testName,`auxPictureObj getAuxiliaryPictureInfo success:`,JSON.stringify(res));
            expect(res!.auxiliaryPictureType == format).assertTrue();
            expect(res!.size.height).assertEqual(100);
            expect(res!.size.width).assertEqual(200);
          } else {
            console.error(TAG, testName, 'AuxPictureObj is null.');
            expect().assertFail();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail();
        } finally {
          auxPictureObj.release();
        }
      }
      done();
    });


    /**
     * @tc.name   SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0100
     * @tc.number SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0100
     * @tc.desc   setAuxiliaryPictureInfo the auxiliaryPictureType emu the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0100';
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const resourceMgr = context.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
      console.info(TAG, testName,`rawFile success:`,rawFile);
      let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      let auxSize: image.Size = { height: 180, width: 240 };
      const formats = [
        image.AuxiliaryPictureType.DEPTH_MAP,
        image.AuxiliaryPictureType.UNREFOCUS_MAP,
        image.AuxiliaryPictureType.LINEAR_MAP,
        image.AuxiliaryPictureType.FRAGMENT_MAP];
      for (const format of formats) {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        console.info(TAG, testName,`auxPictureObj success:`,auxPictureObj);
        try {
          console.info(TAG, `createAuxiliaryPicture:`);
          if (auxPictureObj != null) {
            let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
            let info: image.AuxiliaryPictureInfo = {
              auxiliaryPictureType: format,
              size: { height: 100, width: 200 },
              pixelFormat: image.PixelMapFormat.RGBA_8888,
              rowStride: 0,
              colorSpace: colorSpaceManager.create(colorSpaceName),
            };
            auxPictureObj.setAuxiliaryPictureInfo(info);
            let res:image.AuxiliaryPictureInfo |undefined = auxPictureObj.getAuxiliaryPictureInfo();
            expect(res!.auxiliaryPictureType == format).assertTrue();
          } else {
            console.error(TAG, testName, 'AuxPictureObj is null.');
            expect().assertFail();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail();
        } finally {
          auxPictureObj.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0200
     * @tc.number SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0200
     * @tc.desc   setAuxiliaryPictureInfo the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0200';
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const resourceMgr = context.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
      console.info(TAG, testName,`rawFile success:`,rawFile);
      let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      let auxSize: image.Size = { height: 180, width: 240 };
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.ALPHA_8,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.RGBA_1010102,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010,];
      for (const format of formats) {
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
        try {
          console.info(TAG, `createAuxiliaryPicture:`);
          if (auxPictureObj != null) {
            let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
            let info: image.AuxiliaryPictureInfo = {
              auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
              size: { height: 100, width: 200 },
              pixelFormat: format,
              rowStride: 0,
              colorSpace: colorSpaceManager.create(colorSpaceName),
            };
            auxPictureObj.setAuxiliaryPictureInfo(info);
            expect(auxPictureObj!=undefined).assertTrue();
            let res:image.AuxiliaryPictureInfo | undefined = auxPictureObj.getAuxiliaryPictureInfo();
            expect(res!.pixelFormat == format).assertTrue();
            console.info(TAG, testName,format, 'AuxPictureObj is success.');
          } else {
            console.error(TAG, testName,format, 'AuxPictureObj is null.');
            expect().assertFail();
          }
        } catch (error) {
          console.error(TAG, testName,format, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail();
        } finally {
          auxPictureObj.release();
        }
      }
      done();
    });


    /**
     * @tc.name   SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0300
     * @tc.number SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0300
     * @tc.desc   setAuxiliaryPictureInfo the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0300';
      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const resourceMgr = context.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
      console.info(TAG, testName,`rawFile success:`,rawFile);
      let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      let auxSize: image.Size = { height: 180, width: 240 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      console.info(TAG, `createAuxiliaryPicture:`);
      try {
        if (auxPictureObj != null) {
          let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
          let info: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
            size: { height: 100, width: 200 },
            pixelFormat: image.PixelMapFormat.UNKNOWN,
            rowStride: 0,
            colorSpace: colorSpaceManager.create(colorSpaceName),
          };
          auxPictureObj.setAuxiliaryPictureInfo(info);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'AuxPictureObj is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect(Number(error.code)).assertEqual(401)
      } finally {
        auxPictureObj.release();
        done();
      }
    });

     /**
       * @tc.name   SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0400
       * @tc.number SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0400
       * @tc.desc   setAuxiliaryPictureInfo the pixelFormat emu
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
      */
    it('SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_SET_AUXILIARY_PICTURE_INFO_setAuxiliaryPictureInfo_static_0400';

      let context: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const resourceMgr = context.resourceManager;
      console.info(TAG, testName,`resourceMgr success:`,resourceMgr);
      const rawFile = await resourceMgr.getRawFileContent("AllAuxiliaryPictures_exclude_fragment.jpg");
      console.info(TAG, testName,`rawFile success:`,rawFile);
      let auxBuffer: ArrayBuffer = rawFile.buffer as ArrayBuffer;
      let auxSize: image.Size = { height: 180, width: 240 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxPictureObj = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      console.info(TAG, `createAuxiliaryPicture:`);
      try {
        if (auxPictureObj != null) {
          let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
          let info: image.AuxiliaryPictureInfo = {
            auxiliaryPictureType: image.AuxiliaryPictureType.GAINMAP,
            size: { height: 100, width: 200 },
            pixelFormat: image.PixelMapFormat.ASTC_4x4,
            rowStride: 0,
            colorSpace: colorSpaceManager.create(colorSpaceName),
          };
          auxPictureObj.setAuxiliaryPictureInfo(info);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'AuxPictureObj is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error.code}`);
        expect(Number(error.code)).assertEqual(401)
      } finally {
        auxPictureObj.release();
        done();
      }
    });


    /**
     * @tc.name   SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0100
     * @tc.number SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0100
     * @tc.desc   Auxiliary getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0100';
      let AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      await getAuxiliaryTypeTest(done, testName, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(image.AuxiliaryPictureType.GAINMAP);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0200
     * @tc.number SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0200
     * @tc.desc   Auxiliary getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0200';
      let AuxiliaryPictureType = image.AuxiliaryPictureType.DEPTH_MAP;
      await getAuxiliaryTypeTest(done, testName, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(image.AuxiliaryPictureType.DEPTH_MAP);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0300
     * @tc.number SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0300
     * @tc.desc   Auxiliary getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0300';
      let AuxiliaryPictureType = image.AuxiliaryPictureType.UNREFOCUS_MAP;
      await getAuxiliaryTypeTest(done, testName, AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(image.AuxiliaryPictureType.UNREFOCUS_MAP);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0400
     * @tc.number SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0400
     * @tc.desc   Auxiliary getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0400';
      let AuxiliaryPictureType = image.AuxiliaryPictureType.LINEAR_MAP;
      await getAuxiliaryTypeTest(done, testName,  AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(image.AuxiliaryPictureType.LINEAR_MAP);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0500
     * @tc.number SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0500
     * @tc.desc   Auxiliary getType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_AUXILIARY_PICTURE_GET_TYPE_static_0500';
      let AuxiliaryPictureType = image.AuxiliaryPictureType.FRAGMENT_MAP;
      await getAuxiliaryTypeTest(done, testName,  AuxiliaryPictureType, (res:image.AuxiliaryPictureType) => {
        expect(res).assertEqual(image.AuxiliaryPictureType.FRAGMENT_MAP);
      });
    })



    /**
     * @tc.number     SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100
     * @tc.name       SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100
     * @tc.desc       Metadata -ExifMetadata -getAllProperties -返回值不为空
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0100';
      const testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test_exif_v2.jpg';
      let path =`${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSourceApi: image.ImageSource|undefined = image.createImageSource(path);
      console.info(TAG, testName,`imageSourceApi success:`,imageSourceApi);
      try {
        let metaData:image.ImageMetadata = await imageSourceApi!.readImageMetadata(["ImageWidth", "ImageLength"]);
        console.info(TAG, testName, `readImageMetadata success:`,metaData);
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          let res: Record<string, string | null> = await metaData!.exifMetadata!.getAllProperties();
          expect(res != undefined).assertTrue();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'ExifMetadata getProperties error', error.message, error.code);
        expect().assertFail();
        done();
      }
      finally {
        await imageSourceApi?.release();
        done();
      }
    });

    /**
     * @tc.number     SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0200
     * @tc.name       SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0200
     * @tc.desc       Metadata -ExifMetadata -getAllProperties -返回值为undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0200', Level.LEVEL1, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_static_0200';
      let testExifMetadata: image.ExifMetadata = image.ExifMetadata.createInstance();
      console.info(TAG,testName, 'createInstance success.', testExifMetadata);
      try {
        let res = await testExifMetadata.getAllProperties();
        console.info(TAG,testName, 'getAllProperties success.', res);
        expect(res).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   SUB_MEDIA_IMAGE_auxiliaryPicture_readPixelsToBuffer_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_auxiliaryPicture_readPixelsToBuffer_promise_static_0100
     * @tc.desc   readPixelsToBuffer AuxiliaryPictureType =  image.AuxiliaryPictureType.FRAGMENT_MAP;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_auxiliaryPicture_readPixelsToBuffer_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_auxiliaryPicture_readPixelsToBuffer_promise_static_0100';
      const pathUri = 'AllAuxiliaryPictures.jpg';
      const AuxiliaryPictureType =  image.AuxiliaryPictureType.FRAGMENT_MAP;
      try {
        let path = `file://${testContext.filesDir}/${pathUri}`;
        let imageSource: image.ImageSource |undefined = image.createImageSource(path);
        let commodityPixelMap: image.Picture | undefined = await imageSource!.createPicture();
        let auxPictureObj: image.AuxiliaryPicture | null = await commodityPixelMap!.getAuxiliaryPicture(AuxiliaryPictureType);
        console.info(TAG,testName, 'getAuxiliaryPicture success.', auxPictureObj!);
        if (auxPictureObj != null) {
          let pixelsBuffer: ArrayBuffer|undefined = await auxPictureObj!.readPixelsToBuffer();
          // await auxPictureObj!.readPixelsToBuffer()
          console.info(TAG,testName, 'read pixels from buffer success.', pixelsBuffer!);
          expect(pixelsBuffer!=undefined).assertTrue();
          imageSource!.release();
          done();
        } else {
          console.error(TAG,testName, 'AuxPictureObj is null.');
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
      done();
    })



  })
}