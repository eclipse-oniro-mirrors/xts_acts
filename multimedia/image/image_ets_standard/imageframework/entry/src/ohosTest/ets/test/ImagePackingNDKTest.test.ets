/*
// @ts-nocheck
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import fileio from "@ohos.fileio";
import fs from '@ohos.file.fs';
import ndkTest from 'libentry.so'
import image from "@ohos.multimedia.image";
import { common } from '@kit.AbilityKit';
import { camera } from '@kit.CameraKit';

const CODE_SUCCESS = 0;
const ERR_CODE = 62980115;
const ERR_CODE1 = 401;
let pictureFd: number;

function logger(caseName: string): ESObject {
  return {
    myName: caseName,
    log: (msg: string) => console.info(caseName + ' ' + msg)
  };
}

interface PackingOption_format {
  format: string;
}

interface PackingOption_quality {
  quality: number;
}

async function getWriteFd(fileName: string) {
  let fdNumber: number;
  let filePath: string;
  try {
    let uiContext: common.UIAbilityContext = globalThis.uiContext;
    let filePath: string = await uiContext.filesDir + "/" + fileName;
    console.info("image getWriteFd filePath is " + filePath);
    let fdNumber: number = fileio.openSync(filePath, 0o102, 0o666);
    console.log(`getWriteFd fd: ${JSON.stringify(fdNumber)}`);
    if (fdNumber !== null) {
      console.info("getWriteFd file fd created");
    } else {
      console.info("getWriteFd file fd created error");
    }
    fdNumber = fileio.openSync(filePath, 0o2002, 0o666);
    console.log(`getWriteFd fd-re: ${JSON.stringify(fdNumber)}`);
    if (fdNumber !== null) {
      console.info("getWriteFd file fd opened : Append Mode");
    } else {
      console.info("getWriteFd file fd opened : Append Mode failed");
    }
    return [filePath, fdNumber];
  } catch (error) {
    console.info("image getWriteFd " + error);
    return [filePath!, fdNumber!];
  }
}

async function getreadFd(pictureName: string) {
  let uiContext: common.UIAbilityContext = globalThis.uiContext;
  let picturePath: string;
  picturePath = uiContext.filesDir + "/" + pictureName;
  console.info(' image case filePath is ' + picturePath);
  let file = fs.openSync(picturePath);
  pictureFd = file.fd;
  console.info(" image case open fd success " + pictureFd);
}

function checkNdkRes(res: ndkTest.imagePacker) {
  expect(res != undefined).assertTrue();
  expect(res.code == CODE_SUCCESS).assertTrue();
}

async function createTest(done: Function, testNum: string) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create()
    checkNdkRes(packer)
    expect(packer.result != undefined).assertTrue();
    log.log("packer create finished");
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function createTestImageSource(picName: string): Promise<image.ImageSource> {
  let result: image.ImageSource;
  try {
    let uiContext: common.UIAbilityContext = AppStorage.Get('thisContext') as common.UIAbilityContext;
    console.error("Failed to get rHUIaw file content:  " + JSON.stringify(uiContext));
    const rawFile = await uiContext.resourceManager.getRawFileContent(picName);
    console.error("Failed to get rFEIaw file content:  " + JSON.stringify(rawFile));
    const ImageSource: image.ImageSource = image.createImageSource(rawFile.buffer);
    return ImageSource;
  } catch (error) {
    console.error("Failed to get raw file content:  " + error.message + error.code);
  }
  return result!;
}

async function createTestPixelMap() {
  const Color = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
  return await image.createPixelMap(Color, opts)
}


async function packToDataTest(done: Function, testNum: string, source: image.ImageSource | image.PixelMap,
  packOpts: image.PackingOption | PackingOption_format | PackingOption_quality) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create();
    if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
      log.log("packer create failed");
      expect().assertFail();
      done();
      return;
    }
    let packingRes = ndkTest.packToData(packer.result, source, packOpts);
    expect(packingRes).assertEqual(0)
    log.log("packer packingRes " + JSON.stringify(packingRes));
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function packToFileTest(done: Function, testNum: string, source: image.ImageSource | image.PixelMap,
  writeFd: number, packOpts: image.PackingOption | PackingOption_format | PackingOption_quality) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create();
    if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
      log.log("packer create failed");
      expect().assertFail();
      done();
      return;
    }

    let packingRes = ndkTest.packToFile(packer.result, source, writeFd, packOpts);
    log.log(`packingRes : ${JSON.stringify(packingRes)}`);
    expect(packingRes).assertEqual(0)
    ndkTest.release(packer.result);
    packer.result.release();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function checkPackForSequenceResult(done: Function, imageSourceApi: image.ImageSource, packConfig: ESObject) {
  if (imageSourceApi == undefined) {
    console.info(' create image source failed');
    expect(false).assertTrue();
    done();
    return;
  } else {
    let delayTimeListLength: number = packConfig.option.delayTimes.length;
    let delayTimes = await imageSourceApi.getDelayTimeList();
    let disposalTypes = await imageSourceApi.getDisposalTypeList();
    let loopcount = await imageSourceApi.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
    let imageInfo = imageSourceApi.getImageInfoSync();
    console.info(`checkPackForSequenceResult delayTimes ${delayTimes}`);
    console.info(`checkPackForSequenceResult disposalTypes ${disposalTypes}`);
    console.info(`checkPackForSequenceResult loopcount = ${loopcount}`);
    console.info(`checkPackForSequenceResult width = ${imageInfo.size.width}`);
    console.info(`checkPackForSequenceResult height = ${imageInfo.size.height}`);
    expect(imageInfo.size.width == 600).assertTrue();
    expect(imageInfo.size.height == 400).assertTrue();
    expect(imageInfo.mimeType == "image/gif").assertTrue();
    if (packConfig.loop != undefined) {
      expect(loopcount.GIFLoopCount == packConfig.loop).assertTrue();
    } else {
      expect(loopcount.GIFLoopCount == '1').assertTrue();
    }
    for (let i = 0; i < packConfig.frameCount; i++) {
      if (i < delayTimeListLength) {
        expect(delayTimes[i] == packConfig.option.delayTimes[i] * 10).assertTrue();
      } else {
        expect(delayTimes[i] == packConfig.option.delayTimes[delayTimeListLength -1] * 10).assertTrue();
      }
    }
    if (packConfig.option.disposalTypes != undefined) {
      for (let i = 0; i < packConfig.frameCount; i++) {
        if (i < packConfig.option.disposalTypes.length) {
          if (packConfig.option.disposalTypes[i] == 0) {
            expect(disposalTypes[i] == 1).assertTrue;
          } else {
            expect(disposalTypes[i] == packConfig.option.disposalTypes[i]).assertTrue;
          }
        } else {
          expect(disposalTypes[i] == 1).assertTrue;
        }
      }
    }
    await imageSourceApi.release();
    done();
  }
}

async function checkPackGifResult(res: ndkTest.imagePacker, packedFile: string | image.ImagePacker,
  packConfig: ESObject) {
  expect(res != undefined).assertTrue();
  expect(res.code == CODE_SUCCESS).assertTrue();
  let imageSource = image.createImageSource(packedFile as string);
  if (imageSource == undefined) {
    console.log(`create pack file imageSource failed.`);
    expect(false).assertTrue();
  } else {
    let delayTimes = await imageSource.getDelayTimeList();
    let disposalTypes = await imageSource.getDisposalTypeList();
    let loopCount = await imageSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
    let imageInfo = imageSource.getImageInfoSync();
    console.log(`packGifToFile delayTimes ${delayTimes}`);
    console.log(`packGifToFile disposalTypes ${disposalTypes}`);
    console.log(`packGifToFile loopCount ${loopCount}`);
    console.log(`packGifToFile width ${imageInfo.size.width}`);
    console.log(`packGifToFile height ${imageInfo.size.height}`);
    let delayTimesArray: number[] = new Array(delayTimes.length).fill(1000);
    let disposalTypesArray: number[] = new Array(disposalTypes.length).fill(1);
    expect(JSON.stringify(delayTimes) == JSON.stringify(delayTimesArray)).assertTrue();
    expect(JSON.stringify(disposalTypes) == JSON.stringify(disposalTypesArray)).assertTrue();
    expect(loopCount.GIFLoopCount == '0').assertTrue();
    expect(imageInfo.size.width == packConfig.size.width).assertTrue();
    expect(imageInfo.size.height == packConfig.size.height).assertTrue();
    expect(imageInfo.mimeType == "image/gif").assertTrue();
    await imageSource.release();
  }
}

interface packConfig_size {
  width: number;
  height: number;
}

interface delayTimes_alone {
  delayTimes: number[];
}

interface packConfig_options {
  delayTimes: number[];
  disposalTypes: number[];
}

function isSupportedCameras(): boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context: common.UIAbilityContext =
    AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext

  let isSupportedCameras = true;
  let isSupportedCameraManager = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info('Enter getCameraManagerInstance');
  try {
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info("getCameraManager FAILED");
      isSupportedCameraManager = false;
      return isSupportedCameraManager;
    }
    console.info('Exit getCameraManagerInstance');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      isSupportedCameras = false;
    }
  } catch (err) {
    console.error("getCameraManager FAILED. errorMessage:", err);
    isSupportedCameraManager = false;
    return isSupportedCameraManager;
  }
  if (cameraAvailable && isSupportedCameras) {
    isSupportedCameraManager = true;
  } else {
    isSupportedCameraManager = false;
  }
  return isSupportedCameraManager;
}

export default function ImagePackingNDKTest() {
  describe('ImagePackingNDKTest', () => {
    const WIDTH = 1280;
    const HEIGHT = 960;
    const CAPACITY = 8;
    let isSupportedCamerasResult = isSupportedCameras();
    let isSupportGifEncode: boolean;

    beforeAll(() => {
      if (!isSupportedCamerasResult) {
        return;
      }
      console.info('beforeAll case');
      isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100
     * @tc.desc   1.packingtestndk create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100");
        let packer = ndkTest.create();
        if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
          log.log("packer create failed");
          expect().assertFail();
          done();
          return;
        }
        let releaseRes = ndkTest.release(packer.result);
        expect(releaseRes).assertEqual(0)
        done();
      } catch (error) {
        console.error("Test exception " + error);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0100
     * @tc.desc   1.create image receiver options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0100', Level.LEVEL0, async (done: Function) => {
      let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100");
      if (!isSupportedCamerasResult) {
        console.info('Failed to obtain the default camera or device object.Not support usb camera');
        done();
        return;
      }
      let mlg: ESObject = logger("SUB_MULTIMEDIA_IMAGE_RECEIVERNDK_RELEASE_0100");
      try {
        let options: number = ndkTest.JsCreateImageReceiverOptions(WIDTH, HEIGHT, CAPACITY);
        let myReceiver: image.ImageReceiver = ndkTest.JsCreateImageReceiver(options);
        log.log("packer huifei111 " + myReceiver);
        expect(myReceiver).assertEqual(0)
        mlg.log("Can't recreate receiver, case success.");
        done();
      } catch (error) {
        mlg.log("Test exception " + error);
        expect().assertFail();
        done();
      }
    });
  })
}


