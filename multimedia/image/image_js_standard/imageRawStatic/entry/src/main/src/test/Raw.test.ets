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
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';
import { initialize } from './AbilityContextHelper.test';

export default function imageRaw() {
  let globalpixelmap: image.PixelMap | undefined = undefined;
  let globalImagesource: image.ImageSource | undefined = undefined;
  let globalPacker: image.ImagePacker | undefined = undefined;
  const RGBA_8888 = image.PixelMapFormat.RGBA_8888;
  let filePath: string;
  let fdNumber: int;
  let filesDir: string = '';

  describe("imageRaw", () => {
    beforeAll(async () => {
      console.info("beforeAll case");
    });

    beforeEach(() => {
      console.info("beforeEach case");
      await initialize();
      filesDir = Hypium.get('filesDir') as string;
    });

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info("globalpixelmap release start");
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info("globalpixelmap release fail");
        }
      }
      if (globalImagesource != undefined) {
        console.info("globalpixelmap release start");
        try {
          await globalImagesource!.release();
        } catch (error) {
          console.info("globalImagesource release fail");
        }
      }
      if (globalPacker != undefined) {
        console.info("globalPacker release start");
        try {
          await globalPacker!.release();
        } catch (error) {
          console.info("globalPacker release fail");
        }
      }
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    const getFd = async (fileName: string): Promise<void> => {
      console.log('fdNumber pathDir', filesDir)
      filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      fdNumber = file.fd as int
      console.log('fdNumber getFd', fdNumber)
    }

    let packingPromise =
      async (done: () => void, testNum: string, pixelmap: image.PixelMap, packOpts: image.PackingOption): Promise<void> => {
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

            let data = await imagePackerApi.packToData(pixelmap, packOpts);
            console.info(`${testNum} packing finished`);
            if (data != undefined) {
              console.info(`${testNum} packing success`);
              let dataArr = new Uint8Array(data);
              console.info(`${testNum} packing show begin(length:` + dataArr.length + `)`);
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
        console.info(`${testNum} packingPromise leave`);
      };

    let createPixelMapPromise =
      async (done: () => void, testNum: string, picName: string, decodeOpts: image.DecodingOptions,
        packOpts: image.PackingOption): Promise<void> => {
        let imageSourceApi: image.ImageSource | undefined;
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
            let pixelmap = await imageSourceApi.createPixelMap(decodeOpts);
            if (pixelmap != undefined) {
              globalpixelmap = pixelmap;
              console.info(`${testNum} createPixelMap create pixelmap success`);
              packingPromise(done, testNum, pixelmap, packOpts);

            } else {
              console.info(`${testNum} createPixelMap create pixelmap failed`);
              expect(false).assertTrue();
              done();
            }
          }
        } catch (error) {
          console.info(`${testNum}  error: ` + error);
          expect(false).assertTrue();
          done();
        }
        console.info(`${testNum} createPixelMapPromise leave`);
      };

    let createPixelMapCallBack =
      async (done: () => void, testNum: string, picName: string, decodeOpts: image.DecodingOptions,
        packOpts: image.PackingOption): Promise<void> => {
        let imageSourceApi: image.ImageSource | undefined;
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
            imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError|null, pixelmap: image.PixelMap|undefined) => {
              if (pixelmap != undefined) {
                globalpixelmap = pixelmap;
                console.info(`${testNum} createPixelMap create pixelmap success`);
                packingPromise(done, testNum, pixelmap, packOpts);
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

    let createPixelMapCallBackErr =
      async (done: () => void, testNum: string, picName: string, decodeOpts: image.DecodingOptions): Promise<void> => {
        let imageSourceApi: image.ImageSource | undefined;
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
            imageSourceApi.createPixelMap(decodeOpts, (err: BusinessError|null, pixelmap: image.PixelMap|undefined) => {
              if (pixelmap == undefined) {
                expect(true).assertTrue();
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

    let createPixelMapPromiseErr =
      async (done: () => void, testNum: string, picName: string, decodeOpts: image.DecodingOptions): Promise<void> => {
        let imageSourceApi: image.ImageSource | undefined;
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
            try {
              let pixelmap = await imageSourceApi.createPixelMap(decodeOpts);
              console.log(`${testNum} failed`);
              expect(false).assertTrue();
              done();
            } catch (error) {
              console.log(`${testNum} createPixelMap err: ` + error);
              expect(true).assertTrue();
              done();
            }
          }
        } catch (error) {
          console.info(`${testNum}  error: ` + error);
          expect(false).assertTrue();
          done();
        }
        console.info(`${testNum} createPixelMap leave`);
      };
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0100
     * @tc.desc   createPixelMap - promise-arw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 192, height: 108
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0100", "test.arw", decodeOpts, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0200
     * @tc.desc   createPixelMap - promise-cr2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0200", "test.cr2", decodeOpts, packOpts);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0300
     * @tc.desc   createPixelMap - promise-dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0300",
        "test_dng.dng",
        decodeOpts,
        packOpts
      );
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0400
     * @tc.desc   createPixelMap - promise-nrw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0400", "test.nrw", decodeOpts, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0500
     * @tc.desc   createPixelMap - promise-pef
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0500", "test.pef", decodeOpts, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0600
     * @tc.desc   createPixelMap - promise-raf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0600", "test.raf", decodeOpts, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0700
     * @tc.desc   createPixelMap - promise-rw2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapPromise(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0700", "test.rw2", decodeOpts, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0800
     * @tc.desc   createPixelMap - callback-arw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0800", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 192, height: 108
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0800",
        "test.arw",
        decodeOpts,
        packOpts
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0900
     * @tc.desc   createPixelMap - callback-cr2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0900", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_0900",
        "test.cr2",
        decodeOpts,
        packOpts
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1000
     * @tc.desc   createPixelMap - callback-dng
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1000",
        "test_dng.dng",
        decodeOpts,
        packOpts
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1100
     * @tc.desc   createPixelMap - callback-nrw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1100",
        "test.nrw",
        decodeOpts,
        packOpts
      );
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1200
     * @tc.desc   createPixelMap - callback-pef
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1200",
        "test.pef",
        decodeOpts,
        packOpts
      );
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1300
     * @tc.desc   createPixelMap - callback-raf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1300",
        "test.raf",
        decodeOpts,
        packOpts
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1400
     * @tc.desc   createPixelMap - callback-rw2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1400", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: {
          width: 160, height: 120
        } as image.Size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      let packOpts: image.PackingOption = {
        format: "image/webp", quality: 100
      };
      createPixelMapCallBack(
        done,
        "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_1400",
        "test.rw2",
        decodeOpts,
        packOpts
      );
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2100
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2100
     * @tc.desc   createPixelMap - promise-arw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2100", Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2100", "test.arw", decodingOption);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2200
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2200
     * @tc.desc   createPixelMap - promise-arw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2200", Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2200", "test.arw", decodingOption);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2300
     * @tc.number SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2300
     * @tc.desc   createPixelMap - promise-arw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2300", Level.LEVEL0, async (done: () => void): Promise<void> => {
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
      await createPixelMapPromiseErr(done, "SUB_MULTIMEDIA_IMAGE_RAW_STATIC_2300", "test.arw", decodingOption);
    });

  });
}
