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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs'
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import hilog from '@ohos.hilog';
import { initialize } from './AbilityContextHelper.test';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function imagePacking() {
  let filesDir: string|undefined|null;
  let cacheDir: string|undefined|null;
  let isSupportGifEncode: boolean = false;
  const ERROR_CODE = 401;

  describe("imagePacking", (): void => {
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      cacheDir = Hypium.get('cacheDir') as string | undefined | null;
      isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
    })

    let getFd = (fileName: string): int => {
      let fdNumber: int;
      let filePath = filesDir + "/" + fileName;
      console.log('image case filePath is1111', filePath);

      let file = fs.openSync(filePath);
      fdNumber = file.fd as int;
      console.log('image case filePath is', fdNumber + filePath);
      return fdNumber;
    }

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });

    let getImageSourceData = (fileName: string) => {
      let globalImagesource: image.ImageSource | undefined;
      try {
        const path: string = filesDir + "/" + fileName;
        globalImagesource = image.createImageSource(path);
        console.log('image source1111111: ' + globalImagesource)
        return globalImagesource;
      } catch (error: BusinessError) {
        console.info("image getRawFileContent case" + error.code + ",err message" + error.message);
        return undefined;
      }
    }

    let isSupportImageFormat = (fileName: string, format: string) => {
      let filePath = ""
      let isSupportFormat = false;
      let globalImagesource: image.ImageSource | undefined;
      try {
        filePath = filesDir + "/" + fileName;
        globalImagesource = image.createImageSource(filePath);
        if (globalImagesource != undefined) {
          isSupportFormat = globalImagesource.supportedFormats.includes(format);
          console.info('isSupportFormat is ' + isSupportFormat);
          globalImagesource.release();
        }
        return isSupportFormat;
      } catch (error) {
        console.info("getRawFileContent case" + error);
        return isSupportFormat;
      }
      return isSupportFormat;
    }

    let createPixelMapList = (done: () => void, picName: string) => {
      console.info("createPixelMapList start");
      let imageSourceApi: image.ImageSource | undefined = getImageSourceData(picName);
      let pixelMapList: Array<image.PixelMap> = [];
      if (imageSourceApi == undefined) {
        console.info("createImageSource failed");
        expect(false).assertTrue();
        done();
      } else {
        try {
          pixelMapList = await imageSourceApi.createPixelMapList();
          if (pixelMapList != undefined) {
            console.info("createPixelMapList success");
            await imageSourceApi.release();
          } else {
            console.info("createPixelMapList failed");
            expect(false).assertTrue();
            done();
          }
        } catch (error: BusinessError) {
          console.info("createPixelMapList error = " + error.code + "createPixelMapList errormsg = " + error.message);
          expect(false).assertTrue();
          done();
        }
      }
      return pixelMapList;
    }

    let checkPackingForSequenceResult = async (buffer: ArrayBuffer, pictureSize: image.Size,
      packingOptions: image.PackingOptionsForSequence) => {
      let imgSource = image.createImageSource(buffer);
      if (imgSource == undefined) {
        console.info(`imgSource create failed.`);
        expect(false).assertTrue();
      } else {
        let delayTimeListLength: int = packingOptions.delayTimeList.length as int;
        let delayTimes = await imgSource.getDelayTimeList();
        let disposalTypes = await imgSource.getDisposalTypeList();
        let loopcount = await imgSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
        expect(loopcount['GIFLoopCount'] != null).assertTrue();
        let GIFloopCount = loopcount['GIFLoopCount'] as string;
        let imageInfo = imgSource.getImageInfoSync();
        if (imageInfo == undefined) {
          expect(false).assertTrue();
        } else {
          console.info(`checkPackingForSequenceResult delayTimes ${delayTimes}`);
          console.info(`checkPackingForSequenceResult disposalTypes ${disposalTypes}`);
          console.info(`checkPackingForSequenceResult loopcount ${loopcount}`);
          console.info(`checkPackingForSequenceResult height ${imageInfo.size.height}`);
          console.info(`checkPackingForSequenceResult width ${imageInfo.size.width}`);
          console.info(`checkPackingForSequenceResult mimeType ${imageInfo.mimeType}`);
          expect(imageInfo.size.width == pictureSize.width).assertTrue();
          expect(imageInfo.size.height == pictureSize.height).assertTrue();
          expect(imageInfo.mimeType == "image/gif").assertTrue();
        }
        console.info(`checkPackingForSequenceResult loopcount1 ${GIFloopCount}`);
        console.info(`checkPackingForSequenceResult loopcount2 ${packingOptions.loopCount}`);
        //对比编码前后的 loopCount
        //GIF编码中设定输出图片循环播放次数的参数，取值范围为[0，65535]。0表示无限循环, 如果没有此字段, 则设置为默认值1；
        if (packingOptions.loopCount != undefined) {
          expect(GIFloopCount == `${packingOptions.loopCount}`).assertTrue();
        } else {
          expect(GIFloopCount == `1`).assertTrue();
        }
        //对比编码前后的 delayTimesList。delayTimes 的值编码和解码的单位差10倍
        //GIF编码中设定输出图片每一帧的延迟时间。如果不是0，则此字段指定等待时间为参数值*0.01秒。
        //如果长度小于frameCount，则缺失的部分将用delayTimeList最后一个值填充。
        console.info(`packingMultiFramesPromise delayTimeList ${packingOptions.delayTimeList}`);
        for (let i = 0; i < packingOptions.frameCount; i++) {
          if (i < delayTimeListLength) {
            expect(delayTimes[i] == packingOptions.delayTimeList[i] * 10).assertTrue();
          } else {
            expect(delayTimes[i] == packingOptions.delayTimeList[delayTimeListLength -1] * 10).assertTrue();
          }
        }
        console.info(`packingMultiFramesPromise disposalTypes ${packingOptions.disposalTypes}`);
        //对比编码前后的 disposalTypes。disposalTypes的有效值是0～3，解码的时候0会变成1。
        //0：不需要任何操作  1：保持图形不变  2：恢复背景色  3：恢复到之前的状态。
        if (packingOptions.disposalTypes != undefined) {
          for (let i = 0; i < packingOptions.frameCount; i++) {
            if (i < packingOptions.disposalTypes!!.length) {
              if (packingOptions.disposalTypes!![i] == 0) {
                expect(disposalTypes[i] == 1).assertTrue();
              } else {
                expect(disposalTypes[i] == packingOptions.disposalTypes!![i]).assertTrue();
              }
            } else {
              expect(disposalTypes[i] == 1).assertTrue();
            }
          }
        }
      }
      if (imgSource != undefined) {
        await imgSource.release();
      }
    }

    let testPackingForSequencePromise = (done: () => void, testNum: string, pictureSize: image.Size,
      packingOptions: image.PackingOptionsForSequence, pixelMapList: Array<image.PixelMap>) => {
      try {
        let globalPacker = image.createImagePacker();
        if (globalPacker == undefined) {
          console.info(`${testNum} createImagePacker failed`);
          expect(false).assertTrue();
          done();
          return;
        }
        try {
          let data: ArrayBuffer = await globalPacker.packToDataFromPixelmapSequence(pixelMapList, packingOptions);
          console.info(`${testNum} testPackingForSequencePromise success`);
          await globalPacker.release();
          for (let i = 0; i < pixelMapList.length; i++) {
            if (pixelMapList[i] != undefined) {
              console.info(`${testNum} pixelMapList[${i}] release`);
              await pixelMapList[i].release();
            } else {
              console.info(`${testNum} pixelMapList[${i}] is undefined`);
              expect().assertFail();
              done();
            }
          }
          await checkPackingForSequenceResult(data, pictureSize, packingOptions);
          done();
        } catch (e1) {
          console.info(`${testNum} testPackingForSequencePromise e1: ` + e1);
          expect().assertFail();
          done();
        }
      } catch (error: Error) {
        console.info(`${testNum} error: ` + JSON.stringify(error));
        expect().assertFail();
        done();
      };
    }

    let testPackingForSequencePromiseError = (done: () => void, testNum: string, pictureSize: image.Size,
      packingOptions: image.PackingOptionsForSequence, pixelMapList: Array<image.PixelMap>) => {
      let globalPacker = image.createImagePacker();
      if (globalPacker == undefined) {
        console.log(`${testNum} createImagePacker failed`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        let data: ArrayBuffer = await globalPacker.packToDataFromPixelmapSequence(pixelMapList, packingOptions);
        console.log(`${testNum} testPackingForSequencePromiseError success`);
        expect(false).assertTrue();
        done();
      } catch(error: BusinessError) {
        await globalPacker.release();
        for (let i = 0; i < pixelMapList.length; i++) {
          if (pixelMapList[i] != undefined) {
            console.info(`${testNum} pixelMapList[${i}] release`);
            await pixelMapList[i].release();
          } else {
            console.info(`${testNum} pixelMapList[${i}] is undefined`);
            expect().assertFail();
            done();
          }
        }
        console.log(`${testNum} packing error: ` + JSON.stringify(error));
        expect(error.code == ERROR_CODE).assertTrue();
        done();
      };
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_STATIC_0100
     * @tc.desc   createImagePacker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_STATIC_0100", Level.LEVEL1, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_STATIC_0100");
      try {
        let fdNumber: int = getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          logger.log("create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            logger.log("create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            logger.log("create image packer success");
            done();
          }
        }
      } catch (error) {
        logger.log("error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_STATIC_0100
     * @tc.desc   release ImagePacker - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const imagePackerApi = image.createImagePacker();
      if (imagePackerApi == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_STATIC_0100 create image packer failed");
        expect(false).assertTrue();
        done();
      } else {
        try {
          imagePackerApi.release();
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_STATIC_0100 success");
          done();
        } catch (error) {
          console.log("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_STATIC_0100 error: " + error);
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_STATIC_0100
     * @tc.desc   release ImagePacker - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const imagePackerApi = image.createImagePacker();
      if (imagePackerApi == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_STATIC_0100 create image packer failed");
        expect(false).assertTrue();
        done();
      } else {
        imagePackerApi.release(() => {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_STATIC_0100 success");
          done();
        });
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0100
     * @tc.desc   test the packing interface uses many PixelMaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 1, 0],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0100",
          {width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0200
     * @tc.desc   test the packing interface uses PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.png");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0200",
          { width: 6016, height: 3384 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0300
     * @tc.desc   test the packing interface configuration delaytimes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [10], disposalTypes: [3, 2, 3]
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0300",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0400
     * @tc.desc   test the packing interface configuration loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.png");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10], loopCount: 2
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0400",
          { width: 6016, height: 3384 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0500
     * @tc.desc   test the packing interface no disposalTypes and no loopCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10]
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0500",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0600
     * @tc.desc   test the packing interface frameCount less than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0600",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0700
     * @tc.desc   test the packing interface frameCount more than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 5, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0700",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0800
     * @tc.desc   test the packing interface delayTimeList less than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0800",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0900
     * @tc.desc   test the packing interface delayTimeList more than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10, 20, 30], disposalTypes: [3, 1, 0], loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_0900",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1000
     * @tc.desc   test the packing interface disposalTypes less than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3], loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1000",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1100
     * @tc.desc   test the packing interface disposalTypes more than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 2, 1, 0], loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1100",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1200
     * @tc.desc   test the packing interface uses test.bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.bmp");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1200",
          { width: 1399, height: 1042 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1300
     * @tc.desc   test the packing interface uses test.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.jpg");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1300",
          { width: 1446, height: 1476 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1400
     * @tc.desc   test the packing interface uses test.ico
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.ico");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1400",
          { width: 64, height: 64 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1500
     * @tc.desc   test the packing interface uses test.svg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.svg");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1500",
          { width: 400, height: 200 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1600
     * @tc.desc   test the packing interface uses test.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.dng");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1600",
          { width: 5976, height: 3992 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1700
     * @tc.desc   test the packing interface uses test.jpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.jpeg");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1700",
          { width: 3072, height: 4096 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1800
     * @tc.desc   test the packing interface uses test.webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "test.webp");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1800",
          { width: 1212, height: 681 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1900
     * @tc.desc   test the packing interface uses HDRVividSingleLayer.heic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let isSupportFormat = isSupportImageFormat("HDRVividSingleLayer.heic", "image/heic");
        if (!isSupportFormat) {
          console.info("device is not support imageformat heic");
          done();
        } else {
          let pixelMapList = createPixelMapList(done, "HDRVividSingleLayer.heic");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 1,
            delayTimeList: [10],
            disposalTypes: [3],
            loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_STATIC_1900",
            { width: 3840, height: 2160 }, packingOptions, pixelMapList)
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0100
     * @tc.desc   test the packing interface passed wrong frameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 0, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0100",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0200
     * @tc.desc   test the packing interface passed wrong delayTimeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [0], disposalTypes: [3, 1, 0], loopCount: 5
        };
        testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0200",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0300
     * @tc.desc   test the packing interface passed wrong disposalTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 4, 5], loopCount: 5
        };
        testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0300",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0400
     * @tc.desc   test the packing interface passed wrong loopCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: -1
        };
        testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0400",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0500
     * @tc.desc   test the packing interface passed wrong loopCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList = createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 65536
        };
        testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_STATIC_0500",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAPLIST_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAPLIST_ERROR_STATIC_0100
     * @tc.desc   test the packingMultiFrames interface passed empty pixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAPLIST_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let pixelMapList: Array<image.PixelMap> = [];
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAPLIST_ERROR_STATIC_0100",
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });
  })
}
