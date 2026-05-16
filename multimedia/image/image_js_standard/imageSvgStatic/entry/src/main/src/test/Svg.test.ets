/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs'
import { initialize } from './AbilityContextHelper.test';

export default function imageSvg() {
  describe("imageSvg", () => {
    const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
    let filePath: string;
    let fdNumber: int;
    let filesDir: string | undefined;

    const getFd = async (fileName: string): Promise<void> => {
      console.log('fdNumber pathDir', filesDir)
      filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      fdNumber = file.fd as int
      console.log('fdNumber getFd', fdNumber)
    }

    beforeAll(async () => {
      console.info("beforeAll case");
      await initialize();
      filesDir = Hypium.get('filesDir') as string;
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
    let packingPromise: (done: () => void, testNum: string, pixelmap: image.PixelMap,
      packOpts: image.PackingOption) => Promise<void> =
      async (done: () => void, testNum: string, pixelmap: image.PixelMap,
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
            let data = await imagePackerApi.packToData(pixelmap, packOpts);
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
    let createPixelMapPromise =
      async (done: () => void, testNum: string, picName: string, decodeOpts: image.DecodingOptions,
        packOpts: image.PackingOption): Promise<void> => {
      let imageSourceApi: image.ImageSource | undefined;
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
            packingPromise(done, testNum, pixelmap, packOpts);
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
    let createPixelMapCallBack =
      async (done: () => void, testNum: string, picName: string, decodeOpts: image.DecodingOptions,
        packOpts: image.PackingOption): Promise<void> => {
        let imageSourceApi: image.ImageSource | undefined;
        await getFd(picName);
        imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${testNum} create imagesource success`);
          imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError|null, pixelmap: image.PixelMap|undefined) => {
            if (err && err.code) {
              console.info(`${testNum} createPixelMap create pixelmap failed err: ${err}`);
              expect(false).assertTrue();
              done();
              return;
            }
            console.info(`${testNum} createPixelMap success`);
            expect(pixelmap != undefined).assertTrue();
            let imageInfo: image.ImageInfo = await pixelmap!.getImageInfo();
            expect(imageInfo.size.width).assertEqual(4);
            expect(imageInfo.size.height).assertEqual(2);
            packingPromise(done, testNum, pixelmap!, packOpts);
          });
        }
      };

    let createPixelMapCallBackErr: (done: () => void, testNum: string, picName: string,
      decodeOpts: image.DecodingOptions) => Promise<void> =
      async (done: () => void, testNum: string, picName: string,
        decodeOpts: image.DecodingOptions): Promise<void> => {
        let imageSourceApi: image.ImageSource | undefined;
        await getFd(picName);
        imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} createPixelMapPromise create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${testNum} createPixelMapPromise create imagesource success`);
          imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError|null, pixelmap: image.PixelMap|undefined) => {
            expect(err != null).assertTrue();
            console.info(`${testNum} success: ` + err);
            done();
          });
        }
      };
    let createPixelMapPromiseErr: (done: () => void, testNum: string, picName: string,
      decodeOpts: image.DecodingOptions) => Promise<void> =
      async (done: () => void, testNum: string, picName: string,
        decodeOpts: image.DecodingOptions): Promise<void> => {
        let imageSourceApi: image.ImageSource | undefined;
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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_STATIC_0100
     * @tc.desc   createPixelMap - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 32, height: 16
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_STATIC_0100", "test_large.svg", decodeOpts,
        packOpts);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_STATIC_0100
     * @tc.desc   createPixelMap - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 4, height: 2
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(done, "SUB_MULTIMEDIA_IMAGE_SVG_CALLBACK_STATIC_0100", "test_large.svg", decodeOpts,
        packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0100
     * @tc.desc   createPixelMap - promise-sampleSize: -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOption: image.DecodingOptions = {
        sampleSize: -1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0100", "test_large.svg",
        decodingOption);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0200
     * @tc.desc   createPixelMap - promise-index: -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOption: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: -1,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0200", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0300
     * @tc.desc   createPixelMap - promise-rotate: 500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOption: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 500,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 0, y: 0
        } as image.Region,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0300", "test_large.svg",
        decodingOption);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0500
     * @tc.desc   createPixelMap - promise-{x: 10000, y: 0}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOption: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 10000, y: 0
        } as image.Region,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0500", "test_large.svg",
        decodingOption);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0600
     * @tc.desc   createPixelMap - promise-{x: 0, y: 10000}
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodingOption: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 1, height: 2
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        desiredRegion: {
          size: {
            height: 1, width: 2
          } as image.Size, x: 0, y: 10000
        } as image.Region,
        index: 0,
      };
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_SVG_PROMISE_ERR_STATIC_0600", "test_large.svg",
        decodingOption);
    });
  });
}
