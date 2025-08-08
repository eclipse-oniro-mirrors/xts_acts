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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import featureAbility from "@ohos.ability.featureAbility";
import { BusinessError } from '@kit.BasicServicesKit';
import fs from '@ohos.file.fs'

export default function imageSvg() {
  describe("imageSvg", () => {
    const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
    let filePath: string;
    let fdNumber: number;
    let filesDir: string | undefined;

    const getFd = async (fileName: string) => {
      filesDir = AppStorage.get('pathDir')
      console.log('fdNumber pathDir', filesDir)
      filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      fdNumber = file.fd
      console.log('fdNumber getFd', fdNumber)
    }

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(async () => {
      console.info("afterAll case");
    });
    let packingPromise: (done: Function, testNum: string, pixelmap: PixelMap,
      packOpts: image.PackingOption) => Promise<void> =
      async (done: Function, testNum: string, pixelmap: PixelMap,
        packOpts: image.PackingOption): Promise<void> => {
        try {
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info(`${testNum} packingPromise create image packer failed`);
            expect(false).assertTrue();
            done();
          } else {
            let packOptsFormat = `format:` + packOpts.format;
            let packOptsQuality = `quality:` + packOpts.quality;
            console.info(`${testNum} packingPromise packOpts={${packOptsFormat}, ${packOptsQuality} }`);
            let data = await imagePackerApi.packing(pixelmap, packOpts);
            console.info(`${testNum} packing finished`);
            if (data != undefined) {
              console.info(`${testNum} packing success`);
              let dataArr = new Uint8Array(data);
              console.info(`${testNum} packing show begin(length: ${dataArr.length})`);
              let line = 0;
              for (let i = 0; i < dataArr.length; i++) {
                let str = `dataArr[${i}]=`;
                for (let j = 0; j < 20 && i < dataArr.length; j++, i++) {
                  str = str + "," + dataArr[i];
                }
                console.info(`${testNum} packing ` + str);
                i--;
                line++;
              }
              console.info(`${testNum} packing show end(line: ${line}  )`);
              expect(true).assertTrue();
              done();
            } else {
              console.info(`${testNum} packing failed`);
              expect(false).assertTrue();
              done();
            }
          }
        } catch (error) {
          console.info(`${testNum} packingPromise error: ` + error);
          expect(false).assertTrue();
          done();
        }
      };
    let createPixelMapPromise: (done: Function, testNum: string, picName: string, decodeOpts: image.DecodingOptions,
      packFunc: Function, packOpts: ESObject) => Promise<void> =
      async (done: Function, testNum: string, picName: string, decodeOpts: image.DecodingOptions,
        packFunc: Function, packOpts: ESObject): Promise<void> => {
        let imageSourceApi: image.ImageSource;
        try {
          await getFd(picName)
          console.log(`fdNumber ${fdNumber}`)
          imageSourceApi = image.createImageSource(fdNumber);
          if (imageSourceApi == undefined) {
            console.info(`${testNum} create imagesource failed`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${testNum} create imagesource success`);
            let pixelmap = await imageSourceApi.createPixelMap(decodeOpts);
            if (pixelmap != undefined) {
              console.info(`${testNum} create pixelmap success`);
              let imageInfo = await pixelmap.getImageInfo();
              expect(imageInfo.size.width).assertEqual(32);
              expect(imageInfo.size.height).assertEqual(16);
              packFunc(done, testNum, pixelmap, packOpts);
            } else {
              console.info(`${testNum} create pixelmap failed`);
              expect(false).assertTrue();
              done();
            }
          }
        } catch (error) {
          console.info(`${testNum} create pixelmap error: ` + error);
          expect(false).assertTrue();
          done();
        }
      };
    let createPixelMapCallBack: (done: Function, testNum: string, picName: string,
      decodeOpts: image.DecodingOptions, packFunc: Function, packOpts: ESObject) => Promise<void> =
      async (done: Function, testNum: string, picName: string, decodeOpts: image.DecodingOptions,
        packFunc: Function, packOpts: ESObject): Promise<void> => {
        let imageSourceApi: ESObject;
        await getFd(picName);
        imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${testNum} create imagesource success`);
          imageSourceApi.createPixelMap(decodeOpts, async (err: BusinessError, pixelmap: ESObject) => {
            if (err != undefined) {
              console.info(`${testNum} createPixelMap create pixelmap failed err: ${err}`);
              expect(false).assertTrue();
              done();
              return;
            }
            console.info(`${testNum} createPixelMap success`);
            expect(pixelmap != undefined).assertTrue();
            let imageInfo: ESObject = await pixelmap.getImageInfo();
            expect(imageInfo.size.width).assertEqual(4);
            expect(imageInfo.size.height).assertEqual(2);
            packFunc(done, testNum, pixelmap, packOpts);
          });
        }
      };

    let createPixelMapCallBackErr: (done: Function, testNum: string, picName: string,
      decodeOpts: image.DecodingOptions) => Promise<void> =
      async (done: Function, testNum: string, picName: string,
        decodeOpts: image.DecodingOptions): Promise<void> => {
        let imageSourceApi: ESObject;
        await getFd(picName);
        imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} createPixelMapPromise create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${testNum} createPixelMapPromise create imagesource success`);
          imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError, pixelmap: ESObject) => {
            expect(err != undefined).assertTrue();
            console.info(`${testNum} success: ` + err);
            done();
          });
        }
      };
    let createPixelMapPromiseErr: (done: Function, testNum: string, picName: string,
      decodeOpts: image.DecodingOptions) => Promise<void> =
      async (done: Function, testNum: string, picName: string,
        decodeOpts: image.DecodingOptions): Promise<void> => {
        let imageSourceApi: ESObject;
        await getFd(picName);
        imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} createPixelMapPromise create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${testNum} createPixelMapPromise create imagesource success`);
          try {
            await imageSourceApi.createPixelMap(decodeOpts);
            expect(false).assertTrue();
            done();
          } catch (error) {
            expect(true).assertTrue();
            console.info(`${testNum} error: ` + error);
            done();
          }
        }
      };
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_0100
     * @tc.name      : createPixelMap - promise
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_0100", 0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 32, height: 16
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_0100", "test_large.svg", decodeOpts,
        packingPromise, packOpts);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_0100
     * @tc.name      : createPixelMap - callback
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_0100", 0, async (done: Function) => {
      let decodeOpts: ESObject = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 4, height: 2
        } as ESObject,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: ESObject = {
        format: ["image/webp"], quality: 100
      };
      createPixelMapCallBack(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_0100", "test_large.svg", decodeOpts,
        packingPromise, packOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0100
     * @tc.name      : createPixelMap - callback-sampleSize: -1
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0100", 0, async (done: Function) => {
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
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0100", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0200
     * @tc.name      : createPixelMap - callback-index: -1
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0200", 0, async (done: Function) => {
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
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0200", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0300
     * @tc.name      : createPixelMap - callback-rotate: 500
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0300", 0, async (done: Function) => {
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
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0300", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0400
     * @tc.name      : createPixelMap - callback-desiredPixelFormat: 33
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0400", 0, async (done: Function) => {
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
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0400", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0500
     * @tc.name      : createPixelMap - callback-{x: 10000, y: 0 }
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0500", 0, async (done: Function) => {
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
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0500", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0600
     * @tc.name      : createPixelMap - callback-{x: 0, y: 10000 }
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0600", 0, async (done: Function) => {
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
      await createPixelMapCallBackErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_ERR_0600", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0100
     * @tc.name      : createPixelMap - promise-sampleSize: -1
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0100", 0, async (done: Function) => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0100", "test_large.svg",
        decodingOption);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0200
     * @tc.name      : createPixelMap - promise-index: -1
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0200", 0, async (done: Function) => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0200", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0300
     * @tc.name      : createPixelMap - promise-rotate: 500
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0300", 0, async (done: Function) => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0300", "test_large.svg",
        decodingOption);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0400
     * @tc.name      : createPixelMap - promise-desiredPixelFormat: 33
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0400", 0, async (done: Function) => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0400", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0500
     * @tc.name      : createPixelMap - promise-{x: 10000, y: 0}
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0500", 0, async (done: Function) => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0500", "test_large.svg",
        decodingOption);
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0600
     * @tc.name      : createPixelMap - promise-{x: 0, y: 10000}
     * @tc.desc      : 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.create PixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0600", 0, async (done: Function) => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_0600", "test_large.svg",
        decodingOption);
    });
  });
}