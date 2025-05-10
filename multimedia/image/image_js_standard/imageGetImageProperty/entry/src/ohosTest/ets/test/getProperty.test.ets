/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { getPropertyBuf } from "./getPropertyBuf";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';


const ORIENTATION = image.PropertyKey.ORIENTATION
const IMAGE_LENGTH = image.PropertyKey.IMAGE_LENGTH
const IMAGE_WIDTH = image.PropertyKey.IMAGE_WIDTH
const DATE_TIME_ORIGINAL = image.PropertyKey.DATE_TIME_ORIGINAL
const EXPOSURE_TIME = image.PropertyKey.EXPOSURE_TIME
const SCENE_TYPE = image.PropertyKey.SCENE_TYPE
const ISO_SPEED_RATINGS = image.PropertyKey.ISO_SPEED_RATINGS
const F_NUMBER = image.PropertyKey.F_NUMBER
const DATE_TIME = image.PropertyKey.DATE_TIME
const GPS_DATE_STAMP = image.PropertyKey.GPS_DATE_STAMP
const IMAGE_DESCRIPTION = image.PropertyKey.IMAGE_DESCRIPTION
const SCENE_FLOWERS_CONF = image.PropertyKey.SCENE_FLOWERS_CONF
const SCENE_NIGHT_CONF = image.PropertyKey.SCENE_NIGHT_CONF
const GIF_LOOP_COUNT = image.PropertyKey.GIF_LOOP_COUNT

let filePath: ESObject;
let fdNumber: number;
const LOOPCASE: ESObject = {
  LOOP_FIVE: '5',
  LOOP_ONE: '1',
  LOOP_ZERO: '0',
  LOOP_NO: null,
};
let GET_PROPERTIES_ERROR_CODE = "62980096";
let globalImagesource: image.ImageSource;

async function getFd(fileName: string) {
  let context: ESObject = await AppStorage.get('thisContext');
  filePath = context.filesDir + "/" + fileName;
  console.info("image case filePath is " + filePath);
  await fileio
    .open(filePath)
    .then(
      (data) => {
        fdNumber = data;
        console.info("image case open fd success " + fdNumber);
      },
      (err: BusinessError) => {
        console.info("image cese open fd fail" + err);
      }
    )
    .catch((err: BusinessError) => {
      console.info("image case open fd err " + err);
    });
}


let props: ESObject = {
  DateTimeOriginal: "2022:06:02 15:51:35",
  ExposureTime: "1/33 sec.",
  SceneType: "Directly photographed",
  ISOSpeedRatings: "400",
  FNumber: "f/1.8",
};

async function testGetImageProperties(done: Function, testNum: string, type: string, args: ESObject) {
  let imageSourceApi: image.ImageSource;
  if (type == "buf") {
    const data = getPropertyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd(type);
    imageSourceApi = image.createImageSource(filePath);
  }

  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi.getImageProperties(args)
      .then((data) => {
        console.info(`${testNum} ${args}` + JSON.stringify(data));
        expect(true).assertTrue();
        done();
      })
      .catch((error: BusinessError) => {
        const errormsg = error.toString();
        const errorCode = JSON.stringify(error);
        console.log(`${testNum} error: ` + errormsg);
        expect(errorCode.includes(GET_PROPERTIES_ERROR_CODE)).assertTrue();
        done();
      });
  }
}

async function testGetImagePropertyPromise(done: Function, testNum: string, type: string, args: ESObject) {
  let imageSourceApi: image.ImageSource;
  if (type == "buf") {
    const data = getPropertyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif1.jpg");
    imageSourceApi = image.createImageSource(fdNumber);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    imageSourceApi
      .getImageProperty(args)
      .then((data) => {
        console.info(`${testNum} ${args} ` + data);
        expect(data == props[args]).assertTrue();
        done();
      })
      .catch((error: BusinessError) => {
        console.log(`${testNum} error: ` + error);
        expect(false).assertTrue();
        done();
      });
  }
}

