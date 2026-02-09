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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import common from '@ohos.app.ability.common';
import fileio from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import { BusinessError } from '@ohos.base';
import { initialize } from './AbilityContextHelper.test';

export default function imagePackToFile() {
  let filesDir: string | undefined | null;
  let cacheDir: string | undefined | null;
  let testContext: common.UIAbilityContext;
  describe("imagePackToFile", () => {
    const pixelWidth: int = 6;
    const pixelHeight: int = 4;
    const ERROR_CODE: int = 62980115;

    beforeAll(() => {
      await initialize();
      testContext = Hypium.get('context') as common.UIAbilityContext;
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      cacheDir = Hypium.get('cacheDir') as string | undefined | null;
      console.info("beforeAll case");
    });

    beforeEach(() => {
      console.info("beforeEach case");
    });

    afterEach(() => {
      console.info("afterEach case");
    });

    afterAll(() => {
      console.info("afterAll case");
    });

    const getImageSourceData = (fileName: string) => {
      let fPath = filesDir + "/" + fileName;
      let imagesource = image.createImageSource(fPath);
      return imagesource;
    }

    const getPixelMapData = () => {
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 2 as image.PixelMapFormat, size: { height: 4, width: 6 } };
      const Color = new ArrayBuffer(96);
      let pixelmap = image.createPixelMapSync(Color, opts);
      return pixelmap;
    }

    const getWriteFd = (fileName: string) => {
      let writeFd: int = 0;
      let fPath = filesDir + "/" + fileName;
      try {
        console.info("image getWriteFd fPath is " + fPath);
        let mode: int = fileio.OpenMode.READ_WRITE | fileio.OpenMode.CREATE;
        writeFd = fileio.openSync(fPath, mode).fd as int;
        console.log(`getWriteFd fd: ${JSON.stringify(writeFd)}`);
        if (writeFd !== null) {
          console.info("getWriteFd file fd created");
        } else {
          console.info("getWriteFd file fd created error");
        }
        writeFd = fileio.openSync(fPath, mode).fd as int;
        console.log(`getWriteFd fd-re: ${JSON.stringify(writeFd)}`);
        if (writeFd !== null) {
          console.info("getWriteFd file fd opened : Append Mode");
        } else {
          console.info("getWriteFd file fd opened : Append Mode failed");
        }
      } catch (error) {
        console.info("image getWriteFd " + error);
      }
      return [fPath, writeFd];
    }

    const packToFilePromise = async (
      done: () => void,
      testNum: string,
      source: image.ImageSource | image.PixelMap,
      fd: int,
      fPath: string,
      ops: image.PackingOption,
      checkSize: (width: int, height: int) => void
    ) => {
      try {
        let imagePacker = image.createImagePacker();
        expect(imagePacker != undefined).assertTrue();
        if (imagePacker == undefined) {
          done();
        }
        try {
          if (source instanceof image.ImageSource) {
            await imagePacker.packToFile(source as image.ImageSource, fd, ops);
          } else {
            await imagePacker.packToFile(source as image.PixelMap, fd, ops);
          }
          await imagePacker.release();
          await source.release();
          try {
            fileio.closeSync(fd)
            console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
            let imgSource = image.createImageSource(fPath);
            if (imgSource == undefined) {
              expect().assertFail();
              done();
              return undefined;
            }
            let info = await imgSource.getImageInfo();
            await imgSource.release();
            if (info == undefined) {
              expect().assertFail();
              done();
              return undefined;
            }
            console.log(`${testNum} file size ${info.size.width}`);
            console.log(`${testNum} file size ${info.size.height}`);
            checkSize(info.size.width, info.size.height)
            done();
          } catch (e1) {
            console.log("packToFilePromise e1: " + e1);
            expect().assertFail();
            done();
          }
        } catch(error) {
          console.log(`${testNum} error: ` + error);
          expect().assertFail();
          done();
        };
      } catch (error) {
        console.log("packToFilePromise error: " + error);
        expect().assertFail();
        done();
      }
    }

    const packToFileCallback = async (
      done: () => void,
      testNum: string,
      source: image.ImageSource | image.PixelMap,
      fd: int,
      fPath: string,
      ops: image.PackingOption,
      checkSize: (width: int, height: int) => void
    ) => {
        try {
          let imagePacker = image.createImagePacker();
          expect(imagePacker != undefined).assertTrue();
          if (imagePacker == undefined) {
            await source.release();
            done();
          }
          if (source instanceof image.ImageSource) {
            imagePacker.packToFile(source as image.ImageSource, fd, ops, (err: BusinessError | null) => {
              try {
                await imagePacker.release();
                await source.release();
                fileio.closeSync(fd)
                console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                if (err && err.code) {
                  console.info(`${testNum} pack failerr: ${err}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  let imgSource = image.createImageSource(fPath);
                  if (imgSource == undefined) {
                    expect().assertFail();
                  } else {
                    let info = await imgSource.getImageInfo();
                    if (info == undefined) {
                      expect().assertFail();
                    } else {
                      await imgSource.release();
                      console.log(`${testNum} file size ${info.size.width}`);
                      console.log(`${testNum} file size ${info.size.height}`);
                      checkSize(info.size.width, info.size.height)
                    }
                  }
                  done();
                }
              } catch (e1) {
                console.log("packToFileCallback e1: " + e1);
                expect().assertFail();
                done();
              }
            })
          } else {
            imagePacker.packToFile(source as image.PixelMap, fd, ops, (err: BusinessError | null) => {
              try {
                await imagePacker.release();
                await source.release();
                fileio.closeSync(fd)
                console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
                if (err && err.code) {
                  console.info(`${testNum} pack failerr: ${err}`);
                  expect(false).assertTrue();
                  done();
                } else {
                  let imgSource = image.createImageSource(fPath);
                  if(imgSource == undefined) {
                    expect().assertFail();
                  } else {
                    let info = await imgSource.getImageInfo();
                    await imgSource.release();
                    if(info != undefined) {
                      console.log(`${testNum} file size ${info.size.width}`);
                      console.log(`${testNum} file size ${info.size.height}`);
                      checkSize(info.size.width, info.size.height)
                    } else {
                      expect().assertFail();
                    }
                  }
                  done();
                }
              } catch (e1) {
                console.log("packToFileCallback e1: " + e1);
                expect().assertFail();
                done();
              }
            })
          }
        } catch (error) {
          console.log("packToFileCallback error: " + error);
          try {
            await source.release();
          } catch (e) {
            console.log("Error releasing source: " + e);
          }
          expect().assertFail();
          done();
        }
    }

    const packToFileCbErr = async (done: () => void, testNum: string, source: image.ImageSource | image.PixelMap, fd: int, ops: image.PackingOption, fPath: string) => {
      try {
        let imagePacker = image.createImagePacker();
        expect(imagePacker != undefined).assertTrue();
        if (imagePacker == undefined) {
          expect(false).assertTrue();
          done();
        }
        if (source instanceof image.ImageSource) {
          imagePacker.packToFile(source as image.ImageSource, fd, ops, (err: BusinessError|null) => {
            fileio.closeSync(fd);
            await imagePacker.release();
            await source.release();
            if (err && err.code) {
              console.info(`${testNum} pack failerr: ${JSON.stringify(err)}`);
              console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
              expect(err!.code == ERROR_CODE).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          })
        } else {
          imagePacker.packToFile(source as image.PixelMap, fd, ops, (err: BusinessError|null) => {
            fileio.closeSync(fd);
            await imagePacker.release();
            await source.release();
            if (err && err.code) {
              console.info(`${testNum} pack failerr: ${JSON.stringify(err)}`);
              console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
              expect(err!.code == ERROR_CODE).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }
      } catch (error) {
        console.log("packToFileCallback error: " + error);
        expect().assertFail();
        done();
      }
    }

    const packToFilePromiseErr = async (done: () => void, testNum: string, source: image.ImageSource | image.PixelMap, fd: int, ops: image.PackingOption, fPath: string) => {
      try {
        let imagePacker = image.createImagePacker();
        expect(imagePacker != undefined).assertTrue();
        if (imagePacker == undefined) {
          done();
        }
        try {
          if (source instanceof image.ImageSource) {
            await imagePacker.packToFile(source as image.ImageSource, fd, ops);
          } else {
            await imagePacker.packToFile(source as image.PixelMap, fd, ops);
          }
          await imagePacker.release();
          await source.release();
          fileio.closeSync(fd);
          expect(false).assertTrue();
          console.info(`${testNum} packToFile test`);
          done();
        } catch (error: BusinessError) {
          fileio.closeSync(fd);
          console.log(`${testNum} packToFile error: ` + JSON.stringify(error));
          console.info(`${testNum} file size ${fileio.statSync(fPath).size}`);
          expect(error.code == ERROR_CODE).assertTrue();
          done();
        }
      } catch (error) {
        console.log("packToFilePromise error: " + error);
        expect().assertFail();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0100
     * @tc.desc   sub_multimedia_image_packToFile_promise_imagesource_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let imageSource = getImageSourceData("test.png")
      if (imageSource == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("promise_image_source.jpg")
      let ops: image.PackingOption = { format: "image/jpeg", quality: 100 };
      let imageInfo = await imageSource.getImageInfo();
      if (imageInfo == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let checkSize = (width: int, height: int) => {
        expect(width == imageInfo!.size.width).assertTrue();
        expect(height == imageInfo!.size.height).assertTrue();
      }
      await packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0100",
        imageSource, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0200
     * @tc.desc   sub_multimedia_image_packToFile_promise_imagesource_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let imageSource = getImageSourceData("test.png")
      if (imageSource == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("webp_image_source.webp")
      let ops: image.PackingOption = { format: "image/webp", quality: 98 };
      let imageInfo = await imageSource.getImageInfo();
      if (imageInfo == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let checkSize = (width: int, height: int) => {
        expect(width == imageInfo!.size.width).assertTrue();
        expect(height == imageInfo!.size.height).assertTrue();
      }
      await packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0200",
        imageSource, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0300
     * @tc.desc   sub_multimedia_image_packToFile_promise_imagesource_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let imageSource = getImageSourceData("test.png")
      if (imageSource == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("png_image_source.png")
      let ops: image.PackingOption = { format: "image/png", quality: 100 };
      let imageInfo = await imageSource.getImageInfo();
      if (imageInfo == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let checkSize = (width: int, height: int) => {
        expect(width == imageInfo!.size.width).assertTrue();
        expect(height == imageInfo!.size.height).assertTrue();
      }
      await packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_IMAGE_SOURCE_STATIC_0300",
        imageSource, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0100
     * @tc.desc   sub_multimedia_image_packToFile_callback_imagesource_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let imageSource = getImageSourceData("test.png")
      if (imageSource == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_image_source.jpg")
      let ops: image.PackingOption = { format: "image/jpeg", quality: 100 };
      let imageInfo = await imageSource.getImageInfo();
      if (imageInfo == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let checkSize = (width: int, height: int) => {
        expect(width == imageInfo!.size.width).assertTrue();
        expect(height == imageInfo!.size.height).assertTrue();
      }
      await packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0100",
        imageSource, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0200
     * @tc.desc   sub_multimedia_image_packToFile_callback_imagesource_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let imageSource = getImageSourceData("test.png")
      if (imageSource == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_image_source.webp")
      let ops: image.PackingOption = { format: "image/webp", quality: 98 };
      let imageInfo = await imageSource.getImageInfo();
      if (imageInfo == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let checkSize = (width: int, height: int) => {
        expect(width == imageInfo!.size.width).assertTrue();
        expect(height == imageInfo!.size.height).assertTrue();
      }
      await packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0200",
        imageSource, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0300
     * @tc.desc   sub_multimedia_image_packToFile_callback_imagesource_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let imageSource = getImageSourceData("test.png")
      if (imageSource == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_image_source.png")
      let ops: image.PackingOption = { format: "image/png", quality: 100 };
      let imageInfo = await imageSource.getImageInfo();
      if (imageInfo == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let checkSize = (width: int, height: int) => {
        expect(width == imageInfo!.size.width).assertTrue();
        expect(height == imageInfo!.size.height).assertTrue();
      }
      await packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_IMAGE_SOURCE_STATIC_0300",
        imageSource, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0100
     * @tc.desc   sub_multimedia_image_packToFile_promise_pixelmap_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("promise_pixel_map.jpg")
      let ops: image.PackingOption = { format: "image/jpeg", quality: 100 };

      let checkSize = (width: int, height: int) => {
        expect(width == pixelWidth).assertTrue();
        expect(height == pixelHeight).assertTrue();
      }
      await packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0100",
        pixelmap, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0200
     * @tc.desc   sub_multimedia_image_packToFile_promise_pixelmap_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("promise_pixel_map.webp")
      let ops: image.PackingOption = { format: "image/webp", quality: 98 };

      let checkSize = (width: int, height: int) => {
        expect(width == pixelWidth).assertTrue();
        expect(height == pixelHeight).assertTrue();
      }
      await packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0200",
        pixelmap, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0300
     * @tc.desc   sub_multimedia_image_packToFile_promise_pixelmap_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("promise_pixel_map.png")
      let ops: image.PackingOption = { format: "image/png", quality: 100 };

      let checkSize = (width: int, height: int) => {
        expect(width == pixelWidth).assertTrue();
        expect(height == pixelHeight).assertTrue();
      }
      await packToFilePromise(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_PIXEL_MAP_STATIC_0300",
        pixelmap, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0100
     * @tc.desc   sub_multimedia_image_packToFile_callback_pixelmap_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_pixel_map.jpg")
      let ops: image.PackingOption = { format: "image/jpeg", quality: 100 };

      let checkSize = (width: int, height: int) => {
        expect(width == pixelWidth).assertTrue();
        expect(height == pixelHeight).assertTrue();
      }
      await packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0100",
        pixelmap, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0200
     * @tc.desc   sub_multimedia_image_packToFile_callback_pixelmap_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_pixel_map.webp")
      let ops: image.PackingOption = { format: "image/webp", quality: 98 };

      let checkSize = (width: int, height: int) => {
        expect(width == pixelWidth).assertTrue();
        expect(height == pixelHeight).assertTrue();
      }
      await packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0200",
        pixelmap, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0300
     * @tc.desc   sub_multimedia_image_packToFile_callback_pixelmap_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_pixel_map.png")
      let ops: image.PackingOption = { format: "image/png", quality: 100 };

      let checkSize = (width: int, height: int) => {
        expect(width == pixelWidth).assertTrue();
        expect(height == pixelHeight).assertTrue();
      }
      await packToFileCallback(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_PIXEL_MAP_STATIC_0300",
        pixelmap, fileInfo[1] as int, fileInfo[0] as string, ops, checkSize)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0200
     * @tc.desc   sub_multimedia_image_packToFile_callback_pixelmap_err_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_pixel_map_errb.jpg");
      let ops: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0200",
        pixelmap, fileInfo[1] as int, ops, fileInfo[0] as string)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0300
     * @tc.desc   sub_multimedia_image_packToFile_callback_pixelmap_err_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("callback_pixel_map_errc.jpg");
      let ops: image.PackingOption = { format: "image/txt", quality: 100 };
      await packToFileCbErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_CALLBACK_ERR_STATIC_0300",
        pixelmap, fileInfo[1] as int, ops, fileInfo[0] as string)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0200
     * @tc.desc   sub_multimedia_image_packToFile_promise_pixelmap_err_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("promise_pixel_map_errb.jpg");
      let ops: image.PackingOption = { format: "image/jpeg", quality: 101 };
      await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0200",
        pixelmap, fileInfo[1] as int, ops, fileInfo[0] as string)

    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300
     * @tc.desc   sub_multimedia_image_packToFile_promise_pixelmap_err_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let pixelmap = getPixelMapData()
      if (pixelmap == undefined) {
        expect().assertFail();
        done();
        return undefined;
      }
      let fileInfo = getWriteFd("promise_pixel_map_errc.jpg");
      let ops: image.PackingOption = { format: "image/txt", quality: 100 };
      await packToFilePromiseErr(done, "SUB_MULTIMEDIA_IMAGE_PACK_TO_FILE_PROMISE_ERR_STATIC_0300",
        pixelmap, fileInfo[1] as int, ops, fileInfo[0] as string)
    });
  });
}
