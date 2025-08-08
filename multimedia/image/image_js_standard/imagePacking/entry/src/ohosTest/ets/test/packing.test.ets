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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs'
import display from '@ohos.display';
import hdrCapability from '@ohos.graphics.hdrCapability';

interface Size {
  height: 4,
  width: 6
}

interface Opts {
  editable: boolean,
  pixelFormat: number,
  size: Size
}

interface packOpts {
  format?: string,
  quality?: number,
  bufferSize?: number
};

export default function imagePacking() {
  describe("imagePacking", () => {
    let testContext: common.UIAbilityContext =
      AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
    let filesDir: string = AppStorage.get<string>("pathDir") as string;
    let isSupportGifEncode: ESObject;
    const ERROR_CODE = 401;

    let getFd = async (fileName: string) => {
      let fdNumber: ESObject;
      let filePath = filesDir + "/" + fileName;
      console.log('image case filePath is1111', filePath)

      let file = fs.openSync(filePath);
      fdNumber = file.fd
      console.log('image case filePath is', fdNumber + filePath)
      return fdNumber;
    }

    beforeAll(async () => {
      console.info("beforeAll case");
      isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
    });

    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });
    let packingPromise = (done: ESObject, testNum: ESObject, pixFormat: ESObject, arg: ESObject) => {
      let opts: Opts;
      const Color = new ArrayBuffer(96);
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5, size: {
            height: 4, width: 6
          }
        };
      }
      image
        .createPixelMap(Color, opts)
        .then((pixelmap) => {
          if (pixelmap == undefined) {
            expect(false).assertTrue();
            console.info(`${testNum} create pixelmap fail`);
            done();
          } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              expect(false).assertTrue();
              console.info(`${testNum} create imagepacker fail`);
              done();
            } else {
              imagePackerApi
                .packing(pixelmap, arg)
                .then((data) => {
                  let dataArr = new Uint8Array(data);
                  console.info(`${testNum} dataArr.length=` + dataArr.length);
                  for (let i = 0; i < dataArr.length; i++) {
                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                  }
                  expect(data != undefined).assertTrue();
                  console.info(`${testNum} success`);
                  done();
                })
                .catch((error: BusinessError) => {
                  console.log(`${testNum} error:` + error);
                  expect().assertFail();
                  done();
                });
            }
          }
        })
        .catch((error: BusinessError) => {
          console.log("createpixelmap error: " + error);
          expect().assertFail();
          done();
        });
    }
    let packingCb = (done: ESObject, testNum: ESObject, pixFormat: ESObject, arg: ESObject) => {
      let opts: Opts;
      const Color = new ArrayBuffer(96);
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5, size: {
            height: 4, width: 6
          }
        };
      }
      image
        .createPixelMap(Color, opts)
        .then((pixelmap) => {
          if (pixelmap == undefined) {
            expect(false).assertTrue();
            console.info(`${testNum} create pixelmap fail`);
            done();
          } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              expect(false).assertTrue();
              console.info(`${testNum} create imagepacker fail`);
              done();
            } else {
              imagePackerApi.packing(pixelmap, arg, (err, data) => {
                if (err != undefined) {
                  console.info(`${testNum} packing failerr: ${err}`);
                  expect(false).assertTrue();
                  done();
                  return;
                }
                let dataArr = new Uint8Array(data);
                console.info(`${testNum} dataArr.length=` + dataArr.length);
                for (let i = 0; i < dataArr.length; i++) {
                  console.info(`dataArr[` + i + `]=` + dataArr[i]);
                }
                expect(data != undefined).assertTrue();
                done();
              });
            }
          }
        })
        .catch((error: BusinessError) => {
          console.log(`${testNum} createpixelmap error: ` + error);
          expect().assertFail();
          done();
        });
    }
    let packingCbFail = (done: ESObject, testNum: ESObject, pixFormat: ESObject, arg: ESObject) => {
      const Color = new ArrayBuffer(96);
      let opts: Opts
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5, size: {
            height: 4, width: 6
          }
        };
      }

      image.createPixelMap(Color, opts)
        .then((pixelmap) => {
          if (pixelmap == undefined) {
            expect(false).assertTrue();
            done();
          } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              expect(false).assertTrue();
              done();
            } else {
              imagePackerApi.packing(pixelmap, arg, (err, data) => {
                expect(err != undefined).assertTrue();
                done();
              });
            }
          }
        })
        .catch((error: BusinessError) => {
          console.log(`${testNum} createpixelmap error:` + error);
          expect().assertFail();
          done();
        });
    }
    let packingPromiseFail = (done: ESObject, testNum: ESObject, pixFormat: ESObject, arg: ESObject) => {
      const Color = new ArrayBuffer(96);
      let opts: Opts;
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5, size: {
            height: 4, width: 6
          }
        };
      }
      image.createPixelMap(Color, opts)
        .then((pixelmap) => {
          if (pixelmap == undefined) {
            expect(false).assertTrue();
            done();
          } else {
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              expect(false).assertTrue();
              done();
            } else {
              imagePackerApi
                .packing(pixelmap, arg)
                .then((data) => {
                  expect(false).assertTrue();
                  done();
                })
                .catch((error: BusinessError) => {
                  console.log(`${testNum} error:` + error);
                  expect(true).assertTrue();
                  done();
                });
            }
          }
        })
        .catch((error: BusinessError) => {
          console.log("createpixelmap error: " + error);
          expect().assertFail();
          done();
        });
    }
    let getImageSourceData = (fileName: string) => {
      let globalImagesource: image.ImageSource;
      try {
        const path: string = testContext.filesDir + "/" + fileName;
        globalImagesource = image.createImageSource(path);
        console.log('image source1111111: ' + globalImagesource)
        return globalImagesource;
      } catch (error) {
        console.info("image getRawFileContent case" + error.code + ",err message" + error.message);
        return undefined;
      }
    }

	let isSupportImageFormat = async (fileName: string, format: string) => {
	  let filePath = ""
	  let isSupportFormat = false;
	  let globalImagesource: image.ImageSource;
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

    let createPixelMapList = async (done: ESObject, picName: ESObject) => {
      console.info("createPixelMapList start");
      let imageSourceApi: ESObject = await getImageSourceData(picName);
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
          console.info("createPixelMapList error = " + error.code + "createPixelMapList errormsg = " + error.message);
          expect(false).assertTrue();
          done();
        }
      }
      return pixelMapList;
    }
    let checkPackingForSequenceResult = async (buffer: ESObject, pictureSize: ESObject,
      packingOptions: image.PackingOptionsForSequence) => {
      let imgSource = image.createImageSource(buffer);
      if (imgSource == undefined) {
        console.log(`imgSource create failed.`);
        expect(false).assertTrue();
      } else {
        let delayTimeListLength: ESObject = packingOptions.delayTimeList.length;
        let delayTimes = await imgSource.getDelayTimeList();
        let disposalTypes = await imgSource.getDisposalTypeList();
        let loopcount: ESObject = await imgSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
        let imageInfo = imgSource.getImageInfoSync();
        console.log(`checkPackingForSequenceResult delayTimes ${delayTimes}`);
        console.log(`checkPackingForSequenceResult disposalTypes ${disposalTypes}`);
        console.log(`checkPackingForSequenceResult loopcount ${loopcount}`);
        console.log(`checkPackingForSequenceResult height ${imageInfo.size.height}`);
        console.log(`checkPackingForSequenceResult width ${imageInfo.size.width}`);
        console.log(`checkPackingForSequenceResult mimeType ${imageInfo.mimeType}`);
        expect(imageInfo.size.width == pictureSize.width).assertTrue();
        expect(imageInfo.size.height == pictureSize.height).assertTrue();
        expect(imageInfo.mimeType == "image/gif").assertTrue();
        console.log(`checkPackingForSequenceResult loopcount1 ${JSON.stringify(loopcount)}`);
        console.log(`checkPackingForSequenceResult loopcount2 ${JSON.stringify(packingOptions.loopCount)}`);
        //对比编码前后的 loopCount
        //GIF编码中设定输出图片循环播放次数的参数，取值范围为[0，65535]。0表示无限循环, 如果没有此字段, 则设置为默认值1；
        if (packingOptions.loopCount != undefined) {
          expect(loopcount.GIFLoopCount == packingOptions.loopCount).assertTrue();
        } else {
          expect(loopcount.GIFLoopCount == 1).assertTrue();
        }
        //对比编码前后的 delayTimesList。delayTimes 的值编码和解码的单位差10倍
        //GIF编码中设定输出图片每一帧的延迟时间。如果不是0，则此字段指定等待时间为参数值*0.01秒。
        //如果长度小于frameCount，则缺失的部分将用delayTimeList最后一个值填充。
        console.log(`packingMultiFramesPromise delayTimeList ${packingOptions.delayTimeList}`);
        for (let i = 0; i < packingOptions.frameCount; i++) {
          if (i < delayTimeListLength) {
            expect(delayTimes[i] == packingOptions.delayTimeList[i] * 10).assertTrue();
          } else {
            expect(delayTimes[i] == packingOptions.delayTimeList[delayTimeListLength -1] * 10).assertTrue();
          }
        }
        console.log(`packingMultiFramesPromise disposalTypes ${packingOptions.disposalTypes}`);
        //对比编码前后的 disposalTypes。disposalTypes的有效值是0～3，解码的时候0会变成1。
        //0：不需要任何操作  1：保持图形不变  2：恢复背景色  3：恢复到之前的状态。
        if (packingOptions.disposalTypes != undefined) {
          for (let i = 0; i < packingOptions.frameCount; i++) {
            if (i < packingOptions.disposalTypes.length) {
              if (packingOptions.disposalTypes[i] == 0) {
                expect(disposalTypes[i] == 1).assertTrue();
              } else {
                expect(disposalTypes[i] == packingOptions.disposalTypes[i]).assertTrue();
              }
            } else {
              expect(disposalTypes[i] == 1).assertTrue();
            }
          }
        }
      }
    }
    let testPackingForSequencePromise = (done: ESObject, testNum: ESObject, pictureSize: ESObject, 
      packingOptions: image.PackingOptionsForSequence, pixelMapList: Array<image.PixelMap>) => {
      let globalPacker = image.createImagePacker();
      if (globalPacker == undefined) {
        console.log(`${testNum} createImagePacker failed`);
        expect(false).assertTrue();
        done();
        return;
      }
      globalPacker.packToDataFromPixelmapSequence(pixelMapList, packingOptions).then(async (data: ESObject) => {
        try {
          console.log(`${testNum} testPackingForSequencePromise success`);
          await checkPackingForSequenceResult(data, pictureSize, packingOptions);
          done();
        } catch (e1) {
          console.log("testPackingForSequencePromise e1: " + e1);
          expect().assertFail();
          done();
        }
      }).catch((error: BusinessError) => {
        console.log(`${testNum} error: ` + error.toString());
        expect().assertFail();
        done();
      });
    }

    let testPackingForSequencePromiseError = (done: ESObject, testNum: ESObject, pictureSize: ESObject,
      packingOptions: image.PackingOptionsForSequence, pixelMapList: Array<image.PixelMap>) => {
      let globalPacker = image.createImagePacker();
      if (globalPacker == undefined) {
        console.log(`${testNum} createImagePacker failed`);
        expect(false).assertTrue();
        done();
        return;
      }
      globalPacker.packToDataFromPixelmapSequence(pixelMapList, packingOptions).then(async (data: ESObject) => {
        console.log(`${testNum} testPackingForSequencePromiseError success`);
        expect(false).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.log(`${testNum} packing error: ` + JSON.stringify(error));
        expect(error.code == ERROR_CODE).assertTrue();
        done();
      });
    }

    let checkPackToDataResult = async (buffer: ESObject, picSize: ESObject) => {
      let imageSource = image.createImageSource(buffer);
      if (imageSource == undefined) {
        console.log(`create pack file imageSource failed.`);
        return false;
      } else {
        let delayTimes: ESObject = await imageSource.getDelayTimeList();
        let disposalTypes: ESObject = await imageSource.getDisposalTypeList();
        let loopCount: ESObject = await imageSource.getImageProperties([image.PropertyKey.GIF_LOOP_COUNT]);
        let imageInfo: ESObject = imageSource.getImageInfoSync();
        console.log(`packGifToData delayTimes ${delayTimes}`);
        console.log(`packGifToData disposalTypes ${disposalTypes}`);
        console.log(`packGifToData loopCount ${JSON.stringify(loopCount)}`);
        console.log(`packGifToData width ${imageInfo.size.width}`);
        console.log(`packGifToData height ${imageInfo.size.height}`);
        let result = delayTimes == 1000 && disposalTypes == 1 && loopCount.GIFLoopCount == 0 &&
          imageInfo.size.width == picSize.width && imageInfo.size.height == picSize.height &&
          imageInfo.mimeType == "image/gif"
        await imageSource.release();
        return result;
      }
    }
    let packGifToData =
      async (done: Function, testNum: ESObject, source: ESObject, picSize: ESObject, type: ESObject) => {
        let globalPacker = image.createImagePacker();
        if (globalPacker == undefined) {
          console.log(`${testNum} createImagePacker failed`);
          expect(false).assertTrue();
          done();
        }
        let packOpts: image.PackingOption = {
          format: "image/gif", quality: 100
        };
        if (type == "callback") {
          globalPacker.packing(source, packOpts, async (err: BusinessError, data: ESObject) => {
            if (err != undefined) {
              console.info(`${testNum} pack fail: ${JSON.stringify(err)}`);
              expect(false).assertTrue();
              done();
            } else {
              let result = await checkPackToDataResult(data, picSize);
              expect(result).assertTrue();
              done();
            }
          })
        } else {
          try {
            let data: ESObject = await globalPacker.packing(source, packOpts);
            console.info(`${testNum} packTodata test success`);
            let result = await checkPackToDataResult(data, picSize);
            console.info(`${testNum} packTodata test ${result}`);
            expect(result).assertTrue();
            done();
          } catch (error) {
            console.log(`${testNum} packTodata error: ` + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          }
        }
      }

    let testPackGifToData =
      async (done: Function, testNum: ESObject, fileName: string, packSource: ESObject, picSize: ESObject,
        type: ESObject) => {
        let source: ESObject = await getImageSourceData(fileName);
        if (packSource == "PixelMap") {
          let globalpixelmap: image.PixelMap = await source.createPixelMap();
          source = globalpixelmap;
        }
        await packGifToData(done, testNum, source, picSize, type);
      }
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0100
     * @tc.name      : SUB_IMAGE_packing_P_001
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0100", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg",
        quality: 99
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0100", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0200
     * @tc.name      : SUB_IMAGE_packing_P_002 - Promise - RGB565 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0200", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg",
        quality: 123
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0200", 2, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0300
     * @tc.name      : SUB_IMAGE_packing_P_003 - Promise - RGB565 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0300", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg"
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0300", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0400
     * @tc.name      : SUB_IMAGE_packing_P_004 - Promise - RGB565 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0400", 0, async (done: Function) => {
      let packOpts: packOpts = {
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0400", 2, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0500
     * @tc.name      : SUB_IMAGE_packing_P_005 - Promise - RGB565 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0500", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/txt", quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0500", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0600
     * @tc.name      : SUB_IMAGE_packing_P_006
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0600", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 50
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0600", 5, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0700
     * @tc.name      : SUB_IMAGE_packing_P_007 - Promise - RGB888 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0700", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 123
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0700", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0800
     * @tc.name      : SUB_IMAGE_packing_P_008 - Promise - RGB888 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0800", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg"
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0800", 5, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0900
     * @tc.name      : SUB_IMAGE_packing_P_009 - Promise - RGB888 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0900", 0, async (done: Function) => {
      let packOpts: packOpts = {
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_0900", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1000
     * @tc.name      : SUB_IMAGE_packing_P_010 - Promise - RGB888 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1000", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/txt", quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1000", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1100
     * @tc.name      : SUB_IMAGE_packing_PixelMap - Promise - no quality
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1100", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/gif"
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PROMISE_1100", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0100
     * @tc.name      : SUB_IMAGE_packingCb_001
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0100", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 99
      };
      packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0100", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0200
     * @tc.name      : SUB_IMAGE_packingCb_002 - callback - RGB565 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0200", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 123
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0200", 2, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0300
     * @tc.name      : SUB_IMAGE_packingCb_003 - callback - RGB565 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0300", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg"
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0300", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0400
     * @tc.name      : SUB_IMAGE_packingCb_004 - callback - RGB565 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0400", 0, async (done: Function) => {
      let packOpts: packOpts = {
        quality: 99
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0400", 2, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0500
     * @tc.name      : SUB_IMAGE_packingCb_005 - callback - RGB565 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0500", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/txt", quality: 99
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0500", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0600
     * @tc.name      : SUB_IMAGE_packingCb_006
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0600", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 50
      };
      packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0600", 5, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0700
     * @tc.name      : SUB_IMAGE_packingCb_007 - callback - RGB888 quality 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0700", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 123
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0700", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0800
     * @tc.name      : SUB_IMAGE_packingCb_008 - callback - RGB888 quality null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0800", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg"
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0800", 5, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0900
     * @tc.name      : SUB_IMAGE_packingCb_009 - callback - RGB888 format null
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0900", 0, async (done: Function) => {
      let packOpts: packOpts = {
        quality: 99
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_0900", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1000
     * @tc.name      : SUB_IMAGE_packingCb_010 - callback - RGB888 wrong format
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1000", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/txt", quality: 99
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1000", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1200
     * @tc.name      : SUB_IMAGE_packingCb_PixelMap - callback - quality: 123
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1200", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/gif", quality: 123
      };
      packingCbFail(done, "SUB_MULTIMEDIA_IMAGE_PACKING_CALLBACK_1200", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100
     * @tc.name      : packing ImageSource - promise
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi: ESObject = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: packOpts = {
              format: "image/jpeg", quality: 99
            };
            imagePackerApi.packing(imageSourceApi, packOpts)
              .then((data: ESObject) => {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 success");
                expect(data != undefined).assertTrue();
                done();
              })
              .catch((error: BusinessError) => {
                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 error: " + error);
                expect(false).assertFail();
                done();
              });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0100 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100
     * @tc.name      : packing ImageSource - callback
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi: ESObject = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: packOpts = {
              format: "image/jpeg", quality: 1
            };
            imagePackerApi.packing(imageSourceApi, packOpts, (err: BusinessError, data: ESObject) => {
              console.info(
                "SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 success" + JSON.stringify(data)
              );
              expect(data != undefined).assertTrue();
              done();
            });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0100 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200
     * @tc.name      : packing ImageSource - callback - wrong quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi: ESObject = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: ESObject = {
              format: "image/jpeg", quality: 101
            };
            imagePackerApi.packing(imageSourceApi, packOpts, (err: BusinessError, data: ESObject) => {
              console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 success");
              expect(data == undefined).assertTrue();
              console.info(data);
              done();
            });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0200 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100
     * @tc.name      : createImagePacker
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 create image packer success");
            expect(true).assertTrue();
            done();
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_CREATEIMAGEPACKER_0100 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200
     * @tc.name      : packing ImageSource - promise - no quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */

    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi: ESObject = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: ESObject = {
              format: "image/jpeg"
            };
            imagePackerApi.packing(imageSourceApi, packOpts)
              .then((data) => {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 failed");
                expect(data == undefined).assertTrue();
                done();
              })
              .catch((error: BusinessError) => {
                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 error: " + error);
                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 success");
                expect(true).assertTrue();
                done();
              });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0200 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300
     * @tc.name      : packing ImageSource - promise - no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi: ESObject = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: ESObject = {
              quality: 50
            };
            imagePackerApi.packing(imageSourceApi, packOpts)
              .then((data) => {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 failed");
                expect(data == undefined).assertTrue();
                done();
              })
              .catch((error: BusinessError) => {
                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 error: " + error);
                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 success");
                expect(true).assertTrue();
                done();
              });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0300 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400
     * @tc.name      : packing ImageSource - callback - quality 100
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */

    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: ESObject = {
              format: "image/jpeg", quality: 100
            };
            imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
              if (err) {
                expect(false).assertTrue();
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 error: " + err);
                done();
                return;
              }
              if (data != undefined) {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 success");
                expect(true).assertTrue();
                done();
              } else {
                expect(false).assertTrue();
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 failed");
                done();
              }
            });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0400 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500
     * @tc.name      : packing ImageSource - callback - quality 0
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi: ESObject = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: packOpts = {
              format: "image/jpeg", quality: 0
            };
            imagePackerApi.packing(imageSourceApi, packOpts, (err: BusinessError, data: ESObject) => {
              console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 success");
              expect(data != undefined).assertTrue();
              done();
            });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0500 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600
     * @tc.name      : packing ImageSource - callback - quality -1
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: ESObject = {
              format: "image/jpeg", quality: -1
            };
            imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
              console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 success");
              expect(data == undefined).assertTrue();
              done();
            });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0600 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700
     * @tc.name      : packing ImageSource - promise - no quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.call return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("moving_test.gif");
        const imageSourceApi: ESObject = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: ESObject = {
              format: "image/gif"
            };
            imagePackerApi.packing(imageSourceApi, packOpts)
              .then((data) => {
                console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700 failed");
                expect(data == undefined).assertTrue();
                done();
              })
              .catch((error: BusinessError) => {
                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700 error: " + error);
                console.log("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700 success");
                expect(true).assertTrue();
                done();
              });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_PROMISE_0700 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0800
     * @tc.name      : packing ImageSource - callback - quality: 123
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     *                 4.callbackcall return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0800", 0, async (done: Function) => {
      try {
        let fdNumber: ESObject = await getFd("moving_test.gif");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0800 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0800 create image packer failed");
            expect(false).assertTrue();
            done();
          } else {
            let packOpts: ESObject = {
              format: "image/gif", quality: 123
            };
            imagePackerApi.packing(imageSourceApi, packOpts, (err, data) => {
              console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0800 success");
              expect(data == undefined).assertTrue();
              done();
            });
          }
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_IMAGESOURCE_CALLBACK_0800 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100
     * @tc.name      : release ImagePacker - promise
     * @tc.desc      : 1.create ImagePacker
     *                 2.call release
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100", 0, async (done: Function) => {
      const imagePackerApi = image.createImagePacker();
      if (imagePackerApi == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100 create image packer failed");
        expect(false).assertTrue();
        done();
      } else {
        imagePackerApi
          .release()
          .then(() => {
            console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100 success");
            expect(true).assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_PROMISE_0100 error: " + error);
            expect(false).assertTrue();
            done();
          });
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100
     * @tc.name      : release ImagePacker - callback
     * @tc.desc      : 1.create ImagePacker
     *                 2.call release
     *                 3.return undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100", 0, async (done: Function) => {
      const imagePackerApi = image.createImagePacker();
      if (imagePackerApi == undefined) {
        console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100 create image packer failed");
        expect(false).assertTrue();
        done();
      } else {
        imagePackerApi.release(() => {
          console.info("SUB_MULTIMEDIA_IMAGE_PACKING_RELEASE_IMAGEPACKER_CALLBACK_0100 success");
          expect(true).assertTrue();
          done();
        });
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 99, bufferSize: 10485760
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0100", 2, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 99, bufferSize: 20480
      };
      console.info(`SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200 buffersize: ${packOpts.bufferSize}`);
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0200", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300-over maxbufferSize
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 99, bufferSize: 20000000
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_0300", 2, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 99, bufferSize: 10485760
      };
      packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0100", 2, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 99, bufferSize: 20480
      };
      packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0200", 5, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300
     * @tc.desc      : 1.create PixelMap
     *                 2.create ImagePacker
     *                 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300", 0, async (done: Function) => {
      let packOpts: packOpts = {
        format: "image/jpeg", quality: 99, bufferSize: 20000000
      };
      packingCb(done, "SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_CALLBACK_0300", 5, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0100
     * @tc.name      : test the packing interface uses many PixelMaps
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0100", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 1, 0],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0100", 
          {width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0200
     * @tc.name      : test the packing interface uses PixelMap
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0200", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.png");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0200", 
          { width: 6016, height: 3384 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0300
     * @tc.name      : test the packing interface configuration delaytimes
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0300", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1, delayTimeList: [10], disposalTypes: [3, 2, 3]
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0300", 
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0400
     * @tc.name      : test the packing interface configuration loop
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0400", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.png");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10], loopCount: 2
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0400", 
          { width: 6016, height: 3384 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0500
     * @tc.name      : test the packing interface no disposalTypes and no loopCount
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0500", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "moving_test.gif");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 3, delayTimeList: [10, 10, 10]
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0500", 
          { width: 198, height: 202 }, packingOptions, pixelMapList)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0600
     * @tc.name      : test the packing interface frameCount less than PixelMapList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0600", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 1, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0600",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0700
     * @tc.name      : test the packing interface frameCount more than PixelMapList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0700", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 5, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0700", 
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0800
     * @tc.name      : test the packing interface delayTimeList less than PixelMapList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0800", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10], disposalTypes: [3, 1, 0], loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0800",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0900
     * @tc.name      : test the packing interface delayTimeList more than PixelMapList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0900", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10, 10, 10, 20, 30], disposalTypes: [3, 1, 0], loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_0900",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1000
     * @tc.name      : test the packing interface disposalTypes less than PixelMapList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1000", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3], loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1000",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1100
     * @tc.name      : test the packing interface disposalTypes more than PixelMapList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1100", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 2, 1, 0], loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1100",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1200
     * @tc.name      : test the packing interface uses test.bmp
     * @tc.desc      : 1.Create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1200", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.bmp");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1200", 
          { width: 1399, height: 1042 }, packingOptions, pixelMapList)
      }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1300
     * @tc.name      : test the packing interface uses test.jpg
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1300", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.jpg");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1300", 
          { width: 1446, height: 1476 }, packingOptions, pixelMapList)
      }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1400
     * @tc.name      : test the packing interface uses test.ico
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1400", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.ico");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1400", 
          { width: 64, height: 64 }, packingOptions, pixelMapList)
      }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1500
     * @tc.name      : test the packing interface uses test.svg
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1500", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.svg");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1500", 
          { width: 400, height: 200 }, packingOptions, pixelMapList)
      }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1600
     * @tc.name      : test the packing interface uses test.dng
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1600", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.dng");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1600", 
          { width: 5976, height: 3992 }, packingOptions, pixelMapList)
      }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1700
     * @tc.name      : test the packing interface uses test.jpeg
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1700", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.jpeg");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1700", 
          { width: 3072, height: 4096 }, packingOptions, pixelMapList)
      }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1800
     * @tc.name      : test the packing interface uses test.webp
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1800", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let pixelMapList = await createPixelMapList(done, "test.webp");
        let packingOptions: image.PackingOptionsForSequence = {
          frameCount: 1,
          delayTimeList: [10],
          disposalTypes: [3],
          loopCount: 5
        };
        testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1800", 
          { width: 1212, height: 681 }, packingOptions, pixelMapList)
      }
    });
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1900
     * @tc.name      : test the packing interface uses HDRVividSingleLayer.heic
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1900", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        let isSupportFormat = await isSupportImageFormat("HDRVividSingleLayer.heic", "image/heic");
		if (!isSupportFormat) {
	      console.info("device is not support imageformat heic");
		  expect(true).assertTrue();
		  done();
        } else {
          let pixelMapList = await createPixelMapList(done, "HDRVividSingleLayer.heic");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 1,
            delayTimeList: [10],
            disposalTypes: [3],
            loopCount: 5
          };
          testPackingForSequencePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_1900", 
            { width: 3840, height: 2160 }, packingOptions, pixelMapList)
        }
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0100
     * @tc.name      : test the packing interface passed wrong frameCount
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0100", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 0, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
          };
          testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0100",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0200
     * @tc.name      : test the packing interface passed wrong delayTimeList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0200", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [0], disposalTypes: [3, 1, 0], loopCount: 5
          };
          testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0200",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0300
     * @tc.name      : test the packing interface passed wrong disposalTypes
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0300", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 4, 5], loopCount: 5
          };
          testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0300",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0400
     * @tc.name      : test the packing interface passed wrong loopCount
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0400", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: -1
          };
          testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0400",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0500
     * @tc.name      : test the packing interface passed wrong loopCount
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0500", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = await createPixelMapList(done, "moving_test.gif");
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 65536
          };
          testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKINGFORSEQUENCE_ERROR_0500",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAPLIST_ERROR_0100
     * @tc.name      : test the packingMultiFrames interface passed empty pixelMapList
     * @tc.desc      : 1.create PixelMap List
     *               : 2.get writefd
     *               : 3.create ImagePacker
     *               : 4.packingMultiFrames
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAPLIST_ERROR_0100", 0, async (done: Function) => {
        if (!isSupportGifEncode) {
          console.info("This device does not support GIF encoding.")
          expect(true).assertTrue();
          done();
        } else {
          let pixelMapList = [];
          let packingOptions: image.PackingOptionsForSequence = {
            frameCount: 3, delayTimeList: [10, 10, 10], disposalTypes: [3, 1, 0], loopCount: 5
          };
          testPackingForSequencePromiseError(done, "SUB_MULTIMEDIA_IMAGE_PACKING_PIXELMAPLIST_ERROR_0100",
            { width: 198, height: 202 }, packingOptions, pixelMapList)
        }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0100
     * @tc.name      : test pack gif PixelMap to buffer --callback
     * @tc.desc      : 1.create imagesource
     *               : 2.create PixelMap
     *               : 3.create ImagePacker
     *               : 4.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0100", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        await testPackGifToData(
          done,
          "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0100",
          "moving_test.gif",
          "PixelMap",
          {
            width: 198, height: 202
          },
          "callback"
        );
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0200
     * @tc.name      : test pack gif ImageSource to buffer --callback
     * @tc.desc      : 1.create imagesource
     *               : 2.create ImagePacker
     *               : 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0200", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        await testPackGifToData(
          done,
          "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0200",
          "moving_test.gif",
          "ImageSource",
          {
            width: 198, height: 202
          },
          "callback"
        );
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0300
     * @tc.name      : test pack gif PixelMap to buffer --promise
     * @tc.desc      : 1.create imagesource
     *               : 2.create PixelMap
     *               : 3.create ImagePacker
     *               : 4.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0300", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        await testPackGifToData(
          done,
          "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0300",
          "moving_test.gif",
          "PixelMap",
          {
            width: 198, height: 202
          },
          "promise"
        );
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0400
     * @tc.name      : test pack gif ImageSource to buffer --promise
     * @tc.desc      : 1.create imagesource
     *               : 2.create ImagePacker
     *               : 3.call packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0400", 0, async (done: Function) => {
      if (!isSupportGifEncode) {
        console.info("This device does not support GIF encoding.")
        expect(true).assertTrue();
        done();
      } else {
        await testPackGifToData(
          done,
          "SUB_MULTIMEDIA_IMAGE_GIF_PACKINGTODATA_0400",
          "moving_test.gif",
          "ImageSource",
          {
            width: 198, height: 202
          },
          "promise"
        );
      }
    });
  })
}