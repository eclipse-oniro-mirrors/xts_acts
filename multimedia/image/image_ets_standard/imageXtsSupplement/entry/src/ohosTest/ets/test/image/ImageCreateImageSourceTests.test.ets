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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import { fileIo as fs } from '@kit.CoreFileKit';
import { isEmpty } from '../common';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = 'Image.ImageCreateImageSourceSuppTest';
let pixelMap: image.PixelMap;
let imageSource: image.ImageSource;
let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
let testContext: common.UIAbilityContext;
let path: string;
let file: fs.File;
let auxPictureObj: image.AuxiliaryPicture;


export default function ImageCreateImageSourceSuppTest() {
  describe('ImageCreateImageSourceSuppTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      testContext = AppStorage.get('testContext') as common.UIAbilityContext;
      path = `file://${testContext.filesDir}/test.jpg`;
      file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00001
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00001
     * @tc.desc   image createImageSource url is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00001';
      try {
        imageSource = image.createImageSource("");
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00002
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00002
     * @tc.desc   image createImageSource url is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00002';
      try {
        imageSource = image.createImageSource(null);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00003
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00003
     * @tc.desc   image createImageSource url is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00003';
      try {
        imageSource = image.createImageSource(undefined);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00004
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00004
     * @tc.desc   image createImageSource the first parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00004';
      try {
        imageSource = image.createImageSource("", sourceOptions);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00005
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00005
     * @tc.desc   image createImageSource the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00005';
      try {
        imageSource = image.createImageSource(null, sourceOptions);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00006
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00006
     * @tc.desc   image createImageSource the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00006';
      try {
        imageSource = image.createImageSource(undefined, sourceOptions);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00007
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00007
     * @tc.desc   image createImageSource the second parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00007';
      try {
        imageSource = image.createImageSource(path, "" as ESObject as image.SourceOptions);
        expect(isEmpty(imageSource)).assertFalse();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00008
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00008
     * @tc.desc   image createImageSource the second parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00008';
      try {
        imageSource = image.createImageSource(path, null as ESObject as image.SourceOptions);
        expect(isEmpty(imageSource)).assertFalse();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00009
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00009
     * @tc.desc   image createImageSource the second parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_URL_00009';
      try {
        imageSource = image.createImageSource(path, undefined as ESObject as image.SourceOptions);
        expect(isEmpty(imageSource)).assertFalse();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00001
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00001
     * @tc.desc   image createImageSource the first parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00001';
      try {
        imageSource = image.createImageSource("" as ESObject as number, sourceOptions);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00002
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00002
     * @tc.desc   image createImageSource the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00002';
      try {
        imageSource = image.createImageSource(null as ESObject as number, sourceOptions);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00003
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00003
     * @tc.desc   image createImageSource the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00003';
      try {
        imageSource = image.createImageSource(undefined as ESObject as number, sourceOptions);
        expect(isEmpty(imageSource)).assertTrue();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00004
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00004
     * @tc.desc   image createImageSource the second parameter is ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00004';
      try {
        imageSource = image.createImageSource(file.fd, "" as ESObject as image.SourceOptions);
        expect(isEmpty(imageSource)).assertFalse();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00005
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00005
     * @tc.desc   image createImageSource the second parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00005';
      try {
        imageSource = image.createImageSource(file.fd, null as ESObject as image.SourceOptions);
        expect(isEmpty(imageSource)).assertFalse();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00006
     * @tc.number SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00006
     * @tc.desc   image createImageSource the second parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_IMAGE_SOURCE_FD_00006';
      try {
        imageSource = image.createImageSource(file.fd, undefined as ESObject as image.SourceOptions);
        expect(isEmpty(imageSource)).assertFalse();
        console.info(TAG, testName, ' createImageSource success');
      } catch (error) {
        console.error(TAG, testName, ' createImageSource error', error.message, error.code);
        expect().assertFail();
      } finally {
        await imageSource?.release();
        done();
      }
    });

    /**
     * @tc.name   GET_IMAGE_INFO_SYNC_00001
     * @tc.number GET_IMAGE_INFO_SYNC_00001
     * @tc.desc   getImageInfoSync the AlphaType emu the size the density the stride the isHdr the mimeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GET_IMAGE_INFO_SYNC_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_INFO_SYNC_00001';
      try {
        let imageSource = image.createImageSource(path);
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: { width: 1, height: 2 },
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
          desiredRegion: { size: { width: 1, height: 2 }, x: 0, y: 0 },
          cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST,
          index: 0
        };
        pixelMap = imageSource.createPixelMapSync(decodingOptions);
        let res = pixelMap.getImageInfoSync();
        expect(isEmpty(res.size)).assertFalse();
        expect(Number(res.size.width)).assertEqual(1);
        expect(Number(res.size.height)).assertEqual(2);
        expect(res.density == 0).assertTrue();
        expect(res.stride == 4).assertTrue();
        expect(res.alphaType == image.AlphaType.PREMUL).assertTrue();
        expect(res.mimeType == 'image/jpeg').assertTrue();
        expect(res.isHdr).assertFalse();
        console.info(TAG, testName, ' getImageInfoSync success', JSON.stringify(res));
      } catch (error) {
        console.error(TAG, testName, ' getImageInfoSync error', error);
        expect().assertFail();
      } finally {
        await pixelMap?.release();
        done();
      }
    });

    /**
     * @tc.name   GET_IMAGE_INFO_SYNC_00002
     * @tc.number GET_IMAGE_INFO_SYNC_00002
     * @tc.desc   getImageInfoSync the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GET_IMAGE_INFO_SYNC_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_IMAGE_INFO_SYNC_00002';
      const formats = [
        image.PixelMapFormat.ARGB_8888,
        image.PixelMapFormat.RGB_565,
        image.PixelMapFormat.RGBA_8888,
        image.PixelMapFormat.BGRA_8888,
        image.PixelMapFormat.RGB_888,
        image.PixelMapFormat.RGBA_F16,
        image.PixelMapFormat.NV21,
        image.PixelMapFormat.NV12,
        image.PixelMapFormat.YCBCR_P010,
        image.PixelMapFormat.YCRCB_P010];
      for (const format of formats) {
        try {
          let opts: image.InitializationOptions =
            {
              editable: true,
              pixelFormat: format,
              size: { height: 4, width: 6 },
            }
          pixelMap = await image.createPixelMapSync(opts);
          expect(isEmpty(pixelMap)).assertFalse();
          let res = await pixelMap.getImageInfo();
          expect(res.pixelFormat == format).assertTrue();
          console.info(TAG, testName, format, ' getImageInfoSync success', JSON.stringify(res));
        } catch (error) {
          console.error(TAG, testName, format, ' getImageInfoSync error', error);
          expect().assertFail();
        } finally {
          await pixelMap?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   GET_AUXILIARY_PICTURE_INFO_00001
     * @tc.number GET_AUXILIARY_PICTURE_INFO_00001
     * @tc.desc   getAuxiliaryPictureInfo the auxiliaryPictureType emu the size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GET_AUXILIARY_PICTURE_INFO_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'GET_AUXILIARY_PICTURE_INFO_00001';
      const formats = [
        image.AuxiliaryPictureType.GAINMAP,
        image.AuxiliaryPictureType.DEPTH_MAP,
        image.AuxiliaryPictureType.UNREFOCUS_MAP,
        image.AuxiliaryPictureType.LINEAR_MAP,
        image.AuxiliaryPictureType.FRAGMENT_MAP];
      for (const format of formats) {
        try {
          let array = new ArrayBuffer(20000000);
          const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let readLength = await fs.read(fd.fd, array);
          console.info(TAG, testName, ` readLength: ${readLength}`);
          await fs.close(fd);
          let auxSize: Size = {
            height: 180,
            width: 240
          };
          let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
          auxPictureObj = await image.createAuxiliaryPicture(array, auxSize, auxType);
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
            let res = auxPictureObj.getAuxiliaryPictureInfo();
            expect(res.auxiliaryPictureType == format).assertTrue();
            expect(res.size.height).assertEqual(100);
            expect(res.size.width).assertEqual(200);
          } else {
            console.error(TAG, testName, 'AuxPictureObj is null.');
            expect().assertFail();
          }
        } catch (error) {
          console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail();
        } finally {
          auxPictureObj?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SET_AUXILIARY_PICTURE_INFO_00001
     * @tc.number SET_AUXILIARY_PICTURE_INFO_00001
     * @tc.desc   setAuxiliaryPictureInfo the auxiliaryPictureType emu the
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SET_AUXILIARY_PICTURE_INFO_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_AUXILIARY_PICTURE_INFO_00001';
      const formats = [
        image.AuxiliaryPictureType.DEPTH_MAP,
        image.AuxiliaryPictureType.UNREFOCUS_MAP,
        image.AuxiliaryPictureType.LINEAR_MAP,
        image.AuxiliaryPictureType.FRAGMENT_MAP];
      for (const format of formats) {
        try {
          let array = new ArrayBuffer(20000000);
          const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let readLength = await fs.read(fd.fd, array);
          console.info(TAG, testName, ` readLength: ${readLength}`);
          await fs.close(fd);
          let auxSize: Size = {
            height: 180,
            width: 240
          };
          let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
          auxPictureObj = await image.createAuxiliaryPicture(array, auxSize, auxType);
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
            let res = auxPictureObj.getAuxiliaryPictureInfo();
            expect(res.auxiliaryPictureType == format).assertTrue();
          } else {
            console.error(TAG, testName, 'AuxPictureObj is null.');
            expect().assertFail();
          }
        } catch (error) {
          console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail();
        } finally {
          auxPictureObj?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SET_AUXILIARY_PICTURE_INFO_00002
     * @tc.number SET_AUXILIARY_PICTURE_INFO_00002
     * @tc.desc   setAuxiliaryPictureInfo the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SET_AUXILIARY_PICTURE_INFO_00002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_AUXILIARY_PICTURE_INFO_00002';
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
        try {
          let array = new ArrayBuffer(20000000);
          const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          let readLength = await fs.read(fd.fd, array);
          console.info(TAG, testName, ` readLength: ${readLength}`);
          await fs.close(fd);
          let auxSize: Size = {
            height: 180,
            width: 240
          };
          let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
          auxPictureObj = await image.createAuxiliaryPicture(array, auxSize, auxType);
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
            expect(isEmpty(auxPictureObj)).assertFalse();
            let res = auxPictureObj.getAuxiliaryPictureInfo();
            expect(res.pixelFormat == format).assertTrue();
            console.info(TAG, testName,format, 'AuxPictureObj is success.');
          } else {
            console.error(TAG, testName,format, 'AuxPictureObj is null.');
            expect().assertFail();
          }
        } catch (error) {
          console.error(TAG, testName,format, `failed; error: ${error},${error.code}`, testName);
          expect().assertFail();
        } finally {
          auxPictureObj?.release();
        }
      }
      done();
    });

    /**
     * @tc.name   SET_AUXILIARY_PICTURE_INFO_00003
     * @tc.number SET_AUXILIARY_PICTURE_INFO_00003
     * @tc.desc   setAuxiliaryPictureInfo the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SET_AUXILIARY_PICTURE_INFO_00003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_AUXILIARY_PICTURE_INFO_00003';
      try {
        let array = new ArrayBuffer(20000000);
        const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let readLength = await fs.read(fd.fd, array);
        console.info(TAG, testName, ` readLength: ${readLength}`);
        await fs.close(fd);
        let auxSize: Size = {
          height: 180,
          width: 240
        };
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        auxPictureObj = await image.createAuxiliaryPicture(array, auxSize, auxType);
        console.info(TAG, `createAuxiliaryPicture:`);
        if (auxPictureObj != null) {
          auxPictureObj.setAuxiliaryPictureInfo(null);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'AuxPictureObj is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        auxPictureObj?.release();
        done();
      }
    });

    /**
     * @tc.name   SET_AUXILIARY_PICTURE_INFO_00004
     * @tc.number SET_AUXILIARY_PICTURE_INFO_00004
     * @tc.desc   setAuxiliaryPictureInfo the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SET_AUXILIARY_PICTURE_INFO_00004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_AUXILIARY_PICTURE_INFO_00004';
      try {
        let array = new ArrayBuffer(20000000);
        const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let readLength = await fs.read(fd.fd, array);
        console.info(TAG, testName, ` readLength: ${readLength}`);
        await fs.close(fd);
        let auxSize: Size = {
          height: 180,
          width: 240
        };
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        auxPictureObj = await image.createAuxiliaryPicture(array, auxSize, auxType);
        console.info(TAG, `createAuxiliaryPicture:`);
        if (auxPictureObj != null) {
          auxPictureObj.setAuxiliaryPictureInfo(undefined);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'AuxPictureObj is null.');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect(Number(error.code)).assertEqual(401);
      } finally {
        auxPictureObj?.release();
        done();
      }
    });

    /**
     * @tc.name   SET_AUXILIARY_PICTURE_INFO_00005
     * @tc.number SET_AUXILIARY_PICTURE_INFO_00005
     * @tc.desc   setAuxiliaryPictureInfo the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SET_AUXILIARY_PICTURE_INFO_00005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_AUXILIARY_PICTURE_INFO_00005';
      try {
        let array = new ArrayBuffer(20000000);
        const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let readLength = await fs.read(fd.fd, array);
        console.info(TAG, testName, ` readLength: ${readLength}`);
        await fs.close(fd);
        let auxSize: Size = {
          height: 180,
          width: 240
        };
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        auxPictureObj = await image.createAuxiliaryPicture(array, auxSize, auxType);
        console.info(TAG, `createAuxiliaryPicture:`);
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
        auxPictureObj?.release();
        done();
      }
    });

    /**
     * @tc.name   SET_AUXILIARY_PICTURE_INFO_00006
     * @tc.number SET_AUXILIARY_PICTURE_INFO_00006
     * @tc.desc   setAuxiliaryPictureInfo the pixelFormat emu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SET_AUXILIARY_PICTURE_INFO_00006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SET_AUXILIARY_PICTURE_INFO_00006';
      try {
        let array = new ArrayBuffer(20000000);
        const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let readLength = await fs.read(fd.fd, array);
        console.info(TAG, testName, ` readLength: ${readLength}`);
        await fs.close(fd);
        let auxSize: Size = {
          height: 180,
          width: 240
        };
        let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
        auxPictureObj = await image.createAuxiliaryPicture(array, auxSize, auxType);
        console.info(TAG, `createAuxiliaryPicture:`);
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
        auxPictureObj?.release();
        done();
      }
    });
  })
}
