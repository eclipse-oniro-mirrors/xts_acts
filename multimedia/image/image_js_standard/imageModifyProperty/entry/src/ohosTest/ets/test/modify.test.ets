/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import { modifyBuf } from "./modifyBuffer";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';
import fs from '@ohos.file.fs';


const IMAGE_LENGTH = image.PropertyKey.IMAGE_LENGTH;
const IMAGE_WIDTH = image.PropertyKey.IMAGE_WIDTH;
const GPS_DATE_STAMP = image.PropertyKey.GPS_DATE_STAMP;
const IMAGE_DESCRIPTION = image.PropertyKey.IMAGE_DESCRIPTION;
const SCENE_BLUE_SKY_CONF = image.PropertyKey.SCENE_BLUE_SKY_CONF;
const SCENE_GREEN_PLANT_CONF = image.PropertyKey.SCENE_GREEN_PLANT_CONF;
const GIF_LOOP_COUNT = image.PropertyKey.GIF_LOOP_COUNT;

let globalImagesource: image.ImageSource;
let globalImagepacker: image.ImagePacker | undefined;
let globalPixelMap: image.PixelMap | undefined;
let filePath: ESObject;
let fdNumber: number;
let ERROR_CODE1 = "62980135";
let ERROR_CODE2 = "62980146";
let ERROR_CODE3 = "62980096";
let ERROR_CODE4 = 62980123;
let ERROR_CODE5 = 62980110;
let filesDir: string|undefined;
let cacheDir: string|undefined;
let testContext: common.UIAbilityContext;
let isSupportHEIFDecode: boolean;
let isSupportHEICEncode: boolean;
let isSupportHdr: Boolean;

interface RecordKeyValue {
  key: image.PropertyKey,
  value: string
}

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

const getFdFilesDir = (fileName: string) => {
  const uri: string = filesDir + '/' + fileName;
  const file: fs.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  return file.fd;
}

async function testModifyImageProperties(done: Function, testNum: string, type: string, props: ESObject,
  checkKey: ESObject) {
  let imageSourceApi: image.ImageSource;
  if (type == "buffer") {
    const data = modifyBuf.buffer;
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
    imageSourceApi.modifyImageProperties(props)
      .then(() => {
        imageSourceApi
          .getImageProperties(checkKey)
          .then((data: ESObject) => {
            console.info(`${testNum} newProps: ${JSON.stringify(props)} , data: ${JSON.stringify(data)}`);
            checkKey.forEach((item: ESObject) => {
              expect(data.item == props.item).assertTrue();
            })
            done();
          })
          .catch((err: BusinessError) => {
            const errorCode = JSON.stringify(err);
            console.log(`${testNum} get error: ` + err.toString());
            expect(errorCode.includes(ERROR_CODE3)).assertTrue();
            done();
          });
      })
      .catch((err: BusinessError) => {
        const errorCode = JSON.stringify(err);
        console.log(`${testNum} modify error: ` + err.toString());
        expect(errorCode.includes(ERROR_CODE1) || errorCode.includes(ERROR_CODE2) || errorCode.includes(ERROR_CODE3))
          .assertTrue();
        imageSourceApi
          .getImageProperties(checkKey)
          .then((data) => {
            console.info(`${testNum} props: ${JSON.stringify(props)} , data: ${JSON.stringify(data)}`);
          })
        done();
      });
  }
}

async function testModifyImagePropertyPromise(done: Function, testNum: string, type: string, key: ESObject,
  value: ESObject, checkProps: Function) {
  let imageSourceApi: image.ImageSource;
  if (type == "buffer") {
    const data = modifyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif.jpg");
    imageSourceApi = image.createImageSource(filePath);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi
      .modifyImageProperty(key, value)
      .then(() => {
        imageSourceApi
          .getImageProperty(key)
          .then((data) => {
            console.info(`${testNum} ${key} ` + data);
            checkProps(data);
            done();
          })
          .catch((err: BusinessError) => {
            console.info(`${testNum} getImageProperty failed, err:${err}`);
            expect(false).assertTrue();
            done();
          });
      })
      .catch((err: BusinessError) => {
        console.info(`${testNum} modifyImageProperty failed, err:${err}`);
        expect(false).assertTrue();
        done();
      });
  }
}

async function testModifyImagePropertyCb(done: Function, testNum: string, type: string, key: ESObject, value: string,
  checkProps: Function) {
  let imageSourceApi: image.ImageSource;
  if (type == "buffer") {
    const data = modifyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif.jpg");
    imageSourceApi = image.createImageSource(filePath);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi.modifyImageProperty(key, value, (error: BusinessError) => {
      if (error) {
        console.info(`${testNum} modify err: ` + error);
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty(key, (error: BusinessError, data: string) => {
          if (error) {
            console.info(`${testNum} get err: ` + error);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${testNum} ${key}: ` + data);
            checkProps(data);
            done();
          }
        });
      }
    });
  }
}

async function testModifyImagePropertyOptCb(done: Function, testNum: string, type: string, key: string, value: string,
  checkProps: Function) {
  let imageSourceApi: image.ImageSource;
  if (type == "buffer") {
    const data = modifyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif.jpg");
    imageSourceApi = image.createImageSource(filePath);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    let property: ESObject = { index: 0, defaultValue: "1" };
    imageSourceApi.modifyImageProperty(key, value, (error: BusinessError) => {
      if (error) {
        console.info(`${testNum} modify err: ` + error);
        expect(false).assertTrue();
        done();
      } else {
        imageSourceApi.getImageProperty(key, (error, data) => {
          if (error) {
            console.info(`${testNum} get err: ` + error);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${testNum} ${key}: ` + data);
            checkProps(data);
            done();
          }
        });
      }
    });
  }
}

async function testModifyImagePropertyCbErr(done: Function, testNum: string, type: string, key: ESObject,
  value: string) {
  let imageSourceApi: image.ImageSource;
  if (type == "buffer") {
    const data = modifyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif.jpg");
    imageSourceApi = image.createImageSource(filePath);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi.modifyImageProperty(key, value, (error: BusinessError) => {
      console.info(`${testNum} errormsg: ` + error);
      expect(error.code == 62980135).assertTrue();
      done();
    });
  }
}

