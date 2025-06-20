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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import fileio from "@ohos.fileio";
import fs from '@ohos.file.fs';
import ndkTest from 'libentry.so'
import  image  from "@ohos.multimedia.image";
import { common } from '@kit.AbilityKit';

const CODE_SUCCESS = 0;
const ERR_CODE = 62980115;
const ERR_CODE1 = 401;
let pictureFd: number ;

function logger(caseName: string): ESObject{
  return {
    myName: caseName,
    log: (msg: string) => console.info(caseName + ' ' + msg) // Use arrow function
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
    let filePath: string = await uiContext.filesDir+"/" + fileName;
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
    return [filePath,fdNumber];
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
    let uiContext: common.UIAbilityContext = globalThis.uiContext;
    const rawFile = await uiContext.resourceManager.getRawFileContent(picName);
    const  ImageSource: image.ImageSource = image.createImageSource(rawFile.buffer);
    return ImageSource;
  } catch (error) {
    console.error("Failed to get raw file content:  " + error.message);
  }
  return result!;
}

async function createTestPixelMap() {
  const Color = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: 2, size: { height: 4, width: 6 } };
  return await image.createPixelMap(Color, opts)
}


async function packToDataTest(done: Function, testNum: string, source: image.ImageSource | image.PixelMap,
  packOpts: image.PackingOption| PackingOption_format | PackingOption_quality) {
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
     checkNdkRes(packingRes);
     expect(packingRes.result != undefined).assertTrue();
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
    checkNdkRes(packingRes);
    ndkTest.release(packer.result);
    packer.result.release();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function nativeInitTest(done: Function, testNum: string) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create()
    if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
      log.log("packer create failed");
      expect().assertFail();
      done();
      return
    }
    let initRes = ndkTest.initNative(packer.result);
    checkNdkRes(initRes);
    log.log("packer init native finished");
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function releaseTest(done: Function, testNum: string) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create();
    if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
      log.log("packer create failed");
      expect().assertFail();
      done();
      return;
    }
    let releaseRes = ndkTest.release(packer.result);
    checkNdkRes(releaseRes);
    log.log("release result " + releaseRes.code);
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function packToDataErrTest(done: Function, testNum: string, source: image.ImageSource,
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
    log.log("packer packingRes.result " + JSON.stringify(packingRes));
    expect(packingRes.code == ERR_CODE).assertTrue();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function packToFileErrTest(done: Function, testNum: string, source: image.ImageSource, writeFd: number,
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
    let packingRes = ndkTest.packToFile(packer.result, source, writeFd, packOpts);
    log.log(`packingRes : ${JSON.stringify(packingRes)}`);
    expect(packingRes.code == ERR_CODE).assertTrue();
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
    //对比编码前后的 loopCount
    //GIF编码中设定输出图片循环播放次数的参数，取值范围为[0，65535]。0表示无限循环, 如果没有此字段, 则设置为默认值1；
    if (packConfig.loop != undefined) {
      expect(loopcount.GIFLoopCount == packConfig.loop).assertTrue();
    } else {
      expect(loopcount.GIFLoopCount == '1').assertTrue();
    }
    //对比编码前后的 delayTimesList。delayTimes 的值编码和解码的单位差10倍
    //GIF编码中设定输出图片每一帧的延迟时间。如果不是0，则此字段指定等待时间为参数值*0.01秒。
    //如果长度小于frameCount，则缺失的部分将用delayTimeList最后一个值填充。
    for (let i = 0; i < packConfig.frameCount; i++) {
      if (i < delayTimeListLength) {
        expect(delayTimes[i] == packConfig.option.delayTimes[i] * 10).assertTrue();
      } else {
        expect(delayTimes[i] == packConfig.option.delayTimes[delayTimeListLength -1] * 10).assertTrue();
      }
    }
    //对比编码前后的 disposalTypes。disposalTypes的有效值是0～3，解码的时候0会变成1。
    //0：不需要任何操作  1：保持图形不变  2：恢复背景色  3：恢复到之前的状态。
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

async function testPackToFileForSequenceNdk(done: Function, testNum: string, packConfig: ESObject) {
  let mlg: ESObject = logger(testNum);
  let path: string, fd: number;
  let variable = await getWriteFd(packConfig.packTarget);
  path = variable[0] as string;
  fd = variable[1] as number;
  mlg.log(`path: ${path}, fd: ${fd}`);
  let ret = ndkTest.JsPackToFileMultiFrames(packConfig.option, fd, packConfig.frameCount, packConfig.loop);
  mlg.log("ret : " + ret);
  fs.closeSync(fd);
  if (ret.code == CODE_SUCCESS) {
    mlg.log('JsPackToFileMultiFrames success');
    await getreadFd(packConfig.packTarget);
    const imageSourceApi = image.createImageSource(pictureFd);
    await checkPackForSequenceResult(done, imageSourceApi, packConfig);
  } else {
    mlg.log('JsPackToFileMultiFrames failed');
    expect(false).assertTrue();
    done();
  }
}

async function testPackToFileForSequenceNdkError(done: Function, testNum: string, packConfig: ESObject) {
  let mlg: ESObject = logger(testNum);
  let path: string, fd: number;
  let variable = await getWriteFd(packConfig.packTarget);
  path = variable[0] as string;
  fd = variable[1] as number;
  mlg.log(`path: ${path}, fd: ${fd}`);
  try {
    let ret = ndkTest.JsPackToFileMultiFrames(packConfig.option, fd, packConfig.frameCount, packConfig.loop);
    mlg.log(`ret.code : ${JSON.stringify(ret.code)}`)
    expect(ret.code == ERR_CODE1).assertTrue();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function testPackToFileForSequenceNdkBadParameter(done: Function, testNum: string, packConfig: ESObject) {
  let mlg: ESObject = logger(testNum);
  let path: string, fd: number;
  let variable = await getWriteFd(packConfig.packTarget);
  path = variable[0] as string;
  fd = variable[1] as number;
  mlg.log(`path: ${path}, fd: ${fd}`);
  try {
    let ret = ndkTest.JsPackToFileMultiFramesError(packConfig.option, fd, packConfig.frameCount, packConfig.loop,
      packConfig.mode);
    mlg.log(`ret.code : ${JSON.stringify(ret.code)}`)
    expect(ret.code == ERR_CODE1).assertTrue();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function testPackToDataForSequenceNdk(done: Function, testNum: string, packConfig: ESObject) {
  let mlg: ESObject = logger(testNum);
  let ret = ndkTest.JsPackToDataMultiFrames(packConfig.loop, packConfig.option, packConfig.frameCount);
  if (ret.code == CODE_SUCCESS && ret.result != undefined) {
    mlg.log('JsPackToDataMultiFrames success');
    const imageSourceApi = image.createImageSource(ret.result);
    await checkPackForSequenceResult(done, imageSourceApi, packConfig);
  } else {
    mlg.log('JsPackToDataMultiFrames failed');
    expect(false).assertTrue();
    done();
  }
}

async function testPackToDataForSequenceNdkError(done: Function, testNum: string, packConfig: ESObject) {
  let mlg: ESObject = logger(testNum);
  try {
    let ret = ndkTest.JsPackToDataMultiFrames(
      packConfig.loop, packConfig.option, packConfig.frameCount);
    mlg.log(`ret.code : ${JSON.stringify(ret.code)}`)
    expect(ret.code == ERR_CODE1).assertTrue();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function testPackToDataForSequenceNdkBadParameter(done: Function, testNum: string, packConfig: ESObject) {
  let mlg: ESObject = logger(testNum);
  try {
    let ret = ndkTest.JsPackToDataMultiFramesError(
        packConfig.loop, packConfig.option, packConfig.frameCount, packConfig.mode);
    mlg.log(`ret.code : ${JSON.stringify(ret.code)}`)
    expect(ret.code == ERR_CODE1).assertTrue();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function checkPackGifResult(res: ndkTest.imagePacker, packedFile: string | image.ImagePacker, packConfig: ESObject) {
  expect(res != undefined).assertTrue();
  expect(res.code == CODE_SUCCESS).assertTrue();
  let imageSource = image.createImageSource(packedFile as string);
  if (imageSource == undefined) {
    console.log(`create pack file imageSource failed.`);
    expect(false).assertTrue();
  } else {
    let delayTimes= await imageSource.getDelayTimeList();
    let disposalTypes= await imageSource.getDisposalTypeList();
    let loopCount= await imageSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
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

async function packGifToFile(done: Function, testNum: string, source: image.ImageSource | image.PixelMap, path: string, 
  fd: number, packOpts: image.PackingOption | PackingOption_format | PackingOption_quality, packConfig: ESObject) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create();
    if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
      log.log("packer create failed");
      expect().assertFail();
      done();
    }
    let packingRes = ndkTest.packToFile(packer.result, source, fd, packOpts);
    log.log(`packingRes : ${JSON.stringify(packingRes)}`);
    ndkTest.release(packer.result);
    packer.result.release();
    fileio.closeSync(fd);
    await checkPackGifResult(packingRes, path, packConfig);
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function packGifToFileError(done: Function, testNum: string, source: image.ImageSource | image.PixelMap, 
  path: string, fd: number, packOpts: image.PackingOption | PackingOption_format | PackingOption_quality) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create()
    if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
        log.log("packer create failed");
        expect().assertFail();
        done();
    }
    let packingRes = ndkTest.packToFile(packer.result, source, fd, packOpts);
    log.log("packer packingRes.result " + JSON.stringify(packingRes));
    expect(packingRes.code == ERR_CODE).assertTrue();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function packGifToData(done: Function, testNum: string, source: image.ImageSource | image.PixelMap,
  packOpts: image.PackingOption | PackingOption_format | PackingOption_quality, packConfig: ESObject) {
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
     expect(packingRes.result != undefined).assertTrue();
     await checkPackGifResult(packingRes, packingRes.result, packConfig);
     done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function packGifToDataError(done: Function, testNum: string, source: image.ImageSource | image.PixelMap,
  packOpts: image.PackingOption | PackingOption_format | PackingOption_quality) {
  try {
    let log: ESObject = logger(testNum);
    let packer = ndkTest.create()
    if (packer == undefined || packer.code != CODE_SUCCESS || packer.result == undefined) {
      log.log("packer create failed");
      expect().assertFail();
      done();
      return
    }
    let packingRes = ndkTest.packToData(packer.result, source, packOpts);
    log.log("packer packingRes.result " + JSON.stringify(packingRes));
    expect(packingRes.code == ERR_CODE).assertTrue();
    done();
  } catch (error) {
    console.error("Test exception " + error);
    expect().assertFail();
    done();
  }
}

async function testPackGifToFile(done: Function, testNum: string, packConfig: ESObject) {
   let imageSource: image.ImageSource = await createTestImageSource(packConfig.sourceFileName);
   expect(imageSource != undefined).assertTrue();
   console.info(testNum + " create imageSource " + (imageSource != undefined));
   let source: image.ImageSource | image.PixelMap = imageSource;
   if (packConfig.packSource == "PixelMap") {
     try {
       source = await imageSource.createPixelMap();
       expect(source != undefined).assertTrue();
       console.info(testNum + " create pixel map " + (source != undefined));
     } catch (error) {
       console.info(testNum + " createPixelMap error " + error);
     }
   }
   let packOpts: image.PackingOption = {
     format: "image/gif", quality: 100
   };
   if (packConfig.packTarget == "Data") {
     await packGifToData(done, testNum, source, packOpts, packConfig);
   } else {
     let path: string, fd: number;
     let variable = await getWriteFd(packConfig.packTarget);
     path = variable[0] as string;
     fd = variable[1] as number;
     expect(fd != undefined).assertTrue();
     await packGifToFile(done, testNum, source, path, fd, packOpts, packConfig);
   }
}

async function testPackGifToFileError(done: Function, testNum: string, 
  packOpts: image.PackingOption | PackingOption_format, packConfig: ESObject) {
  let imageSource: image.ImageSource = await createTestImageSource(packConfig.sourceFileName);
  expect(imageSource != undefined).assertTrue();
  console.info(testNum + " create imageSource " + (imageSource != undefined))
  let source: image.ImageSource | image.PixelMap = imageSource;
  if (packConfig.packSource == "PixelMap") {
      try {
        source = await imageSource.createPixelMap();
        expect(source != undefined).assertTrue();
        console.info(testNum + " create pixel map " + (source != undefined))
      } catch (error) {
          console.info(testNum + " createPixelMap error " + error)
      }
  }
  
  if (packConfig.packTarget == "Data") {
      await packGifToDataError(done, testNum, source, packOpts);
  } else {
    let path: string, fd: number;
    let variable = await getWriteFd(packConfig.packTarget);
    path = variable[0] as string;
    fd = variable[1] as number;
    expect(fd != undefined).assertTrue();
      await packGifToFileError(done, testNum, source, path, fd, packOpts);
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

export default function ImagePackingNDKTest() {
  describe('ImagePackingNDKTest', () => {
    let isSupportGifEncode: boolean;

    beforeAll(() => {
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_CREATE_0100
     * @tc.name      : sub_multimedia_image_packerndk_create
     * @tc.desc      : 1.packingtestndk create
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_CREATE_0100', 0, async (done: Function) => {

      await createTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_CREATE_0100");
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_INIT_NATIVE_0100
     * @tc.name      : sub_multimedia_image_packerndk_native_init
     * @tc.desc      : 1.packingtestndk create
     *                 2.packingtestndk native init
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_INIT_NATIVE_0100', 0, async (done: Function) => {
      await nativeInitTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_INIT_NATIVE_0100");
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_DATA_0100
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_jpg_data
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *                 3.packing image source to array buffer-jpeg
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_DATA_0100', 0, async (done: Function) => {
      let source: image.ImageSource = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: 100
      };
      await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_DATA_0100",source, packOpts);
      await source.release();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_into_jpg_file
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source into a writtable file-jpeg
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100', 0, async (done: Function) => {
      let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100");
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_image_source.jpg");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: 100
      };
      await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_JPG_FILE_0100", source, fd, packOpts);
      fileio.closeSync(fd);
      log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`);
      let size = fileio.statSync(path).size;
      expect(size != 0).assertTrue();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_DATA_0200
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_webp_data
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-webp
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_DATA_0200', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format:"image/webp",
        quality: 100
      };
      await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_DATA_0200", source, packOpts);
      await source.release();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_into_webp_file
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source into a writtable file-webp
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200', 0, async (done: Function) => {
      let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200");
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      console.log('image source ' + (source != undefined));
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_image_source.webp");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_WEBP_FILE_0200", source, fd, packOpts);
      fileio.closeSync(fd);
      log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`);
      let size = fileio.statSync(path).size;
      expect(size != 0).assertTrue();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_DATA_0300
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_png_data
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-png
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_DATA_0300', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/png", quality: 100
      };
      await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_DATA_0300", source,
        packOpts);
      await source.release();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_into_png_file
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source into a writtable file-png
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300', 0, async (done: Function) => {
      let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300");
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_image_source.png");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/png", quality: 100
      };
      await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_PNG_FILE_0300", source, fd,
        packOpts);
      fileio.closeSync(fd);
      log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`);
      let size = fileio.statSync(path).size;
      expect(size != 0).assertTrue();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_DATA_0400
     * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_to_jpg_data
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixelmap to array buffer-jpg
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_DATA_0400', 0, async (done: Function) => {
      let source = await createTestPixelMap();
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: 100
      };
      await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_DATA_0400", source, packOpts);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400
     * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_into_jpg_file
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixelmap into a writtable file-jpg
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400', 0, async (done: Function) => {
      let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400");
      let source = await createTestPixelMap();
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_pixel_map.jpg");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: 100
      };
      await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_JPG_FILE_0400", source, fd,  packOpts);
      fileio.closeSync(fd);
      log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`);
      let size = fileio.statSync(path).size;
      expect(size != 0).assertTrue();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_DATA_0500
     * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_to_webp_data
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixelmap to array buffer-webp
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_DATA_0500', 0, async (done: Function) => {
      let source = await createTestPixelMap();
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_DATA_0500", source, packOpts);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500
     * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_into_webp_file
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixelmap into a writtable file-webp
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500', 0, async (done: Function) => {
      let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500");
      let source = await createTestPixelMap();
      console.log('pixel map ' + (source != undefined));
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_pixel_map.webp");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_WEBP_FILE_0500", source, fd,
        packOpts);
      fileio.closeSync(fd);
      log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`);
      let size = fileio.statSync(path).size;
      expect(size != 0).assertTrue();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_DATA_0600
     * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_to_png_data
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixelmap to array buffer-png
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_DATA_0600', 0, async (done: Function) => {
      let source: PixelMap  = await createTestPixelMap();
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/png", quality: 100
      };
      await packToDataTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_DATA_0600", source, packOpts);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600
     * @tc.name      : sub_multimedia_image_packerndk_pack_pixelmap_into_png_file
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixelmap into a writtable file-png
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600', 0, async (done: Function) => {
      let log: ESObject = logger("SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600");
      let source = await createTestPixelMap();
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable= await getWriteFd("test_write_pixel_map.png");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/png", quality: 100
      };
      await packToFileTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_PIXEL_MAP_TO_PNG_FILE_0600", source, fd,
        packOpts);
      fileio.closeSync(fd);
      log.log(`file size: ${JSON.stringify(fileio.statSync(path).size)}`);
      let size = fileio.statSync(path).size;
      expect(size != 0).assertTrue();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100
     * @tc.name      : sub_multimedia_image_packerndk_native_release
     * @tc.desc      : 1.packingtestndk create
     *                 2.packingtestndk native release
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100', 0, async (done: Function) => {
      await releaseTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_RELEASE_0100");
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0100
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_001
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-format: "image/txt"
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0100', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/txt", quality: 100
      };
      await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0100", source,  packOpts);
      await source.release();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0200
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_002
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-quality: 101
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0200', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: 101
      };
      await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0200", source, packOpts);
      await source.release();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0300
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_003
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-no quality
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0300', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let packOpts: PackingOption_format = {
        format: "image/jpeg"
      };
      await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0300", source, packOpts);
      await source.release();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0400
     * @tc.name      : sub_multimedia_image_packerndk_pack_image_source_to_data_err_004
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-no format
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0400', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let packOpts: PackingOption_quality = {
         quality: 10
      };
      await packToDataErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_DATA_ERR_0400", source,
        packOpts);
      await source.release();
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0100
     * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_001
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing imagesource into a writtable file-format: "image/txt"
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0100', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_pixel_map_erra.jpeg");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/txt", quality: 100
      };
      await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0100", source, fd, packOpts);
      fileio.closeSync(fd);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0200
     * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_002
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing imagesource into a writtable file-quality: 101
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0200', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_pixel_map_errb.jpeg");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: image.PackingOption = {
        format: "image/jpeg", quality: 101
      };
      await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0200", source,
        fd, packOpts);
      fileio.closeSync(fd);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0300
     * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_003
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing imagesource into a writtable file-no quality
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0300', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_pixel_map_errc.jpeg");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: PackingOption_format = {
        format: "image/jpeg"
      };
      await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0300", source, fd, packOpts);
      fileio.closeSync(fd);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0400
     * @tc.name      : sub_multimedia_image_packerndk_pack_imagesource_into_file_err_004
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing imagesource into a writtable file-no format
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0400', 0, async (done: Function) => {
      let source: image.ImageSource  = await createTestImageSource("test.png");
      expect(source != undefined).assertTrue();
      let path: string, fd: number;
      let variable = await getWriteFd("test_write_pixel_map_errc.jpeg");
      path = variable[0] as string;
      fd = variable[1] as number;
      expect(fd != undefined).assertTrue();
      let packOpts: PackingOption_quality = {
         quality: 10
      };
      await packToFileErrTest(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_IMAGE_SOURCE_TO_FILE_ERR_0400", source,
        fd, packOpts);
      fileio.closeSync(fd);
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0100
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface uses many PixelMaps
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0100", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0200
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface uses PixelMap
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_oneFrame_pixel_map.gif",
          loop: 5,
          frameCount: 1,
          option: ({ delayTimes: [10], disposalTypes: [3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0200", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0300
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface configuration delaytimes
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0300', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_no_loop.gif",
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0300", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0400
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface configuration loop
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0400', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_oneFrame_pixel_map_no_disposalTypes.gif",
          loop: 5,
          frameCount: 1,
          option: ({ delayTimes: [10, 10, 10] } as delayTimes_alone)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0400", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0500
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface no disposalTypes and no loopCount
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0500', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_oneFrame_pixel_map_no_disposalTypes_no_loopCount.gif",
          frameCount: 1,
          option: ({ delayTimes: [10, 10, 10] } as delayTimes_alone)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0500", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0600
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface frameCount less than PixelMapList
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0600', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_0600.gif",
          loop: 5,
          frameCount: 1,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0600", 
          packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0700
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface frameCount more than PixelMapList
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0700', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_0700.gif",
          loop: 5,
          frameCount: 5,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0700", 
          packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0800
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface delayTimeList less than PixelMapList
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0800', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_0800.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0800", 
          packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0900
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface delayTimeList more than PixelMapList
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0900', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_0900.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10, 20, 30], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_0900", 
          packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1000
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface disposalTypes less than PixelMapList
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1000', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_1000.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1000", 
          packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1100
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface disposalTypes more than PixelMapList
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_1100.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 2, 1, 0] } as packConfig_options)
        }
        await testPackToFileForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1100", 
          packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1200
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface passed wrong frameCount
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_1200.gif",
          loop: 5,
          frameCount: 0,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 2, 1] } as packConfig_options)
        }
        await testPackToFileForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1200", packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1300
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface passed wrong delayTimeList
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1300', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_1300.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [0], disposalTypes: [3, 2, 1] } as packConfig_options)
        }
        await testPackToFileForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1300", packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1400
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface passed wrong disposalTypes
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1400', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_1400.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 4, 5] } as packConfig_options)
        }
        await testPackToFileForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1400", packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1500
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface passed wrong loopCount
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1500', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_1500.gif",
          loop: -1,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 1, 0] } as packConfig_options)
        }
        await testPackToFileForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1500", packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1600
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface passed wrong loopCount
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1600', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_1600.gif",
          loop: 65536,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 1, 0] } as packConfig_options)
        }
        await testPackToFileForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILEMULTIFRAMES_1600", packConfig); 
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_IMAGEPACKER_0100
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface wrong parameter imagepacker
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFramesError
     *                 mode = BAD_PARAMETER_IMAGEPACKER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_IMAGEPACKER_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_err_0100.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 1, 0] } as packConfig_options),
          mode: 0
        }
        await testPackToFileForSequenceNdkBadParameter(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_IMAGEPACKER_0100", packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_PACKINGOPTIONS_0200
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface wrong parameter packingoptions
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFramesError
     *                 mode = BAD_PARAMETER_PACKINGOPTIONS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_PACKINGOPTIONS_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_err_0200.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 1, 0] } as packConfig_options),
          mode: 1
        }
        await testPackToFileForSequenceNdkBadParameter(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_PACKINGOPTIONS_0200", packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_PIXELMAPS_0300
     * @tc.name      : test the oH_ImagePacker_PackToFileMultiFrames interface wrong parameter pixelmaps
     * @tc.desc      : 1.getWriteFd
     *                 2.JsPackToFileMultiFramesError
     *                 mode = BAD_PARAMETER_PIXELMAPS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_PIXELMAPS_0300', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "picking_multiFrame_pixel_map_err_0300.gif",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10], disposalTypes: [3, 1, 0] } as packConfig_options),
          mode: 2
        }
        await testPackToFileForSequenceNdkBadParameter(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTOFILE_BAD_PARAMETER_PIXELMAPS_0300", packConfig); 
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0100
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface uses many PixelMaps
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0100", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0200
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface uses PixelMap
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 0,
          frameCount: 1,
          option: ({ delayTimes: [10], disposalTypes: [3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0200", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0300
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface configuration delaytimes
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0300', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          frameCount: 3,
          option: ({ delayTimes: [30, 30, 30], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0300", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0400
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface configuration loop
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0400', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 0,
          frameCount: 1,
          option: ({ delayTimes: [30, 30, 30] } as delayTimes_alone)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0400", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0500
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface no disposalTypes and noloop
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0500', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          frameCount: 3,
          option: ({ delayTimes: [30, 30, 30] } as delayTimes_alone)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0500", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0600
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface frameCount less than PixelMapList
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0600', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 1,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0600", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0700
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface frameCount more than PixelMapList
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0700', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 5,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0700", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0800
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface delayTimeList less than PixelMapList
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0800', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0800", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0900
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface delayTimeList more than PixelMapList
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0900', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [10, 10, 10, 20, 30], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_0900", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_1000
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface disposalTypes less than PixelMapList
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_1000', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_1000", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_1100
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface disposalTypes more than PixelMapList
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_1100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 2, 1, 0] } as packConfig_options)
        }
        await testPackToDataForSequenceNdk(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_1100", 
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1200
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface passed wrong frameCount
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
            packTarget: "data",
            loop: 5,
            frameCount: 0,
            option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1200", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1300
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface passed wrong delayTimeList
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1300', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [0], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1300", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1400
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface passed wrong disposalTypes
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1400', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 4, 5] } as packConfig_options)
        }
        await testPackToDataForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1400", packConfig);
      }
    });

    /**
    * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1500
    * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface passed wrong loopCount
    * @tc.desc      : 1.JsPackToDataMultiFrames
    * @tc.size      : MEDIUM
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1500', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: -1,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1500", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1600
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface passed wrong loopCount
     * @tc.desc      : 1.JsPackToDataMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1600', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 65536,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options)
        }
        await testPackToDataForSequenceNdkError(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATAMULTIFRAMES_ERROR_1600", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_IMAGEPACKER_0100
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface wrong parameter imagepacker
     * @tc.desc      : 1.testPackToDataForSequenceNdkError
     *                 mode = BAD_PARAMETER_IMAGEPACKER
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_IMAGEPACKER_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options),
          mode: 0
        }
        await testPackToDataForSequenceNdkBadParameter(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_IMAGEPACKER_0100", packConfig);
      }
    });

    /**
    * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_PACKINGOPTIONS_0200
    * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface wrong parameter packingoptions
    * @tc.desc      : 1.testPackToDataForSequenceNdkBadParameter
    *                 mode = BAD_PARAMETER_PACKINGOPTIONS
    * @tc.size      : MEDIUM
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_PACKINGOPTIONS_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options),
          mode: 1
        }
        await testPackToDataForSequenceNdkBadParameter(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_PACKINGOPTIONS_0200", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_PIXELMAPS_0300
     * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface wrong parameter pixelmaps
     * @tc.desc      : 1.testPackToDataForSequenceNdkBadParameter
     *                 mode = BAD_PARAMETER_PIXELMAPS
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_PIXELMAPS_0300', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options),
          mode: 2
        }
        await testPackToDataForSequenceNdkBadParameter(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_PIXELMAPS_0300", packConfig);
      }
    });

    /**
    * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_OUTDATA_0400
    * @tc.name      : test the oH_ImagePacker_PackToDataMultiFrames interface uses many outData
    * @tc.desc      : 1.testPackToDataForSequenceNdkBadParameter
    *                 mode = BAD_PARAMETER_OUTDATA
    * @tc.size      : MEDIUM
    * @tc.type      : Functional
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_OUTDATA_0400', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          packTarget: "data",
          loop: 5,
          frameCount: 3,
          option: ({ delayTimes: [20, 20, 20], disposalTypes: [3, 3, 3] } as packConfig_options),
          mode: 3
        }
        await testPackToDataForSequenceNdkBadParameter(done, 
          "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACKTODATA_BAD_PARAMETER_OUTDATA_0400", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0100
     * @tc.name      : test pack gif imageSource to file
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing imageSource into a writtable file-gif
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "test_write_gif_image_source.gif",
          packSource: "ImageSource",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0100", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0200
     * @tc.name      : test pack gif pixel map to file
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixel map into a writtable file-gif
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "test_write_gif_pixel_map.gif",
          packSource: "PixelMap",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0200", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_0100
     * @tc.name      : test pack gif imageSource to buffer
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing imageSource into a buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "Data",
          packSource: "ImageSource",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_0100", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_0200
     * @tc.name      : test pack gif pixel map to buffer
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixel map into a buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "Data",
          packSource: "PixelMap",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFile(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_0200", packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_ERROR_0100
     * @tc.name      : sub_multimedia_image_packerndk_pack_gif_to_file_err_001
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-format: "moving_test.gif"
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_ERROR_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packOpts: image.PackingOption = { format: "image/gif", quality: 123 };
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "test_write_gif_image_source.gif",
          packSource: "ImageSource",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFileError(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0100", packOpts,
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_ERROR_0200
     * @tc.name      : sub_multimedia_image_packerndk_pack_gif_to_file_err_002
     * @tc.desc      : 1.packingtestndk create
     *               : 2.create image source-png
     *               : 3.packing image source to array buffer-format: "moving_test.gif"
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_ERROR_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packOpts: PackingOption_format = { format: "image/gif" };
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "test_write_gif_pixel_map.gif",
          packSource: "PixelMap",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFileError(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_FILE_0100", packOpts,
          packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_ERROR_0100
     * @tc.name      : sub_multimedia_image_packerndk_pack_gif_to_data_err_001
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing imageSource into a buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_ERROR_0100', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packOpts: image.PackingOption = { format: "image/gif", quality: 123 };
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "Data",
          packSource: "ImageSource",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFileError(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_ERROR_0100", 
          packOpts, packConfig);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_ERROR_0200
     * @tc.name      : sub_multimedia_image_packerndk_pack_gif_to_data_err_002
     * @tc.desc      : 1.packingtestndk create
     *                 2.packing pixel map into a buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_ERROR_0200', 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let packOpts: PackingOption_format = { format: "image/gif" };
        let packConfig: ESObject = {
          sourceFileName: "moving_test.gif",
          packTarget: "Data",
          packSource: "PixelMap",
          size: ({ width: 198, height: 202 } as packConfig_size)
        }
        await testPackGifToFileError(done, "SUB_MULTIMEDIA_IMAGE_PACKERNDK_PACK_GIF_TO_DATA_ERROR_0200", 
          packOpts, packConfig);
      }
    });
  })
}


