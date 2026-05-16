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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';

const TAG = 'getHdrComposedPixelmapWithOptions';
const RGBA_1010102: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
const YCBCR_P010: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
const YCRCB_P010: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
const RGBA_8888: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
const NV21: image.PixelMapFormat = image.PixelMapFormat.NV21;
const RGB_565: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
let isSupportHEIFDecode: boolean;
let isSupportVPE: boolean;

export default function getHdrComposedPixelmapWithOption() {
  let filesDir: string|undefined;
  let cacheDir: string|undefined;
  let testContext: common.UIAbilityContext;

  describe('getHdrComposedPixelmapWithOption', () => {
    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "test.jpg").supportedFormats.includes("image/heic");
      console.info(TAG, 'beforeAll case.');
      isSupportVPE = await fs.access("/sys_prod/etc/VideoProcessingEngine/Image_SR_Model_576x576_20240402.omc").then((res: boolean) => {
        if (res) {
          console.info("file exists");
          return true;
        } else {
          console.info("file not exists");
          return false;
        }
      }).catch((err: BusinessError) => {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        return false;
      });
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

    const getBuffer = async (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const getImageSource = async (fileName: string, type?: string) => {
      let imageSourceApi: image.ImageSource;
      if (type === "buffer") {
        const buffer = await getBuffer(fileName);
        imageSourceApi = image.createImageSource(buffer);
      } else if (type === "uri") {
        const filePath = filesDir + '/' + fileName
        imageSourceApi = image.createImageSource(filePath);
      } else if (type === "rawfile") {
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName);
        imageSourceApi = image.createImageSource(rawFileDescriptor);
      } else if (type === "incremental") {
        const picBuffer = await getBuffer(fileName);
        imageSourceApi = image.CreateIncrementalSource(picBuffer);
      } else {
        const filePath = filesDir + "/" + fileName;
        const file = fs.openSync(filePath);
        imageSourceApi = image.createImageSource(file.fd);
      }
      return imageSourceApi;
    }

    const createPictureImageSourcePic = async (fileName: string, type: string, auxType?: image.AuxiliaryPictureType) => {
      let imageSourceApi: image.ImageSource = await getImageSource(fileName, type);
      let picture: image.Picture;
      if (auxType) {
        let decodingOptForPicture: image.DecodingOptionsForPicture;
        decodingOptForPicture = {desiredAuxiliaryPictures: [auxType]};
        picture = await imageSourceApi.createPicture(decodingOptForPicture);
      } else {
        picture = await imageSourceApi.createPicture();
      }
      imageSourceApi.release();
      return picture;
    }

    const testHdrComposedPixelmapWithOptions = async (
      fileName: string,
      type: string,
      desiredFormat: image.PixelMapFormat
    ) => {
      let imageInfo: image.ImageInfo|undefined;
      let picture: image.Picture;
      picture = await createPictureImageSourcePic(fileName, type);
      try{
        if (picture == undefined) {
          console.info("create Pictrue failed.");
          expect().assertFail();
        } else {
          let options: image.HdrComposeOptions = {
            desiredPixelFormat: desiredFormat
          };
          let hdrPixelMap: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(options);
          if(hdrPixelMap == undefined){
            console.info("get HdrComposed Pixelmap failed.");
            expect().assertFail();
          }else{
            imageInfo = await hdrPixelMap.getImageInfoSync();
            console.info("imageInfo: " + JSON.stringify(imageInfo));
            console.info('imageInfo.pixelFormat is: ' + imageInfo?.pixelFormat + 'desiredFormat is: ' + desiredFormat);
            expect(imageInfo?.pixelFormat == desiredFormat).assertTrue();
          }
        }
      } catch(error){
        console.info(JSON.stringify(error) + ", error code: " + error.code);
        expect().assertFail();
      }
    }

    const testHdrComposedPixelmapWithOptionsError = async (
      fileName: string,
      type: string,
      desiredFormat: image.PixelMapFormat,
      exceptErrorCode: number
    ) => {
      let picture: image.Picture;
      picture = await createPictureImageSourcePic(fileName, type);
      try{
        if (picture == undefined) {
          console.info("create Pictrue failed.");
          expect().assertFail();
        } else {
          try{
            let options: image.HdrComposeOptions = {
              desiredPixelFormat: desiredFormat
            };
            await picture.getHdrComposedPixelmapWithOptions(options);
            expect().assertFail();
          } catch(error){
            console.info(JSON.stringify(error) + ", error code: " + error);
            expect(error == exceptErrorCode).assertTrue();
          } 
        }
      } catch(error){
        console.info(JSON.stringify(error) + ", error code: " + error.code);
        expect().assertFail();
      }
    }

    const pixelmapTestHdrComposedPixelmapWithOptions = async (
      fileName: string,
      type: string,
      desiredFormat: image.PixelMapFormat,
      opt: string
    ) => {
      let imageInfo: image.ImageInfo|undefined;
      let picture: image.Picture;
      picture = await createPictureImageSourcePic(fileName, type);
      try{
        if (picture == undefined) {
          console.info("create Pictrue failed.");
          expect().assertFail();
        } else {
          let options: image.HdrComposeOptions = {
            desiredPixelFormat: desiredFormat
          };
          let hdrPixelMap: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(options);
          if(hdrPixelMap == undefined){
            console.info("get HdrComposed Pixelmap failed.");
            expect().assertFail();
          }else{
            if(opt == 'scale'){
              let scaleX = 0.5;
              let scaleY = 0.5;
              let oldImageInfo = hdrPixelMap.getImageInfoSync()
              console.info('oldImageInfo width: ' + oldImageInfo.size.width + ' , height: ' + oldImageInfo.size.height)
              hdrPixelMap.scale(scaleX, scaleY).then(() => {
                console.info('succeeded in scale');
                let newImageInfo = hdrPixelMap?.getImageInfoSync()
                console.info('newImageInfo width: ' + newImageInfo?.size?.width + ' , height: ' + newImageInfo?.size?.height)
                const widthCheck = newImageInfo?.size?.width === Math.round(oldImageInfo.size.width * scaleX)
                const heightCheck = newImageInfo?.size?.height === Math.round(oldImageInfo.size.height * scaleY)
                expect(widthCheck && heightCheck).assertTrue()
              }).catch((error: BusinessError) => {
                console.info(JSON.stringify(error) + ", Failed to scale, error code: " + error.code);
                expect().assertFail();
              })
            } else if(opt == 'rotate'){
              let angle = 90
              let oldImageInfo = hdrPixelMap.getImageInfoSync()
              console.info('oldImageInfo width: ' + oldImageInfo.size.width + ' , height: ' + oldImageInfo.size.height)
              hdrPixelMap.rotate(angle).then(() => {
                console.info('succeeded in rotate');
                let newImageInfo = hdrPixelMap?.getImageInfoSync()
                console.info('newImageInfo width: ' + newImageInfo?.size?.width + ' , height: ' + newImageInfo?.size?.height)
                const widthCheck = newImageInfo?.size?.width === oldImageInfo.size.height
                const heightCheck = newImageInfo?.size?.height === oldImageInfo.size.width
                expect(widthCheck && heightCheck).assertTrue()
              }).catch((error: BusinessError) => {
                console.info(JSON.stringify(error) + ", Failed to rotate, error code: " + error.code);
                expect().assertFail();
              })
            } else if(opt == 'flip'){
              let horizontal = true
              let vertical = true
              let oldImageInfo = hdrPixelMap.getImageInfoSync()
              console.info('oldImageInfo width: ' + oldImageInfo.size.width + ' , height: ' + oldImageInfo.size.height)
              hdrPixelMap.flip(horizontal, vertical).then(() => {
                console.info('succeeded in flip');
                let newImageInfo = hdrPixelMap?.getImageInfoSync()
                console.info('newImageInfo width: ' + newImageInfo?.size?.width + ' , height: ' + newImageInfo?.size?.height)
                const widthCheck = newImageInfo?.size?.width === oldImageInfo.size.width
                const heightCheck = newImageInfo?.size?.height === oldImageInfo.size.height
                expect(widthCheck && heightCheck).assertTrue()
              }).catch((error: BusinessError) => {
                console.info(JSON.stringify(error) + ", Failed to flip, error code: " + error.code);
                expect().assertFail();
              })
            } else{
              let region: image.Region = { x: 0, y: 0, size: { height: 200, width: 300} };
              hdrPixelMap.crop(region).then(() => {
                console.info('succeeded in crop');
                let newImageInfo = hdrPixelMap?.getImageInfoSync()
                console.info('newImageInfo width: ' + newImageInfo?.size?.width + ' , height: ' + newImageInfo?.size?.height)
                const widthCheck = newImageInfo?.size?.width === region.size.width
                const heightCheck = newImageInfo?.size?.height === region.size.height
                expect(widthCheck && heightCheck).assertTrue()
              }).catch((error: BusinessError) => {
                console.info(JSON.stringify(error) + ", Failed to crop, error code: " + error.code);
                expect().assertFail();
              })
            }
          }
        }
      } catch(error){
        console.info(JSON.stringify(error) + ", error code: " + error.code);
        expect().assertFail();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0100
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0100', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      await testHdrComposedPixelmapWithOptions("AllAuxiliaryPictures.jpg", "buffer", RGBA_1010102);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0200
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0200', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        await testHdrComposedPixelmapWithOptions("all_auxtype.heic", "fd", YCBCR_P010);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0300
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_0300', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      await testHdrComposedPixelmapWithOptions("AllAuxiliaryPictures.jpg", "uri", YCRCB_P010);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0100
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      await testHdrComposedPixelmapWithOptionsError("AllAuxiliaryPictures.jpg", "buffer", RGBA_8888, 7600201);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0200
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0200', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        await testHdrComposedPixelmapWithOptionsError("all_auxtype.heic", "buffer", NV21, 7600201);
        done();
      }
    });

        /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0300
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_ERROR_0300', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        await testHdrComposedPixelmapWithOptionsError("all_auxtype.heic", "buffer", RGB_565, 7600201);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0100
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0100', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      await pixelmapTestHdrComposedPixelmapWithOptions("AllAuxiliaryPictures.jpg", "buffer", RGBA_1010102, 'scale');
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0200
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0200', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        await pixelmapTestHdrComposedPixelmapWithOptions("all_auxtype.heic", "buffer", YCBCR_P010, 'rotate');
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0300
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0300', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      await pixelmapTestHdrComposedPixelmapWithOptions("AllAuxiliaryPictures.jpg", "fd", YCRCB_P010, 'flip');
      done();
    });

      /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0400
     * @tc.desc   getHdrComposedPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PICTURE_IMAGESOURCE_GET_HDR_COMPOSED_PIXELMAP_WITH_OPTIONS_AND_PIXELMAP_TEST_0400', Level.LEVEL0, async (done: Function) => {
      let result = true;
      try{
        if(!isSupportVPE) {
          expect(result).assertTrue();
          done();
          return
        };
      } catch (error) {
        console.info('file does not exist');
      }
      if (!isSupportHEIFDecode) {
        console.info("device is not support heif decode");
        done();
      } else{
        await pixelmapTestHdrComposedPixelmapWithOptions("all_auxtype.heic", "uri", YCRCB_P010, 'crop');
        done();
      }
    });

  })
}