async function testModifyImagePropertyOptCbErr(done: Function, testNum: string, type: string, key: string,
  value: string) {
  let imageSourceApi: image.ImageSource;
  if (type == "buffer") {
    const data = modifyBuf.buffer;
    imageSourceApi = image.createImageSource(data);
  } else {
    await getFd("test_exif.jpg");
    imageSourceApi = image.createImageSource(filePath);
  }
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    let property: ESObject = { index: 0, defaultValue: "1" };
    imageSourceApi.modifyImageProperty(key, value, (error: BusinessError) => {
      console.info(`${testNum} errormsg: ` + error);
      expect(error.code == 62980135).assertTrue();
      done();
    });
  }
}

async function testModifyImagePropertyPromiseError(done: Function, testNum: string, type: string, key: string,
  value: string) {
  let imageSourceApi: image.ImageSource | undefined;
  try {
    if (type == "buffer") {
      const data = modifyBuf.buffer;
      imageSourceApi = image.createImageSource(data);
    } else {
      await getFd("test_exif.jpg");
      imageSourceApi = image.createImageSource(filePath);
    }
  } catch (error) {
    expect(false).assertTrue();
    done();
  }

  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi
      .modifyImageProperty(key, value)
      .then(() => {
        expect(false).assertTrue();
        done();
      })
      .catch((error: BusinessError) => {
        expect(error.code != 0).assertTrue();
        console.info(`${testNum} message: ` + error);
        done();
      });
  }
}

async function testModifyImageBufferProperty(done: Function, testNum: string, type: string, key: string,
  value: string) {
  let imageSourceApi: image.ImageSource | undefined;
  try {
    if (type == "buffer") {
      const data = modifyBuf.buffer;
      imageSourceApi = image.createImageSource(data);
    } else {
      console.info(`${testNum} buffer source failed`);
      expect(false).assertTrue();
      done();
    }
  } catch (error) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  }

  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    imageSourceApi
      .modifyImageProperty(key, value)
      .then(() => {
        expect(false).assertTrue();
        done();
      })
      .catch((error: BusinessError) => {
        console.info(`${testNum} message: ` + error);
        expect(error.code == 62980146).assertTrue();
        expect(error.message == "The EXIF data failed to be written to the file.").assertTrue();
        done();
      });
  }
}

async function testModifyLoopCountErr(testNum: string, type: string, isBatch: boolean, done: Function) {
  let imageSourceApi: image.ImageSource;
  try {
    if (type == "gif") {
      await getFd("moving_test_loop1.gif");
    } else {
      await getFd("test_exif.jpg");
    }
  } catch (error) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  }
  imageSourceApi = image.createImageSource(filePath);
  if (imageSourceApi == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource = imageSourceApi;
    if (isBatch) {
      let props: ESObject = {
        ImageWidth: '1024',
        GIFLoopCount: '3'
      };
      imageSourceApi
        .modifyImageProperties(props)
        .then(() => {
          console.log(`${testNum} modify GIF_LOOP_COUNT success.`);
          expect().assertFail();
          done()
        })
        .catch((error: BusinessError) => {
          let errorCode = JSON.stringify(error);
          console.log(`${testNum} error: ` + error);
          console.log(`${testNum} error: ` + errorCode);
          expect(errorCode.includes("62980146")).assertTrue();
          done();
        });
    } else {
      imageSourceApi
        .modifyImageProperty(GIF_LOOP_COUNT, '3')
        .then(() => {
          console.log(`${testNum} modify GIF_LOOP_COUNT success.`);
          expect().assertFail();
          done()
        })
        .catch((error: BusinessError) => {
          let errorCode = JSON.stringify(error);
          console.log(`${testNum} error: ` + error);
          console.log(`${testNum} error: ` + errorCode);
          expect(errorCode.includes("62980146")).assertTrue();
          done();
        });
    }
  }
}

async function createPixelMap(done: Function, testNum: string,fd: number) {
  let imageSource: image.ImageSource = image.createImageSource(fd);
  let imagePixelMapApi: image.PixelMap = await imageSource.createPixelMap();
  if (imagePixelMapApi == undefined) {
    console.info(`${testNum} create pixel map failed`);
    expect(false).assertTrue();
    done();
  }
  console.info(`${testNum} createPixelMap successfully `);
  globalPixelMap = imagePixelMapApi;
  await imageSource.release();
  return imagePixelMapApi;
}

async function checkMakerNoteInfo(done: Function, testNum: string, imageSource: image.ImageSource, prop: RecordKeyValue) {
  try {
    let materNoet: string = await imageSource.getImageProperty(prop.key);
    console.info(`${testNum} get imageSource MaterNote: ` + materNoet);
    expect(materNoet == prop.value).assertTrue();
    console.info(`${testNum} checkMakerNoteInfo successfully `);
  } catch (error) {
    console.info(`${testNum} getImageProperty error:` + error);
    expect(false).assertTrue();
    done();
  }
}

async function imagePackerPackToFile(done: Function, testNum: string, fd: number,
  packOpts: image.PackingOption, writeFd: number) {
    try {
      let pixelMap = await createPixelMap(done, testNum, fd);
      if (pixelMap == undefined) {
        console.info(`${testNum} create pixelMap failed`);
        expect(false).assertTrue();
        done();
    }
      const imagePackerApi: image.ImagePacker = image.createImagePacker();
      if (imagePackerApi == undefined) {
        console.info(`${testNum} create image packer failed`);
        expect(false).assertTrue();
        done();
      } else {
        globalImagepacker = imagePackerApi;
        await imagePackerApi.packToFile(pixelMap, writeFd, packOpts);
        console.info(`${testNum} imagePackerApi packToFile successfully `);
      }
    } catch (error) {
      console.error(`${testNum} Test exception ` + JSON.stringify(error));
      expect(false).assertFail();
      done();
    }
}

