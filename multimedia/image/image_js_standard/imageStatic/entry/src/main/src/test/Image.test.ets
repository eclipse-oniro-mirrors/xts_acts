/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import image from '@ohos.multimedia.image';
import rpc from '@ohos.rpc'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { initialize } from './AbilityContextHelper.test';
import resourceManager from '@ohos.resourceManager';
import hilog from '@ohos.hilog';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imageJsTest", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function imageJsTest() {
  describe('imageJsTest', (): void => {
    let filesDir: string | undefined | null;
    let testContext: common.UIAbilityContext;
    let filePath: string;

    let fdNumber: int;
    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalimageSource: image.ImageSource | undefined = undefined;
    let globalpacker: image.ImagePacker | undefined = undefined;

    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath);
      fdNumber = file.fd as int;
      return fdNumber;
    };

    const getFilePath = async (fileName: string): Promise<string> => {
      let filePath = filesDir + "/" + fileName;
      return filePath;
    }

    const getBuffer = (fileName: string) => {
      const filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead;
    }

    const testImageSourceImageInfoMimetype = async (
      done: () => void,
      testNum: string,
      pictureFormat: string,
      expectedMimetype: string,
      flag: string
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(pictureFormat);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          if (flag == 'Promise') {
            try {
              let imageInfo: image.ImageInfo | undefined = await imageSourceApi.getImageInfo();
              if (imageInfo == undefined) {
                expect(false).assertTrue();
                logger.log("getImageInfo failed.");
              } else {
                expect(imageInfo!.mimeType == expectedMimetype).assertTrue();
                logger.log("success imageInfo.encodedFormat: " + imageInfo.mimeType);
              }
            } catch (error) {
              logger.log("getImageInfo error: " + error);
              expect(false).assertTrue();
            }
            await imageSourceApi.release();
            done();
          } else if (flag == 'PromiseNumber') {
            try {
              let imageInfo: image.ImageInfo | undefined = await imageSourceApi.getImageInfo(0);
              if (imageInfo == undefined) {
                expect(false).assertTrue();
                logger.log("getImageInfo failed.");
              } else {
                expect(imageInfo!.mimeType == expectedMimetype).assertTrue();
                logger.log("success imageInfo.encodedFormat: " + imageInfo.mimeType);
              }
            } catch (error) {
              logger.log("getImageInfo error: " + error);
              expect(false).assertTrue();
            }
            await imageSourceApi.release();
            done();
          } else if (flag == 'Callback') {
            imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
              if (err && err.code) {
                expect(false).assertTrue();
                logger.log("getImageInfo error: " + err);
              }
              if (imageInfo != undefined && imageInfo != null) {
                expect(imageInfo!.mimeType == expectedMimetype).assertTrue();
                logger.log("success imageInfo.encodedFormat: " + imageInfo.mimeType);
              } else {
                expect(false).assertTrue();
                logger.log("getImageInfo failed.");
              }
              await imageSourceApi.release();
              done();
            });
          } else if (flag == 'CallbackNumber') {
            imageSourceApi.getImageInfo(0, (err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
              if (err && err.code) {
                expect(false).assertTrue();
                logger.log("getImageInfo error: " + err);
              }
              if (imageInfo != undefined && imageInfo != null) {
                expect(imageInfo!.mimeType == expectedMimetype).assertTrue();
                logger.log("success imageInfo.encodedFormat: " + imageInfo.mimeType);
              } else {
                expect(false).assertTrue();
                logger.log("getImageInfo failed.");
              }
              await imageSourceApi.release();
              done();
            });
          }
        }
      } catch (error) {
        logger.log("getImageInfo error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      testContext = Hypium.get('context') as common.UIAbilityContext;
    })

    beforeEach(() => {
      console.info('beforeEach case');
    });

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      if (globalpacker != undefined) {
        console.info('globalpacker release start');
        try {
          await globalpacker!.release();
        } catch (error) {
          console.info('globalpacker release fail');
        }
      }
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_STATIC_0100
     * @tc.desc   writeBufferToPixels-promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 4, width: 6
        }
      };
      try {
        let pixelmap = image.createPixelMapSync(color, opts);
        globalpixelmap = pixelmap;
        if (pixelmap == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_STATIC_0100 createPixelMap failed');
          expect(false).assertTrue();
          done();
        }
        const writeColor = new ArrayBuffer(96);
        let tmpBufferArr = new Uint8Array(writeColor);
        for (let i = 0; i < tmpBufferArr.length; i++) {
          tmpBufferArr[i] = i + 1;
        }
        await pixelmap.writeBufferToPixels(writeColor);
        const readBuffer = new ArrayBuffer(96);
        await pixelmap.readPixelsToBuffer(readBuffer);
        let bufferArr = new Uint8Array(readBuffer);
        let res = true;
        for (let i = 0; i < bufferArr.length; i++) {
          if (bufferArr[i] == 0) {
            res = false;
            console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_STATIC_0100 failed');
            expect(false).assertTrue();
            done();
            break;
          }
        }
        if (res) {
          console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_STATIC_0100 success');
          expect(res).assertTrue();
          done();
        }
      } catch(error: Error) {
        console.log('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_PROMISE_STATIC_0100 error: ' + error);
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_STATIC_0100
     * @tc.desc   writeBufferToPixels-callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 4, width: 6
        }
      };
      try {
        let pixelmap = image.createPixelMapSync(color, opts);
        globalpixelmap = pixelmap;
        if (pixelmap == undefined) {
          expect(false).assertTrue();
          console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_STATIC_0100 failed');
          done();
        }
        const writeColor = new ArrayBuffer(96);
        await pixelmap.writeBufferToPixels(writeColor);
        const readBuffer = new ArrayBuffer(96);
        await pixelmap.readPixelsToBuffer(readBuffer);
        let bufferArr = new Uint8Array(readBuffer);
        let res = true;
        for (let i = 0; i < bufferArr.length; i++) {
          if (res) {
            if (bufferArr[i] == 0) {
              res = false;
              console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_STATIC_0100 Success');
              expect(!res).assertTrue();
              done();
              break;
            }
          }
        }
        if (res) {
          console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_STATIC_0100 no change after writeBuffer');
          expect(false).assertTrue();
          done();
        }
      } catch (error: Error) {
        console.log('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_CALLBACK_STATIC_0100 error: ' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_STATIC_0100
     * @tc.desc   writeBufferToPixels-sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 4, width: 6
        }
      };
      let pixelmap = image.createPixelMapSync(color, opts);
      if (pixelmap == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_STATIC_0100 createPixelMap failed');
        expect(false).assertTrue();
        done();
      }
      const writeColor = new ArrayBuffer(96);
      let bufferArr1: Uint8Array = new Uint8Array(writeColor);
      for (let i = 0; i < bufferArr1.length; i++) {
        bufferArr1[i] = i + 1;
      }
      pixelmap.writeBufferToPixelsSync(writeColor);
      const readBuffer = new ArrayBuffer(96);
      pixelmap.readPixelsToBufferSync(readBuffer);
      let bufferArr2 = new Uint8Array(readBuffer);
      let res = true;
      for (let i = 0; i < bufferArr2.length; i++) {
        if (bufferArr2[i] == 0) {
          res = false;
          console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_STATIC_0100 failed');
          expect(false).assertTrue();
          done();
          break;
        }
      }
      if (res) {
        console.info('SUB_MULTIMEDIA_IMAGE_WRITEBUFFERTOPIXELS_SYNC_STATIC_0100 success');
        expect(res).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0100
     * @tc.desc   createImageSource(uri)-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFd('test.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0100 create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          expect(imageSourceApi != undefined).assertTrue();
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0100 success');
          done();
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0100 error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0200
     * @tc.desc   createImageSource(uri)-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFd('test.bmp');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0200 create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          expect(imageSourceApi != undefined).assertTrue();
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0200 success');
          done();
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0200 error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0300
     * @tc.desc   createImageSource(uri)-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFd('test.gif');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0300 create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          expect(imageSourceApi != undefined).assertTrue();
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0300 success');
          done();
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0300 error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0400
     * @tc.desc   createImageSource(uri)-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFd('test.png');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0400 create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          expect(imageSourceApi != undefined).assertTrue();
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0400 success');
          done();
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_STATIC_0400 error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_STATIC_0100
     * @tc.desc   createImageSource(uri)-image with wrong suffix file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_SUFFIXFILE_STATIC_0100");
      try {
        getFd('test.123');
        let imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          logger.log('create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          imageSourceApi.createPixelMap((err, pixelmap) => {
            if (err && err.code) {
              logger.log('create pixelmap failed: ' +
              JSON.stringify(err));
              expect(false).assertTrue();
              done();
              return;
            }
            expect(pixelmap != undefined).assertTrue();
            globalpixelmap = pixelmap!;
            logger.log('success');
            done();
          });
        }
      } catch (error) {
        logger.log('err: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_STATIC_0100
     * @tc.desc   createImageSource(uri)-wrong uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_STATIC_0100");
      try {
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource('file:///multimedia/test.jpg');
        if (imageSourceApi != undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_STATIC_0100 create image source success');
          globalimageSource = imageSourceApi;
          expect(false).assertTrue();
          done();
        } else {
          expect(imageSourceApi == undefined).assertTrue();
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_URI_ERROR_URI_STATIC_0100 failed');
          done();
        }
      } catch (error) {
        logger.log('error: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0100
     * @tc.desc   createImageSource(fd)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0100");
      try {
        let fd: int = getFd('test.jpg');
        logger.log("fd is: " + fd);
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        logger.log("create image source end");
        if (imageSourceApi == undefined) {
          logger.log('create image source failed!');
          expect(false).assertTrue();
          done();
        } else {
          imageSourceApi.getImageInfo((err, imageInfo) => {
            if (err && err.code) {
              expect(false).assertTrue();
              logger.log('err: ' + JSON.stringify(err));
              done();
            }
            if (imageInfo != undefined) {
              expect(imageInfo != undefined).assertTrue();
              // fs.closeSync(fd);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (error) {
        logger.log('error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0200
     * @tc.desc   createImageSource(fd) fd<0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(-2);
        if (imageSourceApi != undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0200 create image source success');
          globalimageSource = imageSourceApi;
          expect(false).assertTrue();
          done();
        } else {
          expect(imageSourceApi == undefined).assertTrue();
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0200 failed');
          done();
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0200 error: ' + JSON.stringify(error));
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0300
     * @tc.desc   createImageSource(data)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let data = getBuffer("test.jpg");
      let imageSourceApi = image.createImageSource(data);
      if (imageSourceApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0300 create image source failed');
        expect(false).assertTrue();
        done();
      } else {
        globalimageSource = imageSourceApi;
        imageSourceApi!.getImageInfo((err: BusinessError | null, imageInfo:image.ImageInfo | undefined) => {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0300 imageInfo');
          expect(imageInfo != undefined).assertTrue();
          done();
        });
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0400
     * @tc.desc   createImageSource(data) buffer:0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_STATIC_0400");
      try {
        const data = new ArrayBuffer(0);
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(data);
        if (imageSourceApi != undefined) {
          logger.log('create image source success');
          globalimageSource = imageSourceApi;
          expect(false).assertTrue();
          done();
        } else {
          expect(imageSourceApi == undefined).assertTrue();
          logger.log('success');
          done();
        }
      } catch (error) {
        logger.log('error: ' + error);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0100
     * @tc.desc   createImageSource(uri)-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0100");
      try {
        getFd('test.jpg');
        let opt_size: image.Size = { height: 4, width: 6};
        let opts: image.SourceOptions = {
          sourceDensity: 240,
          sourcePixelFormat: image.PixelMapFormat.RGBA_8888,
          sourceSize: opt_size
        };
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(filePath, opts);
        if (imageSourceApi == undefined) {
          logger.log('create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          logger.log("createImageSource result is: " + (imageSourceApi != undefined));
          expect(imageSourceApi != undefined).assertTrue();
          done();
        }
      } catch (error) {
        logger.log("createImageSource error is: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0200
     * @tc.desc   release-imagesource-promise-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_CREATEIMAGESOURCE_SET_OPTION_STATIC_0200");
      try {
        let fd: int = getFd('test.jpg');
        let opt_size: image.Size = { height: 4, width: 6};
        let opts: image.SourceOptions = {
          sourceDensity: 240,
          sourcePixelFormat: image.PixelMapFormat.RGBA_8888,
          sourceSize: opt_size
        };
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd, opts);
        if (imageSourceApi == undefined) {
          logger.log('create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          logger.log("createImageSource result is: " + (imageSourceApi != undefined));
          expect(imageSourceApi != undefined).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_STATIC_0100
     * @tc.desc   release-imagesource-promise-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_STATIC_0100");
      try {
        let fd: int = getFd('test.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          logger.log('create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          imageSourceApi.release();
          logger.log('imageSource release success');
          done();
        }
      } catch (error) {
        logger.log('error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_STATIC_0100
     * @tc.desc   release-imagesource-callback-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_JPG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_JPG_STATIC_0100");
      try {
        let fd: int = getFd('test.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          logger.log('create image source failed');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          imageSourceApi.release(() => {
            logger.log('imageSource release success');
            done();
          });
        }
      } catch (error) {
        logger.log('error: ' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100
     * @tc.desc   getImageInfo(callback: AsyncCallback<ImageInfo>)-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.jpg');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                    if (err && err.code) {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100 err:' + err);
                        done();
                        return;
                    }
                    if (imageInfo != undefined) {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100 imageInfo.size.height:' +
                        imageInfo!.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100 imageInfo.size.width:' +
                        imageInfo!.size.width);
                        expect(imageInfo != undefined).assertTrue();
                        fs.closeSync(fdNumber);
                        done();
                    } else {
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100 failed');
                        expect(false).assertTrue();
                        done();
                    }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0100 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200
     * @tc.desc   getImageInfo(callback: AsyncCallback<ImageInfo>)-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.bmp');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                  if (err && err.code) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200 error' + err);
                      done();
                  }
                  if (imageInfo == undefined || imageInfo == null) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200 failed');
                      done();
                  } else {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200 imageInfo.size.height:' +
                    imageInfo!.size.height);
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200 imageInfo.size.width:' +
                    imageInfo!.size.width);
                    done();
                  }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0200 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300
     * @tc.desc   getImageInfo(callback: AsyncCallback<ImageInfo>)-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.png');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                  if (err && err.code) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300 error' + err);
                      done();
                  }
                  if (imageInfo == undefined || imageInfo == null) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300 failed');
                      done();
                  } else {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300 imageInfo.size.height:' +
                    imageInfo!.size.height);
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300 imageInfo.size.width:' +
                    imageInfo!.size.width);
                    done();
                  }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0300 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400
     * @tc.desc   getImageInfo(callback: AsyncCallback<ImageInfo>)-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.gif');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                    if (err && err.code) {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400 error' + err);
                        done();
                        return;
                    }
                    if (imageInfo != undefined && imageInfo != null) {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400 imageInfo.size.height:' +
                        imageInfo!.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400 imageInfo.size.width:' +
                        imageInfo!.size.width);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400 success');
                        done();
                    } else {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400 failed');
                        done();
                    }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0400 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500
     * @tc.desc   getImageInfo(index: int, callback: AsyncCallback<ImageInfo>)-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.jpg');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo(0, (err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                  if (err && err.code) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500 error' + err);
                      done();
                  }
                  if (imageInfo == undefined || imageInfo == null) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500 failed');
                      done();
                  } else {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500 imageInfo.size.height:' +
                    imageInfo!.size.height);
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500 imageInfo.size.width:' +
                    imageInfo!.size.width);
                    done();
                  }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0500 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600
     * @tc.desc   getImageInfo(index: int, callback: AsyncCallback<ImageInfo>)-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.bmp');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo(0, (err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                  if (err && err.code) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600 error' + err);
                      done();
                  }
                  if (imageInfo == undefined || imageInfo == null) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600 failed');
                      done();
                  } else {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600 imageInfo.size.height:' +
                    imageInfo!.size.height);
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600 imageInfo.size.width:' +
                    imageInfo!.size.width);
                    done();
                  }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0600 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700
     * @tc.desc   getImageInfo(index: int, callback: AsyncCallback<ImageInfo>)-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.png');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo(0, (err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                  if (err && err.code) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700 error' + err);
                      done();
                  }
                  if (imageInfo == undefined || imageInfo == null) {
                      expect(false).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700 failed');
                      done();
                  } else {
                    expect(imageInfo != undefined).assertTrue();
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700 imageInfo.size.height:' +
                    imageInfo!.size.height);
                    console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700 imageInfo.size.width:' +
                    imageInfo!.size.width);
                    done();
                  }
                });
            }
        } catch (error)  {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0700 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800
     * @tc.desc   getImageInfo(index: int, callback: AsyncCallback<ImageInfo>)-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.gif');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.getImageInfo(0, (err: BusinessError | null, imageInfo: image.ImageInfo | undefined) => {
                    if (err && err.code) {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800 error' + err);
                        done();
                        return;
                    }
                    if (imageInfo != undefined && imageInfo != null) {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800 imageInfo.size.height:' +
                        imageInfo!.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800 imageInfo.size.width:' +
                        imageInfo!.size.width);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800 success');
                        done();
                    } else {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800 failed');
                        done();
                    }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_CALLBACK_STATIC_0800 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100
     * @tc.desc   getImageInfo(index?: int): Promise<ImageInfo>-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.jpg');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    let imageInfo: image.ImageInfo | undefined = await imageSourceApi.getImageInfo(0);
                    if (imageInfo == undefined || imageInfo == null) {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100 failed');
                        done();
                    } else {
                      expect(imageInfo != undefined).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100 imageInfo');
                      console.info('imageInfo.size.height:' + imageInfo!.size.height);
                      console.info('imageInfo.size.width:' + imageInfo!.size.width);
                      done();
                    }
                } catch(error) {
                    error = error as BusinessError;
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100 error: ' + error);
                    expect().assertFail();
                    done();
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0100 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200
     * @tc.desc   getImageInfo(index?: int): Promise<ImageInfo>-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.bmp');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    let imageInfo: image.ImageInfo | undefined = await imageSourceApi.getImageInfo(0)
                    if (imageInfo == undefined || imageInfo == null) {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200 failed');
                        done();
                    } else {
                      expect(imageInfo != undefined).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200 imageInfo');
                      console.info('imageInfo.size.height:' + imageInfo!.size.height);
                      console.info('imageInfo.size.width:' + imageInfo!.size.width);
                      done();
                    }
                } catch(error) {
                    if (error instanceof BusinessError) {
                      console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200 error: ' + error);
                      expect().assertFail();
                      done();
                    }
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0200 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300
     * @tc.desc   getImageInfo(index?: int): Promise<ImageInfo>-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.png');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    let imageInfo: image.ImageInfo | undefined = await imageSourceApi.getImageInfo(0);
                    if (imageInfo == undefined || imageInfo == null) {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300 failed');
                        done();
                    } else {
                      expect(imageInfo != undefined).assertTrue();
                      console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300 imageInfo');
                      console.info('imageInfo.size.height:' + imageInfo!.size.height);
                      console.info('imageInfo.size.width:' + imageInfo!.size.width);
                      done();
                    }
                } catch(error) {
                    if (error instanceof BusinessError) {
                      console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300 error: ' + error);
                      expect().assertFail();
                      done();
                    }
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0300 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400
     * @tc.desc   getImageInfo(index?: int): Promise<ImageInfo>-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.gif');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try{
                  let imageInfo: image.ImageInfo | undefined = await imageSourceApi.getImageInfo(0)
                    if (imageInfo != undefined && imageInfo != null) {
                        expect(imageInfo != undefined).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400 imageInfo.size.height:' +
                        imageInfo.size.height);
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400 imageInfo.size.width:' +
                        imageInfo.size.width);
                        done();
                    } else {
                        expect(false).assertTrue();
                        console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400 failed');
                        done();
                    }
                } catch(error: BusinessError) {
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400 error: ' + error);
                    expect().assertFail();
                    done();
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_PROMISE_STATIC_0400 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0100
     * @tc.desc   getImageInfo(index?: int): Promise<ImageInfo>-gif(frame:1)-index:1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.gif');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0100 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    await imageSourceApi.getImageInfo(1);
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0100 failed');
                    expect(false).assertTrue();
                    done();
                } catch(error) {
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0100 success');
                    done();
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0100 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0200
     * @tc.desc   getImageInfo(index?: int): Promise<ImageInfo>-gif-index:-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.gif');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0200 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    await imageSourceApi.getImageInfo(-1);
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0200 failed');
                    expect(false).assertTrue();
                    done();
                } catch (error) {
                    console.log('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0200 success');
                    done();
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_INDEX_PROMISE_GIF_STATIC_0200 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_STATIC_0100
     * @tc.desc   createPixelMap-promise-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_JPG_STATIC_0100');
      try {
        let fd: int = getFd('test.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          try {
            let pixelMap: image.PixelMap | undefined = await imageSourceApi.createPixelMap();
            if (pixelMap == undefined) {
              logger.log('createPixelMap failed');
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelMap;
              logger.log("createPixelMap success;");
              expect(pixelMap != undefined).assertTrue();
              done();
            }
          } catch (error) {
            logger.log("createPixelMap error: " + error);
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_STATIC_0100
     * @tc.desc   createPixelMap-callback-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_JPG_STATIC_0100');
      try {
        let fd: int = getFd('test.jpg');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          imageSourceApi.createPixelMap((err: BusinessError | null, pixelmap: image.PixelMap | undefined) => {
            if (err && err.code) {
              logger.log("createPixelMap error: " + err);
              expect(false).assertTrue();
              done();
              return;
            }
            if (pixelmap == undefined) {
              logger.log("createPixelMap failed");
              expect(false).assertTrue();
              done();
            } else {
              expect(pixelmap != undefined).assertTrue();
              globalpixelmap = pixelmap!;
              logger.log("createPixelMap success;");
              done();
            }
          });
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100
     * @tc.desc   createIncrementalSource-updateData-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let testimagebuffer = getBuffer("test.png");
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 0003 ' + testimagebuffer.byteLength);
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        const incSouce: image.ImageSource | undefined = image.createIncrementalSource(new ArrayBuffer(1));
        let ret: boolean;
        let isFinished: boolean = false;
        while (offset < testimagebuffer.byteLength) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 0006 ' + testimagebuffer.byteLength);
          let  oneStep = testimagebuffer.slice(offset, offset + bufferSize);
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 0007 ' + oneStep.byteLength);
          if (oneStep.byteLength < bufferSize) {
            isFinished = true;
          }
          try {
            if (incSouce == undefined) {
              console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 incSouce is undefined');
              expect(false).assertTrue();
              done();
            } else {
              globalimageSource = incSouce;
              await incSouce.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
              offset = offset + oneStep.byteLength as int;
              console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 0011 ' + offset);
              ret = true;
            }
          } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 updateData failed');
            expect(false).assertTrue();
            ret = false;
          }
        }
        if (ret && incSouce != undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 updateData success ');
          let decodingOptions: image.DecodingOptions = {
            sampleSize: 1
          };
          incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 0014' + pixelmap);
            expect(pixelmap != undefined).assertTrue();
            done();
          });
        } else {
          done();
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0100 updateData failed ' + error);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200
     * @tc.desc   createIncrementalSource-updateData-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let testimagebuffer = getBuffer("test.jpg");
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 0003 ' + testimagebuffer.byteLength);
        let bufferSize = testimagebuffer.byteLength;
        let offset: int = 0;
        const incSouce = image.createIncrementalSource(new ArrayBuffer(1));
        let ret: boolean;
        let isFinished: boolean = false;
        while (offset < testimagebuffer.byteLength) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 0006 ' + testimagebuffer.byteLength);
          let oneStep = testimagebuffer.slice(offset, offset + bufferSize);
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 0007 ' + oneStep.byteLength);
          if (oneStep.byteLength < bufferSize) {
            isFinished = true;
          }
          try {
            if (incSouce == undefined) {
              console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 incSouce is undefined');
              expect(false).assertTrue();
              done();
            } else {
              globalimageSource = incSouce;
              await incSouce.updateData(oneStep, isFinished, 0, oneStep.byteLength as int);
              offset = offset + oneStep.byteLength as int;
              console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 0011 ' + offset);
              ret = true;
            }
          } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 updateData failed');
            expect(false).assertTrue();
            ret = false;
          }
        }
        if (ret && incSouce != undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 updateData success ');
          let decodingOptions: image.DecodingOptions = {
            sampleSize: 1
          };
          incSouce.createPixelMap(decodingOptions, (err, pixelmap) => {
            expect(pixelmap != undefined).assertTrue();
            done();
          });
        } else {
          done();
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_CREATEINCREMENTALSOURCE_UPDATEDATA_STATIC_0200 updateData failed ' + error);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0100
     * @tc.desc   release ImageSource - promise - png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.png');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0100 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    await imageSourceApi.release();
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0100 success');
                    done();
                } catch(error) {
                    if (error instanceof BusinessError) {
                      console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0100 error: ' + error);
                      expect().assertFail();
                      done();
                    }
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0100 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0100
     * @tc.desc   release ImageSource - callback - png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.png');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0100 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.release((err: BusinessError | null) => {
                    if (err && err.code) {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0100 err:' + err);
                        expect(false).assertTrue();
                        done();
                    } else {
                        console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0100 Success');
                        done();
                    }
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0100 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0200
     * @tc.desc   release ImageSource - promise - bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.bmp');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0200 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    await imageSourceApi.release();
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0200 success');
                    done();
                } catch(error: BusinessError) {
                    console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0200 error: ' + error);
                    expect().assertFail();
                    done();
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0200 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0200
     * @tc.desc   release ImageSource - callback - bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.bmp');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0200 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.release(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0200 Success');
                    done();
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0200 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0300
     * @tc.desc   release ImageSource - promise - gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.gif');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0300 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                try {
                    await imageSourceApi.release()
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0300 success');
                    done();
                } catch(error: BusinessError) {
                    console.log('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0300 error: ' + error);
                    expect().assertFail();
                    done();
                };
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_PROMISE_STATIC_0300 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0300
     * @tc.desc   release ImageSource - callback - gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.gif');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0300 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                imageSourceApi.release(() => {
                    console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0300 Success');
                    done();
                    return;
                });
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_RELEASE_IMAGESOURCE_CALLBACK_STATIC_0300 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0800
     * @tc.desc   createPixelMap-promise-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0800');
      try {
        let fd: int = getFd('moving_test.gif');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          try {
            let pixelMap: image.PixelMap | undefined = await imageSourceApi.createPixelMap();
            if (pixelMap == undefined) {
              logger.log('createPixelMap failed');
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelMap;
              logger.log("createPixelMap success;");
              expect(pixelMap != undefined).assertTrue();
              done();
            }
          } catch (error) {
            logger.log("createPixelMap error: " + error);
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1200
     * @tc.desc   createPixelMap-callback-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1200');
      try {
        let fd: int = getFd('moving_test.gif');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          imageSourceApi.createPixelMap((err: BusinessError | null, pixelmap: image.PixelMap | undefined) => {
            if (err && err.code) {
              logger.log("createPixelMap error: " + err);
              expect(false).assertTrue();
              done();
            }
            if (pixelmap == undefined) {
              logger.log("createPixelMap failed");
              expect(false).assertTrue();
              done();
            } else {
              expect(pixelmap !== undefined).assertTrue();
              globalpixelmap = pixelmap!;
              logger.log("createPixelMap success;");
              done();
            }
          });
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0900
     * @tc.desc   createPixelMap-promise-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_0900');
      try {
        let fd: int = getFd('test.bmp');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          try {
            let pixelMap: image.PixelMap | undefined = await imageSourceApi.createPixelMap();
            if (pixelMap == undefined) {
              logger.log('createPixelMap failed');
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelMap;
              logger.log("createPixelMap success;");
              expect(pixelMap != undefined).assertTrue();
              done();
            }
          } catch (error) {
            logger.log("createPixelMap error: " + error);
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1300
     * @tc.desc   createPixelMap-callback-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1300');
      try {
        let fd: int = getFd('test.bmp');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          imageSourceApi.createPixelMap((err: BusinessError | null, pixelmap: image.PixelMap | undefined) => {
            if (err && err.code) {
              logger.log("createPixelMap error: " + err);
              expect(false).assertTrue();
              done();
            } 
            if (pixelmap == undefined) {
              logger.log("createPixelMap failed");
              expect(false).assertTrue();
              done();
            } else {
              expect(pixelmap != undefined).assertTrue();
              globalpixelmap = pixelmap!;
              logger.log("createPixelMap success;");
              done();
            }
          });
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_1000
     * @tc.desc   createPixelMap-promise-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_PROMISE_STATIC_1000');
      try {
        let fd: int = getFd('test.png');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          try {
            let pixelMap: image.PixelMap | undefined = await imageSourceApi.createPixelMap();
            if (pixelMap == undefined) {
              logger.log('createPixelMap failed');
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelMap;
              logger.log("createPixelMap success;");
              expect(pixelMap != undefined).assertTrue();
              done();
            }
          } catch (error) {
            logger.log("createPixelMap error: " + error);
            expect(false).assertTrue();
            done();
          }
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1400
     * @tc.desc   createPixelMap-callback-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_CREATEPIXELMAP_CALLBACK_STATIC_1400');
      try {
        let fd: int = getFd('test.png');
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          imageSourceApi!.createPixelMap((err: BusinessError | null, pixelmap: image.PixelMap | undefined) => {
            if (err && err.code) {
              logger.log("createPixelMap error: " + err);
              expect(false).assertTrue();
              done();
            }
            if (pixelmap == undefined) {
              logger.log("createPixelMap failed");
              expect(false).assertTrue();
              done();
            } else {
              expect(pixelmap != undefined).assertTrue();
              globalpixelmap = pixelmap!;
              logger.log("createPixelMap success;");
              done();
            }
          });
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_STATIC_0100
     * @tc.desc   imagesource supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
            getFd('test.jpg');
            const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
            if (imageSourceApi == undefined) {
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_STATIC_0100 create image source failed');
                expect(false).assertTrue();
                done();
            } else {
                globalimageSource = imageSourceApi;
                expect(imageSourceApi.supportedFormats != undefined).assertTrue();
                console.info(imageSourceApi.supportedFormats + 'imageSourceApi.supportedFormats');
                console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_STATIC_0100 success ');
                done();
            }
        } catch (error) {
            console.info('SUB_MULTIMEDIA_IMAGE_IMAGESOURCE_SUPPORTEDFORMATS_STATIC_0100 error: ' + error);
            expect(false).assertTrue();
            done();
        }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_STATIC_0100
     * @tc.desc   imagepacker supportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const imagePackerApi = image.createImagePacker();
      if (imagePackerApi == undefined) {
        console.info('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_STATIC_0100 create image packer failed');
        expect(false).assertTrue();
        done();
      } else {
        globalpacker = imagePackerApi;
        expect(imagePackerApi.supportedFormats != undefined).assertTrue();
        console.info(imagePackerApi.supportedFormats + 'imageSourceApi.supportedFormats');
        console.info('SUB_MULTIMEDIA_IMAGE_IMAGEPACKER_SUPPORTEDFORMATS_STATIC_0100 success ');
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100
     * @tc.desc   imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100',
        'test.jpg', 'image/jpeg', 'Promise');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200
     * @tc.desc   imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200',
        'test.jpeg', 'image/jpeg', 'Promise');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300
     * @tc.desc   imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300',
        'test.png', 'image/png', 'PromiseNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400
     * @tc.desc   imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400',
        'test.gif', 'image/gif', 'PromiseNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500
     * @tc.desc   imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500',
        'moving_test.webp', 'image/webp', 'Callback');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600
     * @tc.desc   imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600',
        'test.ico', 'image/x-icon', 'Callback');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700
     * @tc.desc   imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700',
        'test.svg', 'image/svg+xml', 'Callback');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800
     * @tc.desc   imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800',
        'test.bmp', 'image/bmp', 'CallbackNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900
     * @tc.desc   imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_IMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900',
        'test.dng', 'image/x-adobe-dng', 'CallbackNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0100',
        'wrong_suffix_jpg.jpeg', 'image/jpeg', 'Promise');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0200',
        'wrong_suffix_jpeg.png', 'image/jpeg', 'Promise');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0300',
        'wrong_suffix_png.gif', 'image/png', 'PromiseNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-promise-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done, 'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_PROMISE_STATIC_0400',
        'wrong_suffix_gif.tiff', 'image/gif', 'PromiseNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done,
        'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0500', 'wrong_suffix_webp.ico',
        'image/webp', 'Callback');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done,
        'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0600', 'wrong_suffix_ico.svg',
        'image/x-icon', 'Callback');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done,
        'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0700', 'wrong_suffix_svg.bmp',
        'image/svg+xml', 'Callback');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done,
        'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0800', 'wrong_suffix_bmp.dng',
        'image/bmp', 'CallbackNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900
     * @tc.desc   wrongSuffixImage-imageSource-getImageInfo-callback-mimetype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testImageSourceImageInfoMimetype(done,
        'SUB_MULTIMEDIA_WRONGSUFFIXIMAGE_GETIMAGEINFO_MIMETYPE_CALLBACK_STATIC_0900', 'wrong_suffix_dng.jpg',
        'image/x-adobe-dng', 'CallbackNumber');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_STATIC_0100
     * @tc.desc   1.test Image getDecodeSupportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_STATIC_0100', Level.LEVEL0, async (done:() => void)=>{
      let logger = "SUB_MULTIMEDIA_IMAGE_GET_DECODE_SUPPORTEDFORMATS_STATIC_0100";
      const srcSupportedFormatsList: Array<string> = image.getImageSourceSupportedFormats();
      let filePath = await getFilePath("test.jpg");
      const dstSupportedFormatsList: Array<string> = image.createImageSource(filePath)!.supportedFormats;
      console.log(`${logger}, srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
      console.log(`${logger}, dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
      const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
      console.log("compare result is: " + ret);
      expect(ret).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_STATIC_0100
     * @tc.desc   1.test image getEncodeSupportedFormats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_STATIC_0100', Level.LEVEL0, async (done:() => void)=>{
      let logger = "SUB_MULTIMEDIA_IMAGE_GET_ENCODE_SUPPORTEDFORMATS_STATIC_0100";
      const srcSupportedFormatsList: Array<string> = image.getImagePackerSupportedFormats();
      const dstSupportedFormatsList: Array<string> = image.createImagePacker().supportedFormats;
      console.log(`${logger}, srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
      console.log(`${logger}, dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
      const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
      console.log("compare result is: " + ret);
      expect(ret).assertTrue();
      done();
    })
  })
}
