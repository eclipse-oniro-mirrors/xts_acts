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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';

let globalpixelmap: ESObject;
let globalImagesource: ESObject;
let globalPacker: ESObject;
const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
let filePath: ESObject;
let fdNumber: ESObject;
let filesDir: ESObject;

const getFd = async (fileName: string) => {
  filesDir = AppStorage.get('pathDir')
  console.log('fdNumber pathDir', filesDir)
  filePath = filesDir + '/' + fileName;
  let file = fs.openSync(filePath);
  fdNumber = file.fd
  console.log('fdNumber getFd', fdNumber)
}

export default function imageRaw() {
  describe("imageRaw", () => {
    beforeAll(async () => {
      console.info("beforeAll case");
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
    let packingPromise: (done: Function, testNum: ESObject, pixelmap: ESObject,
      packOpts: ESObject) => Promise<void> =
      async (done: Function, testNum: ESObject, pixelmap: ESObject, packOpts: ESObject): Promise<void> => {
        console.info(`${testNum} packingPromise enter`);
        try {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info(`${testNum} packingPromise create image packer failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalPacker = imagePackerApi;
            let packOptsFormat = `format:` + packOpts.format;
            let packOptsQuality = `quality:` + packOpts.quality;
            console.info(`${testNum} packingPromise packOpts={` + packOptsFormat + `, ` + packOptsQuality +
              `}`);
            imagePackerApi
              .packing(pixelmap, packOpts)
              .then((data) => {
                console.info(`${testNum} packing finished`);
                if (data != undefined) {
                  console.info(`${testNum} packing success`);
                  let dataArr = new Uint8Array(data);
                  console.info(`${testNum} packing show begin(length:` + dataArr.length + `)`);
                  let line = 0;
                  for (let i = 0; i < dataArr.length; i++) {
                    let str = `dataArr[` + i + `]=`;
                    for (let j = 0; j < 20 && i < dataArr.length; j++, i++) {
                      str = str + "," + dataArr[i];
                    }
                    console.info(`${testNum} packing ` + str);
                    i--;
                    line++;
                  }
                  console.info(`${testNum} packing show end(line:` + line + `)`);
                  done();
                } else {
                  console.info(`${testNum} packing failed`);
                  expect(false).assertTrue();
                  done();
                }
              }).catch((error: BusinessError) => {
              console.log(`${testNum} packing error: ` + error);
              expect(false).assertTrue();
              done();
            });
          }
        } catch (error) {
          console.info(`${testNum} packingPromise error: ` + error);
          expect(false).assertTrue();
          done();
        }
        console.info(`${testNum} packingPromise leave`);
      };
    let createPixelMapPromise: (done: Function, testNum: ESObject, picName: ESObject, decodeOpts: ESObject,
      packFunc: ESObject, packOpts: ESObject) => Promise<void> =
      async (done: Function, testNum: ESObject, picName: ESObject, decodeOpts: ESObject, packFunc: ESObject,
        packOpts: ESObject): Promise<void> => {
        let imageSourceApi: ESObject;
        try {
          await getFd(picName);
          imageSourceApi = image.createImageSource(fdNumber);
          if (imageSourceApi == undefined) {
            console.info(`${testNum} createPixelMapPromise create imagesource failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalImagesource = imageSourceApi;
            console.info(`${testNum} createPixelMapPromise create imagesource success`);
            imageSourceApi
              .createPixelMap(decodeOpts)
              .then((pixelmap: ESObject) => {
                if (pixelmap != undefined) {
                  globalpixelmap = pixelmap;
                  console.info(`${testNum} createPixelMap create pixelmap success`);
                  packFunc(done, testNum, pixelmap, packOpts);
                } else {
                  console.info(`${testNum} createPixelMap create pixelmap failed`);
                  expect(false).assertTrue();
                  done();
                }
              })
              .catch((error: BusinessError) => {
                console.log(`${testNum} createPixelMap err: ` + error);
                expect(false).assertFalse();
                done();
              });
          }
        } catch (error) {
          console.info(`${testNum}  error: ` + error);
          expect(false).assertTrue();
          done();
        }
        console.info(`${testNum} createPixelMapPromise leave`);
      };
    let createPixelMapCallBack: (done: Function, testNum: ESObject, picName: ESObject, decodeOpts: ESObject,
      packFunc: ESObject, packOpts: ESObject) => Promise<void> =
      async (done: Function, testNum: ESObject, picName: ESObject, decodeOpts: ESObject, packFunc: ESObject,
        packOpts: ESObject): Promise<void> => {
        let imageSourceApi: ESObject;
        try {
          await getFd(picName);
          imageSourceApi = image.createImageSource(fdNumber);
          if (imageSourceApi == undefined) {
            console.info(`${testNum} createPixelMapPromise create imagesource failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalImagesource = imageSourceApi;
            console.info(`${testNum} createPixelMapPromise create imagesource success`);
            imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError, pixelmap: ESObject) => {
              if (pixelmap != undefined) {
                globalpixelmap = pixelmap;
                console.info(`${testNum} createPixelMap create pixelmap success`);
                packFunc(done, testNum, pixelmap, packOpts);
              } else {
                console.info(`${testNum} createPixelMap create pixelmap failed err: ${err}`);
                expect(false).assertFalse();
                done();
              }
            });
          }
        } catch (error) {
          console.info(`${testNum}  error: ` + error);
          expect(false).assertTrue();
          done();
        }
        console.info(`${testNum} createPixelMapPromise leave`);
      };

    let createPixelMapCallBackErr: (done: Function, testNum: ESObject, picName: ESObject,
      decodeOpts: ESObject) => Promise<void> =
      async (done: Function, testNum: ESObject, picName: ESObject, decodeOpts: ESObject): Promise<void> => {
        let imageSourceApi: ESObject;
        try {
          await getFd(picName);
          imageSourceApi = image.createImageSource(fdNumber);
          if (imageSourceApi == undefined) {
            console.info(`${testNum} createPixelMapPromise create imagesource failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalImagesource = imageSourceApi;
            console.info(`${testNum} createPixelMapPromise create imagesource success`);
            imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError, pixelmap: ESObject) => {
              if (pixelmap == undefined) {
                console.info(`${testNum} success: ` + err);
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          }
        } catch (error) {
          console.info(`${testNum}  error: ` + error);
          expect(false).assertTrue();
          done();
        }
        console.info(`${testNum} createPixelMap leave`);
      };
    let createPixelMapPromiseErr: (done: Function, testNum: ESObject, picName: ESObject,
      decodeOpts: ESObject) => Promise<void> =
      async (done: Function, testNum: ESObject, picName: ESObject, decodeOpts: ESObject): Promise<void> => {
        let imageSourceApi: ESObject;
        try {
          await getFd(picName);
          imageSourceApi = image.createImageSource(fdNumber);
          if (imageSourceApi == undefined) {
            console.info(`${testNum} createPixelMapPromise create imagesource failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalImagesource = imageSourceApi;
            console.info(`${testNum} createPixelMapPromise create imagesource success`);
            imageSourceApi
              .createPixelMap(decodeOpts)
              .then((pixelmap: ESObject) => {
                console.log(`${testNum} failed`);
                expect(false).assertTrue();
                done();
              })
              .catch((error: BusinessError) => {
                console.log(`${testNum} createPixelMap err: ` + error);
                done();
              });
          }
        } catch (error) {
          console.info(`${testNum}  error: ` + error);
          expect(false).assertTrue();
          done();
        }
        console.info(`${testNum} createPixelMap leave`);
      };
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0100
     * @tc.name      : createPixelMap - promise-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0100", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 192, height: 108
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_0100", "test.arw", decodeOpts, packingPromise, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0200
     * @tc.name      : createPixelMap - promise-cr2
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0200", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_0200", "test.cr2", decodeOpts, packingPromise, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0300
     * @tc.name      : createPixelMap - promise-dng
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0300", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_0300",
        "test_dng.dng",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0400
     * @tc.name      : createPixelMap - promise-nrw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0400", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_0400", "test.nrw", decodeOpts, packingPromise, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0500
     * @tc.name      : createPixelMap - promise-pef
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0500", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_0500", "test.pef", decodeOpts, packingPromise, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0600
     * @tc.name      : createPixelMap - promise-raf
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0600", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_0600", "test.raf", decodeOpts, packingPromise, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0700
     * @tc.name      : createPixelMap - promise-rw2
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0700", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_0700", "test.rw2", decodeOpts, packingPromise, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0800
     * @tc.name      : createPixelMap - callback-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0800", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 192, height: 108
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_0800",
        "test.arw",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_0900
     * @tc.name      : createPixelMap - callback-cr2
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_0900", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_0900",
        "test.cr2",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1000
     * @tc.name      : createPixelMap - callback-dng
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1000", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_1000",
        "test_dng.dng",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1100
     * @tc.name      : createPixelMap - callback-nrw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1100", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_1100",
        "test.nrw",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1200
     * @tc.name      : createPixelMap - callback-pef
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1200", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_1200",
        "test.pef",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1300
     * @tc.name      : createPixelMap - callback-raf
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1300", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_1300",
        "test.raf",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1400
     * @tc.name      : createPixelMap - callback-rw2
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1400", Level.LEVEL0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_1400",
        "test.rw2",
        decodeOpts,
        packingPromise,
        packOpts
      );
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1500
     * @tc.name      : createPixelMap - callback-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1500", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_1500", "test.arw", decodingOption);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1600
     * @tc.name      : createPixelMap - callback-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1600", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: -1,
      };
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_1600", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1700
     * @tc.name      : createPixelMap - callback-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1700", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 500,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_1700", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1800
     * @tc.name      : createPixelMap - callback-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1800", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: false,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: 33,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_1800", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_1900
     * @tc.name      : createPixelMap - callback-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_1900", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 10000, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_1900", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_2000
     * @tc.name      : createPixelMap - callback-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_2000", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 10000
        } as ESObject,
        index: 0,
      };
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_2000", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_2100
     * @tc.name      : createPixelMap - promise-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_2100", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_2100", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_2200
     * @tc.name      : createPixelMap - promise-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_2200", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: -1,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_2200", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_2300
     * @tc.name      : createPixelMap - promise-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_2300", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 500,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_2300", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_2400
     * @tc.name      : createPixelMap - promise-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_2400", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: false,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: 33,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_2400", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_2500
     * @tc.name      : createPixelMap - promise-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_2500", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 10000, y: 0
        } as ESObject,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_2500", "test.arw", decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_RAW_2600
     * @tc.name      : createPixelMap - promise-arw
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_2600", Level.LEVEL0, async (done: Function) => {
      let decodingOption: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as ESObject, x: 0, y: 10000
        } as ESObject,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_2600", "test.arw", decodingOption);
    });

  });
}