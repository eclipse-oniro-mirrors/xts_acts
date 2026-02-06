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


const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
const EXPECTFRAMECOUNT = 3;
const ERR_CODE = 62980149;
const ERR_CODE1 = 62980096;
const ERR_CODE2 = 62980118;
const DECODE_FAILED = 7700301;
const UNSUPPORTED_MIMETYPE = 7700102;
const IMAGE_TOO_LARGE = 7700103;
const UNSUPPORTED_OPTIONS = 7700203;
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

async function gifInCompleteFrameTestMarshalling(logger: Logger, picture: image.Picture): Promise<boolean> {
  try {
    let parcelable: MySequence = new MySequence(picture);
    let data: rpc.MessageSequence = rpc.MessageSequence.create();
    data.writeParcelable(parcelable);
    let ret: MySequence = new MySequence(picture);
    data.readParcelable(ret);
    await sleep(500);

    let marshallingMetadata = await picture.getMetadata(image.MetadataType.GIF_METADATA);
    let unmarshallingMetadata = await ret.picture_.getMetadata(image.MetadataType.GIF_METADATA);
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

async function gifInCompleteFrameMetadataTest(logger: Logger, picture: image.Picture, modifyProperties: Record<string, string | null>): Promise<boolean> {
  try {
    let metadata = await picture.getMetadata(image.MetadataType.GIF_METADATA);
    await metadata.setProperties(modifyProperties);
    await picture.setMetadata(image.MetadataType.GIF_METADATA, metadata);
    let dataAfterSet = await picture.getMetadata(image.MetadataType.GIF_METADATA);
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0100
     * @tc.name      : test getDelayTimeList(promise) one frame gif
     * @tc.desc      : 1.create one frame gif imagesource
     *                 2.getDelayTimeList(promise)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0100", "test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0200
     * @tc.name      : test getDelayTimeList(promise) gif
     * @tc.desc      : 1.create gif imagesource
     *                 2.getDelayTimeList(promise)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0200", Level.LEVEL0, async (done:Function)=>{
      getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_0200", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0100
     * @tc.name      : test getDelayTimeList(callback) one frame gif
     * @tc.desc      : 1.create one frame gif imagesource
     *                 2.getDelayTimeList(callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0100", Level.LEVEL0, async (done:Function)=>{
      getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0100", "test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0200
     * @tc.name      : test getDelayTimeList(callback) gif
     * @tc.desc      : 1.create gif imagesource
     *                 2.getDelayTimeList(callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0200", Level.LEVEL0, async (done:Function)=>{
      getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_0200", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0100
     * @tc.name      : test getDisposalType promise for gif
     * @tc.desc      : 1.create gif imagesource
     *                 2.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0100", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0200
     * @tc.name      : test getDisposalType promise for one frame gif
     * @tc.desc      : 1.create one frame gif imagesource
     *                 2.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0200", Level.LEVEL0, async (done:Function)=>{
      testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0200", "test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0300
     * @tc.name      : test getDisposalType promise jpg error
     * @tc.desc      : 1.create jpg imagesource
     *                 2.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0300", Level.LEVEL0, async (done:Function)=>{
      testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_0300", "test.jpg");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_0100
     * @tc.name      :  getFrameCount - promise
     * @tc.desc      : 1.create imagesource
     *                 2.getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_0100", Level.LEVEL0, async (done:Function)=>{
      getFrameCountPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_0100", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_0100
     * @tc.name      :  getFrameCount - callback
     * @tc.desc      : 1.create imagesource
     *                 2.getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_0100", Level.LEVEL0, async (done:Function)=>{
      getFrameCountCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_0100", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_0100
     * @tc.name      : createPixelMapList - promise
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0100
     * @tc.name      : createPixelMapList - promise-sampleSize: -1
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0200
     * @tc.name      : createPixelMapList - promise-index: -8
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0300
     * @tc.name      : createPixelMapList - promise-rotate: 500
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_0400
     * @tc.name      : createPixelMapList - promise-desiredPixelFormat: unsupported format
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_0100
     * @tc.name      : createPixelMapList - callback
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0100
     * @tc.name      : createPixelMapList - callback-sampleSize: -1
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0200
     * @tc.name      : createPixelMapList - callback- index: -8
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0300
     * @tc.name      : createPixelMapList - callback-rotate: 500
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_CALLBACK_0400
     * @tc.name      : createPixelMapList - callback-unsupported format
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100
     * @tc.desc      : test gif incomplete frame
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     *                 3.getDelayTimeList
     *                 4.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0100");
      let ret = await gifIncompleteFrameTest(logger, "moving_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200
     * @tc.desc      : test gif incomplete frame
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     *                 3.test marshalling
     *                 4.compare picture gif metadata properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0200");
      let filePath = await getFilePath("moving_test.gif");
      try {
        let imageSourceApi = image.createImageSource(filePath);
        let picture: image.Picture = await imageSourceApi.createPictureAtIndex(0);
        let ret = await gifInCompleteFrameTestMarshalling(logger, picture);
        expect(ret).assertTrue();
        done();
      } catch (error) {
        logger.log("error is: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300
     * @tc.desc      : test gif incomplete frame
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     *                 3.compare picture gif metadata properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_0300");
      let filePath = await getFilePath("moving_test.gif");
      try {
        let imageSourceApi = image.createImageSource(filePath);
        let picture: image.Picture = await imageSourceApi.createPictureAtIndex(0);
        let modifyProperties: Record<string, string | null> = {"GifDelayTime":"100", "GifDisposalType":"2"};
        let ret = await gifInCompleteFrameMetadataTest(logger, picture, modifyProperties);
        expect(ret).assertTrue();
        done();
      } catch (error) {
        logger.log("error is: " + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0100");
      let ret = await gifIncompleteFrameTest(logger, "incomplete_test.gif");
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0200
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300", Level.LEVEL0, async (done:() => void)=>{
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0300");
      let ret = await gifInCompleteFrameTestError(logger, "fake_large_size_test.gif", IMAGE_TOO_LARGE);
      expect(ret).assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_INCOMPLETE_FRAME_ERROR_0400
     * @tc.desc      : test gif incomplete frame error
     *                 1.create imagesource
     *                 2.createPictureAtIndex
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
  });
}