async function testGetImagePropertyCb(done: Function, testNum: string, type: string, args: ESObject) {
  let imageSourceApi: image.ImageSource;
  if (type == "buf") {
    const data = getPropertyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif1.jpg");
    imageSourceApi = image.createImageSource(fdNumber);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    imageSourceApi.getImageProperty(args, (err: BusinessError, data: string) => {
      if (err) {
        expect(false).assertTrue();
        console.info(`${testNum} ${args} err: ` + err);
      } else {
        console.info(`${testNum} ${args} ` + data);
        expect(data == props[args]).assertTrue();
        done();
      }
    });
  }
}

async function testGetImagePropertyOptCb(done: Function, testNum: string, type: string, args: ESObject) {
  let imageSourceApi: image.ImageSource;
  if (type == "buf") {
    const data = getPropertyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif1.jpg");
    imageSourceApi = image.createImageSource(fdNumber);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    let property: ESObject = { index: 0, defaultValue: "9999" };
    imageSourceApi.getImageProperty(args, property, (err, data) => {
      if (err) {
        expect(false).assertTrue();
        console.info(`${testNum} ${args} err: ` + err);
      } else {
        console.info(`${testNum} ${args} ` + data);
        expect(data != "9999" && data == props[args]).assertTrue();
        done();
      }
    });
  }
}

async function testGetImagePropertyPromiseErr(done: Function, testNum: string, type: string, args: ESObject,
  isTypeErr: boolean) {
  let imageSourceApi: image.ImageSource;
  if (type == "buf") {
    const data = getPropertyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif1.jpg");
    imageSourceApi = image.createImageSource(fdNumber);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    if (isTypeErr) {
      try {
        await imageSourceApi.getImageProperty(args);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
        console.log(`${testNum} error msg: ` + error);
        done();
      }
    } else {
      try {
        await imageSourceApi.getImageProperty(args);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code != 0).assertTrue();
        console.log(`${testNum} error msg: ` + error);
        done();
      }
    }
  }
}

