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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import { BusinessError } from '@kit.BasicServicesKit';

export default function imageWebp() {
  describe("imageWebp", () => {
    const ERR_CODE = 62980149;
    let globalpixelmap: ESObject;
    let globalImagesource: ESObject;
    let globalPacker: ESObject;
    let filePath: string;
    let filesDir: string | undefined;
    let isSupportGifEncode: boolean | undefined;

    let getFd: (fileName: string) => void = (fileName: string): void => {
      filesDir = AppStorage.get('pathDir')
      console.log('fdNumber pathDir', filesDir)
      filePath = filesDir + '/' + fileName;
    };

    beforeAll(async () => {
      console.info("beforeAll case");
      isSupportGifEncode = image.createImagePacker().supportedFormats.includes("image/gif");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info("globalpixelmap release start");
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info("globalpixelmap release fail");
        }
      }
      if (globalImagesource != undefined) {
        console.info("globalpixelmap release start");
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
    let createPixMapCbErr: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        getFd("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          imageSourceApi.createPixelMap(arg, (err, pixelmap) => {
            if (pixelmap == undefined) {
              console.info(`${testNum} success `);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }
      };

    let createPixMapCb: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        getFd("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          imageSourceApi.createPixelMap(arg, (err, pixelmap) => {
            if (err) {
              console.info(`${testNum} - fail ${err}`);
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelmap;
              pixelmap
                .getImageInfo()
                .then((imageInfo) => {
                  expect(imageInfo.size.height == 2).assertTrue();
                  expect(imageInfo.size.width == 1).assertTrue();
                  console.info(`${testNum} - success `);
                  console.info("imageInfo height :" + imageInfo.size.height + "width : " +
                  imageInfo.size.width);
                  done();
                })
                .catch((err: BusinessError) => {
                  console.info(`${testNum} getimageInfo err ` + JSON.stringify(err));
                });
            }
          });
        }
      };
    let createPixMapPromiseErr: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        getFd("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          imageSourceApi
            .createPixelMap(arg)
            .then((pixelmap) => {
              console.log(`${testNum} failed`);
              expect().assertFail();
              done();
            })
            .catch((error: BusinessError) => {
              console.log(`${testNum} success `);
              done();
            });
        }
      };
    let createPixMapPromise: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        getFd("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          imageSourceApi
            .createPixelMap(arg)
            .then((pixelmap) => {
              globalpixelmap = pixelmap;
              pixelmap
                .getImageInfo()
                .then((imageInfo) => {
                  expect(imageInfo.size.height == 2).assertTrue();
                  expect(imageInfo.size.width == 1).assertTrue();
                  console.info(`${testNum} - success `);
                  console.info("imageInfo height :" + imageInfo.size.height + "width : " +
                  imageInfo.size.width);
                  done();
                })
                .catch((err: BusinessError) => {
                  console.info(`${testNum} getimageInfo err ` + JSON.stringify(err));
                });
            })
            .catch((error: BusinessError) => {
              console.log(`${testNum} fail `);
              expect(false).assertTrue();
              done();
            });
        }
      };
    let packingPromise: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        console.info(`${testNum} enter`);
        let height = 4;
        let width = 6;
        let pixelSize = 4;
        let widthSize = width * pixelSize;
        let bufferSize = height * widthSize;
        const color = new ArrayBuffer(bufferSize);
        let colorArr = new Uint8Array(color);
        for (let h = 0; h < height / 2; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 255; // r
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = 0; h < height / 2; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 255; // g
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 255; // b
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        let opts: ESObject = {
          editable: true, pixelFormat: 3, size: {
            height: 4, width: 6
          } as ESObject
        };
        image.createPixelMap(color, opts).then((pixelmap) => {
          if (pixelmap == undefined) {
            console.info("${testNum} create pixelmap failed");
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap;
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              console.info(`${testNum} create image packer failed`);
              expect(false).assertTrue();
              done();
            } else {
              globalPacker = imagePackerApi;
              imagePackerApi
                .packing(pixelmap, arg)
                .then((data) => {
                  console.info(`${testNum} success`);
                  expect(data != undefined).assertTrue();
                  let dataArr = new Uint8Array(data);
                  console.info(`${testNum} dataArr.length=` + dataArr.length);
                  for (let i = 0; i < dataArr.length; i++) {
                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                  }
                  done();
                })
                .catch((error: BusinessError) => {
                  console.log(`${testNum} error: ` + error);
                  expect(false).assertFail();
                  done();
                });
            }
          }
        });
        console.info(`${testNum} leave`);
      };
    let packingCb: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        console.info(`${testNum} enter`);
        let height = 4;
        let width = 6;
        let pixelSize = 4;
        let widthSize = width * pixelSize;
        let bufferSize = height * widthSize;
        const color = new ArrayBuffer(bufferSize);
        let colorArr = new Uint8Array(color);
        for (let h = 0; h < height / 2; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 255; // r
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = 0; h < height / 2; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 255; // g
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 255; // b
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        let opts: ESObject = {
          editable: true, pixelFormat: 3, size: {
            height: 4, width: 6
          } as ESObject
        };
        image
          .createPixelMap(color, opts)
          .then((pixelmap) => {
            if (pixelmap == undefined) {
              console.info("${testNum} create pixelmap failed");
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelmap;
              const imagePackerApi = image.createImagePacker();
              if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
              } else {
                globalPacker = imagePackerApi;
                imagePackerApi.packing(pixelmap, arg, (err, data) => {
                  console.info(`${testNum} success`);
                  expect(data != undefined).assertTrue();
                  let dataArr = new Uint8Array(data);
                  console.info(`${testNum} dataArr.length=` + dataArr.length);
                  for (let i = 0; i < dataArr.length; i++) {
                    console.info(`dataArr[` + i + `]=` + dataArr[i]);
                  }
                  done();
                });
              }
            }
          })
          .catch((error: BusinessError) => {
            console.log(`${testNum} error: ` + error);
            expect(false).assertFail();
            done();
          });
        console.info(`${testNum} leave`);
      };
    let packingPromiseErr: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        console.info(`${testNum} enter`);
        let height = 4;
        let width = 6;
        let pixelSize = 4;
        let widthSize = width * pixelSize;
        let bufferSize = height * widthSize;
        const color = new ArrayBuffer(bufferSize);
        let colorArr = new Uint8Array(color);
        for (let h = 0; h < height / 2; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 255; // r
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = 0; h < height / 2; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 255; // g
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 255; // b
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        let opts: ESObject = {
          editable: true, pixelFormat: 3, size: {
            height: 4, width: 6
          } as ESObject
        };
        image.createPixelMap(color, opts).then((pixelmap) => {
          if (pixelmap == undefined) {
            console.info("${testNum} create pixelmap failed");
            expect(false).assertTrue();
            done();
          } else {
            globalpixelmap = pixelmap;
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
              console.info(`${testNum} create image packer failed`);
              expect(false).assertTrue();
              done();
            } else {
              globalPacker = imagePackerApi;
              imagePackerApi
                .packing(pixelmap, arg)
                .then((data) => {
                  console.log(`${testNum} data: ${data}`)
                  expect(data !== undefined).assertTrue();
                  done();
                })
                .catch((error: BusinessError) => {
                  console.log(`${testNum} errors: ` + error);
                  done();
                });
            }
          }
        });
        console.info(`${testNum} leave`);
      };
    let packingCbErr: (done: Function, testNum: string, arg: ESObject) => Promise<void> =
      async (done: Function, testNum: string, arg: ESObject): Promise<void> => {
        console.info(`${testNum} enter`);
        let height = 4;
        let width = 6;
        let pixelSize = 4;
        let widthSize = width * pixelSize;
        let bufferSize = height * widthSize;
        const color = new ArrayBuffer(bufferSize);
        let colorArr = new Uint8Array(color);
        for (let h = 0; h < height / 2; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 255; // r
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = 0; h < height / 2; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 255; // g
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = 0; w < width / 2; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 255; // b
            colorArr[pos + 3] = 255;
          }
        }
        for (let h = height / 2; h < height; h++) {
          for (let w = width / 2; w < width; w++) {
            let pos = widthSize * h + pixelSize * w;
            colorArr[pos + 0] = 0;
            colorArr[pos + 1] = 0;
            colorArr[pos + 2] = 0;
            colorArr[pos + 3] = 255;
          }
        }
        let opts: ESObject = {
          editable: true, pixelFormat: 3, size: {
            height: 4, width: 6
          } as ESObject
        };
        image
          .createPixelMap(color, opts)
          .then((pixelmap) => {
            if (pixelmap == undefined) {
              console.info(`${testNum} create pixelmap failed`);
              expect(false).assertTrue();
              done();
            } else {
              globalpixelmap = pixelmap;
              const imagePackerApi = image.createImagePacker();
              if (imagePackerApi == undefined) {
                console.info(`${testNum} create image packer failed`);
                expect(false).assertTrue();
                done();
              } else {
                globalPacker = imagePackerApi;
                imagePackerApi.packing(pixelmap, arg, (err, data) => {
                  console.info(`${testNum} success`);
                  console.info(`${testNum} create packing ${data}`);
                  expect(data == undefined).assertTrue();
                  done();
                });
              }
            }
          })
          .catch((error: BusinessError) => {
            console.log(`${testNum} error: ` + error);
            done();
          });
        console.info(`${testNum} leave`);
      };
    let testGetDelayTimePromise: (done: Function, testNum: string, file: string) => Promise<void> =
      async (done: Function, testNum: string, file: string): Promise<void> => {
        await getFd(file);
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} testGetDelayTimePromise create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          try {
            console.info(`${testNum} testGetDelayTimePromise create image source success`);
            globalImagesource = imageSourceApi;
            imageSourceApi.getDelayTimeList().then((delayTimes) => {
              console.info(`${testNum} testGetDelayTimePromise getDelayTime success`);
              console.info(`${testNum} delayTimes show begin length: ${delayTimes.length} `);
              for (let i = 0; i < delayTimes.length; i++) {
                console.info(`${testNum} delayTimes[ ${i} ]= ${delayTimes[i]}`);
              }
              console.info(`${testNum} delayTimes show end`);
            }).catch((err: BusinessError) => {
              console.info(`${testNum} testGetDelayTimePromise getDelayTime failed err: code is ${err.code}, message is ${err.message}`);
              expect(err.code == ERR_CODE).assertTrue();
            });
            done();
          } catch (error) {
            console.log("testGetDelayTimePromise error: " + error);
            expect(false).assertTrue();
            done();
          }
        }
      };

    let testGetDelayTimeCallBack: (done: Function, testNum: string, file: string) => Promise<void> =
      async (done: Function, testNum: string, file: string): Promise<void> => {
        await getFd(file);
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} testGetDelayTimeCallBack create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${testNum} testGetDelayTimeCallBack create imagesource success`);
          globalImagesource = imageSourceApi;
          imageSourceApi.getDelayTimeList((err, delayTimes) => {
            if (err != undefined) {
              console.info(`${testNum} testGetDelayTimeCallBack getDelayTime failed err: code is ${err.code}, message is ${err.message}`);
              expect(err.code == ERR_CODE).assertTrue();
              done();
              return;
            }
            expect(delayTimes != undefined).assertTrue();
            console.info(`${testNum} testGetDelayTimeCallBack getDelayTime success`);
            console.info(`${testNum} delayTimes show begin(length:` + delayTimes.length + `)`);
            for (let i = 0; i < delayTimes.length; i++) {
              console.info(`${testNum} delayTimes[` + i + `]=` + delayTimes[i]);
            }
            console.info(`${testNum} delayTimes show end`);
            done();
          });
        }
      };

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100
     * @tc.name      : createPixelMap - promise-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      try {
        getFd("test_large.webp");
        console.log(`filePath ${filePath}`)
        let imageSourceApi = image.createImageSource(filePath);

        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          let decodingOptions: ESObject = {
            sampleSize: 1,
            editable: true,
            desiredSize: {
              width: 1, height: 2
            } as ESObject,
            rotate: 10,
            desiredPixelFormat: 2,
            desiredRegion: {
              size: {
                height: 1, width: 2
              } as ESObject, x: 0, y: 0
            } as ESObject,
            index: 0,
          };
          imageSourceApi.createPixelMap(decodingOptions).then((pixelmap) => {
            console.log(`pixelmap ${pixelmap}`)
            if (pixelmap != undefined) {
              globalpixelmap = pixelmap;
              console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100 success ");
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          }).catch((err: BusinessError) => {
            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100 error 0: " + err);
          });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0100 error 1: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100
     * @tc.name      : createPixelMap - callback-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      try {
        await getFd("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        console.log(`filePathfilePath ${filePath}`)
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          let decodingOptions: ESObject = {
            sampleSize: 1,
            editable: true,
            desiredSize: {
              width: 1, height: 2
            } as ESObject,
            rotate: 10,
            desiredPixelFormat: 2,
            desiredRegion: {
              size: {
                height: 1, width: 2
              } as ESObject, x: 0, y: 0
            } as ESObject,
            index: 0,
          };
          imageSourceApi.createPixelMap(decodingOptions, (err, pixelmap) => {
            if (pixelmap != undefined) {
              globalpixelmap = pixelmap;
              console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100 success ");
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0100 error: " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200
     * @tc.name      : createPixelMap-promise-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      try {
        await getFd("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          imageSourceApi
            .createPixelMap()
            .then((pixelmap) => {
              globalpixelmap = pixelmap;
              expect(pixelmap != undefined).assertTrue();
              console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 success ");
              done();
            })
            .catch((error: BusinessError) => {
              console.log("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 error: " + error);
              expect().assertFail();
              done();
            });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_PROMISE_0200 err " + error);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200
     * @tc.name      : createPixelMap-callback-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      try {
        await getFd("test_large.webp");
        let imageSourceApi = image.createImageSource(filePath);
        if (imageSourceApi == undefined) {
          console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200 create image source failed");
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          imageSourceApi.createPixelMap((err, pixelmap) => {
            globalpixelmap = pixelmap;
            expect(pixelmap != undefined).assertTrue();
            console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200 success ");
            done();
          });
        }
      } catch (error) {
        console.info("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0200 err " + error);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0300
     * @tc.name      : createPixelMap-callback -{sampleSize: -1} -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 2,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0300", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0400
     * @tc.name      : createPixelMap-callback -{index: -1} -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0400", Level.LEVEL0, async (done: ESObject) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 0,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: -1,
      };
      createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0400", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0500
     * @tc.name      : createPixelMap-callback -{rotate: 500} -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0500", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 500,
        desiredPixelFormat: 3,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0500", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0600
     * @tc.name      : createPixelMap-callback -{rotate: -10} -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0600", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: -10,
        desiredPixelFormat: 3,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0600", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0700
     * @tc.name      : createPixelMap-callback editable: false -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0700", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: false,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 33,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0700", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0800
     * @tc.name      : createPixelMap-callback -{ size: { height: 1, width: 2 }, x: -1, y: -1 }-webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0800", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 2,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: -1, y: -1
        } as ESObject,
        index: 0,
      };
      createPixMapCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0800", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0900
     * @tc.name      : createPixelMap-callback -size: { height: 10000, width: 10000 } -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0900", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 3,
        desiredRegion: {
          size: {
            height: 10000, width: 10000
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapCb(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_0900", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1000
     * @tc.name      : createPixelMap-callback - sampleSize: -1 -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1000", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 2,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1000", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1100
     * @tc.name      : createPixelMap-callback - index: -1 -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1100", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 2,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: -1,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1100", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1200
     * @tc.name      : createPixelMap-callback - desiredPixelFormat: 1 -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1200", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 2,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 500,
        desiredPixelFormat: 1,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1200", decodingOptions);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1300
     * @tc.name      : createPixelMap-callback - { size: { height: 1, width: 2 }, x: -1, y: -1 } -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1300", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 3,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: -1, y: -1
        } as ESObject,
        index: 0,
      };
      createPixMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1300", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1400
     * @tc.name      : createPixelMap-callback -  size: { height: 10000, width:10000 } -webp
     * @tc.desc      : 1.create imagesource
     *                 2.set index and DecodeOptions
     *                 3.create PixelMap
     *                 4.return pixelmap undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1400", Level.LEVEL0, async (done: Function) => {
      let decodingOptions: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 10,
        desiredPixelFormat: 2,
        desiredRegion: {
          size: {
            height: 10000, width: 10000
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      createPixMapPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_CREATEPIXELMAP_CALLBACK_1400", decodingOptions);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0100
     * @tc.name      : packing - callback-webp
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 90
      };
      packingCb(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0100", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0100
     * @tc.name      : packing - promise-webp
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0100", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0100
     * @tc.name      : packing - promise-webp-wrong quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 123
      };
      packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0100", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0200
     * @tc.name      : packing - promise-webp
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      if (isSupportGifEncode) {
        console.info("SUB_MULTIMEDIA_IMAGE_COLORSPACE_ENCODE_PROMISE_0200 The device support gif encode")
        done();
      } else {
        let packOpts: ESObject = {
          format: ["image/gif"], quality: 90
        };
        packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0200", packOpts);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0300
     * @tc.name      : packing - promise-webp-no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        quality: 90
      };
      packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0300", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0400
     * @tc.name      : packing - promise-webp-no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/jpeg"]
      };
      packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0400", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0100
     * @tc.name      : packing - callback-webp-wrong format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0100", Level.LEVEL0, async (done: Function) => {
      if (isSupportGifEncode) {
        done();
      } else {
        let packOpts: ESObject = {
          format: ["image/gif"], quality: 100
        };
        packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0100", packOpts);
      }

    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0200
     * @tc.name      : packing - callback-webp-wrong quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0200", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/jpeg"], quality: 112
      };
      packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0200", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0300
     * @tc.name      : packing - callback-webp-no quality
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0300", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/jpeg"]
      };
      packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0300", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0400
     * @tc.name      : packing - callback-webp-no format
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0400", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        quality: 90
      };
      packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0400", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0500
     * @tc.name      : packing - callback-webp-quality -1
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/jpeg"], quality: -1
      };
      packingCbErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_ERROR_0500", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0500
     * @tc.name      : packing - promise-webp-quality -1
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0500", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/jpeg"], quality: -1
      };
      packingPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_ERROR_0500", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0200
     * @tc.name      : packing - callback-webp-quality 0
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/jpeg"], quality: 0
      };
      packingCb(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_CALLBACK_0200", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0200
     * @tc.name      : packing - promise-webp-quality 0
     * @tc.desc      : 1.create ImageSource
     *                 2.call packing
     *                 3.return array
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      let packOpts: ESObject = {
        format: ["image/jpeg"], quality: 0
      };
      packingPromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_PACKING_PROMISE_0200", packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0100
     * @tc.name      : test getDelayTime promise for one frame webp
     * @tc.desc      : 1.create one frame webp imagesource
     *                 2.getDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0100", Level.LEVEL0, async (done: Function) => {
      testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0100", "test_large.webp");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0200
     * @tc.name      : test getDelayTime promise for webp
     * @tc.desc      : 1.create webp imagesource
     *                 2.getDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0200", Level.LEVEL0, async (done: Function) => {
      testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0200", "moving_test.webp");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0300
     * @tc.name      : test getDelayTime promise for unsupported jpg
     * @tc.desc      : 1.create jpg imagesource
     *                 2.getDelayTime
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0300", Level.LEVEL0, async (done: Function) => {
      testGetDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_PROMISE_0300", "test.jpg");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0100
     * @tc.name      : test getDelayTime callback for one frame webp
     * @tc.desc      : 1.create one frame webp imagesource
     *                 2.getDelayTime with callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0100", Level.LEVEL0, async (done: Function) => {
      testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0100", "test_large.webp");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0200
     * @tc.name      : test getDelayTime callback for webp
     * @tc.desc      : 1.create webp imagesource
     *                 2.getDelayTime with callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0200", Level.LEVEL0, async (done: Function) => {
      testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0200", "moving_test.webp");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0300
     * @tc.name      : test getDelayTime callback for unsupported jpg
     * @tc.desc      : 1.create jpg imagesource
     *                 2.getDelayTime with callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0300", Level.LEVEL0, async (done: Function) => {
      testGetDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_WEBP_GETDELAYTIME_CALLBACK_0300", "test.jpg");
    });
  });
}