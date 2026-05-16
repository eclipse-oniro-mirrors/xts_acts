/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import fileio from "@ohos.fileio";
import hilog from '@ohos.hilog';
import rpc from '@ohos.rpc';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';


const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
const EXPECTFRAMECOUNT = 3;
const ERR_CODE = 62980149;
const ERR_CODE1 = 62980096;
const ERR_CODE2 = 62980118;
const DECODE_FAILED = 7700301;
const UNSUPPORTED_MIMETYPE = 7700102;
const IMAGE_TOO_LARGE = 7700103;
const UNSUPPORTED_OPTIONS = 7700203;
const READ_FAILED = 7700202;
let filePath: ESObject;
let fdNumber: number;
let globalImagesource: image.ImageSource;
let globalPacker: image.ImagePacker;
let isSupportHEICDecode: boolean;

interface Options {
  sampleSize: number,
  editable: boolean,
  desiredSize: Size,
  rotate: number,
  desiredPixelFormat: number,
  index: number,
}

interface DesiredRegion {
  size: Size,
  x: number,
  y: number
}

interface Size {
  width: number,
  height: number
}

interface GenericError {
  code?: number;
  message?: string;
}

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

function handleError(testTag: string, err: GenericError | Array<GenericError>, expectedErrorCode: number): boolean {
  if (Array.isArray(err)) {
    for (let error of err) {
      console.error(`${testTag} failed.err: ${error.code} errorMessage: ${error.message}`);
      return error.code == expectedErrorCode;
    }
  } else {
    let error: GenericError = err;
    console.error(`${testTag} failed.err: ${error.code} errorMessage: ${error.message}`);
    return error.code == expectedErrorCode;
  }
  return false;
}

async function getFd(fileName: string) {
  let context: ESObject = await AppStorage.get('thisContext');
  filePath = context.filesDir + "/" + fileName;
  console.info("image case filePath is " + filePath);
  await fileio
    .open(filePath, 0o2, 0o777)
    .then(
      (data) => {
        fdNumber = data;
        console.info("image case open fd success " + fdNumber);
      },
      (err: BusinessError) => {
        console.info("image case open fd fail" + err);
      }
    )
    .catch((err: BusinessError) => {
      console.info("image case open fd err " + err);
    });
}

async function getFilePath(fileName: string): Promise<string> {
  let context: ESObject = await AppStorage.get('thisContext');
  let filePath = context.filesDir + "/" + fileName;
  return filePath;
}

