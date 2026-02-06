/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import { initialize } from './AbilityContextHelper.test';

export default function imagePackToData() {
  describe("imagePackToData", (): void => {
    let filesDir: string|undefined|null;
    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalPacker: image.ImagePacker | undefined = undefined;
    let globalImagesource: image.ImageSource | undefined = undefined;
    let filePath: string;
    let fdNumber: int;
    const ERROR_CODE = 401;

    let getFd = async (fileName: string) => {
      filePath = filesDir + "/" + fileName;
      console.log('image case filePath is1111', filePath)

      let file = fs.openSync(filePath);
      fdNumber = file.fd as int;
      console.log('image case filePath is', fdNumber + filePath)
    }

    beforeAll(async () => {
      console.info("beforeAll case");
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
    });

    beforeEach(() => {
      console.info("beforeEach case");
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

    afterAll(() => {
      console.info("afterAll case");
    });

    let packToDataPromise = (done: () => void, testNum: string, pixFormat: int, arg: image.PackingOption) => {
      let opts: image.InitializationOptions
      const Color = new ArrayBuffer(96);
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2 as image.PixelMapFormat, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5 as image.PixelMapFormat, size: {
            height: 4, width: 6
          }
        };
      }
      try {
        let pixelmap: image.PixelMap = image.createPixelMapSync(Color, opts);
        if (pixelmap == undefined) {
          expect(false).assertTrue();
          console.info(`${testNum} create pixelmap fail`);
          done();
        } else {
          globalpixelmap = pixelmap;
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            expect(false).assertTrue();
            console.info(`${testNum} create imagepacker fail`);
            done();
          } else {
            globalPacker = imagePackerApi;
            try {
              let data: ArrayBuffer | undefined;
              waitForCompletion(async () => {data = await imagePackerApi!.packToData(pixelmap, arg);})
              waitForCompletion(async () => {await pixelmap!.release();})
              waitForCompletion(async () => {await imagePackerApi!.release();})
              let dataArr = new Uint8Array(data as ArrayBuffer);
              console.info(`${testNum} dataArr.length=` + dataArr.length);
              for (let i = 0; i < dataArr.length; i++) {
                console.info(`dataArr[` + i + `]=` + dataArr[i]);
              }
              expect(data != undefined).assertTrue();
              console.info(`${testNum} success`);
              done();
            } catch (error) {
              console.log(`${testNum} error:` + JSON.stringify(error));
              expect().assertFail();
              done();
            };
          }
        }
    } catch (error) {
        console.log("createpixelmap error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      };
    }

    let packingPromiseFail = (done: () => void, testNum: string, pixFormat: int, packOpts: image.PackingOption) => {
      const Color = new ArrayBuffer(96);
      let opts: image.InitializationOptions
      if (pixFormat == 2) {
        opts = {
          editable: true, pixelFormat: 2 as image.PixelMapFormat, size: {
            height: 4, width: 6
          }
        };
      } else {
        opts = {
          editable: true, pixelFormat: 5 as image.PixelMapFormat, size: {
            height: 4, width: 6
          }
        };
      }
      try {
        let pixelmap: image.PixelMap = image.createPixelMapSync(Color, opts);
        if (pixelmap == undefined) {
          expect(false).assertTrue();
          done();
        } else {
          globalpixelmap = pixelmap;
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            expect(false).assertTrue();
            done();
          } else {
            globalPacker = imagePackerApi;
            try {
                let data: ArrayBuffer | undefined;
                waitForCompletion(async () => {data = await imagePackerApi!.packToData(pixelmap, packOpts);})
                expect(false).assertTrue();
                done();
            } catch(error)  {
              error = error as BusinessError;
              console.log(`${testNum} error:` + JSON.stringify(error));
              console.log(`${testNum} error.code:` + error.code);
              expect(error.code == ERROR_CODE).assertTrue();
              done();
            };
          }
        }
      } catch (error) {
        console.log("createpixelmap error: " + JSON.stringify(error));
        expect().assertFail();
        done();
      };
    }

    let packToDataimgSourcePromise = async (done: () => void, testNum: string, packOpts: image.PackingOption) => {
      try {
        await getFd("test.png");
        const imageSourceApi = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          const imagePackerApi: image.ImagePacker = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info(`${testNum} create image packer failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalPacker = imagePackerApi;
            try {
              let data: ArrayBuffer = await imagePackerApi.packToData(imageSourceApi, packOpts);
              await imagePackerApi.release();
              await imageSourceApi.release();
              console.info(`${testNum} success`);
              expect(data != undefined).assertTrue();
              done();
            } catch(error) {
              await imagePackerApi.release();
              await imageSourceApi.release();
              console.log(`${testNum} error.code:` + error.code + ` error.message: ` + error.message);
              expect(false).assertFail();
              done();
            };
          }
        }
      } catch (error) {
        console.info(`${testNum} error: ` + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    }

    let packToDataimgSourcePromiseFail = async (done: () => void, testNum: string, packOpts: image.PackingOption) => {
      try {
        await getFd("test.png");
        const imageSourceApi: image.ImageSource | undefined = image.createImageSource(fdNumber);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} create image source failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalImagesource = imageSourceApi;
          const imagePackerApi = image.createImagePacker();
          if (imagePackerApi == undefined) {
            console.info(`${testNum} create image packer failed`);
            expect(false).assertTrue();
            done();
          } else {
            globalPacker = imagePackerApi;
            try {
            let data: ArrayBuffer = await imagePackerApi.packToData(imageSourceApi, packOpts);
              console.info(`${testNum} failed`);
              expect(data == undefined).assertTrue();
              done();
            } catch(error) {
              error = error as BusinessError;
              console.log(`${testNum} error.code:` + error.code + ` error.message: ` + error.message);
              expect(error.code == ERROR_CODE).assertTrue();
              done();
            };
          }
        }
      } catch (error) {
        console.info(`${testNum} error: ` + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0100
     * @tc.desc   SUB_IMAGE_packToData_PixelMap_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 99
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0100", 2, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0200
     * @tc.desc   SUB_IMAGE_packToData_PixelMap_002 - Promise - RGB565 quality 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 123
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0200", 2, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0500
     * @tc.desc   SUB_IMAGE_packToData_PixelMap_005 - Promise - RGB565 wrong format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/txt",
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0500", 2, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0600
     * @tc.desc   SUB_IMAGE_packToData_PixelMap_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0600", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 50
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0600", 5, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0700
     * @tc.desc   SUB_IMAGE_packToData_PixelMap_007 - Promise - RGB888 quality 123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0700", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 123
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_0700", 5, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_1000
     * @tc.desc   SUB_IMAGE_packToData_PixelMap_010 - Promise - RGB888 wrong format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_1000", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/txt",
        quality: 99
      };
      packingPromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_PROMISE_STATIC_1000", 5, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0100
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 99,
        bufferSize: 10485760
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0100", 2, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0200
     * @tc.desc   1.create PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 99,
        bufferSize: 20480
      };
      console.info(`SUB_MULTIMEDIA_IMAGE_PACKING_ADDBUFFERSIZE_PROMISE_STATIC_0200 buffersize: ${packOpts.bufferSize}`);
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0200", 2, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0300
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0300-over maxbufferSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 99,
        bufferSize: 20000000
      };
      packToDataPromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_PIXELMAP_ADDBUFFERSIZE_PROMISE_STATIC_0300", 2, packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0100
     * @tc.desc   packToData ImageSource - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 99
      };
      packToDataimgSourcePromise(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0100", packOpts);
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0200
     * @tc.desc   SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 123
      };
      packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0200", packOpts);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0500
     * @tc.desc   packToData ImageSource - promise - wrong format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0500", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let packOpts: image.PackingOption = {
        format: "image/txt",
        quality: 99
      };
      packToDataimgSourcePromiseFail(done, "SUB_MULTIMEDIA_IMAGE_PACKTODATA_IMAGESOURCE_PROMISE_STATIC_0500", packOpts);
    });
  })
}
