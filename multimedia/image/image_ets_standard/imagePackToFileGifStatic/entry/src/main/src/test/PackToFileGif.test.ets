/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import fs from '@ohos.file.fs';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import { BusinessError } from '@ohos.base';
import { initialize } from './AbilityContextHelper.test';

interface TestFile {
  fileName?: string,
  packTarget: string,
  size: image.Size
};

interface  TestFilePack {
  fileName: string,
  packTarget: string,
  size: image.Size,
  packSource: string
}

export default function imagePackToFileGif() {
  describe("imagePackToFileGif", () => {
    let isSupportGifEncode: boolean;
    let filesDir: string | undefined | null;
    let cacheDir: string | undefined | null;
    const ERROR_CODE = 62980115;
    const ERROR_CODE1 = 401;
    const INVALID_FD = -1;

    beforeAll(async () => {
      console.info("beforeAll case");
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      cacheDir = Hypium.get('cacheDir') as string | undefined | null;
      isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
    });

    beforeEach(async () => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    const getImageSourceData = async (fileName: string) => {
      let filePath = ""
      let globalImagesource: image.ImageSource | undefined;
      try {
        filePath = filesDir + "/" + fileName;
        globalImagesource = image.createImageSource(filePath);
        return globalImagesource;
      } catch (error) {
        console.info("getRawFileContent case" + error);
        return undefined;
      }
    }

    const getPixelMapData = async () => {
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 2 as image.PixelMapFormat, size: { height: 4, width: 6 } };
      const Color = new ArrayBuffer(96);
      let globalpixelmap = image.createPixelMapSync(Color, opts);
      return globalpixelmap;
    }

    const getWriteFd = (fileName: string) => {
      let writeFd: int = INVALID_FD;
      try {
        let fPath = cacheDir + "/" + fileName;
        console.info("image getWriteFd fPath is " + fPath);
        let file = fs.openSync(fPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        if (file !== null) {
          console.log(`getWriteFd fd: ${JSON.stringify(file.fd)}`);
          console.info("getWriteFd file fd created");
          writeFd = file.fd as int;
        } else {
          console.info("getWriteFd file fd created error");
        }
      } catch (error) {
        console.info("image getWriteFd " + error);
      }
      return writeFd;
    }

    const isSupportImageFormat = async (fileName: string, format: string) => {
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

    const createPixelMapList = async (done: () => void, picName: string) => {
      console.info("createPixelMapList start");
      let imageSourceApi = await getImageSourceData(picName);
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
          } else {
            console.info("createPixelMapList failed");
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          console.info("createPixelMapList error = " + error);
          expect(false).assertTrue();
          done();
        }
      }
      return pixelMapList;
    }

    const releasePixelMapList = async (pixelMapList: Array<image.PixelMap>) => {
      for (let i = 0; i < pixelMapList.length; i++) {
        if (pixelMapList[i] != undefined) {
          await pixelMapList[i].release();
        }
      }
    }

    const checkPackToFileForSequenceResult = async (imageSource: image.ImageSource,
      packingOptions: image.PackingOptionsForSequence, testFile: TestFile) => {
      let delayTimeListLength = packingOptions.delayTimeList.length;
      let delayTimes = await imageSource.getDelayTimeList();
      let disposalTypes = await imageSource.getDisposalTypeList();
      let loopCount = await imageSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
      expect(loopCount['GIFLoopCount'] != null).assertTrue();
      let GIFloopCount = loopCount['GIFLoopCount'] as string;
      let imageInfo: image.ImageInfo | undefined = imageSource.getImageInfoSync();
      if (imageInfo == undefined) {
        console.log(`getImageInfoSync failed.`);
        expect().assertFail();
      } else {
        console.log(`checkPackToFileForSequenceResult delayTimes ${delayTimes}`);
        console.log(`checkPackToFileForSequenceResult disposalTypes ${disposalTypes}`);
        console.log(`checkPackToFileForSequenceResult loopCount ${loopCount}`);
        console.log(`checkPackToFileForSequenceResult width ${imageInfo.size.width}`);
        console.log(`checkPackToFileForSequenceResult height ${imageInfo.size.height}`);
        expect(imageInfo.size.width == testFile.size.width).assertTrue();
        expect(imageInfo.size.height == testFile.size.height).assertTrue();
        expect(imageInfo.mimeType == "image/gif").assertTrue();
        //对比编码前后�?loopCount
        //GIF编码中设定输出图片循环播放次数的参数，取值范围为[0�?5535]�?表示无限循环, 如果没有此字�? 则设置为默认�?�?
        if (packingOptions.loopCount != undefined) {
          expect(GIFloopCount == `${packingOptions.loopCount}`).assertTrue();
        } else {
          expect(GIFloopCount == `1`).assertTrue();
        }
        //对比编码前后�?delayTimesList。delayTimes 的值编码和解码的单位差10�?
        //GIF编码中设定输出图片每一帧的延迟时间。如果不�?，则此字段指定等待时间为参数�?0.01秒�?
        //如果长度小于frameCount，则缺失的部分将用delayTimeList最后一个值填充�?
        for (let i = 0; i < packingOptions.frameCount; i++) {
          if (i < delayTimeListLength) {
            expect(delayTimes[i] == packingOptions.delayTimeList[i] * 10).assertTrue();
          } else {
            expect(delayTimes[i] == packingOptions.delayTimeList[delayTimeListLength -1] * 10).assertTrue();
          }
        }
        //对比编码前后�?disposalTypes。disposalTypes的有效值是0�?，解码的时�?会变�?�?
        //0：不需要任何操�? 1：保持图形不�? 2：恢复背景色  3：恢复到之前的状态�?
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
    }

    const testPackToFileForSequence = async (done: () => void, testNum: string,
      packingOptions: image.PackingOptionsForSequence, testFile: TestFile) => {
      let pixelMapList: Array<image.PixelMap> = [];
      if (testFile.fileName != undefined) {
        pixelMapList = await createPixelMapList(done, testFile.fileName!!);
      }
      let fpath: string = cacheDir + "/" + testFile.packTarget;
      let writeFd = getWriteFd(testFile.packTarget);
      expect(writeFd != INVALID_FD).assertTrue();
      console.log(`fpath = ` + fpath);
      console.log(`writeFd = ` + writeFd);

      let globalPacker = image.createImagePacker();
      if (globalPacker == undefined) {
        console.log(`${testNum} createImagePacker failed`);
        expect(false).assertTrue();
        done();
      }
      try {
        await globalPacker.packToFileFromPixelmapSequence(pixelMapList, writeFd as int, packingOptions);
        try {
          console.log(`${testNum} testPackToFileForSequence success`);
          let imgSource = image.createImageSource(fpath);
          if (imgSource == undefined) {
            console.log(`${testNum} create pack file imageSource failed.`);
            expect(false).assertTrue();
            done();
          } else {
            await checkPackToFileForSequenceResult(imgSource, packingOptions, testFile);
            await imgSource.release();
            done();
          }
        } catch (e1) {
          console.log("testPackToFileForSequence e1: " + e1);
          expect().assertFail();
          done();
        }
      } catch(error) {
        console.log(`${testNum} error: ` + JSON.stringify(error));
        expect().assertFail();
        done();
      } finally {
        fs.closeSync(writeFd)
        await releasePixelMapList(pixelMapList);
        await globalPacker.release();
      }
    }

    const testPackToFileForSequenceError = async (done: () => void, testNum: string,
      packingOptions: image.PackingOptionsForSequence, testFile: TestFile) => {
      let pixelMapList: Array<image.PixelMap> = [];
      if (testFile.fileName != undefined) {
        await createPixelMapList(done, testFile.fileName!!);
      }
      let fpath: string = cacheDir + "/" + testFile.packTarget;
      let writeFd = getWriteFd(testFile.packTarget);
      expect(writeFd != INVALID_FD).assertTrue();
      console.log(`fpath = ` + fpath);
      console.log(`writeFd = ` + writeFd);

      let globalPacker = image.createImagePacker();
      if (globalPacker == undefined) {
        console.log(`${testNum} createImagePacker failed`);
        expect(false).assertTrue();
        done();
      }
      try {
        await globalPacker.packToFileFromPixelmapSequence(pixelMapList, writeFd as int, packingOptions);
        console.log(`${testNum} packToFileFromPixelmapSequence success`);
        expect(false).assertTrue();
        done();
      } catch(error) {
          error = error as BusinessError;
        console.log(`${testNum} packToFileFromPixelmapSequence error: ` + JSON.stringify(error));
        console.log(`${testNum} packToFileFromPixelmapSequence error.code: ` + error.code);
        expect(error.code == ERROR_CODE1).assertTrue();
        done();
      } finally {
        fs.closeSync(writeFd)
        await releasePixelMapList(pixelMapList);
        await globalPacker.release();
      }
    }

    const checkPackToFileResult = async (filepath: string, testFilePack: TestFilePack) => {
      let imageSource = image.createImageSource(filepath);
      if (imageSource == undefined) {
        console.log(`create pack file imageSource failed.`);
        return false;
      } else {
        let delayTimes: Array<int> = await imageSource.getDelayTimeList();
        let disposalTypes: Array<int> = await imageSource.getDisposalTypeList();
        let loopCount = await imageSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
        let GIFLoopCount = loopCount['GIFLoopCount'];
        let imageInfo = imageSource.getImageInfoSync();
        if (imageInfo == undefined) {
          console.log(`getImageInfoSync failed.`);
          return false;
        }
        console.log(`packGifToFile delayTimes ${delayTimes}`);
        console.log(`packGifToFile disposalTypes ${disposalTypes}`);
        console.log(`packGifToFile loopCount ${loopCount}`);
        console.log(`packGifToFile width ${imageInfo.size.width}`);
        console.log(`packGifToFile height ${imageInfo.size.height}`);
        let result = `${delayTimes}` == `1000` && `${disposalTypes}` == `1` && GIFLoopCount == `0` &&
          imageInfo.size.width == testFilePack.size.width &&
          imageInfo.size.height == testFilePack.size.height &&
          imageInfo.mimeType == "image/gif"
        await imageSource.release();
        return result;
      }
    }

    const packGifToFile = async (done: () => void, testNum: string, source: image.ImageSource | image.PixelMap, fd: int,
      packingOptions: image.PackingOption, fPath: string, type:string,
      testFilePack: TestFilePack) => {
      let globalPacker = image.createImagePacker();
      if (globalPacker == undefined) {
        console.log(`${testNum} createImagePacker failed`);
        expect(false).assertTrue();
        done();
      }
      if (type == "callback") {
        let callbackFunc = (err: BusinessError|null) => {
          try {
            if (err && err.code) {
              console.info(`${testNum} pack fail: ${JSON.stringify(err)}`);
              expect(false).assertTrue();
              done();
            } else {
              let result = checkPackToFileResult(fPath, testFilePack);
              expect(result).assertTrue();
              done();
            }
          } catch(error) {
            console.log(`${testNum} packToFile failed. ${error}`);
          }
        };
        if(testFilePack.packSource == "PixelMap") {
          let pixelmap: image.PixelMap = source as image.PixelMap;
          globalPacker.packToFile(pixelmap, fd, packingOptions, callbackFunc);
          await pixelmap.release();
        } else {
          let imageSource: image.ImageSource = source as image.ImageSource;
          globalPacker.packToFile(imageSource, fd, packingOptions, callbackFunc);
          await imageSource.release();
        }
        fs.closeSync(fd);
        await globalPacker.release();
      } else {
        try {
          if(testFilePack.packSource == "PixelMap") {
            let pixelmap: image.PixelMap = source as image.PixelMap;
            await globalPacker.packToFile(pixelmap, fd, packingOptions);
            await pixelmap.release();
          } else {
            let imageSource: image.ImageSource = source as image.ImageSource;
            await globalPacker.packToFile(imageSource, fd, packingOptions);
            await imageSource.release();
          }
          console.info(`${testNum} packToFile test success`);
          let result = await checkPackToFileResult(fPath, testFilePack);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        } finally {
          fs.closeSync(fd);
          await globalPacker.release();
        }
      }
    }

    const testPackGifToFile = async (done: () => void, testNum: string, packingOptions: image.PackingOption,
      type: string, testFilePack: TestFilePack) => {
      let imageSource: image.ImageSource | undefined = await getImageSourceData(testFilePack.fileName);
      expect(imageSource != undefined).assertTrue();
      let source: image.ImageSource = imageSource! as image.ImageSource;
      let fpath: string = cacheDir + "/" + testFilePack.packTarget;
      let writeFd = getWriteFd(testFilePack.packTarget);
      expect(writeFd != INVALID_FD).assertTrue();
      if (testFilePack.packSource == "PixelMap") {
        let globalpixelmap = await source.createPixelMap();
        if (globalpixelmap != undefined) {
          await packGifToFile(done, testNum, globalpixelmap, writeFd, packingOptions, fpath, type, testFilePack);
        }
      } else {
        await packGifToFile(done, testNum, source, writeFd, packingOptions, fpath, type, testFilePack);
      }
    }

    const packToFileCbErr = async (done: () => void, testNum: string, source: image.ImageSource | image.PixelMap, type: string, fd: int,
      ops: image.PackingOption) => {
      let globalPacker: image.ImagePacker | undefined;
      try {
        globalPacker = image.createImagePacker();
        expect(globalPacker != undefined).assertTrue();
        if (globalPacker == undefined) {
          expect(false).assertTrue();
          done();
          return;
        }
        if(type == "PixelMap") {
          let pixelmap: image.PixelMap = source as image.PixelMap;
          await globalPacker!.packToFile(pixelmap, fd, ops);
          await pixelmap.release();
        } else {
          let imageSource: image.ImageSource = source as image.ImageSource;
          await globalPacker!.packToFile(imageSource, fd, ops);
          await imageSource.release();
        }
        expect(false).assertTrue();
        console.info(`${testNum} packToFile test`);
        done();
      } catch (error) {
          error = error as BusinessError;
        console.log("packToFileCallback error: " + error);
        console.info(`${testNum} pack failerr: ${JSON.stringify(error)}`);
        console.info(`${testNum} pack failerr: ${error.code}`);
        expect(error.code == ERROR_CODE).assertTrue();
        done();
      } finally {
        fs.closeSync(fd);
        await globalPacker!.release();
      }
    }

    const packToFilePromiseErr = async (done: () => void, testNum: string, source: image.ImageSource | image.PixelMap, type: string, fd: int,
      ops: image.PackingOption) => {
      let globalPacker: image.ImagePacker;
      try {
        globalPacker = image.createImagePacker();
        expect(globalPacker != undefined).assertTrue();
        if (globalPacker == undefined) {
          expect(false).assertTrue();
          done();
          return;
        }
        try {
          if(type == "PixelMap") {
            let pixelmap: image.PixelMap = source as image.PixelMap;
            await globalPacker.packToFile(pixelmap, fd, ops);
            await pixelmap.release();
          } else {
            let imageSource: image.ImageSource = source as image.ImageSource;
            await globalPacker.packToFile(imageSource, fd, ops);
            await imageSource.release();
          }
          expect(false).assertTrue();
          console.info(`${testNum} packToFile test`);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
          console.info(`${testNum} pack failerr: ${error.code}`);
          expect(error.code == ERROR_CODE).assertTrue();
          done();
        } finally {
          fs.closeSync(fd);
          await globalPacker.release();
        }
      } catch (error) {
        console.log("packToFilePromise error: " + error);
        expect().assertFail();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0100
     * @tc.desc   test the packToFile interface uses many PixelMaps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_multiFrames.gif", size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0100",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0200
     * @tc.desc   test the packToFile interface uses PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0200", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.png", packTarget: "pack_oneFrame.gif", size: { width: 6016, height: 3384 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0200",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0300
     * @tc.desc   test the packToFile interface configuration delaytimes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0300", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_no_loop.gif", size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [200], disposalTypes: [3, 1, 0]
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0300",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0400
     * @tc.desc   test the packToFile interface configuration loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0400", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.png", packTarget: "pack_no_disposalTypes.gif", size: { width: 6016, height: 3384 }
        }
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], loopCount: 4
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0400",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0500
     * @tc.desc   test the packToFile interface no disposalTypes and no loopCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0500", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif",
          packTarget: "pack_no_disposalTypes_no_loopCount.gif",
          size: { width: 198, height: 202 }
        }
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10]
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0500",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0600
     * @tc.desc   test the packToFile interface frameCount less than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0600", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_less_frameCount.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0600",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0700
     * @tc.desc   test the packToFile interface frameCount more than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0700", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_more_frameCount.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 5, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0700",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0800
     * @tc.desc   test the packToFile interface delayTimeList less than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0800", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_less_delayTimeList.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0800",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0900
     * @tc.desc   test the packToFile interface delayTimeList more than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0900", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_more_delayTimeList.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10, 20, 30], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_0900",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1000
     * @tc.desc   test the packToFile interface disposalTypes less than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1000", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_less_disposalTypes.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1000",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1100
     * @tc.desc   test the packToFile interface disposalTypes more than PixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1100", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_more_disposalTypes.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 2, 1, 0], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1100",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1200
     * @tc.desc   test the packToFile interface uses test.bmp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1200", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.bmp", packTarget: "pack_oneFrame_bmp.gif", size: { width: 1399, height: 1042 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1200",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1300
     * @tc.desc   test the packToFile interface uses test.jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1300", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.jpg", packTarget: "pack_oneFrame_jpg.gif", size: { width: 1446, height: 1476 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1300",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1400
     * @tc.desc   test the packToFile interface uses test.ico
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1400", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.ico", packTarget: "pack_oneFrame_ico.gif", size: { width: 64, height: 64 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1400",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1500
     * @tc.desc   test the packToFile interface uses test.svg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1500", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.svg", packTarget: "pack_oneFrame_svg.gif", size: { width: 400, height: 200 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1500",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1600
     * @tc.desc   test the packToFile interface uses test.dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1600", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.dng", packTarget: "pack_oneFrame_dng.gif", size: { width: 5976, height: 3992 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1600",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1700
     * @tc.desc   test the packToFile interface uses test.jpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1700", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.jpeg", packTarget: "pack_oneFrame_jpeg.gif", size: { width: 3072, height: 4096 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1700",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1800
     * @tc.desc   test the packToFile interface uses test.webp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1800", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "test.webp", packTarget: "pack_oneFrame_webp.gif", size: { width: 1212, height: 681 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
        };
        await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1800",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1900
     * @tc.desc   test the packToFile interface uses HDRVividSingleLayer.heic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1900", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let isSupportFormat = await isSupportImageFormat("HDRVividSingleLayer.heic", "image/heic");
        if (!isSupportFormat) {
          console.info("device is not support imageformat heic");
          expect(!isSupportFormat).assertTrue();
          done();
        } else {
          let testFile: TestFile = {
            fileName: "HDRVividSingleLayer.heic", packTarget: "pack_oneFrame_heic.gif",
            size: { width: 3840, height: 2160 }
          };
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 1, delayTimeList: [100], disposalTypes: [3], loopCount: 5
          };
          await testPackToFileForSequence(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_STATIC_1900",
            packingOptions, testFile);
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0100
     * @tc.desc   test the packToFile interface passed wrong frameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_wrong_frameCount.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 0, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0100",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0200
     * @tc.desc   test the packToFile interface passed wrong delayTimeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0200", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_wrong_delayTimeList.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [0], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0200",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0300
     * @tc.desc   test the packToFile interface passed wrong disposalTypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0300", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_wrong_disposalTypes.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 4, 5], loopCount: 5
        };
        await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0300",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0400
     * @tc.desc   test the packToFile interface passed wrong loopCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0400", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_wrong_loopCount_1.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: -1
        };
        await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0400",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0500
     * @tc.desc   test the packToFile interface passed wrong loopCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0500", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: "moving_test.gif", packTarget: "pack_wrong_loopCount_65536.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 65536
        };
        await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILEFORSEQUENCE_ERROR_STATIC_0500",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_STATIC_0100
     * @tc.desc   test the packToFile interface passed empty pixelMapList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(!isSupportGifEncode).assertTrue();
        done();
      } else {
        let testFile: TestFile = {
          fileName: undefined, packTarget: "pack_multiFrames_err_0100.gif",
          size: { width: 198, height: 202 }
        };
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
        };
        await testPackToFileForSequenceError(done, "SUB_MULTIMEDIA_IMAGE_PACKTOFILE_PIXELMAPLIST_ERROR_STATIC_0100",
          packingOptions, testFile);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0100
     * @tc.desc   sub_multimedia_image_packToFile_callback_pixelmap_err_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      let globalpixelmap = await getPixelMapData()
      expect(globalpixelmap != undefined).assertTrue();
      let fpath: string = cacheDir + "/" + "pack_multiFrames_err_001.gif";
      let writeFd = getWriteFd("pack_multiFrames_err_001.gif")
      expect(writeFd != INVALID_FD).assertTrue();
      expect(fpath != undefined).assertTrue();
      let ops: image.PackingOption = { format: "image/gif", quality: 101 };
      await packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0100",
        globalpixelmap, "PixelMap", writeFd, ops)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300
     * @tc.desc   sub_multimedia_image_packToFile_promise_pixelmap_err_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300", Level.LEVEL0, async (done: () => void) => {
      let globalpixelmap = await getPixelMapData()
      expect(globalpixelmap != undefined).assertTrue();
      let fpath: string = cacheDir + "/" + "pack_multiFrames_err_003.gif";
      let writeFd = getWriteFd("pack_multiFrames_err_003.gif")
      expect(writeFd != INVALID_FD).assertTrue();
      expect(fpath != undefined).assertTrue();
      let ops: image.PackingOption = { format: "image/gif", quality: 101 };
      await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300",
        globalpixelmap, "PixelMap", writeFd, ops)
    });
  });
}