async function packingPromise(done:Function, testNum:string, pixelmap:ESObject) {
  const imagePackerApi = image.createImagePacker();
  if (imagePackerApi == undefined) {
    console.info(`${testNum} packingPromise create image packer failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalPacker = imagePackerApi;
    let packOpts:ESObject = {
      format: ["image/webp"], quality: 100
    };
    console.info(
      `${testNum} packingPromise packOpts={${JSON.stringify(packOpts)}}`
    );
    try {
      let data = await imagePackerApi.packing(pixelmap, packOpts);
      console.info(`${testNum} packing finished`);
      if (data == undefined) {
        console.info(`${testNum} packing failed`);
        expect(false).assertTrue();
        done();
        return;
      }
      console.info(`${testNum} packing success`);
      let dataArr = new Uint8Array(data);
      console.info(`${testNum} packing show begin length: ${dataArr.length} `);
      let line = 0;
      for (let i = 0; i < dataArr.length; i++) {
        let str = `dataArr[ ${i} ]=`;
        for (let j = 0; j < 20 && i < dataArr.length; j++, i++) {
          str = str + dataArr[i] + ",";
        }
        console.info(`${testNum} packing str: ${str}`);
        i--;
        line++;
      }
      console.info(`${testNum} packing show end line: ${line}`);
      done();
    } catch (error) {
      console.info(`${testNum} packingPromise error: ${error}`);
      expect(false).assertTrue();
      done();
    }
  }
}

async function getDelayTimePromise(done:Function, testNum:string, picName:string) {
  await getFd(picName);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} getDelayTimePromise create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    try {
      console.info(`${testNum} getDelayTimePromise create imagesource success`);
      let delayTimes = await imageSourceApi.getDelayTimeList();
      if (delayTimes != undefined) {
        console.info(`${testNum} getDelayTimePromise getDelayTime success`);
        console.info(`${testNum} delayTimes show begin length: ${delayTimes.length} `);
        for (let i = 0; i < delayTimes.length; i++) {
          console.info(`${testNum} delayTimes[ ${i} ]= ${delayTimes[i]}`);
        }
        console.info(`${testNum} delayTimes show end`);
      } else {
        console.info(`${testNum} getDelayTimePromise getDelayTime failed`);
        expect(false).assertTrue();
      }
      done();
    } catch (error) {
      console.log(`${testNum} getDelayTimePromise err: ${error}`);
      expect(false).assertTrue();
      done();
    }
    ;
  }
}

async function getDelayTimeCallBack(done:Function, testNum:string, picName:string) {
  let imageSourceApi: image.ImageSource;
  await getFd(picName);
  imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} getDelayTimeCallBack create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    console.info(`${testNum} getDelayTimeCallBack create imagesource success`);
    imageSourceApi.getDelayTimeList((err, delayTimes) => {
      if (err != undefined) {
        console.info(`${testNum} getDelayTimeCallBack getDelayTime failed err: ${err}`);
        expect(false).assertTrue();
        done();
        return;
      }
      expect(delayTimes != undefined).assertTrue();
      console.info(`${testNum} getDelayTimeCallBack getDelayTime success`);
      console.info(`${testNum} delayTimes show begin(length:` + delayTimes.length + `)`);
      for (let i = 0; i < delayTimes.length; i++) {
        console.info(`${testNum} delayTimes[` + i + `]=` + delayTimes[i]);
      }
      console.info(`${testNum} delayTimes show end`);
      done();
    });
  }
}

async function testGetDisposalTypePromise(done:Function, testNum:string, picName:string) {
  await getFd(picName);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} testGetDisposalTypePromise create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    try {
      console.info(`${testNum} testGetDisposalTypePromise create imagesource success`);
      imageSourceApi.getDisposalTypeList().then((disposalTypes) => {
        console.info(`${testNum} testGetDisposalTypePromise getDisposalTypeList success`);
        console.info(`${testNum} disposalTypes show begin length: ${disposalTypes.length} `);
        for (let i = 0; i < disposalTypes.length; i++) {
          console.info(`${testNum} disposalTypes[ ${i} ]= ${disposalTypes[i]}`);
        }
        console.info(`${testNum} disposalTypes show end`);
      }).catch((err: BusinessError) => {
        console.info(`${testNum} testGetDisposalTypePromise getDisposalTypeList failed err: code is ${err.code},message is ${err.message}`);
        expect(err.code == ERR_CODE).assertTrue();
      })
      done();
    } catch (error) {
      console.log(`${testNum} testGetDisposalTypePromise err: ${error}`);
      expect(false).assertTrue();
      done();
    }
    ;
  }
}

async function getFrameCountPromise(done:Function, testNum:string, picName:string) {
  try {
    await getFd(picName);
    let imageSourceApi = image.createImageSource(fdNumber);
    if (imageSourceApi == undefined) {
      console.info(`${testNum} getFrameCountPromise create imagesource failed`);
      expect(false).assertTrue();
      done();
    } else {
      globalImagesource = imageSourceApi;
      console.info(`${testNum} getFrameCountPromise create imagesource success`);
      let frameCount = await imageSourceApi.getFrameCount();
      if (frameCount != undefined) {
        console.info(`${testNum} getFrameCountPromise getFrameCount success`);
        expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
        console.info(`${testNum} getFrameCountPromise frameCount= ${frameCount}`);
      } else {
        console.info(`${testNum} getFrameCountPromise getFrameCount failed`);
        expect(false).assertTrue();
      }
      done();
    }
  } catch (error) {
    console.info(`${testNum} getFrameCountPromise error: ` + error);
    expect(false).assertTrue();
    done();
  }
}

async function getFrameCountCallBack(done:Function, testNum:string, picName:string) {
  await getFd(picName);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} getFrameCountCallBack create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    console.info(`${testNum} getFrameCountCallBack create imagesource success`);
    imageSourceApi.getFrameCount((err, frameCount) => {
      if (err != undefined) {
        console.info(`${testNum} getFrameCountCallBack getFrameCount failed err: ${err}`);
        expect(false).assertTrue();
        done();
        return;
      }
      expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
      console.info(`${testNum} getFrameCountCallBack getFrameCount success`);
      console.info(`${testNum} getFrameCountCallBack frameCount= ${frameCount}`);
      done();
    });
  }
}

async function createPixelMapListPromise(done:Function, testNum:string, picName:string, decodeOpts:ESObject) {
  await getFd(picName);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} createPixelMapListPromise create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    try {
      console.info(`${testNum} createPixelMapListPromise create imagesource success`);
      let pixelMapList = await imageSourceApi.createPixelMapList(decodeOpts);
      if (pixelMapList != undefined) {
        console.info(`${testNum} pixelMapList show begin(length: ${pixelMapList.length})`);
        packingPromise(done, testNum, pixelMapList[0]);
      } else {
        console.info(`${testNum} createPixelMapListPromise createPixelMapList failed`);
        expect(false).assertTrue();
        done();
      }
    } catch (error) {
      console.info(`${testNum} createPixelMapListPromise error: ${error}`);
      expect(false).assertTrue();
      done();
    }
  }
}

async function createPixelMapListCallBack(done:Function, testNum:string, picName:string, decodeOpts:ESObject) {
  await getFd(picName);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} createPixelMapListCallBack create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    console.info(`${testNum} createPixelMapListCallBack create imagesource success`);
    imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
      if (err != undefined) {
        console.info(`${testNum} createPixelMapListCallBack failed err: ${err}`);
        expect(false).assertTrue();
        done();
        return;
      }
      expect(pixelMapList != undefined).assertTrue();
      console.info(`${testNum} pixelMapList show begin length: ${pixelMapList.length}`);
      packingPromise(done, testNum, pixelMapList[0]);
    });
  }
}

async function createPixelMapListErrPromise(done:Function, testNum:string, picName:string, decodeOpts:ESObject, checkErrCode:Function) {
  await getFd(picName);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} createPixelMapListPromise create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    try {
      await imageSourceApi.createPixelMapList(decodeOpts);
      console.info(`${testNum} failed `);
      expect(false).assertTrue();
      done();
    } catch (error) {
      console.info(`${testNum} createPixelMapListPromise error.code: ${error.code} err:${error}`);
      checkErrCode(error.code);
      done();
    }
  }
}

async function createPixelMapListErrCallBack(done:Function, testNum:string, picName:string, decodeOpts:ESObject, checkErrCode:Function) {
  await getFd(picName);
  let imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} createPixelMapListCallBack create imagesource failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    console.info(`${testNum} createPixelMapListCallBack create imagesource success`);
    imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
      if (err != undefined || pixelMapList == undefined) {
        checkErrCode(err.code);
        console.info(`${testNum} createPixelMapList err.code: ${err.code} err:${err}`);
        done();
      } else {
        console.info(`${testNum} failed`);
        expect(false).assertTrue();
        done();
      }
    });
  }
}

async function checkPictureAtIndex(
  logger: Logger,
  index: number,
  imageSource: image.ImageSource,
  picture: image.Picture,
  delayTimeList: Array<number>,
  disposalTypeList: Array<number>
): Promise<boolean> {
  let metadata: image.Metadata = await picture.getMetadata(image.MetadataType.GIF_METADATA);
  let delayTime: Record<string, string | null> = await metadata.getProperties([image.GifPropertyKey.GIF_DELAY_TIME]);
  let disposalType: Record<string, string | null> = await metadata.getProperties([image.GifPropertyKey.GIF_DISPOSAL_TYPE]);

  let mainPixelMap: image.PixelMap = picture.getMainPixelmap();
  let srcImageInfo: image.ImageInfo = await imageSource.getImageInfo();
  let dstImageInfo: image.ImageInfo = await mainPixelMap.getImageInfo();
  let ret = (delayTime[image.GifPropertyKey.GIF_DELAY_TIME] == delayTimeList[index].toString()) &&
    (disposalType[image.GifPropertyKey.GIF_DISPOSAL_TYPE] == disposalTypeList[index].toString()) &&
    (srcImageInfo.size.width == dstImageInfo.size.width) &&
    (srcImageInfo.size.height == dstImageInfo.size.height);
  logger.log(`index is: ${index}, compare result is: ${ret}`);
  if (!ret) {
    logger.log(`delayTimeList is: ${delayTimeList[index]}, disposalTypeList is: ${disposalTypeList[index]}.`);
    logger.log("metadata delayTime is: " + delayTime[image.GifPropertyKey.GIF_DELAY_TIME] + ", disposalType is: " +
      disposalType[image.GifPropertyKey.GIF_DISPOSAL_TYPE]);
    logger.log(`srcImageInfo is: ${JSON.stringify(srcImageInfo)}, dstImageInfo is: ${JSON.stringify(dstImageInfo)}`);
  }
  picture?.release();
  mainPixelMap?.release();
  return ret;
}

async function gifIncompleteFrameTest(logger: Logger, fileName: string): Promise<boolean> {
  let filePath = await getFilePath(fileName);
  logger.log("filePath is: " + filePath);
  try {
    let imageSource: image.ImageSource = image.createImageSource(filePath);
    let frameCount: number = await imageSource.getFrameCount();
    let delayTimeList: Array<number> = await imageSource.getDelayTimeList();
    let disposalTypeList: Array<number> = await imageSource.getDisposalTypeList();
    logger.log("get frameCount num is: " + frameCount);
    let ret: boolean = true;
    for (let index = 0; index < frameCount; index++) {
      let picture: image.Picture = await imageSource.createPictureAtIndex(index);
      let temp = await checkPictureAtIndex(logger, index, imageSource, picture, delayTimeList, disposalTypeList);
      ret = ret && temp;
    }
    imageSource?.release();
    return ret;
  } catch (error) {
    logger.log("gifInCompleteFrameTest failed error is: " + JSON.stringify(error));
    return false;
  }
}

async function gifInCompleteFrameTestError(logger: Logger, fileName: string, errorCode: number): Promise<boolean> {
  if (fileName.endsWith(".heic") && !isSupportHEICDecode) {
    logger.log("device is not support decode heic!");
    return true;
  }

  let filePath = await getFilePath(fileName);
  try {
    let imageSourceApi = image.createImageSource(filePath);
    let frameCount: number = await imageSourceApi.getFrameCount();
    logger.log("get frameCount num is: " + frameCount);
    for (let index = 0; index < frameCount; index++) {
      let picture: image.Picture = await imageSourceApi.createPictureAtIndex(index);
      if (picture == undefined) {
        logger.log("index is: " + index + ", picture is undefined!");
      }
      picture?.release();
    }
    logger.log("createPictureAtIndex is succ!");
    return false;
  } catch (error) {
    logger.log("gifInCompleteFrameTestError failed error is: " + JSON.stringify(error));
    return (error.code == errorCode);
  }
}

async function heifsCheckPictureAtIndex(
  logger: Logger,
  index: number,
  imageSource: image.ImageSource,
  picture: image.Picture,
  delayTimeList: Array<number>
): Promise<boolean> {
  let ret = false;
  let mainPixelMap: image.PixelMap | undefined;
  try {
    let metadata: image.Metadata = await picture.getMetadata(image.MetadataType.HEIFS_METADATA);
    let delayTime: Record<string, string | null> = await metadata.getProperties(['HeifsDelayTime']);
    mainPixelMap = picture.getMainPixelmap();
    let srcImageInfo: image.ImageInfo = await imageSource.getImageInfo();
    let dstImageInfo: image.ImageInfo = await mainPixelMap.getImageInfo();
    ret = (delayTime['HeifsDelayTime'] === delayTimeList[index].toString()) &&
      (srcImageInfo.size.width === dstImageInfo.size.width) &&
      (srcImageInfo.size.height === dstImageInfo.size.height) && 
      (srcImageInfo.mimeType === dstImageInfo.mimeType);
    logger.log(`index is: ${index}, compare result is: ${ret}`);
    if (!ret) {
      logger.log(`delayTimeList is: ${delayTimeList[index]}`);
      logger.log("metadata delayTime is: " + delayTime[image.HeifsPropertyKey.HEIFS_DELAY_TIME]);
      logger.log(`srcImageInfo is: ${JSON.stringify(srcImageInfo)}, dstImageInfo is: ${JSON.stringify(dstImageInfo)}`);
    }
  } catch (error) {
    logger.log("heifsCheckPictureAtIndex failed error is: " + JSON.stringify(error));
    ret = false;
  } finally {
    picture?.release();
    mainPixelMap?.release();
  }
  return ret;
}

async function heifsIncompleteFrameTest(logger: Logger, fileName: string): Promise<boolean> {
  let filePath = await getFilePath(fileName);
  logger.log("filePath is: " + filePath);
  let ret: boolean = false;
  try {
    let imageSource: image.ImageSource = image.createImageSource(filePath);
    let frameCount: number = await imageSource.getFrameCount();
    logger.log("get frameCount num is: " + frameCount);
    let delayTimeList: Array<number> = await imageSource.getDelayTimeList();

    for (let index = 0; index < frameCount; index++) {
      let picture: image.Picture = await imageSource.createPictureAtIndex(index);
      ret = await heifsCheckPictureAtIndex(logger, index, imageSource, picture, delayTimeList);
    }
    if (imageSource != undefined) {
      await imageSource?.release();
    }
    return ret;
  } catch (error) {
    logger.log("heifsIncompleteFrameTest failed error is: " + JSON.stringify(error));
    return ret;
  }
}

class MySequence implements rpc.Parcelable {
  picture_: image.Picture;

  constructor(conPicture: image.Picture) {
    this.picture_ = conPicture;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    this.picture_.marshalling(messageSequence);
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence): boolean {
    let picture: image.Picture = image.createPictureFromParcel(messageSequence)
    this.picture_ = picture;
    return true;
  }
}

async function gifInCompleteFrameTestMarshalling(logger: Logger, picture: image.Picture, metadataType: image.MetadataType): Promise<boolean> {
  try {
    let parcelable: MySequence = new MySequence(picture);
    let data: rpc.MessageSequence = rpc.MessageSequence.create();
    data.writeParcelable(parcelable);
    let ret: MySequence = new MySequence(picture);
    data.readParcelable(ret);
    await sleep(500);

    let marshallingMetadata = await picture.getMetadata(metadataType);
    let unmarshallingMetadata = await ret.picture_.getMetadata(metadataType);
    let marshallingProperties = await marshallingMetadata.getAllProperties();
    let unmarshallingProperties = await unmarshallingMetadata.getAllProperties();
    logger.log(`marshalling properties: ` + JSON.stringify(marshallingProperties));
    logger.log(`unmarshalling properties: ` + JSON.stringify(unmarshallingProperties));
    picture?.release();
    return (JSON.stringify(marshallingProperties) == JSON.stringify(unmarshallingProperties));
  } catch (error) {
    picture?.release();
    logger.log("test marshlling failed error is: " + JSON.stringify(error));
    return false;
  }
}

async function gifInCompleteFrameMetadataTest(logger: Logger, picture: image.Picture, modifyProperties: Record<string, string | null>, metadataType: image.MetadataType): Promise<boolean> {
  try {
    let metadata = await picture.getMetadata(metadataType);
    await metadata.setProperties(modifyProperties);
    await picture.setMetadata(metadataType, metadata);
    let dataAfterSet = await picture.getMetadata(metadataType);
    let data = await dataAfterSet.getAllProperties();
    logger.log("modifyProperties is: " + JSON.stringify(modifyProperties));
    logger.log("after data is: " + JSON.stringify(data));
    picture?.release();
    return (JSON.stringify(modifyProperties) == JSON.stringify(data));
  } catch (error) {
    picture?.release();
    logger.log("test metadata failed error is: " + JSON.stringify(error));
    return false;
  }
}


export default function imageGif() {
  describe("imageGif", () => {


    beforeAll(async () => {
      console.info("beforeAll case");
      let filesDir = await getFilePath("test.jpg");
      isSupportHEICDecode =
        image.createImageSource(filesDir).supportedFormats.includes("image/heic");
    });

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      if (globalImagesource != undefined) {
        console.info("globalImagesource release start");
        try {
          await globalImagesource.release();
        } catch (error) {
          console.info("globalImagesource release fail");
        }
      }
      if (globalPacker != undefined) {
        console.info("globalPacker release start");
        try {
            await globalPacker.release();
        } catch (error) {
            console.info("globalPacker release fail");
        }
    }
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0100
     * @tc.desc   1.create one frame gif imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0100", "test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0200
     * @tc.desc   1.create gif imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0200", Level.LEVEL0, async (done:Function)=>{
      getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0200", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0100
     * @tc.desc   1.create one frame gif imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0100", Level.LEVEL0, async (done:Function)=>{
      getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0100", "test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0200
     * @tc.desc   1.create gif imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0200", Level.LEVEL0, async (done:Function)=>{
      getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0200", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0100
     * @tc.desc   1.create gif imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0100", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0200
     * @tc.desc   1.create one frame gif imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0200", Level.LEVEL0, async (done:Function)=>{
      testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0200", "test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0300
     * @tc.desc   1.create jpg imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0300", Level.LEVEL0, async (done:Function)=>{
      testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0300", "test.jpg");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      getFrameCountPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_0100", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_0100", Level.LEVEL0, async (done:Function)=>{
      getFrameCountCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_0100", "moving_test.gif");
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      createPixelMapListPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_0100",
        "moving_test.gif", decodeOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

      let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE2).assertTrue();
      }

      createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0100",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0200", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: -8,
      };

       let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0200",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0300", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 500,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

       let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0300",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0400", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: 33,
        index: 0,
      };

       let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0400",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_0100", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      createPixelMapListCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_0100",
        "moving_test.gif", decodeOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0100
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0100", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

       let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE2).assertTrue();
      }

      createPixelMapListErrCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0100",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0200
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0200", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: -8,
      };

       let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      createPixelMapListErrCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0200",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0300
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0300", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 500,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

       let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      createPixelMapListErrCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0300",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0400
     * @tc.desc   1.create imagesource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0400", Level.LEVEL0, async (done:Function)=>{
      let decodeOpts:Options = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 198, height: 202
        },
        rotate: 0,
        desiredPixelFormat: 33,
        index: 0,
      };

       let checkErrCode = (code:ESObject)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      createPixelMapListErrCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0400",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100");
      let ret = await gifIncompleteFrameTest(logger, "moving_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200");
      let filePath = await getFilePath("moving_test.gif");
      try {
        let imageSourceApi = image.createImageSource(filePath);
        let picture: image.Picture = await imageSourceApi.createPictureAtIndex(0);
        let ret = await gifInCompleteFrameTestMarshalling(logger, picture, image.MetadataType.GIF_METADATA);
        expect(ret).assertTrue();
        done();
      } catch (error) {
        logger.log("error is: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300
     * @tc.desc   test gif incomplete frame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300");
      let filePath = await getFilePath("moving_test.gif");
      try {
        let imageSourceApi = image.createImageSource(filePath);
        let picture: image.Picture = await imageSourceApi.createPictureAtIndex(0);
        let modifyProperties: Record<string, string | null> = {"GifDelayTime":"100", "GifDisposalType":"2"};
        let ret = await gifInCompleteFrameMetadataTest(logger, picture, modifyProperties, image.MetadataType.GIF_METADATA);
        expect(ret).assertTrue();
        done();
      } catch (error) {
        logger.log("error is: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100");
      let ret = await gifIncompleteFrameTest(logger, "incomplete_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0200
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0200");
      let fileList: Array<string> = ["test.jpg", "0801_sdr2.heic", "test.bmp", "test_dng.dng", "test.png"];
      let ret = true;
      for (let index = 0; index < fileList.length; index++) {
        let temp = await gifInCompleteFrameTestError(logger, fileList[index], UNSUPPORTED_MIMETYPE);
        logger.log(`index is: ${index}, retult is: ${temp}!`);
        ret = ret && temp;
      }
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300");
      let ret = await gifInCompleteFrameTestError(logger, "fake_large_size_test.gif", IMAGE_TOO_LARGE);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0400
     * @tc.desc   test gif incomplete frame error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0400", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0400");
      try {
        let filePath = await getFilePath("moving_test.gif");
        let imageSourceApi = image.createImageSource(filePath);
        let frameCount: number = await imageSourceApi.getFrameCount();
        let picture: image.Picture = await imageSourceApi.createPictureAtIndex(frameCount);
        logger.log("createPictureAtIndex is succ!");
        expect().assertFail();
        done();
      } catch (error) {
        logger.log("createPictureAtIndex failed, error is: " + JSON.stringify(error));
        expect(error.code == UNSUPPORTED_OPTIONS).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0100
     * @tc.desc        Test HEIFS multi-frame decode with metadata verification
     *                 1.create HEIFS imagesource
     *                 2.createPictureAtIndex for each frame
     *                 3.verify delay time metadata and image info
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0100");
      let fileName = "heif.heic";
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let ret = await heifsIncompleteFrameTest(logger, fileName);
        logger.log("heifsIncompleteFrameTest success ret is: " + ret);
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0200
     * @tc.desc        Test HEIFS picture marshalling and unmarshalling
     *                 1.create HEIFS picture at index 0
     *                 2.marshalling picture to MessageSequence
     *                 3.unmarshalling and compare metadata properties
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0200", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0200");
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        try {
          let imageSourceApi = image.createImageSource(filePath);
          let picture: image.Picture = await imageSourceApi.createPictureAtIndex(0);
          let ret = await gifInCompleteFrameTestMarshalling(logger, picture, image.MetadataType.HEIFS_METADATA);
          expect(ret).assertTrue();
          done();
        } catch (error) {
          logger.log("error is: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0300
     * @tc.desc        Test HEIFS metadata set and get for delay time
     *                 1.create HEIFS picture at index 0
     *                 2.set HeifsDelayTime metadata to 100
     *                 3.get metadata and verify delay time value
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0300", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_0300");
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        try {
          let imageSourceApi = image.createImageSource(filePath);
          let picture: image.Picture = await imageSourceApi.createPictureAtIndex(0);
          let modifyProperties: Record<string, string | null> = {"HeifsDelayTime":"100"};
          let ret = await gifInCompleteFrameMetadataTest(logger, picture, modifyProperties, image.MetadataType.HEIFS_METADATA);
          expect(ret).assertTrue();
          done();
        } catch (error) {
          logger.log("error is: " + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_MIMETYPE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_MIMETYPE_0100
     * @tc.desc        Test HEIFS picture MIME type verification
     *                 1.create HEIFS picture at index 0
     *                 2.get main pixelmap from picture
     *                 3.verify MIME type is "image/heif-sequence"
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_MIMETYPE_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_MIMETYPE_0100");
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let ret = false;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        try {
          let imageSourceApi = image.createImageSource(filePath);
          let picture: image.Picture = await imageSourceApi.createPictureAtIndex(0);
          let mainPixelMap: image.PixelMap = picture.getMainPixelmap();
          let dstImageInfo: image.ImageInfo = await mainPixelMap.getImageInfo();
          ret = dstImageInfo.mimeType == "image/heif-sequence";
          await picture?.release();
          await mainPixelMap?.release();
        } catch (error) {
          logger.log("checkPictureAtIndex getMetadata failed error is: " + JSON.stringify(error));
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPIXELMAP_MIMETYPE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPIXELMAP_MIMETYPE_0100
     * @tc.desc        Test HEIFS create pixelmap and verify MIME type and dimensions
     *                 1.create HEIFS imagesource
     *                 2.create pixelmap from imagesource
     *                 3.compare MIME type, width and height
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPIXELMAP_MIMETYPE_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPIXELMAP_MIMETYPE_0100");
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let ret = false;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        try {
          let imageSourceApi = image.createImageSource(filePath);
          let pixelmap: image.PixelMap = await imageSourceApi.createPixelMap();
          let srcImageInfo = await imageSourceApi.getImageInfo();
          let dstImageInfo: image.ImageInfo = await pixelmap.getImageInfo();
          ret = (srcImageInfo.mimeType == dstImageInfo.mimeType) &&
            (srcImageInfo.size.width === dstImageInfo.size.width) &&
            (srcImageInfo.size.height === dstImageInfo.size.height);
          await pixelmap?.release();
          await imageSourceApi?.release();
        } catch (error) {
          logger.log("checkPictureAtIndex getMetadata failed error is: " + JSON.stringify(error));
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_INTERMEDIATE_FRAME_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_INTERMEDIATE_FRAME_0100
     * @tc.desc        Test HEIFS decode at specific index with metadata verification
     *                 1.create HEIFS imagesource
     *                 2.createPictureAtIndex at index 10
     *                 3.verify picture metadata and image info
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_INTERMEDIATE_FRAME_0100", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_INTERMEDIATE_FRAME_0100";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let ret = false;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let picture: image.Picture | undefined;
        let imageSourceApi = image.createImageSource(filePath);
        try {
          let delayTimeList: Array<number> = await imageSourceApi.getDelayTimeList();
          picture = await imageSourceApi.createPictureAtIndex(10);
          ret = await heifsCheckPictureAtIndex(logger, 10, imageSourceApi, picture, delayTimeList);
          logger.log("createPictureAtIndex success picture is: " + (picture != undefined));
        } catch (error) {
          logger.log("checkPictureAtIndex picture failed error is: " + JSON.stringify(error));
        } finally {
          if (picture != undefined) {
            await picture?.release();
          }
          if (imageSourceApi != undefined) {
            await imageSourceApi?.release();
          }
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_FRAME_SKIPPING_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_FRAME_SKIPPING_0100
     * @tc.desc        Test HEIFS decode at even indices with metadata verification
     *                 1.create HEIFS imagesource and get frameCount
     *                 2.createPictureAtIndex for even indices (0, 2, 4...)
     *                 3.verify each frame's metadata and image info
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_FRAME_SKIPPING_0100", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_FRAME_SKIPPING_0100";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let ret = true;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let picture: image.Picture | undefined;
        let imageSourceApi = image.createImageSource(filePath);
        try {
          let frameCount: number = await imageSourceApi.getFrameCount();
          logger.log("get frameCount num is: " + frameCount);
          let delayTimeList: Array<number> = await imageSourceApi.getDelayTimeList();
          for (let index = 0; index < frameCount; index += 2) {
            picture = await imageSourceApi.createPictureAtIndex(index);
            let temp = await heifsCheckPictureAtIndex(logger, index, imageSourceApi, picture, delayTimeList);
            ret = ret && temp;
          }
          logger.log("Frame skipping createPictureAtIndex success picture ret is: " + ret);
        } catch (error) {
          logger.log("Frame skipping checkPictureAtIndex picture failed error is: " + JSON.stringify(error));
          ret = false;
        } finally {
          if (picture != undefined) {
            await picture?.release();
          }
          if (imageSourceApi != undefined) {
            await imageSourceApi?.release();
          }
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_DECODING_FORMAT_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_DECODING_FORMAT_0100
     * @tc.desc        Test HEIFS format support verification
     *                 1.get supported formats from API
     *                 2.get supported formats from imagesource
     *                 3.verify "image/heif-sequence" is included
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_DECODING_FORMAT_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_DECODING_FORMAT_0100");
      let fileName = "heif.heic";
      let context: common.UIAbilityContext | undefined = await AppStorage.get('thisContext');
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        const srcSupportedFormatsList: Array<string> = await image.getImageSourceSupportedFormats();
        const dstSupportedFormatsList: Array<string> = image.createImageSource(context!.filesDir + '/' + "test.jpg").supportedFormats;
        console.log(`${logger}, srcSupportedFormatsList: ` + JSON.stringify(srcSupportedFormatsList));
        console.log(`${logger}, dstSupportedFormatsList: ` + JSON.stringify(dstSupportedFormatsList));
        const ret = (JSON.stringify(srcSupportedFormatsList) == JSON.stringify(dstSupportedFormatsList));
        console.log("compare result is: " + ret);
        expect(ret).assertTrue();
        expect(srcSupportedFormatsList.includes('image/heif-sequence')).assertTrue();
        expect(dstSupportedFormatsList.includes('image/heif-sequence')).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0100
     * @tc.desc        Verify batch modify and read HEIFS metadata properties for heic file
     *                 1.Create image source from heic file using fd
     *                 2.Read modified properties using readImageMetadata API
     *                 4.Verify each property value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0100", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0100";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let propertyKeys = ["HeifsDelayTime"]
      let ret = true;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let imageSourceApi = image.createImageSource(filePath);
        try {
          let frameCount: number = await imageSourceApi.getFrameCount();
          logger.log("get frameCount num is: " + frameCount);
          let delayTimeList: Array<number> = await imageSourceApi.getDelayTimeList();
          
          for (let index = 0; index < frameCount; index++) {
            const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys, index);
            if (exifValue.heifsMetadata != undefined) {
              let actualValue: number = exifValue.heifsMetadata!.heifsDelayTime as number;
              ret = ret && actualValue == delayTimeList[index];
            }
          }
          logger.log("Frame skipping readImageMetadata success picture ret is: " + ret);
        } catch (error) {
          logger.log("Frame skipping readImageMetadata picture failed error is: " + JSON.stringify(error));
          ret = false;
        } finally {
          if (imageSourceApi != undefined) {
            await imageSourceApi?.release();
          }
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0200
     * @tc.desc        Verify HEIFS metadata getProperties and getAllProperties for HEIFS file
     *                 1.Create image source from heic file
     *                 2.Read metadata using readImageMetadata API for each frame
     *                 3.Get properties using both getProperties and getAllProperties
     *                 4.Verify both methods return same delay time value
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0200", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0200";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let propertyKeys = ["HeifsDelayTime"]
      let ret = true;
      let actualValue1: string | null;
      let actualValue2: string | null;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let imageSourceApi = image.createImageSource(filePath);
        try {
          let frameCount: number = await imageSourceApi.getFrameCount();
          logger.log("get frameCount num is: " + frameCount);
          let delayTimeList: Array<number> = await imageSourceApi.getDelayTimeList();

          for (let index = 0; index < frameCount; index++) {
            const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(propertyKeys, index);
            if (exifValue.heifsMetadata != undefined) {
              let exifRecord1: Record<string, string | null> = await exifValue.heifsMetadata!.getProperties(propertyKeys);
              let exifRecord2: Record<string, string | null> = await exifValue.heifsMetadata!.getAllProperties();
              actualValue1 = exifRecord1[propertyKeys[0]] as string;
              actualValue2 = exifRecord2[propertyKeys[0]] as string;
              ret = ret && actualValue1 == JSON.stringify(delayTimeList[index]) && actualValue2 == JSON.stringify(delayTimeList[index]);
            }
          }
          logger.log("Frame skipping readImageMetadata success picture ret is: " + ret);
        } catch (error) {
          logger.log("Frame skipping readImageMetadata picture failed error is: " + JSON.stringify(error));
          ret = false;
        } finally {
          if (imageSourceApi != undefined) {
            await imageSourceApi?.release();
          }
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0300
     * @tc.desc        Verify HEIFS metadata setProperties and getProperties for standard metadata
     *                 1.Read HEIFS metadata using readImageMetadata
     *                 2.Get property value using getProperties
     *                 3.Modify property value using setProperties
     *                 4.Verify modified value matches expected result
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0300", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0300";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let result: boolean = true;
      let heifsMetadataKey: string[] = ["HeifsDelayTime"];
      let expectedValue: Record<string, string | null> = {"HeifsDelayTime": "60"}
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let imageSourceApi = image.createImageSource(filePath);
        try {
          let frameCount: number = await imageSourceApi.getFrameCount();
          logger.log("get frameCount num is: " + frameCount);
          for (let index = 0; index < frameCount; index++) {
            const exifValue: image.ImageMetadata = await imageSourceApi.readImageMetadata(heifsMetadataKey, index);
            if (exifValue.heifsMetadata != undefined) {
              let actualValue1: Record<string, string | null> = await exifValue.heifsMetadata!.getProperties(["HeifsDelayTime"]);
              logger.log("readImageMetadata old actualValue1 is: " + actualValue1["HeifsDelayTime"]);

              await exifValue.heifsMetadata!.setProperties(expectedValue);
              let actualValue2: Record<string, string | null> = await exifValue.heifsMetadata!.getProperties(["HeifsDelayTime"]);
              logger.log("readImageMetadata new actualValue2 is: " + actualValue2["HeifsDelayTime"]);
              result = actualValue2["HeifsDelayTime"] == expectedValue["HeifsDelayTime"];
            }
          }
        } catch (error) {
          logger.log("Error setMetadata err: " + error);
          result = false;
        }
        logger.log("readImageMetadata setMetadata result is: " + result);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0400
     * @tc.name        SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0400
     * @tc.desc        Verify HEIFS metadata clone functionality
     *                 1.Read HEIFS metadata using readImageMetadata
     *                 2.Clone metadata object using clone API
     *                 3.Get properties from both original and cloned objects
     *                 4.Verify cloned properties match original values
     * @tc.size        MEDIUM
     * @tc.type        Functional
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0400", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_READIMAGEMETADATA_HEIFSMETADATA_PROMISE_0400";
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let result: boolean = true;
      let heifsMetadataKey: string[] = ["HeifsDelayTime"];
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        console.info(`${testTag} device is not support decode heif!`);
        done();
      } else {
        let imageSourceApi = image.createImageSource(filePath);
        try {
          const exifValue1: image.ImageMetadata = await imageSourceApi.readImageMetadata(heifsMetadataKey);
          if (exifValue1.heifsMetadata != undefined) {
            let actualValue1: Record<string, string | null> = await exifValue1.heifsMetadata!.getProperties(heifsMetadataKey);
            console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue1}`);

            let exifValue2: image.HeifsMetadata = await exifValue1.heifsMetadata!.clone();

            let actualValue2: Record<string, string | null> = await exifValue2!.getProperties(heifsMetadataKey);
            console.info(`${testTag} readImageMetadata actualValue1 is: ${actualValue2}`);

            if (actualValue1!["HeifsDelayTime"] !== actualValue2!["HeifsDelayTime"]) {
              result = false;
              console.info(`${testTag} readImageMetadata clone key: ${heifsMetadataKey}. actualValue1: ${actualValue1}. actualValue2: ${actualValue2}`);
            }
          }
        } catch (error) {
          console.error(`${testTag} Error clone err: ${error}`);
          result = false;
        }
        console.info(`${testTag} readImageMetadata clone result is: ${result}`);
        expect(result).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0100
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0100
     * @tc.desc        Test HEIFS create picture with out-of-bounds index error
     *                 1.create HEIFS imagesource and get frameCount
     *                 2.createPictureAtIndex with index equals frameCount
     *                 3.verify UNSUPPORTED_OPTIONS error code
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0100";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let ret = false;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let picture: image.Picture | undefined;
        let imageSourceApi = image.createImageSource(filePath);
        try {
          let frameCount: number = await imageSourceApi.getFrameCount();
          logger.log("get frameCount num is: " + frameCount);
          picture = await imageSourceApi.createPictureAtIndex(frameCount);
          logger.log("createPictureAtIndex success picture is: " + (picture != undefined));
        } catch (error) {
          logger.log("Border value checkPictureAtIndex picture failed error is: " + JSON.stringify(error));
          ret = handleError(testTag, error as GenericError | Array<GenericError>, UNSUPPORTED_OPTIONS);
        } finally {
          if (picture != undefined) {
            await picture?.release();
          }
          if (imageSourceApi != undefined) {
            await imageSourceApi?.release();
          }
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0200
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0200
     * @tc.desc        Test HEIFS create picture with negative index error
     *                 1.create HEIFS imagesource
     *                 2.createPictureAtIndex with index -1
     *                 3.verify UNSUPPORTED_OPTIONS error code
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0200", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0200";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let ret = false;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let picture: image.Picture | undefined;
        let imageSourceApi = image.createImageSource(filePath);
        try {
          picture = await imageSourceApi.createPictureAtIndex(-1);
          logger.log("createPictureAtIndex success picture is: " + (picture != undefined));
        } catch (error) {
          logger.log("Border value checkPictureAtIndex picture failed error is: " + JSON.stringify(error));
          ret = handleError(testTag, error as GenericError | Array<GenericError>, UNSUPPORTED_OPTIONS);
        } finally {
          if (picture != undefined) {
            await picture?.release();
          }
          if (imageSourceApi != undefined) {
            await imageSourceApi?.release();
          }
        }
        expect(ret).assertTrue();
        done();
      }
    });

    /**
     * @tc.number      SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0300
     * @tc.name        SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0300
     * @tc.desc        Test HEIFS writeImageMetadata error handling
     *                 1.create HEIFS imagesource
     *                 2.create HeifsMetadata instance and writeImageMetadata
     *                 3.verify READ_FAILED error code
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      let testTag: string = "SUB_MULTIMEDIA_IMAGE_HEIFS_CREATEPICTURE_ERROR_0300";
      let logger = new Logger(testTag);
      let fileName = "heif.heic";
      let filePath = await getFilePath(fileName);
      let ret = false;
      if (!(fileName.toLowerCase().endsWith('.heic') && isSupportHEICDecode)) {
        logger.log("device is not support decode heif!");
        done();
      } else {
        let heifsMetadata1 = image.HeifsMetadata.createInstance();
        const imageMetadata: image.ImageMetadata = {
          heifsMetadata: heifsMetadata1
        };
        let imageSourceApi = image.createImageSource(filePath);
        try {
          await imageSourceApi.writeImageMetadata(imageMetadata);
          logger.log("writeImageMetadata success");
        } catch (error) {
          logger.log("Border value writeImageMetadata failed error is: " + JSON.stringify(error));
          ret = handleError(testTag, error as GenericError | Array<GenericError>, READ_FAILED);
        } finally {
          if (imageSourceApi != undefined) {
            await imageSourceApi?.release();
          }
        }
        expect(ret).assertTrue();
        done();
      }
    });


  });
}
