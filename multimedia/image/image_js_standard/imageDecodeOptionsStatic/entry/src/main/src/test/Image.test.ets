/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

export default function imageDecodeOptions() {
  describe('imageDecodeOptions', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string;

    let globalpixelmap: image.PixelMap | undefined;
    let globalimageSource: image.ImageSource | undefined;
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
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
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      console.info('afterEach case');
    });


    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath);
      return file.fd as int;
    };

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
              let imageInfo = await imageSourceApi.getImageInfo();
              if (imageInfo == undefined) {
                expect().assertFail();
                logger.log("getImageInfo failed");
              } else {
                expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                logger.log("success imageInfo.encodedFormat: " + imageInfo.mimeType);
              }
              done();
            } catch (error) {
              logger.log("getImageInfo error: " + error);
              expect(false).assertTrue();
              done();
            }
          } else if (flag == 'PromiseNumber') {
            try {
              let imageInfo = await imageSourceApi.getImageInfo(0);
              if (imageInfo == undefined) {
                expect().assertFail();
                logger.log("getImageInfo failed");
              } else {
                expect(imageInfo.mimeType == expectedMimetype).assertTrue();
                logger.log("success imageInfo.encodedFormat: " + imageInfo.mimeType);
              }
              done();
            } catch (error) {
              logger.log("getImageInfo error: " + error);
              expect(false).assertTrue();
              done();
            }
          } else if (flag == 'Callback') {
            imageSourceApi.getImageInfo((err: BusinessError | null, imageInfo) => {
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
            imageSourceApi.getImageInfo(0, (err: BusinessError | null, imageInfo) => {
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

    const testDecodingOptCreatePixelMap = async (
      done: () => void,
      testNum: string,
      fileName: string,
      decodingOptions: image.DecodingOptions
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
          globalimageSource = imageSourceApi;
          imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError | null, pixelMap) => {
            if (err && err.code) {
              logger.log("createPixelMap err" + err);
              expect(false).assertTrue();
              done();
            } else {
              logger.log("createPixelMap success");
              expect(pixelMap != undefined).assertTrue();
              globalpixelmap = pixelMap!;
              done();
            }
          });
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const testDecodingOptCreatePixelMapErr = async (
      done: () => void,
      testNum: string,
      fileName: string,
      decodingOptions: image.DecodingOptions
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
          globalimageSource = imageSourceApi;
          imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError | null, pixelMap) => {
            if (err && err.code) {
              logger.log("createPixelMap success");
              logger.log("createPixelMap err" + JSON.stringify(err));
              expect(true).assertTrue();
              done();
            } else {
              logger.log("createPixelMap fail： " + pixelMap);
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (error) {
        logger.log("createPixelMap error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:RGBA_8888-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0100",
        "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions:index -1})-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0200",
        "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:unknown-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_JPG_STATIC_0300",
        "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions:editable false})-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0100",
        "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions:desiredSize>imagesize)-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size_err: image.Size ={ width: 10000, height: 10000 };
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size_err,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0100",
        "test.jpg", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions:desiredRegion>imagesize)-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let fd: int = getFd("test.jpg");
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          console.info(
            "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200 create image source failed"
          );
          expect(false).assertTrue();
          done();
        } else {
          let size_err: image.Size ={ width: 10000, height: 10000 };
          let size: image.Size ={ width: 1, height: 2 };
          let region: image.Region = { size: size_err, x: 0, y: 0};
          let decodingOptions: image.DecodingOptions = {
            sampleSize: 1,
            editable: true,
            desiredSize: size,
            rotate: 10,
            desiredPixelFormat: image.PixelMapFormat.RGB_565,
            desiredRegion: region,
            index: 0,
          };
          imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError|null, pixelmap) => {
            if (err && err.code) {
              console.info(
                "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200 createPixelMap err " +
                JSON.stringify(err)
              );
              expect(false).assertTrue();
              done();
            } else {
              expect(pixelmap != undefined).assertTrue();
              globalpixelmap = pixelmap!;
              try {
                let imageInfo = await pixelmap!.getImageInfo();
                expect(imageInfo.size.height == 2).assertTrue();
                expect(imageInfo.size.width == 1).assertTrue();
                console.info(
                  "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200 success "
                );
                console.info("imageInfo height :" + imageInfo.size.height);
                console.info("imageInfo width : " + imageInfo.size.width);
                done();
              } catch (err) {
                console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200 getimageInfo err " + err);
                expect(false).assertTrue();
                done();
              }
            }
          });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0200 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0100
     * @tc.desc   createPixelMap-promise-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let fd: int = getFd("test.jpg");
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          try {
            let pixelmap = await imageSourceApi.createPixelMap();
            globalpixelmap = pixelmap!;
            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0100 success ");
            expect(pixelmap != undefined).assertTrue();
            done();
          } catch (error) {
            console.log("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0100 error: " + error);
            expect().assertFail();
            done();
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0100 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0100
     * @tc.desc   createPixelMap-callback-jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let fd: int = getFd("test.jpg");
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          imageSourceApi.createPixelMap((err, pixelmap) => {
            expect(pixelmap != undefined).assertTrue();
            globalpixelmap = pixelmap!;
            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0100 success ");
            done();
          });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0100 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:RGBA_8888-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0100",
        "moving_test.gif", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:RGBA_565-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0200",
        "moving_test.gif", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:unkonwn-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0300",
        "moving_test.gif", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions:index 1})-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        desiredRegion: region,
        index: 1,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_INDEX_STATIC_0300",
        "moving_test.gif", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0200
     * @tc.desc   createPixelMap(decodingOptions:editable false})-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0200",
        "moving_test.gif", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions:desiredSize>imagesize)-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size_err: image.Size ={ width: 10000, height: 10000 };
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size_err,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0300",
        "moving_test.gif", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0400
     * @tc.desc   createPixelMap(decodingOptions:desiredRegion>imagesize)-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fd: int = getFd("moving_test.gif");
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info(" SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0400 create image source failed");
        expect(false).assertTrue();
        done();
      } else {
        let size_err: image.Size ={ width: 10000, height: 10000 };
        let size: image.Size ={ width: 1, height: 2 };
        let region: image.Region = { size: size_err, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: size,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGB_565,
          desiredRegion: region,
          index: 0,
        };
        imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError|null, pixelmap) => {
          if (err && err.code) {
            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0400 createPixelMap error " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap!;
            try {
              let imageInfo = await pixelmap!.getImageInfo();
              expect(imageInfo.size.height == 2).assertTrue();
              expect(imageInfo.size.width == 1).assertTrue();
              console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0400 success ");
              console.info("imageInfo height :" + imageInfo.size.height);
              console.info("imageInfo width : " + imageInfo.size.width);
              done();
            } catch (error) {
              console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0400 getimageInfo err " +
              JSON.stringify(err));
              expect().assertFail();
              done();
            }
          }
        });
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0200
     * @tc.desc   createPixelMap-promise-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fd: int = getFd("moving_test.gif");
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0200 create image source failed");
        expect(false).assertTrue();
        done();
      } else {
        try {
          let pixelmap = await imageSourceApi.createPixelMap();
          globalpixelmap = pixelmap!;
          console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0200 success ");
          expect(pixelmap !== undefined).assertTrue();
          done();
        } catch (error) {
          console.log("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PROMISE_STATIC_0200 error: " + error);
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0200
     * @tc.desc   createPixelMap-callback-gif
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fd: int = getFd("moving_test.gif");
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0200 create image source failed");
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.createPixelMap((err, pixelmap) => {
          console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_CALLBACK_STATIC_0200 success ");
          expect(pixelmap !== undefined).assertTrue();
          done();
        });
      }
    });
    //
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:RGBA_8888-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0400",
        "test.bmp", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:RGB_565-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0500",
        "test.bmp", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:unkonwn-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0600",
        "test.bmp", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0300
     * @tc.desc   createPixelMap(decodingOptions:editable false})-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0300",
        "test.bmp", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0500
     * @tc.desc   createPixelMap(decodingOptions:desiredSize>imagesize)-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size_err: image.Size ={ width: 1500, height: 1500 };
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size_err,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0500",
        "test.bmp", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0600
     * @tc.desc   createPixelMap(decodingOptions:desiredRegion>imagesize)-bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fd: int = getFd("test.bmp");
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info(" SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0600 create image source failed");
        expect(false).assertTrue();
        done();
      } else {
        let size_err: image.Size ={ width: 10000, height: 10000 };
        let size: image.Size ={ width: 1, height: 2 };
        let region: image.Region = { size: size_err, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: size,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGB_565,
          desiredRegion: region,
          index: 0,
        };
        imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError|null, pixelmap) => {
          if (err && err.code) {
            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0600 createPixelMap error " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap!;
            try {
              let imageInfo = await pixelmap!.getImageInfo();
              expect(imageInfo.size.height == 2).assertTrue();
              expect(imageInfo.size.width == 1).assertTrue();
              console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0600 success ");
              console.info("imageInfo height :" + imageInfo.size.height);
              console.info("imageInfo width : " + imageInfo.size.width);
              done();
            } catch (error) {
              console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0600 getimageInfo err " +
              JSON.stringify(err));
              expect().assertFail();
              done();
            }
          }
        });
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:RGBA_8888-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0700",
        "test.png", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:RGB_565-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0800",
        "test.png", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900
     * @tc.desc   createPixelMap(decodingOptions)-pixelformat:unkonwn-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_PIXELFORMAT_STATIC_0900",
        "test.png", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0400
     * @tc.desc   createPixelMap(decodingOptions:editable false})-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: false,
        desiredSize: size,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_EDITABLE_FALSE_STATIC_0400",
        "test.png", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0700
     * @tc.desc   createPixelMap(decodingOptions:desiredSize>imagesize)-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let size_err: image.Size ={ width: 1500, height: 1500 };
      let size: image.Size ={ width: 1, height: 2 };
      let region: image.Region = { size, x: 0, y: 0};
      let decodingOptions: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: size_err,
        rotate: 10,
        desiredPixelFormat: image.PixelMapFormat.RGB_565,
        desiredRegion: region,
        index: 0,
      };
      await testDecodingOptCreatePixelMap(done, "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0700",
        "test.png", decodingOptions);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0800
     * @tc.desc   createPixelMap(decodingOptions:desiredRegion>imagesize)-png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fd: int = getFd("test.png");
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info(" SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0800 create image source failed");
        expect(false).assertTrue();
        done();
      } else {
        let size_err: image.Size ={ width: 10000, height: 10000 };
        let size: image.Size ={ width: 1, height: 2 };
        let region: image.Region = { size: size_err, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: size,
          rotate: 10,
          desiredPixelFormat: image.PixelMapFormat.RGB_565,
          desiredRegion: region,
          index: 0,
        };
        imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError|null, pixelmap) => {
          if (err && err.code) {
            console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0800 createPixelMap error " + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap!;
            try {
              let imageInfo = await pixelmap!.getImageInfo();
              expect(imageInfo.size.height == 2).assertTrue();
              expect(imageInfo.size.width == 1).assertTrue();
              console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0800 success ");
              console.info("imageInfo height :" + imageInfo.size.height);
              console.info("imageInfo width : " + imageInfo.size.width);
              done();
            } catch (error) {
              console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_DESIRED_STATIC_0800 getimageInfo err " +
              JSON.stringify(err));
              expect().assertFail();
              done();
            }
          }
        });
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900
     * @tc.desc   Decode the image to generate a bitmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let fd: int = getFd("test.jpg");
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900 create image source failed");
        expect(false).assertTrue();
        done();
      } else {
        let size: image.Size ={ width: 1, height: 2 };
        let region: image.Region = { size: size, x: 0, y: 0};
        let decodingOptions: image.DecodingOptions = {
          sampleSize: 1,
          editable: true,
          desiredSize: size,
          rotate: 90,
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
          desiredRegion: region,
          index: 0,
        };
        imageSourceApi.createPixelMap(decodingOptions, (err: BusinessError|null, pixelmap) => {
          if (err && err.code) {
            console.info(
              "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900 createPixelMap error  " +
              JSON.stringify(err)
            );
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap!;
            pixelmap!.getImageInfo((error: BusinessError|null, imageInfo) => {
              if (error && error.code) {
                console.info(
                  "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900 getimageInfo err " +
                  JSON.stringify(error)
                );
                expect(false).assertTrue();
                done();
              } else {
                if (imageInfo != undefined) {
                  console.info("SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900 success");
                  expect(imageInfo!.size.height == 2).assertTrue();
                  expect(imageInfo!.size.width == 1).assertTrue();
                  done();
                } else {
                  console.info(
                    "SUB_MULTIMEDIA_IMAGE_DECODEOPTIONS_CREATEPIXELMAP_ROTATE_STATIC_0900 imageInfo is empty"
                  );
                  expect(false).assertTrue();
                  done();
                }
              }
            });
          }
        });
      }
    });
  })
}