async function testGetImagePropertyCbErr(done: Function, testNum: string, type: string, args: ESObject,
  isTypeErr: boolean) {
  let imageSourceApi: image.ImageSource;
  if (type == "buf") {
    const data = getPropertyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif1.jpg");
    imageSourceApi = image.createImageSource(fdNumber);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    if (isTypeErr) {
      try {
        imageSourceApi.getImageProperty(args, (error: BusinessError, data: string) => {
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(`${testNum} error1 msg: ` + error);
        expect(error.code == 401).assertTrue();
        done();
      }
    } else {
      imageSourceApi.getImageProperty(args, (error: BusinessError, data: string) => {
        expect(error.code != 0).assertTrue();
        console.log(`${testNum} error3 msg: ` + error);
        done();
      });
    }
  }
}

async function testGetImagePropertyOptCbErr(done: Function, testNum: string, type: string, args: ESObject,
  isTypeErr: boolean) {
  let imageSourceApi: image.ImageSource;
  if (type == "buf") {
    const data = getPropertyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif1.jpg");
    imageSourceApi = image.createImageSource(fdNumber);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    let property: ESObject = { index: 0, defaultValue: "9999" };
    if (isTypeErr) {
      try {
        imageSourceApi.getImageProperty(args, property, (error: BusinessError, data: string) => {
          expect(false).assertTrue();
        });
      } catch (error) {
        expect(error.code == 401).assertTrue();
        console.log(`${testNum} error msg: ` + error);
        done();
      }
    } else {
      imageSourceApi.getImageProperty(args, property, (error: BusinessError, data: string) => {
        expect(error.code != 0).assertTrue();
        console.log(`${testNum} error msg: ` + error);
        done();
      });
    }
  }
}

async function testGetGifLoopCount(done: Function, testNum: string, loopCase: string, isBatch: boolean,
  args: ESObject) {
  let imageSourceApi: image.ImageSource;
  if (loopCase == LOOPCASE.LOOP_FIVE) {
    await getFd("moving_test_loop5.gif");
  } else if (loopCase == LOOPCASE.LOOP_ONE) {
    await getFd("moving_test_loop1.gif");
  } else if (loopCase == LOOPCASE.LOOP_ZERO) {
    await getFd("moving_test_loop0.gif");
  } else {
    await getFd("text.jpg");
  }

  imageSourceApi = image.createImageSource(fdNumber);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    if (!isBatch) {
      imageSourceApi
        .getImageProperty(args)
        .then((data) => {
          console.info(`${testNum} ${args} ` + data);
          expect(data == loopCase).assertTrue();
          done();
        })
        .catch((error: ESObject) => {
          console.log(`${testNum} error: ` + error);
          console.log(`${testNum} error: ` + JSON.stringify(error));
          expect(error.code == "62980149").assertTrue();
          done();
        });
    } else {
      imageSourceApi
        .getImageProperties(args)
        .then((data) => {
          console.info(`${testNum} ${args} ` + JSON.stringify(data));
          expect(data['GIFLoopCount'] == loopCase).assertTrue();
          done();
        })
        .catch((error: BusinessError) => {
          console.log(`${testNum} error: ` + error);
          console.log(`${testNum} error: ` + JSON.stringify(error));
          expect(JSON.stringify(error).includes("62980096")).assertTrue();
          done();
        });
    }
  }
}

export default function imageGetImageProperty() {
  describe("imageGetImageProperty", () => {

    beforeAll(async () => {
      console.info("beforeAll case");
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
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100
     * @tc.name      : getImageProperty(DateTimeOriginal)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", 0, async (done: Function) => {
      let key = DATE_TIME_ORIGINAL;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0100", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200
     * @tc.name      : getImageProperty(ExposureTime)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ExposureTime)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", 0, async (done: Function) => {
      let key = EXPOSURE_TIME;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0200", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300
     * @tc.name      : getImageProperty(FNumber)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(FNumber)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", 0, async (done: Function) => {
      let key = F_NUMBER;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0300", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400
     * @tc.name      : getImageProperty(ISOSpeedRatings)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ISOSpeedRatings)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", 0, async (done: Function) => {
      let key = ISO_SPEED_RATINGS;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0400", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500
     * @tc.name      : getImageProperty(SceneType)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(SceneType)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", 0, async (done: Function) => {
      let key = SCENE_TYPE;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_0500", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100
     * @tc.name      : getImageProperty(DateTimeOriginal)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(DateTimeOriginal)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", 0, async (done: Function) => {
      let key = DATE_TIME_ORIGINAL;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0100", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200
     * @tc.name      : getImageProperty(ExposureTime)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ExposureTime)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", 0, async (done: Function) => {
      let key = EXPOSURE_TIME;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0200", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300
     * @tc.name      : getImageProperty(FNumber)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(FNumber)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", 0, async (done: Function) => {
      let key = F_NUMBER;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0300", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400
     * @tc.name      : getImageProperty(ISOSpeedRatings)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ISOSpeedRatings)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", 0, async (done: Function) => {
      let key = ISO_SPEED_RATINGS;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0400", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500
     * @tc.name      : getImageProperty(SceneType)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(SceneType)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", 0, async (done: Function) => {
      let key = SCENE_TYPE;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0500", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600
     * @tc.name      : getImageProperty(DateTimeOriginal,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", 0, async (done: Function) => {
      let key = DATE_TIME_ORIGINAL;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0600", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700
     * @tc.name      : getImageProperty(ExposureTime,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ExposureTime,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", 0, async (done: Function) => {
      let key = EXPOSURE_TIME;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0700", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800
     * @tc.name      : getImageProperty(FNumber,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(FNumber,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", 0, async (done: Function) => {
      let key = F_NUMBER;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0800", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900
     * @tc.name      : getImageProperty(ISOSpeedRatings,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ISOSpeedRatings,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", 0, async (done: Function) => {
      let key = ISO_SPEED_RATINGS;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_0900", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000
     * @tc.name      : getImageProperty(SceneType,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(SceneType,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", 0, async (done: Function) => {
      let key = SCENE_TYPE;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_1000", "picture", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0100
     * @tc.name      : getImageProperty(DateTimeOriginal)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0100", 0, async (done: Function) => {
      let key = DATE_TIME_ORIGINAL;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0100", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0200
     * @tc.name      : getImageProperty(ExposureTime)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ExposureTime)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0200", 0, async (done: Function) => {
      let key = EXPOSURE_TIME;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0200", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0300
     * @tc.name      : getImageProperty(FNumber)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(FNumber)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0300", 0, async (done: Function) => {
      let key = F_NUMBER;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0300", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0400
     * @tc.name      : getImageProperty(ISOSpeedRatings)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ISOSpeedRatings)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0400", 0, async (done: Function) => {
      let key = ISO_SPEED_RATINGS;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0400", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0500
     * @tc.name      : getImageProperty(SceneType)
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(SceneType)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0500", 0, async (done: Function) => {
      let key = SCENE_TYPE;
      testGetImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_0500", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0100
     * @tc.name      : getImageProperty(DateTimeOriginal)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(DateTimeOriginal)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0100", 0, async (done: Function) => {
      let key = DATE_TIME_ORIGINAL;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0100", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0200
     * @tc.name      : getImageProperty(ExposureTime)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ExposureTime)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0200", 0, async (done: Function) => {
      let key = EXPOSURE_TIME;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0200", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0300
     * @tc.name      : getImageProperty(FNumber)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(FNumber)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0300", 0, async (done: Function) => {
      let key = F_NUMBER;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0300", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0400
     * @tc.name      : getImageProperty(ISOSpeedRatings)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(ISOSpeedRatings)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0400", 0, async (done: Function) => {
      let key = ISO_SPEED_RATINGS;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0400", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0500
     * @tc.name      : getImageProperty(SceneType)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty(SceneType)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0500", 0, async (done: Function) => {
      let key = SCENE_TYPE;
      testGetImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0500", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0600
     * @tc.name      : getImageProperty(DateTimeOriginal,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(DateTimeOriginal,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0600", 0, async (done: Function) => {
      let key = DATE_TIME_ORIGINAL;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0600", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0700
     * @tc.name      : getImageProperty(ExposureTime,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ExposureTime,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0700", 0, async (done: Function) => {
      let key = EXPOSURE_TIME;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0700", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0800
     * @tc.name      : getImageProperty(FNumber,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(FNumber,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0800", 0, async (done: Function) => {
      let key = F_NUMBER;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0800", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0900
     * @tc.name      : getImageProperty(ISOSpeedRatings,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(ISOSpeedRatings,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0900", 0, async (done: Function) => {
      let key = ISO_SPEED_RATINGS;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_0900", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_1000
     * @tc.name      : getImageProperty(SceneType,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.set property
     *                 3.call getImageProperty(SceneType,property)
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_1000", 0, async (done: Function) => {
      let key = SCENE_TYPE;
      testGetImagePropertyOptCb(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBAK_BUFFER_1000", "buf", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0100
     * @tc.name      : getImageProperty-Promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0100", 0, async (done: Function) => {
      let key = "Date";
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0100", "picture", key,
        false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0200
     * @tc.name      : getImageProperty-Promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0200", 0, async (done: Function) => {
      let key = null;
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0200", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0300
     * @tc.name      : getImageProperty-Promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0300", 0, async (done: Function) => {
      let key = 12;
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0300", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0400
     * @tc.name      : getImageProperty-Promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0400", 0, async (done: Function) => {
      let key: ESObject = {
        w: 12
      };
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_ERROR_0400", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0100
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0100", 0, async (done: Function) => {
      let key = "Date";
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0100", "picture", key,
        false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0200
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0200", 0, async (done: Function) => {
      let key = null;
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0200", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0300
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0300", 0, async (done: Function) => {
      let key = 12;
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0300", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0400
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0400", 0, async (done: Function) => {
      let key: ESObject = {
        w: 12
      };
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0400", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0500
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0500", 0, async (done: Function) => {
      let key = "Date";
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0500", "picture", key,
        false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0600
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0600", 0, async (done: Function) => {
      let key = null;
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0600", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0700
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0700", 0, async (done: Function) => {
      let key = 12;
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0700", "picture", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0800
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0800", 0, async (done: Function) => {
      let key: ESObject = {
        a: 12
      };
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_ERROR_0800", "picture", key,
        true);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0100
     * @tc.name      : getImageProperty-promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0100", 0, async (done: Function) => {
      let key = "Date";
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0100", "buf",
        key, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0200
     * @tc.name      : getImageProperty-promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0200", 0, async (done: Function) => {
      let key = null;
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0200", "buf",
        key, true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0300
     * @tc.name      : getImageProperty-promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0300", 0, async (done: Function) => {
      let key = 12;
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0300", "buf",
        key, true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0400
     * @tc.name      : getImageProperty-promise-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0400", 0, async (done: Function) => {
      let key: ESObject = {
        w: 12
      };
      testGetImagePropertyPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_PROMISE_BUFFER_ERROR_0400", "buf",
        key, true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0100
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0100", 0, async (done: Function) => {
      let key = "Date";
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0100", "buf",
        key, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0200
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0200", 0, async (done: Function) => {
      let key = null;
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0200", "buf",
        key, true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0300
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0300", 0, async (done: Function) => {
      let key = 12;
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0300", "buf",
        key, true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0400
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0400", 0, async (done: Function) => {
      let key: ESObject = {
        w: 12
      };
      await testGetImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0400", "buf",
        key, true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0500
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0500", 0, async (done: Function) => {
      let key = "Date";
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0500", "buf", key,
        false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0600
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0600", 0, async (done: Function) => {
      let key = null;
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0600", "buf", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0700
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0700", 0, async (done: Function) => {
      let key = 12;
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0700", "buf", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0800
     * @tc.name      : getImageProperty-callback-wrong key
     * @tc.desc      : 1.create imagesource
     *                 2.call getImageProperty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0800", 0, async (done: Function) => {
      let key: ESObject = {
        a: 12
      };
      testGetImagePropertyOptCbErr(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_CALLBACK_BUFFER_ERROR_0800", "buf", key,
        true);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0100
     * @tc.name      : test getImageProperties for jpg with multy key
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0100", 0, async (done: Function) => {
      let key = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0100", "test_exif.jpg", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0200
     * @tc.name      : test getImageProperties for png with multy key
     * @tc.desc      : 1.create png imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0200", 0, async (done: Function) => {
      let key = [
        ORIENTATION,
        DATE_TIME
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0200", "test_exif.png", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0300
     * @tc.name      : test getImageProperties for jpg with single key
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0300", 0, async (done: Function) => {
      let key = [
        IMAGE_WIDTH
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0300", "test_exif.jpg", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0400
     * @tc.name      : test getImageProperties for png with single key
     * @tc.desc      : 1.create png imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0400", 0, async (done: Function) => {
      let key = [
        ORIENTATION
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0400", "test_exif.png", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0500
     * @tc.name      : test getImageProperties for jpg with partially incorrect keys
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0500", 0, async (done: Function) => {
      let key = [
        "ErrorKey",
        IMAGE_WIDTH
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0500", "test_exif.jpg", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0600
     * @tc.name      : test getImageProperties for png with partially incorrect keys
     * @tc.desc      : 1.create png imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0600", 0, async (done: Function) => {
      let key = [
        "ErrorKey",
        ORIENTATION
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0600", "test_exif.png", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0700
     * @tc.name      : test getImageProperties for jpg with partially null value
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0700", 0, async (done: Function) => {
      let key = [
        GPS_DATE_STAMP,
        IMAGE_DESCRIPTION,
        SCENE_NIGHT_CONF
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0700", "test_exif.jpg", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0800
     * @tc.name      : test getImageProperties for png with partially null value
     * @tc.desc      : 1.create png imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0800", 0, async (done: Function) => {
      let key = [
        GPS_DATE_STAMP,
        IMAGE_DESCRIPTION,
        SCENE_NIGHT_CONF
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0800", "test_exif.png", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0900
     * @tc.name      : test getImageProperties for private filed of jpg
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0900", 0, async (done: Function) => {
      let key = [
        SCENE_FLOWERS_CONF,
        SCENE_NIGHT_CONF
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_0900", "test_exif.jpg", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_1000
     * @tc.name      : test getImageProperties for private filed of png
     * @tc.desc      : 1.create png imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_1000", 0, async (done: Function) => {
      let key = [
        SCENE_FLOWERS_CONF,
        SCENE_NIGHT_CONF
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_1000", "test_exif.png", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0100
     * @tc.name      : test getImageProperties for jpg with all invalid keys
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0100", 0, async (done: Function) => {
      let key = [
        "ErrorKey1",
        "ErrorKey2"
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0100", "test_exif.jpg", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0200
     * @tc.name      : test getImageProperties for png with all invalid keys
     * @tc.desc      : 1.create png imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0200", 0, async (done: Function) => {
      let key = [
        "ErrorKey1",
        "ErrorKey2"
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0200", "test_exif.png", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0300
     * @tc.name      : test getImageProperties for tiff with multy keys
     * @tc.desc      : 1.create tiff imagesource
     *                 2.call getImageProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0300", 0, async (done: Function) => {
      let key = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      testGetImageProperties(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_PROMISE_ERROR_0300", "test.tiff", key);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100
     * @tc.name      : test getImageProperty obtains the loop count 5 of gif
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperty()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100", 0, async (done: Function) => {
      let key = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0100", LOOPCASE.LOOP_FIVE,
        false, key);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200
     * @tc.name      : test getImageProperty obtains the loop count 1 of gif
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperty()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200", 0, async (done: Function) => {
      let key = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0200", LOOPCASE.LOOP_ONE,
        false, key);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300
     * @tc.name      : test getImageProperty obtains the loop count infinite of gif
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperty()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300", 0, async (done: Function) => {
      let key = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0300", LOOPCASE.LOOP_ZERO,
        false, key);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400
     * @tc.name      : test getImageProperty obtains the loop count error of jpg
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperty()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400", 0, async (done: Function) => {
      let key = GIF_LOOP_COUNT;
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTY_LOOPCOUNT_PROMISE_0400", LOOPCASE.LOOP_NO, false,
        key);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0100
     * @tc.name      : test getImageProperties obtains the loop count 5 of gif
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperties()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0100", 0, async (done: Function) => {
      let key = [GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0100 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0100", LOOPCASE.LOOP_FIVE,
        true, key);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0200
     * @tc.name      : test getImageProperties obtains the loop count 1 of gif
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperties()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0200", 0, async (done: Function) => {
      let key = [IMAGE_WIDTH, GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0200 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0200", LOOPCASE.LOOP_ONE,
        true, key);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0300
     * @tc.name      : test getImageProperties obtains the loop count infinite of gif
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperties()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0300", 0, async (done: Function) => {
      let key = [IMAGE_WIDTH, GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0300 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0300", LOOPCASE.LOOP_ZERO,
        true, key);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0400
     * @tc.name      : test getImageProperties obtains the loop count error of jpg
     * @tc.desc      : 1.getFd()
     *                 2.getImageProperties()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0400", 0, async (done: Function) => {
      let key = [IMAGE_WIDTH, GIF_LOOP_COUNT];
      console.info(`SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0400 start`);
      testGetGifLoopCount(done, "SUB_MULTIMEDIA_IMAGE_GETIMAGEPROPERTIES_LOOPCOUNT_PROMISE_0400", LOOPCASE.LOOP_NO,
        true, key);
    });
  });
}