async function testModifyMakerNoteImageProperty(done: Function, testNum: string, picName: string,
  prop: RecordKeyValue, isEncoding: boolean, packOpts?: image.PackingOption, writeFd?: number) {
  let fd: number = getFdFilesDir(picName);
  let imageSource: image.ImageSource = image.createImageSource(fd);
  if (imageSource == undefined) {
    console.info(`${testNum} create image source failed`);
    expect(false).assertTrue();
    done();
  } else {
    globalImagesource= imageSource;
    imageSource.modifyImageProperty(prop.key, prop.value).then(async () => {
      if (isEncoding && writeFd != undefined && packOpts != undefined) {
        await imagePackerPackToFile(done, testNum, fd, packOpts, writeFd);
        let imageSourceApi: image.ImageSource = image.createImageSource(writeFd);
        await checkMakerNoteInfo(done, testNum, imageSourceApi, prop);
        if (imageSourceApi != undefined) {
          await imageSourceApi.release();
        }
      } else {
        await checkMakerNoteInfo(done, testNum, imageSource, prop);
      }
      [fd, writeFd].forEach((descriptor) => {
        if (descriptor != null) {
            fileio.closeSync(descriptor);
        }
      });
      done();
    }).catch((error: BusinessError) => {
      console.info(`${testNum} modifyImageProperty promise error:` + error);
      expect(false).assertTrue();
      done();
    });
  }
}

async function testModifyMakerNoteImagePropertyErr(done :Function, testNum: string, picName: string, prop: RecordKeyValue) {
    try {
      let fd: number = getFdFilesDir(picName);
      let imageSource: image.ImageSource = image.createImageSource(fd);
      if (imageSource == undefined) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      }
      imageSource.modifyImageProperty(prop.key, prop.value).then(async () => {
        console.info(`${testNum} modifyImageProperty promise error`);
        expect(false).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        if (error != undefined) {
          console.info(`${testNum} modifyImageProperty data error: ` + error);
          expect(error.code == ERROR_CODE4).assertTrue();
        } else {
          console.info(`${testNum} modifyImageProperty not supported image error: ` + error);
          expect(error == undefined).assertTrue();
        }
      });
      if (fd != undefined) {
        fs.closeSync(fd);
      }
      if (imageSource != undefined) {
        await globalImagesource.release();
        console.info(`${testNum} releaseImageSource successfully`);
      }
      done();
    } catch (error) {
      console.info(`${testNum} testModifyMakerNoteImagePropertyErr promise error:` + error);
      expect(false).assertTrue();
      done();
    }
}

async function testGetMakerNoteImagePropertyErr(done :Function, testNum: string, picName: string) {
    try {
      let fd: number = getFdFilesDir(picName);
      let imageSource: image.ImageSource = image.createImageSource(fd);
      if (imageSource == undefined) {
        console.info(`${testNum} create image source failed`);
        expect(false).assertTrue();
        done();
      }
      await imageSource.getImageProperty(image.PropertyKey.MAKER_NOTE).then((data: string) => {
        console.info(`${testNum} getImageProperty data: ` + data);
        expect(false).assertTrue();
      }).catch((error: BusinessError) => {
        if (error.code == ERROR_CODE4) {
          console.info(`${testNum} getImageProperty data error: ` + error);
          expect(error.code == ERROR_CODE4).assertTrue();
        } else if (error.code == ERROR_CODE5) {
          console.info(`${testNum} getImageProperty not supported image error: ` + error);
          expect(error.code == ERROR_CODE5).assertTrue();
        }
      });
      if (fd != undefined) {
        fs.closeSync(fd);
      }
      if (imageSource != undefined) {
        await globalImagesource.release();
        console.info(`${testNum} releaseImageSource successfully`);
      }
      done();
    } catch (error) {
      console.info(`${testNum} testGetMakerNoteImagePropertyErr promise error:` + error);
        expect(false).assertTrue();
        done();
    }
}

