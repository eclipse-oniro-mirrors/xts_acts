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

import image from '@ohos.multimedia.image';
import { describe, beforeAll, afterEach, it, expect, Hypium, Level } from '../../../hypium/index';
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import rpc from '@ohos.rpc';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import { initialize } from './AbilityContextHelper.test';

let isSupportHdr: boolean;

interface WriteFile {
  fd: int,
  uri: string
}

interface HdrPicture {
  uri: string,
  fd: int,
  fileSize: int,
  fileData: ArrayBuffer
}

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function image10bitPixelMap() {
  describe('image10bitPixelMap', () => {
    let globalPacker: image.ImagePacker | undefined = undefined;
    let globalPixelMap: image.PixelMap | undefined = undefined;
    const RGBA_1010102: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
    const YCBCR_P010: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
    const YCRCB_P010: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
    let filesDir: string | undefined;
    let cacheDir: string | undefined;
    let openHdrPic: HdrPicture;
    let isSupportHEICEncode: boolean;

    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined;
      cacheDir = Hypium.get('cacheDir') as string | undefined;
      try {
        isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so');
        if (isSupportHdr) {
          console.info("file exists");
        } else {
          console.info("file not exists");
        }
      } catch (err: BusinessError) {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
      }
      isSupportHEICEncode =
        image.createImagePacker().supportedFormats.includes("image/heic");
    })
    afterEach(async () => {
      if (globalPixelMap != undefined) {
        hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'afterEach case');
        try {
          await globalPixelMap!.release();
        } catch (error) {
          hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'pixelMap release fail');
        }
      }
      if (globalPacker != undefined) {
        hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'globalPacker release start');
        try {
          globalPacker!.release();
        } catch (error) {
          hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'globalPacker release fail');
        }
      }
      try {
        fs.closeSync(openHdrPic.fd)
      } catch (error) {
        hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'fileDescriptor close failed. ' + error);
      }
      hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'after each case');
    })

    let sleep = async (delay: int): Promise<int> => {
      return new Promise<int>((resolve, reject) => {
        setTimeout(() => {
          resolve(0)
        }, delay);
      });
    };

    const calculateBufferSize = (height: int, width: int, format: image.PixelMapFormat) => {
      let result: int = 0;
      switch (format) {
        case image.PixelMapFormat.RGBA_1010102:
          result = height * width * 4;
          return result;
        case image.PixelMapFormat.YCBCR_P010:
        case image.PixelMapFormat.YCRCB_P010:
          result = (height * width + ((height + 1) / 2 * (width + 1) / 2) * 2) * 2;
          return result;
        default:
          return result;
      }
    }

    const createPixelMapByPixelFormat = async (srcPixelFormat: image.PixelMapFormat): Promise<image.PixelMap> => {
      let color = new ArrayBuffer(calculateBufferSize(4, 6, srcPixelFormat));
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }

      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: srcPixelFormat,
        size: { height: 4, width: 6 }
      }
      return image.createPixelMapSync(color, opts);
    }

    const getBuffer = async (fileName: string): Promise<ArrayBuffer> => {
      let filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      openHdrPic = { uri: filePath, fd: file.fd as int, fileSize: fileSize as int, fileData: bufferRead }
      return bufferRead
    }

    const testImageSourceCreatePixelMap = async (file: string | int | ArrayBuffer, desiredFormat: image.PixelMapFormat): Promise<image.PixelMap | undefined> => {
      let imageSource: image.ImageSource | undefined;
      if (file instanceof string) {
        let buffer = await getBuffer(file as string);
        imageSource = image.createImageSource(buffer);
      } else if (file instanceof ArrayBuffer) {
        imageSource = image.createImageSource(file as ArrayBuffer);
      } else {
        imageSource = image.createImageSource(file as int);
      }

      if (imageSource == undefined) {
        hilog.info(0x0000, 'image10bitPixelMap', `imageSource is undefined, testImageSourceCreatePixelMap failed`);
        return undefined;
      }

      let decodingOpt: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: desiredFormat,
        desiredDynamicRange: image.DecodingDynamicRange.HDR
      }
      let pixelMap = await imageSource!.createPixelMap(decodingOpt);
      if (pixelMap == undefined) {
        hilog.info(0x0000, 'image10bitPixelMap', `pixelMap is undefined, testImageSourceCreatePixelMap failed`);
        return undefined;
      }
      if (pixelMap!.getImageInfoSync().pixelFormat != desiredFormat) {
        try {
          await pixelMap!.convertPixelFormat(desiredFormat);
        } catch (error) {
          hilog.info(0x0000, "image10bitPixelMap", 'convertPixelFormat failed, msg:%{public}s', JSON.stringify(error));
        }
      }
      return pixelMap;
    }

    const testCreatePixelMap = async (fileName: string, expectFormat: image.PixelMapFormat): Promise<image.PixelMap | undefined> => {
      if (isSupportHdr) {
        return testImageSourceCreatePixelMap(fileName, expectFormat);
      } else {
        return createPixelMapByPixelFormat(expectFormat);
      }
    }

    const checkBuffer = (bufferArr: Uint16Array, readBuffer: ArrayBuffer, logger: Logger, done: () => void) => {
      let readBufferArr = new Uint16Array(readBuffer);
      logger.log('bufferArr: ' + bufferArr);
      logger.log('readBufferArr: ' + readBufferArr);
      let res = true;
      for (let i = 0; i < bufferArr.length; i++) {
        if (readBufferArr[i] != bufferArr[i]) {
          res = false;
          logger.log('check failed');
          expect(false).assertTrue()
          done();
          break;
        }
      }
      if (res) {
        logger.log('no change after writeBuffer');
        expect(true).assertTrue();
        done();
      }
    }

    const writerAndReadPixelsToBuffer = async (done: () => void, logger: Logger, type: string, fileName: string, desiredFormat: image.PixelMapFormat) => {
      let pixelmap = await testCreatePixelMap(fileName, desiredFormat);
      if (pixelmap == undefined) {
        logger.log('createPixelMap failed');
        expect(false).assertTrue()
        done();
      } else {
        globalPixelMap = pixelmap!;
        let imageInfo: image.ImageInfo = pixelmap!.getImageInfoSync();
        expect(imageInfo.pixelFormat == desiredFormat).assertTrue();
        let region: image.Region = { x: 0, y: 0, size: { height: 4, width: 6 } };
        await pixelmap!.crop(region)
        let bufferSize = 96;
        if (desiredFormat == YCBCR_P010 || desiredFormat == YCRCB_P010) {
          bufferSize = 72;
        }
        const writeColor = new ArrayBuffer(bufferSize);
        let bufferArr = new Uint16Array(writeColor);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        const readBuffer = new ArrayBuffer(96);
        if (type == 'promise') {
          pixelmap!.writeBufferToPixels(writeColor).then(() => {
            pixelmap!.readPixelsToBuffer(readBuffer).then(() => {
              checkBuffer(bufferArr, readBuffer, logger, done);
            })
          })
        } else if (type == 'callback') {
          pixelmap!.writeBufferToPixels(writeColor, () => {
            pixelmap!.readPixelsToBuffer(readBuffer, () => {
              checkBuffer(bufferArr, readBuffer, logger, done);
            })
          })
        } else {
          try {
            pixelmap!.writeBufferToPixelsSync(writeColor);
            logger.log("writeBufferToPixelsSync called.")

            pixelmap!.readPixelsToBufferSync(readBuffer);
            logger.log("readPixelsToBufferSync called.")
            checkBuffer(bufferArr, readBuffer, logger, done);
          } catch (error) {
            logger.log("writeBufferToPixels and readPixelsToBuffer sync error." + error);
            expect().assertFail();
            done();
          }
        }
      }
    }

    const applyColorSpaceTest = async (done: () => void, testNum: string, type: string, fileName: string) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, RGBA_1010102);
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap!;
          let imageInfo: image.ImageInfo = pixelMap!.getImageInfoSync();
          expect(imageInfo.pixelFormat == RGBA_1010102).assertTrue();
          let csmModify = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
          logger.log("csmModify " + csmModify.getColorSpaceName());
          if (type == 'promise') {
            try {
              await pixelMap!.applyColorSpace(csmModify);
              let csmn = pixelMap!.getColorSpace().getColorSpaceName();
              logger.log("getColorSpaceName " + csmn);
              expect(csmn == colorSpaceManager.ColorSpace.ADOBE_RGB_1998).assertTrue();
              let pixelSize = pixelMap!.getPixelBytesNumber();
              logger.log(`new pixel size ${pixelSize}`);
              done();
            } catch(error) {
              logger.log("apply colorSpace failed " + error);
              expect().assertFail();
              done();
            }
          } else {
            pixelMap!.applyColorSpace(csmModify, (err) => {
              if (err && err.code) {
                expect(false).assertTrue();
                logger.log("applyColorSpace err " + err);
                done();
              }
              let csmn = pixelMap!.getColorSpace().getColorSpaceName();
              logger.log("getColorSpaceName " + csmn);
              expect(csmn == colorSpaceManager.ColorSpace.ADOBE_RGB_1998).assertTrue();
              let pixelSize = pixelMap!.getPixelBytesNumber();
              logger.log(`new pixel size ${pixelSize}`);
              done();
            })
          }
        } else {
          logger.log('creat pixelMap failed ');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('failed ' + error);
        expect(false).assertTrue();
        done();
      }
    }

    const getWriteFile = (fileName: string): WriteFile => {
      let writeFile: WriteFile = { fd: 0, uri: '' };
      try {
        let filePath = cacheDir + "/" + fileName;
        hilog.info(0x0000, 'getWriteFd', 'image getWriteFd filePath is : %{public}s', filePath);
        let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let fd = file.fd;
        hilog.info(0x0000, 'getWriteFd', 'getWriteFd fd is : %{public}d', fd);
        writeFile.fd = fd as int;
        writeFile.uri = filePath;
      } catch (error) {
        console.info("image getWriteFd " + error);
      }
      return writeFile;
    }

    const checkPackResult = async (orgInfo: image.ImageInfo, file: int | ArrayBuffer, format: image.PixelMapFormat, mimeType: string, logger: Logger): Promise<boolean> => {
      let newPixelMap = await testImageSourceCreatePixelMap(file, format);
      if (newPixelMap == undefined) {
        logger.log("testImageSourceCreatePixelMap failed, newPixelMap is undefined");
        return false;
      }
      let newInfo = newPixelMap.getImageInfoSync();
      logger.log(`org width: ${orgInfo.size.width}, new width: ${newInfo.size.width}`)
      logger.log(`org height: ${orgInfo.size.height}, new height: ${newInfo.size.height}`)
      logger.log(`org format: ${orgInfo.pixelFormat}, new width: ${newInfo.pixelFormat}`)
      logger.log(`org isHdr: ${orgInfo.isHdr}, new width: ${newInfo.isHdr}`)
      logger.log(`org mimeType: ${orgInfo.mimeType}, new mimeType: ${newInfo.mimeType}`)
      return orgInfo.size.width == newInfo.size.width && orgInfo.size.height == newInfo.size.height &&
        orgInfo.pixelFormat == newInfo.pixelFormat && orgInfo.isHdr == newInfo.isHdr &&
        mimeType == newInfo.mimeType
    }

    const testPack10bitPixelMapToFile = async (done: () => void, logger: Logger, writeFile: WriteFile, packOpt: image.PackingOption, type: string,
                                               fileName: string, format: image.PixelMapFormat) => {
      let pixelMap = await testCreatePixelMap(fileName, format);
      if (pixelMap == undefined) {
        logger.log("testCreatePixelMap failed, pixelMap is undefined");
        expect(false).assertTrue();
        done();
      } else {
        let orgInfo = pixelMap!.getImageInfoSync();
        expect(orgInfo.pixelFormat == format).assertTrue();
        globalPixelMap = pixelMap!;
       try {
        let imagePacker = image.createImagePacker();
        expect(imagePacker != undefined).assertTrue();
        if (imagePacker == undefined) {
          done();
        }
        globalPacker = imagePacker
        if (type == "promise") {
          try {
            await imagePacker.packToFile(pixelMap, writeFile.fd, packOpt);
            let ret = await checkPackResult(orgInfo, writeFile.fd, format, packOpt.format, logger);
            fs.closeSync(writeFile.fd);
            expect(ret).assertTrue();
            done();
          } catch (error: BusinessError) {
            fs.closeSync(writeFile.fd);
            if (!isSupportHdr) {
              logger.log(`device not support hdr`);
              expect(!isSupportHdr).assertTrue();
              done();
            } else {
              logger.log(`packToFile promise error: ` + error.message);
              expect(false).assertTrue();
              done();
            }
          }
        } else {
          imagePacker.packToFile(pixelMap!, writeFile.fd, packOpt, (err: BusinessError|null) => {
            if (!isSupportHdr) {
              logger.log(`device not support hdr`);
              expect(!isSupportHdr).assertTrue();
              done();
            } else {
              if (err && err.code) {
                logger.log(`packToFile callback error: ` + err.message);
                expect(false).assertTrue();
                done();
              }
              let ret = await checkPackResult(orgInfo, writeFile.fd, format, packOpt.format, logger);
              fs.closeSync(writeFile.fd);
              expect(ret).assertTrue();
              done();
            }
          })
        }
      } catch (error: BusinessError) {
        logger.log("test packToFile error: " + error.message);
        expect().assertFail();
        done();
        }
      }
    }

    const testToSdr = async (done: () => void, testNum: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, format);
        logger.log("PixelMap " + pixelMap);
        if (pixelMap != undefined) {
          await pixelMap.toSdr();
          expect(pixelMap.getImageInfoSync().isHdr == false).assertTrue();
          done();
        } else {
          logger.log('create pixelMap failed ');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('failed ' + error);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0100
     * @tc.desc   test writeBufferToPixels and readPixelsToBuffer promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0100');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'promise', "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0200
     * @tc.desc   test writeBufferToPixels and readPixelsToBuffer callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0200');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'callback', "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0300
     * @tc.desc   test writeBufferToPixels and readPixelsToBuffer sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_0300');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'sync', "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2800
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2800
     * @tc.desc   test pixelmap.applyColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2800', 'device is not support hdr');
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2800', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2900
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2900
     * @tc.desc   test pixelmap.applyColorSpace callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2900', 'device is not support hdr');
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_2900', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5100
     * @tc.desc   test pack pixelmap to file --promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_promise.jpg");
        let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "promise", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5200
     * @tc.desc   test pack pixelmap to file --callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5200");
      if (!isSupportHdr || !isSupportHEICEncode) {
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
          expect(!isSupportHdr).assertTrue();
        } else {
          logger.log("device is not support heif encode");
        }
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_callback.heic");
        let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "callback", "HDRVividSingleLayer.heic", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5500
     * @tc.desc   test pixelmap.toSdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5500', 'device is not support hdr');
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5500", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5600
     * @tc.desc   test pixelmap.toSdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5600', 'device is not support hdr');
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5600", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5700
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5700
     * @tc.desc   test pixelmap.toSdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5700', 'device is not support hdr');
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_STATIC_5700", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });
  })
}
