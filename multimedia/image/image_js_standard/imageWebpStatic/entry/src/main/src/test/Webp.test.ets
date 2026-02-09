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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';
import { BusinessError } from '@ohos.base';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function imageWebp() {
  describe('imageWebp', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string;
    const ERR_CODE = 62980149;

    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalImageSource: image.ImageSource | undefined = undefined;
    let globalPacker: image.ImagePacker | undefined = undefined;
    let isSupportGifEncode: boolean | undefined;

    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
    })

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      if (globalImageSource != undefined) {
        console.info('globalImageSource release start');
        try {
          await globalImageSource!.release();
        } catch (error) {
          console.info('globalImageSource release fail');
        }
      }
      if (globalPacker != undefined) {
        console.info("globalPacker release start");
        try {
          await globalPacker!.release();
        } catch (error) {
          console.info("globalPacker release fail");
        }
      }
      console.info('afterEach case');
    });

    const getFilePath = (fileName: string): void => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
    }

    const getFd = (fileName: string): int => {
      getFilePath(fileName);
      const file = fs.openSync(filePath);
      return file.fd as int;
    };

    let createPixMapCbErr: (done: () => void, testNum: string, arg: image.DecodingOptions) => Promise<void> =
      async (done: () => void, testNum: string, arg: image.DecodingOptions): Promise<void> => {
        getFilePath("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;
          imageSourceApi.createPixelMap(arg, (err, pixelmap) => {
            if (pixelmap == undefined) {
              expect(pixelmap == undefined).assertTrue();
              console.info(`${testNum} success `);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }
      };

    let createPixMapCb: (done: () => void, testNum: string, arg: image.DecodingOptions) => Promise<void> =
      async (done: () => void, testNum: string, arg: image.DecodingOptions): Promise<void> => {
        getFilePath("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;
          imageSourceApi.createPixelMap(arg, (err, pixelmap) => {
            if (err && err.code) {
              console.info(`${testNum} - fail ${err}`);
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelmap!;
              try {
                let imageInfo = await pixelmap!.getImageInfo();
                expect(imageInfo.size.height == 2).assertTrue();
                expect(imageInfo.size.width == 1).assertTrue();
                console.info(`${testNum} - success `);
                console.info("imageInfo height :" + imageInfo.size.height + "width : " +
                imageInfo.size.width);
                done();
              } catch (err) {
                console.info(`${testNum} getimageInfo err ` + JSON.stringify(err));
                expect(false).assertTrue();
                done();
              }
            }
          });
        }
      };

    let createPixMapPromiseErr: (done: () => void, testNum: string, arg: image.DecodingOptions) => Promise<void> =
      async (done: () => void, testNum: string, arg: image.DecodingOptions): Promise<void> => {
        getFilePath("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;
          try {
            let pixelmap = await imageSourceApi.createPixelMap(arg)
            console.log(`${testNum} failed`);
            expect().assertFail();
            done();
          } catch (error) {
            console.log(`${testNum} success `);
            done();
          }
        }
      };

    let createPixMapPromise: (done: () => void, testNum: string, arg: image.DecodingOptions) => Promise<void> =
      async (done: () => void, testNum: string, arg: image.DecodingOptions): Promise<void> => {
        getFilePath("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;
          try {
            let pixelmap = await imageSourceApi.createPixelMap(arg)
            try {
              if (pixelmap == undefined) {
                console.info(`${testNum} createPixelMap failed, pixelmap is undefined!`);
                expect(false).assertTrue();
                done();
                return undefined;
              }
              let imageInfo = await pixelmap.getImageInfo()
              expect(imageInfo.size.height == 2).assertTrue();
              expect(imageInfo.size.width == 1).assertTrue();
              console.info(`${testNum} - success `);
              console.info("imageInfo height :" + imageInfo.size.height + "width : " +
              imageInfo.size.width);
              done();
            } catch (err) {
              console.info(`${testNum} getimageInfo err ` + JSON.stringify(err));
            }
          } catch (error) {
            console.log(`${testNum} fail `);
            expect(false).assertTrue();
            done();
          }
        }
      };

    let packingPromise: (done: () => void, testNum: string, arg: image.PackingOption) => Promise<void> =
      async (done: () => void, testNum: string, arg: image.PackingOption): Promise<void> => {
        console.info(`${testNum} enter`);
        let height = 4;
        let width = 6;
        let pixelSize = 4;
        let widthSize = width * pixelSize;
        let bufferSize = height * widthSize;
        const color = new ArrayBuffer(bufferSize);
        let colorArr = new Uint8Array(color);
        for (let h = 0; h < height / 2; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 255; // r
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = 0; h < height / 2; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 255; // g
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 255; // b
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
            height: 4, width: 6
          } as image.Size
        };

        try {
          let pixelmap = image.createPixelMapSync(color, opts);
          if (pixelmap == undefined) {
            console.info("${testNum} create pixelmap failed");
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap;
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              console.info(`${testNum} create image packer failed`);
              expect(false).assertTrue();
              done();
            } else {
              globalPacker = imagePackerApi;
              try {
                let data = await imagePackerApi.packToData(pixelmap, arg);
                console.info(`${testNum} success`);
                expect(data != undefined).assertTrue();
                let dataArr = new Uint8Array(data);
                console.info(`${testNum} dataArr.length=` + dataArr.length);
                for (let i = 0; i < dataArr.length; i++) {
                  console.info(`dataArr[` + i + `]=` + dataArr[i]);
                }
                done();
              } catch (error) {
                console.log(`${testNum} error: ` + error);
                expect(false).assertFail();
                done();
              }
            }
          }
        } catch (err) {
          console.log(`${testNum} error: ` + err);
          expect(false).assertFail();
          done();
        }
        console.info(`${testNum} leave`);
      };

    let packingPromiseErr: (done: () => void, testNum: string, arg: image.PackingOption) => Promise<void> =
      async (done: () => void, testNum: string, arg: image.PackingOption): Promise<void> => {
        console.info(`${testNum} enter`);
        let height = 4;
        let width = 6;
        let pixelSize = 4;
        let widthSize = width * pixelSize;
        let bufferSize = height * widthSize;
        const color = new ArrayBuffer(bufferSize);
        let colorArr = new Uint8Array(color);
        for (let h = 0; h < height / 2; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 255; // r
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = 0; h < height / 2; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 255; // g
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 255; // b
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
            height: 4, width: 6
          } as image.Size
        };
        try {
          let pixelmap = image.createPixelMapSync(color, opts);
          if (pixelmap == undefined) {
            console.info("${testNum} create pixelmap failed");
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap;
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              console.info(`${testNum} create image packer failed`);
              expect(false).assertTrue();
              done();
            } else {
              globalPacker = imagePackerApi;
              try {
                let data = imagePackerApi.packToData(pixelmap, arg);
                console.log(`${testNum} data: ${data}`)
                expect(data !== undefined).assertTrue();
                done();
              } catch (error) {
                console.log(`${testNum} errors: ` + error);
                done();
              }
            }
          }
        } catch (err) {
          console.log(`${testNum} errors: ` + err);
          done();
        }

        console.info(`${testNum} leave`);
      };

    const testGetDelayTimePromise = async (
      done: () => void,
      testNum: string,
      fileName: string
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalImageSource = imageSourceApi;
          try {
            let delayTimes = await imageSourceApi.getDelayTimeList();
            expect(delayTimes != undefined).assertTrue();
            logger.log("getDelayTimeList success: " + delayTimes.length);
            for (let i = 0; i < delayTimes.length; i++) {
              logger.log(`delayTimes[ ${i} ]= ${delayTimes[i]}`);
            }
            done();
          } catch (error: BusinessError) {
            logger.log("getDelayTimeList failed err: " + error);
            logger.log("getDelayTimeList failed err: " + error.code);
            expect(error.code == ERR_CODE).assertTrue();
            done();
          }
        }
      } catch (error) {
        logger.log("getDelayTimeList error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const testGetDelayTimeCallBack = async (
      done: () => void,
      testNum: string,
      fileName: string
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalImageSource = imageSourceApi;
          imageSourceApi.getDelayTimeList((error, delayTimes) => {
            if (error && error.code) {
              logger.log("getDelayTimeList error: " + error);
              expect(error!.code == ERR_CODE).assertTrue();
              done();
            }
            expect(delayTimes != undefined).assertTrue();
            logger.log("getDelayTimeList success: " + delayTimes!.length);
            for (let i = 0; i < delayTimes!.length; i++) {
              logger.log(`delayTimes[ ${i} ]= ${delayTimes![i]}`);
            }
            done();
          });
        }
      } catch (error) {
        logger.log("getDelayTimeList error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0100
     * @tc.desc   createPixelMap - promise-webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFilePath("test_large.webp");
        console.log(`filePath ${filePath}`)
        let imageSourceApi = image.createImageSource(filePath);

        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;
          let decodingOptions: image.DecodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: {
              width: 1, height: 2
            } as image.Size,
            rotate: 10,
            desiredPixelFormat: image.PixelMapFormat.RGB_565,
            desiredRegion: {
              size: {
                height: 1, width: 2
              } as image.Size, x: 0, y: 0
            } as image.Region,
            index: 0,
          };
          try {
            let pixelmap = await imageSourceApi.createPixelMap(decodingOptions);
            console.log(`pixelmap ${pixelmap}`)
            if (pixelmap != undefined) {
              globalpixelmap = pixelmap;
              expect(pixelmap != undefined).assertTrue();
              console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0100 success ");
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          } catch (err) {
            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0100 error 0: " + err);
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0100 error 1: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0100
     * @tc.desc   createPixelMap - callback-webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFilePath("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        console.log(`filePathfilePath ${filePath}`)
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;
          let decodingOptions: image.DecodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: {
              width: 1, height: 2
            } as image.Size,
            rotate: 10,
            desiredPixelFormat: image.PixelMapFormat.RGB_565,
            desiredRegion: {
              size: {
                height: 1, width: 2
              } as image.Size, x: 0, y: 0
            } as image.Region,
            index: 0,
          };
          imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
            if (pixelmap != undefined) {
              globalpixelmap = pixelmap;
              console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0100 success ");
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0100 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0200
     * @tc.desc   createPixelMap-promise-webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFilePath("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0200 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;

          try {
            let pixelmap = await imageSourceApi.createPixelMap();
            expect(pixelmap != undefined).assertTrue();
            globalpixelmap = pixelmap!;
            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0200 success ");
            done();
          } catch (error) {
            console.log("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0200 error: " + error);
            expect().assertFail();
            done();
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_STATIC_0200 err " + error);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0200
     * @tc.desc   createPixelMap-callback-webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        getFilePath("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0200 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImageSource = imageSourceApi;
          imageSourceApi.createPixelMap((err, pixelmap) => {
            expect(pixelmap != undefined).assertTrue();
            globalpixelmap = pixelmap!;
            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0200 success ");
            done();
          });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0200 err " + error);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0900
     * @tc.desc   createPixelMap-callback -size: { height: 10000, width: 10000 } -webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: {
          size: {
            height: 10000, width: 10000
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: 0,
      };
      createPixMapCb(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_0900", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1000
     * @tc.desc   createPixelMap-callback - sampleSize: -1 -webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOptions: image.DecodingOptions = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: 0,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1000", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1100
     * @tc.desc   createPixelMap-callback - index: -1 -webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: -1,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1100", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1200
     * @tc.desc   createPixelMap-callback - desiredPixelFormat: 1 -webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 2,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 500,
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: 0,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1200", decodingOptions);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1300
     * @tc.desc   createPixelMap-callback - { size: { height: 1, width: 2 }, x: -1, y: -1 } -webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: -1, y: -1
        } as image.Region,
        index: 0,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1300", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1400
     * @tc.desc   createPixelMap-callback -  size: { height: 10000, width:10000 } -webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: {
          size: {
            height: 10000, width: 10000
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: 0,
      };
      createPixMapPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_STATIC_1400", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0100
     * @tc.desc   packing - promise-webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0100", packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0100
     * @tc.desc   packing - promise-webp-wrong quality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 123
      };
      packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0100", packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0200
     * @tc.desc   packing - promise-webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (isSupportGifEncode) {
        console.info("SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_STATIC_0200 The device support gif encode")
        expect(isSupportGifEncode).assertTrue();
        done();
      } else {
        let packOpts: image.PackingOption = {
          format: "image/gif", quality: 90
        };
        packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0200", packOpts);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0500
     * @tc.desc   packing - promise-webp-quality -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: -1
      };
      packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_STATIC_0500", packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0200
     * @tc.desc   packing - promise-webp-quality 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: 0
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_STATIC_0200", packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0100
     * @tc.desc   test getDelayTime promise for one frame webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0100", "test_large.webp");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0200
     * @tc.desc   test getDelayTime promise for webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0200", "moving_test.webp");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0300
     * @tc.desc   test getDelayTime promise for unsupported jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_STATIC_0300", "test.jpg");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0100
     * @tc.desc   test getDelayTime callback for one frame webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0100", "test_large.webp");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0200
     * @tc.desc   test getDelayTime callback for webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_STATIC_0200", "moving_test.webp");
    });
  })
}