export default function imageModifyProperty() {
  describe("imageModifyProperty", () => {

    beforeAll(async () => {      
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir')
      cacheDir = AppStorage.get('cacheDir')
      isSupportHEIFDecode =
        image.createImageSource(filesDir + '/' + "testExif.jpg").supportedFormats.includes("image/heic");
      isSupportHEICEncode = 
        image.createImagePacker().supportedFormats.includes("image/heic");
      isSupportHdr = 
        !display.getDefaultDisplaySync().hdrFormats.includes(hdrCapability.HDRFormat.NONE) &&
          display.getDefaultDisplaySync().hdrFormats.length != 0;
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
      if (globalImagepacker != undefined) {
        console.info("globalImagepacker release start");
        try {
          await globalImagepacker.release();
          globalImagepacker = undefined;
        } catch (error) {
          console.info("globalImagepacker release fail");
        }
      }
      if (globalPixelMap != undefined) {
        console.info("globalPixelMap release start");
        try {
          await globalPixelMap.release();
          globalPixelMap = undefined;
        } catch (error) {
          console.info("globalPixelMap release fail");
        }
      }
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0100
     * @tc.name      : modifyImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0100",
        "buffer",
        image.PropertyKey.ORIENTATION,
        "2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0200
     * @tc.name      : modifyImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0200",
        "buffer",
        image.PropertyKey.GPS_LATITUDE,
        "114,3"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0300
     * @tc.name      : modifyImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0300",
        "buffer",
        image.PropertyKey.GPS_LONGITUDE,
        "18,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0400
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0400",
        "buffer",
        image.PropertyKey.GPS_LATITUDE_REF,
        "N",
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0500
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0500",
        "buffer",
        image.PropertyKey.GPS_LONGITUDE_REF,
        "W"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0600
     * @tc.name      : modifyImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Top-right").assertTrue();
      }
      testModifyImagePropertyPromise(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0600", "fd",
        image.PropertyKey.ORIENTATION, "2", checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0700
     * @tc.name      : modifyImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result.search("38") != -1).assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0700",
        "fd",
        image.PropertyKey.GPS_LATITUDE,
        "114,3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0800
     * @tc.name      : modifyImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result.search("9") != -1).assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0800",
        "fd",
        image.PropertyKey.GPS_LONGITUDE,
        "18,2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0900
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "N").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_0900",
        "fd",
        image.PropertyKey.GPS_LATITUDE_REF,
        "N",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1000
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "W").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1000",
        "fd",
        image.PropertyKey.GPS_LONGITUDE_REF,
        "W",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1100
     * @tc.name      : modifyImageProperty(BitsPerSample)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "4, 4, 4").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1100",
        "fd",
        image.PropertyKey.BITS_PER_SAMPLE,
        "4, 4, 4",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1200
     * @tc.name      : modifyImageProperty(ImageLength)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "800").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1200",
        "fd",
        image.PropertyKey.IMAGE_LENGTH,
        "800",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1300
     * @tc.name      : modifyImageProperty(ImageWidth)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "500").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1300",
        "fd",
        image.PropertyKey.IMAGE_WIDTH,
        "500",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1400
     * @tc.name      : modifyImageProperty(DateTimeOriginal)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2022:06:02 00:00:00").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1400",
        "fd",
        "DateTimeOriginal",
        "2022:06:02 00:00:00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1500
     * @tc.name      : modifyImageProperty(ExposureTime)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1500", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "1/3 sec.").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1500",
        "fd",
        "ExposureTime",
        "1/3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1600
     * @tc.name      : modifyImageProperty(SceneType)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Directly photographed").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1600",
        "fd",
        "SceneType",
        "1",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1700
     * @tc.name      : modifyImageProperty(ISOSpeedRatings)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1700",
        "fd",
        "ISOSpeedRatings",
        "2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1800
     * @tc.name      : modifyImageProperty(FNumber)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "f/0.5").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1800",
        "fd",
        "FNumber",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1900
     * @tc.name      : modifyImageProperty(DateTime)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2022:06:02 00:00:00").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_1900",
        "fd",
        "DateTime",
        "2022:06:02 00:00:00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2000
     * @tc.name      : modifyImageProperty(GPSTimeStamp)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "11:37:56.00").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2000",
        "fd",
        "GPSTimeStamp",
        "11/1 37/1 56/1",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2100
     * @tc.name      : modifyImageProperty(GPSDateStamp)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2023:10:19").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2100",
        "fd",
        "GPSDateStamp",
        "2023:10:19",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2200
     * @tc.name      : modifyImageProperty(ImageDescription)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "badPhoto").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2200",
        "fd",
        "ImageDescription",
        "badPhoto",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2300
     * @tc.name      : modifyImageProperty(Make)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "XiaoMI").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2300",
        "fd",
        "Make",
        "XiaoMI",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2400
     * @tc.name      : modifyImageProperty(Model)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "TNY-AL00").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2400",
        "fd",
        "Model",
        "TNY-AL00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2600
     * @tc.name      : modifyImageProperty(SensitivityType)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "ISO speed").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2600",
        "fd",
        "SensitivityType",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2800
     * @tc.name      : modifyImageProperty(RecommendedExposureIndex)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "200").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2800",
        "fd",
        "RecommendedExposureIndex",
        "200",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2900
     * @tc.name      : modifyImageProperty(ISOSpeedRatings)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "3").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_2900",
        "fd",
        "ISOSpeedRatings",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3000
     * @tc.name      : modifyImageProperty(ApertureValue)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.50 EV (f/1.2)").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3000",
        "fd",
        "ApertureValue",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3100
     * @tc.name      : modifyImageProperty(ExposureBiasValue)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.50 EV").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3100",
        "fd",
        "ExposureBiasValue",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3200
     * @tc.name      : modifyImageProperty(MeteringMode)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Spot").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3200",
        "fd",
        "MeteringMode",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3300
     * @tc.name      : modifyImageProperty(LightSource)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Fluorescent").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3300",
        "fd",
        "LightSource",
        "2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3400
     * @tc.name      : modifyImageProperty(Flash)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Flash fired, auto mode").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3400",
        "fd",
        "Flash",
        "25",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3500
     * @tc.name      : modifyImageProperty(FocalLength)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3500", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.5 mm").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3500",
        "fd",
        "FocalLength",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3600
     * @tc.name      : modifyImageProperty(UserComment)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "1111").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3600",
        "fd",
        "UserComment",
        "1111",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3700
     * @tc.name      : modifyImageProperty(PixelXDimension)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2000").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3700",
        "fd",
        "PixelXDimension",
        "2000",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3800
     * @tc.name      : modifyImageProperty(PixelYDimension)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2000").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3800",
        "fd",
        "PixelYDimension",
        "2000",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3900
     * @tc.name      : modifyImageProperty(WhiteBalance)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Auto white balance").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_3900",
        "fd",
        "WhiteBalance",
        "0",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_4000
     * @tc.name      : modifyImageProperty(FocalLengthIn35mmFilm)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_4000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "35").assertTrue();
      }
      testModifyImagePropertyPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_4000",
        "fd",
        "FocalLengthIn35mmFilm",
        "35",
        checkProps
      );
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0100
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0100", "buffer", "Orientation",
        "2");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0200
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0200",
        "buffer",
        "GPSLatitude",
        "114,3"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0300
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0300",
        "buffer",
        "GPSLongitude",
        "18,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0400
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0400", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0400",
        "buffer",
        "GPSLatitudeRef",
        "N"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0500
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0500", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0500",
        "buffer",
        "GPSLongitudeRef",
        "W"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0600
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Top-right").assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0600", "fd", "Orientation", "2",
        checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0700
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result.search("38") != -1).assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0700", "fd", "GPSLatitude", "114,3",
        checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0800
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result.search("9") != -1).assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0800", "fd", "GPSLongitude", "18,2",
        checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0900
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "N").assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_0900", "fd", "GPSLatitudeRef", "N",
        checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1000
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "W").assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1000", "fd", "GPSLongitudeRef", "W",
        checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1100
     * @tc.name      : modifyImageProperty(BitsPerSample)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "4, 4, 4").assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1100", "fd", "BitsPerSample",
        "4, 4, 4", checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1200
     * @tc.name      : modifyImageProperty(ImageLength)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "800").assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1200", "fd", "ImageLength", "800",
        checkProps);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1300
     * @tc.name      : modifyImageProperty(ImageWidth)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "500").assertTrue();
      }
      testModifyImagePropertyCb(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1300", "fd", "ImageWidth", "500",
        checkProps);
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1400
     * @tc.name      : modifyImageProperty(DateTimeOriginal)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2022:06:02 00:00:00").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1400",
        "fd",
        "DateTimeOriginal",
        "2022:06:02 00:00:00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1500
     * @tc.name      : modifyImageProperty(ExposureTime)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1500", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "1/3 sec.").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1500",
        "fd",
        "ExposureTime",
        "1/3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1600
     * @tc.name      : modifyImageProperty(SceneType)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Directly photographed").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1600",
        "fd",
        "SceneType",
        "1",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1700
     * @tc.name      : modifyImageProperty(ISOSpeedRatings)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1700",
        "fd",
        "ISOSpeedRatings",
        "2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1800
     * @tc.name      : modifyImageProperty(FNumber)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "f/0.5").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1800",
        "fd",
        "FNumber",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1900
     * @tc.name      : modifyImageProperty(DateTime)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2022:06:02 00:00:00").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_1900",
        "fd",
        "DateTime",
        "2022:06:02 00:00:00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2000
     * @tc.name      : modifyImageProperty(GPSTimeStamp)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "11:37:56.00").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2000",
        "fd",
        "GPSTimeStamp",
        "11:37:56",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2100
     * @tc.name      : modifyImageProperty(GPSDateStamp)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2023:10:19").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2100",
        "fd",
        "GPSDateStamp",
        "2023:10:19",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2200
     * @tc.name      : modifyImageProperty(ImageDescription)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "badPhoto").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2200",
        "fd",
        "ImageDescription",
        "badPhoto",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2300
     * @tc.name      : modifyImageProperty(Make)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "XiaoMI").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2300",
        "fd",
        "Make",
        "XiaoMI",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2400
     * @tc.name      : modifyImageProperty(Model)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "TNY-AL00").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2400",
        "fd",
        "Model",
        "TNY-AL00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2600
     * @tc.name      : modifyImageProperty(SensitivityType)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "ISO speed").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2600",
        "fd",
        "SensitivityType",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2800
     * @tc.name      : modifyImageProperty(RecommendedExposureIndex)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "200").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2800",
        "fd",
        "RecommendedExposureIndex",
        "200",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2900
     * @tc.name      : modifyImageProperty(ISOSpeedRatings)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "3").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_2900",
        "fd",
        "ISOSpeedRatings",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3000
     * @tc.name      : modifyImageProperty(ApertureValue)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.50 EV (f/1.2)").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3000",
        "fd",
        "ApertureValue",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3100
     * @tc.name      : modifyImageProperty(ExposureBiasValue)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.50 EV").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3100",
        "fd",
        "ExposureBiasValue",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3200
     * @tc.name      : modifyImageProperty(MeteringMode)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Spot").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3200",
        "fd",
        "MeteringMode",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3300
     * @tc.name      : modifyImageProperty(LightSource)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Fluorescent").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3300",
        "fd",
        "LightSource",
        "2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3400
     * @tc.name      : modifyImageProperty(Flash)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Flash fired, auto mode").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3400",
        "fd",
        "Flash",
        "25",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3500
     * @tc.name      : modifyImageProperty(FocalLength)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3500", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.5 mm").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3500",
        "fd",
        "FocalLength",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3600
     * @tc.name      : modifyImageProperty(UserComment)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "1111").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3600",
        "fd",
        "UserComment",
        "1111",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3700
     * @tc.name      : modifyImageProperty(PixelXDimension)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2000").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3700",
        "fd",
        "PixelXDimension",
        "2000",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3800
     * @tc.name      : modifyImageProperty(PixelYDimension)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2000").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3800",
        "fd",
        "PixelYDimension",
        "2000",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3900
     * @tc.name      : modifyImageProperty(WhiteBalance)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Auto white balance").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_3900",
        "fd",
        "WhiteBalance",
        "0",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_4000
     * @tc.name      : modifyImageProperty(FocalLengthIn35mmFilm)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_4000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "35").assertTrue();
      }
      testModifyImagePropertyCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_4000",
        "fd",
        "FocalLengthIn35mmFilm",
        "35",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100
     * @tc.name      : modifyImageProperty(Orientation,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0100",
        "buffer",
        "Orientation",
        "2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200
     * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0200",
        "buffer",
        "GPSLatitude",
        "114,3"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300
     * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0300",
        "buffer",
        "GPSLongitude",
        "18,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400
     * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0400",
        "buffer",
        "GPSLatitudeRef",
        "N"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500
     * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500", Level.LEVEL0, async (done: Function) => {
      testModifyImageBufferProperty(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0500",
        "buffer",
        "GPSLongitudeRef",
        "W"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600
     * @tc.name      : modifyImageProperty(Orientation,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Top-right").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0600",
        "fd",
        "Orientation",
        "2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700
     * @tc.name      : modifyImageProperty(GPSLatitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result.search("38") != -1).assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0700",
        "fd",
        "GPSLatitude",
        "114,3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800
     * @tc.name      : modifyImageProperty(GPSLongitude,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result.search("9") != -1).assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0800",
        "fd",
        "GPSLongitude",
        "18,2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900
     * @tc.name      : modifyImageProperty(GPSLatitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "N").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_0900",
        "fd",
        "GPSLatitudeRef",
        "N",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000
     * @tc.name      : modifyImageProperty(GPSLongitudeRef,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "W").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1000",
        "fd",
        "GPSLongitudeRef",
        "W",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1100
     * @tc.name      : modifyImageProperty(BitsPerSample,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "4, 4, 4").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1100",
        "fd",
        "BitsPerSample",
        "4, 4, 4",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1200
     * @tc.name      : modifyImageProperty(ImageLength,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "800").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1200",
        "fd",
        "ImageLength",
        "800",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1300
     * @tc.name      : modifyImageProperty(ImageWidth,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "500").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1300",
        "fd",
        "ImageWidth",
        "500",
        checkProps
      );
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1400
     * @tc.name      : modifyImageProperty(DateTimeOriginal,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2022:06:02 00:00:00").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1400",
        "fd",
        "DateTimeOriginal",
        "2022:06:02 00:00:00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1500
     * @tc.name      : modifyImageProperty(ExposureTime,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1500", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "1/3 sec.").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1500",
        "fd",
        "ExposureTime",
        "1/3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1600
     * @tc.name      : modifyImageProperty(SceneType,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Directly photographed").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1600",
        "fd",
        "SceneType",
        "1",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1700
     * @tc.name      : modifyImageProperty(ISOSpeedRatings,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1700",
        "fd",
        "ISOSpeedRatings",
        "2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1800
     * @tc.name      : modifyImageProperty(FNumber,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "f/0.5").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1800",
        "fd",
        "FNumber",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1900
     * @tc.name      : modifyImageProperty(DateTime,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2022:06:02 00:00:00").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_1900",
        "fd",
        "DateTime",
        "2022:06:02 00:00:00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2000
     * @tc.name      : modifyImageProperty(GPSTimeStamp,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "11:37:56.00").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2000",
        "fd",
        "GPSTimeStamp",
        "11:37:56",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2100
     * @tc.name      : modifyImageProperty(GPSDateStamp,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2023:10:19").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2100",
        "fd",
        "GPSDateStamp",
        "2023:10:19",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2200
     * @tc.name      : modifyImageProperty(ImageDescription,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "badPhoto").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2200",
        "fd",
        "ImageDescription",
        "badPhoto",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2300
     * @tc.name      : modifyImageProperty(Make,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "XiaoMI").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2300",
        "fd",
        "Make",
        "XiaoMI",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2400
     * @tc.name      : modifyImageProperty(Model,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "TNY-AL00").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2400",
        "fd",
        "Model",
        "TNY-AL00",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2600
     * @tc.name      : modifyImageProperty(SensitivityType,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "ISO speed").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2600",
        "fd",
        "SensitivityType",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2800
     * @tc.name      : modifyImageProperty(RecommendedExposureIndex,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "200").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2800",
        "fd",
        "RecommendedExposureIndex",
        "200",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2900
     * @tc.name      : modifyImageProperty(ISOSpeedRatings,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "3").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_2900",
        "fd",
        "ISOSpeedRatings",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3000
     * @tc.name      : modifyImageProperty(ApertureValue,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.50 EV (f/1.2)").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3000",
        "fd",
        "ApertureValue",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3100
     * @tc.name      : modifyImageProperty(ExposureBiasValue,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3100", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.50 EV").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3100",
        "fd",
        "ExposureBiasValue",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3200
     * @tc.name      : modifyImageProperty(MeteringMode,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3200", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Spot").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3200",
        "fd",
        "MeteringMode",
        "3",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3300
     * @tc.name      : modifyImageProperty(LightSource,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3300", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Fluorescent").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3300",
        "fd",
        "LightSource",
        "2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3400
     * @tc.name      : modifyImageProperty(Flash,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3400", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Flash fired, auto mode").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3400",
        "fd",
        "Flash",
        "25",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3500
     * @tc.name      : modifyImageProperty(FocalLength,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3500", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "0.5 mm").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3500",
        "fd",
        "FocalLength",
        "1/2",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3600
     * @tc.name      : modifyImageProperty(UserComment,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3600", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "1111").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3600",
        "fd",
        "UserComment",
        "1111",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3700
     * @tc.name      : modifyImageProperty(PixelXDimension,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3700", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2000").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3700",
        "fd",
        "PixelXDimension",
        "2000",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3800
     * @tc.name      : modifyImageProperty(PixelYDimension,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3800", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "2000").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3800",
        "fd",
        "PixelYDimension",
        "2000",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3900
     * @tc.name      : modifyImageProperty(WhiteBalance,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3900", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "Auto white balance").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_3900",
        "fd",
        "WhiteBalance",
        "0",
        checkProps
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_4000
     * @tc.name      : modifyImageProperty(FocalLengthIn35mmFilm,property)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value,options)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_4000", Level.LEVEL0, async (done: Function) => {
      let checkProps = (result: ESObject) => {
        expect(result == "35").assertTrue();
      }
      testModifyImagePropertyOptCb(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_4000",
        "fd",
        "FocalLengthIn35mmFilm",
        "35",
        checkProps
      );
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100
     * @tc.name      : modifyImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0100",
        "fd",
        "Orientation",
        "abcdef"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200
     * @tc.name      : modifyImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200",
        "fd",
        "GPSLatitude",
        "abc,3"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0300
     * @tc.name      : modifyImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0200",
        "fd",
        "GPSLongitude",
        "abc,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0400",
        "fd",
        "GPSLatitudeRef",
        "456"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0500",
        "fd",
        "GPSLongitudeRef",
        "1234"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600
     * @tc.name      : modifyImageProperty(Orientation)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0600",
        "buffer",
        "Orientation",
        "abcdef"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700
     * @tc.name      : modifyImageProperty(GPSLatitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0700",
        "buffer",
        "GPSLatitude",
        "abc,3"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800
     * @tc.name      : modifyImageProperty(GPSLongitude)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0800",
        "buffer",
        "GPSLongitude",
        "abc,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_0900",
        "buffer",
        "GPSLatitudeRef",
        "456"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-promise
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyPromiseError(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROMISE_ERROR_1000",
        "buffer",
        "GPSLongitudeRef",
        "1234"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0100", "fd", "Orientation",
        "abcdef");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0200", "fd", "GPSLatitude",
        "abc,3");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0300", "fd",
        "GPSLongitude", "abc,2");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0400", "fd",
        "GPSLongitudeRef", "1234");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0500", "fd",
        "GPSLatitudeRef", "456");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0600",
        "buffer",
        "Orientation",
        "abcdef"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(done, "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0700", "buffer",
        "GPSLatitude", "abc,3");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0800",
        "buffer",
        "GPSLongitude",
        "abc,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_0900",
        "buffer",
        "GPSLongitudeRef",
        "1234"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_CALLBACK_ERROR_1000",
        "buffer",
        "GPSLatitudeRef",
        "456"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0100",
        "fd",
        "Orientation",
        "abcdef"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0200",
        "fd",
        "GPSLatitude",
        "abc,3"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0300",
        "fd",
        "GPSLongitude",
        "abc,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0400",
        "fd",
        "GPSLatitudeRef",
        "1234"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0500",
        "fd",
        "GPSLongitudeRef",
        "567"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600
     * @tc.name      : modifyImageProperty(Orientation)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0600",
        "buffer",
        "Orientation",
        "abcef"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700
     * @tc.name      : modifyImageProperty(GPSLatitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0700",
        "buffer",
        "GPSLatitude",
        "abc,3"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800
     * @tc.name      : modifyImageProperty(GPSLongitude)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0800",
        "buffer",
        "GPSLongitude",
        "abc,2"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900
     * @tc.name      : modifyImageProperty(GPSLatitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_0900",
        "buffer",
        "GPSLatitudeRef",
        "456"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000
     * @tc.name      : modifyImageProperty(GPSLongitudeRef)-callback
     * @tc.desc      : 1.create imagesource
     *                 2.call modifyImageProperty(key,value)
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000", Level.LEVEL0, async (done: Function) => {
      testModifyImagePropertyOptCbErr(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTY_PROPERTY_CALLBACK_ERROR_1000",
        "buffer",
        "GPSLongitudeRef",
        "1234"
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0100
     * @tc.name      : test modifyImageProperties for jpg with multy keys
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageWidth: "1024",
        ImageLength: "2048"
      }
      let checkKey = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0100",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0200
     * @tc.name      : test modifyImageProperties for jpg with single key
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageLength: "2048"
      }
      let checkKey = [
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0200",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0300
     * @tc.name      : test modifyImageProperties for all the key with null value of jpg icon
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        GPSDateStamp: "2023:04:13",
        ImageDescription: "A gray picture"
      }
      let checkKey = [
        GPS_DATE_STAMP,
        IMAGE_DESCRIPTION
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0300",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0400
     * @tc.name      : test modifyImageProperties for partially the key with null value of jpg icon
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0400", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        GPSDateStamp: "2023:04:13",
        ImageWidth: "1024",
      }
      let checkKey = [
        GPS_DATE_STAMP,
        IMAGE_WIDTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0400",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0500
     * @tc.name      : test modify image properties using the value obtained from getImageProperties
     * @tc.desc      : 1.create buffer imagesource1
     *                 2.call imagesource1.getImageProperties(checkKey)
     *                 3.create jpg imagesource2
     *                 4.call imagesource2.modifyImageProperties(props)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0500", Level.LEVEL0, async (done: Function) => {
      let checkKey = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      let imageSource = image.createImageSource(modifyBuf.buffer);
      let props = await imageSource.getImageProperties(checkKey);
      await imageSource.release();
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_0500",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0100
     * @tc.name      : test modifyImageProperties for jpg with invalid value
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageWidth: "-1",
        ImageLength: "2344"
      }
      let checkKey = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0100",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0200
     * @tc.name      : test modifyImageProperties for jpg with out-of-bounds value
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageWidth: "100000000000000",
        ImageLength: "2344"
      }
      let checkKey = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0200",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0300
     * @tc.name      : test modifyImageProperties for jpg with invalid keys
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        "ErrorKey1": "1024",
        "ErrorKey2": "2048"
      }
      let checkKey = [
        "ErrorKey1",
        "ErrorKey2"
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0300",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0400
     * @tc.name      : test modifyImageProperties for jpg with invalid key
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageLength: "2048",
        "ErrorKey": "1024",
      }
      let checkKey = [
        IMAGE_LENGTH,
        "ErrorKey"
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0400",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0500
     * @tc.name      : test modifyImageProperties for jpg with all null value
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      let checkKeys: ESObject = Object.values(image.PropertyKey).filter(item =>
      !item.startsWith("Hw") && item != "GIFLoopCount"
      );
      checkKeys.push("HwMnoteCaptureMode");

      let props: ESObject = {};
      checkKeys.forEach((item: ESObject) => {
        props[item] = ""
      })

      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0500",
        "test_exif.jpg",
        props,
        checkKeys
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0600
     * @tc.name      : test modifyImageProperties for jpg with partially null value
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0600", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageLength: "2048",
        ImageWidth: "",
      }
      let checkKey = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0600",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0700
     * @tc.name      : test modifyImageProperties for jpg with incorrect type
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0700", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageLength: "2048",
        ImageWidth: "abc",
      }
      let checkKey = [
        IMAGE_LENGTH,
        IMAGE_WIDTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0700",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0800
     * @tc.name      : test modifyImageProperties for private filed of jpg
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0800", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        HwMnoteSceneBlueSkyConf: "71",
        HwMnoteSceneGreenPlantConf: "98"
      }
      let checkKey = [
        SCENE_BLUE_SKY_CONF,
        SCENE_GREEN_PLANT_CONF
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0800",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0900
     * @tc.name      : test modifyImageProperties for private and public filed of jpg
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0900", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageWidth: "1024",
        ImageLength: "2048",
        HwMnoteSceneBlueSkyConf: "71",
        HwMnoteSceneGreenPlantConf: "98"
      }
      let checkKey = [
        IMAGE_WIDTH,
        IMAGE_LENGTH,
        SCENE_BLUE_SKY_CONF,
        SCENE_GREEN_PLANT_CONF
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_0900",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1000
     * @tc.name      : test modifyImageProperties for unwritable filed of jpg
     * @tc.desc      : 1.create jpg imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1000", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        "JPEGInterchangeFormat": "1450",
        "JPEGInterchangeFormatLength": "1450",
        "MakerNote": "xxxxx",
      }
      let checkKey = [
        "JPEGInterchangeFormat",
        "JPEGInterchangeFormatLength",
        "MakerNote"
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1000",
        "test_exif.jpg",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1100
     * @tc.name      : test modifyImageProperties for tiff with multy keys
     * @tc.desc      : 1.create tiff imagesource
     *                 2.call modifyImageProperty(keys)
     *                 3.return undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1100", Level.LEVEL0, async (done: Function) => {
      let props: ESObject = {
        ImageWidth: "1024",
        ImageLength: "2048"
      }
      let checkKey = [
        IMAGE_WIDTH,
        IMAGE_LENGTH
      ];
      await testModifyImageProperties(
        done,
        "SUB_MULTIMEDIA_IMAGE_MODIFYPROPERTIES_PROMISE_ERROR_1100",
        "test.tiff",
        props,
        checkKey
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100
     * @tc.name      : test modifyImageProperty GIFLoopCount for gif
     * @tc.desc      : 1.getFd()
     *                 2.modifyImageProperty()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100 start");
      testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0100", "gif", false, done);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200
     * @tc.name      : test modifyImageProperties GIFLoopCount for gif
     * @tc.desc      : 1.getFd()
     *                 2.modifyImageProperties()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200 start");
      testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0200", "gif", true, done);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300
     * @tc.name      : test modifyImageProperty GIFLoopCount for jpg
     * @tc.desc      : 1.getFd()
     *                 2.modifyImageProperty()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300 start");
      testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0300", "jpg", false, done);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400
     * @tc.name      : test modifyImageProperties GIFLoopCount for jpg
     * @tc.desc      : 1.getFd()
     *                 2.modifyImageProperties()
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      console.info("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400 start");
      testModifyLoopCountErr("SUB_MULTIMEDIA_IMAGE_MODIFY_LOOPCOUNT_ERROR_0400", "jpg", true, done);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use test_exif.jpg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let writeFd: number = getFdFilesDir("test_makernote_XXX.jpeg");
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackProperties: true
      };
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "XXX"
      };
      await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0100",
        "test_exif.jpg", prop, true, packOpts, writeFd);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use test_exif_v3.heic format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!isSupportHEIFDecode || !isSupportHEICEncode) {
        if (!isSupportHEIFDecode) {
          console.info(`SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200 device is not support heif decode`);
        } else {
          console.info(`SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200 device is not support heic encode`);
        }
        done();
      } else {
        let writeFd: number = getFdFilesDir("test_makernote_heic.heic");
        let packOpts: image.PackingOption = {
          format: "image/heic",
          quality: 98,
          needsPackProperties: true
        };
  
        let prop: RecordKeyValue = {
          key: image.PropertyKey.MAKER_NOTE, value: "XXXXXXXXXXXXXX"
        };
        await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0200",
          "test_exif_v3.heic", prop, true, packOpts, writeFd);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use test_exif.png format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
      let writeFd: number = getFdFilesDir("test_makernote_png.png");
      let packOpts: image.PackingOption = {
        format: "image/png",
        quality: 98,
        needsPackProperties: true
      };

      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "123456789"
      };
      await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0300",
        "test_exif.png", prop, true, packOpts, writeFd);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use test_exif_v2.webp format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "!@#$%^&*()"
      };
      await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0400",
        "test_exif_v2.webp", prop, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use test_dng.dng format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done :Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "manufacturer_information"
      };
      await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0500",
        "test_dng.dng", prop, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use test.jpg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "QWERTYUIOP"
      };
      await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0600",
        "test.jpg", prop, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_0700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_0700
     * @tc.desc      : test get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call getImageProperty
     *                 3.Use food.jpg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const filePath = filesDir + "/" + "food.jpg";
        const file = await fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        let imageSourceApi: image.ImageSource = image.createImageSource(file.fd);
        globalImagesource= imageSourceApi;
        fs.closeSync(file.fd!!);
        await imageSourceApi.getImageProperty(image.PropertyKey.MAKER_NOTE).then((MakerNote: string) => {
          console.error(`SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_0700 getImageProperty MakerNote: ` + MakerNote);
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_0700 getImageProperty error: ` + error);
          expect(false).assertTrue();
          done();
        });
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use food.jpg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "QWE!@#123"
      };
      await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0800",
        "food.jpg", prop, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use food_notHW.jpg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "123456"
      };
      await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_0900",
        "food_notHW.jpg", prop, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000
     * @tc.desc      : test Modify Maker Note Image Property, get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty, getImageProperty
     *                 3.Use food_notHW.jpg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let str: string = new Array(64*1024-1).fill('A').join('');
        str = str.substring(0, 64*1024-1).padEnd(64*1024-1, 'Hello World');
        let prop: RecordKeyValue = {
          key: image.PropertyKey.MAKER_NOTE, value: str
        };
        await testModifyMakerNoteImageProperty(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MODIFY_MAKERNOTE_PROPERTY_1000",
          "test_exif.png", prop, false);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100
     * @tc.desc      : test Modify Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty
     *                 3.Use test.bmp format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "123456789"
      };
      await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0100",
        "test.bmp", prop);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200
     * @tc.desc      : test Modify Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty
     *                 3.Use moving_test.gif format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "123456789"
      };
      await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0200",
        "moving_test.gif", prop);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300
     * @tc.desc      : test Modify Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty
     *                 3.Use test.ico format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "123456789"
      };
      await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0300",
        "test.ico", prop);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400
     * @tc.desc      : test Modify Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty
     *                 3.Use test_large.svg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let writeFd: number = getFdFilesDir("test_large.svg");
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: "123456789"
      };
      await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0400",
        "test_large.svg", prop);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500
     * @tc.desc      : test modify Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty
     *                 3.test_exif.jpg write characters that are less than or equal to 0
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: ""
      };
      await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0500",
        "test_exif.jpg", prop);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600
     * @tc.desc      : test modify Maker Note Image Property
     *                 1.create imagesource
     *                 2.call modifyImageProperty
     *                 3.test_exif.jpg write characters longer than 64*1024
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let str: string = new Array(64*1024).fill('A').join('');
      str = str.substring(0, 64*1024).padEnd(64*1024, 'Hello World');
      let prop: RecordKeyValue = {
        key: image.PropertyKey.MAKER_NOTE, value: str
      };
      await testModifyMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_MODIFY_MAKERNOTE_PROPERTY_ERR_0600",
        "test_exif.jpg", prop);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700
     * @tc.desc      : test get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call getImageProperty
     *                 3.Use test.bmp format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0700",
        "test.bmp")
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800
     * @tc.desc      : test get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call getImageProperty
     *                 3.Use moving_test.gif format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0800",
        "moving_test.gif")
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900
     * @tc.desc      : test get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call getImageProperty
     *                 3.Use test.ico format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_0900",
        "test.ico")
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000
     * @tc.desc      : test get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call getImageProperty
     *                 3.Use test_large.svg format images
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1000",
        "test_large.svg")
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100
     * @tc.desc      : test get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call getImageProperty
     *                 3.testExif.jpg no makernote info
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1100",
        "testExif.jpg")
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200
     * @tc.desc      : test get Maker Note Image Property
     *                 1.create imagesource
     *                 2.call getImageProperty
     *                 3.food_notHW2.jpg
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await testGetMakerNoteImagePropertyErr(done, "SUB_MULTIMEDIA_IMAGE_SOURCENDK_GET_MAKERNOTE_PROPERTY_ERR_1200",
        "food_notHW2.jpg")
    });
  });
}
