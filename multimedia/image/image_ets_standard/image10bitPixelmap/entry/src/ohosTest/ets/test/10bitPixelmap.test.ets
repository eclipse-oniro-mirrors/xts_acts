/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import rpc from '@ohos.rpc';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import fs from '@ohos.file.fs';
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import resourceManager from '@ohos.resourceManager';
import common from '@ohos.app.ability.common';

let isSupportHdr: boolean;

interface WriteFile {
  fd: number,
  uri: string
}

interface HdrPicture {
  uri: string,
  fd: number,
  fileSize: number,
  fileData: ArrayBuffer
}


export default function image10bitPixelMap() {
  describe('image10bitPixelMap', () => {
    let globalPacker: image.ImagePacker | undefined;
    let globalPixelMap: image.PixelMap | undefined;
    const RGBA_1010102: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
    const YCBCR_P010: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
    const YCRCB_P010: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
    let filesDir: string | undefined;
    let cacheDir: string | undefined;
    let openHdrPic: HdrPicture;
    let isSupportHEICEncode: boolean;

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir');
      cacheDir = AppStorage.get('cacheDir');
      isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so').then((res: boolean) => {
        if (res) {
          console.info("file exists");
          return true;
        } else {
          console.info("file not exists");
          return false;
        }
      }).catch((err: BusinessError) => {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        return false;
      })
      isSupportHEICEncode =
        image.createImagePacker().supportedFormats.includes("image/heic");
    })
    afterEach(() => {
      if (globalPixelMap != undefined) {
        hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'afterEach case');
        try {
          globalPixelMap.release();
          globalPixelMap = undefined;
        } catch (error) {
          hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'pixelMap release fail');
        }
      }
      if (globalPacker != undefined) {
        hilog.info(0x0000, '10bitPixelMap', '%{public}s', 'globalPacker release start');
        try {
          globalPacker.release();
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

    class Logger {
      testNum: string;

      constructor(testNum: string) {
        this.testNum = testNum;
      }

      log(msg: string) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', this.testNum, msg);
      }
    }


    let sleep = async (delay: number): Promise<void> => {
      return new Promise((resolve, _) => {
        setTimeout(async () => {
          resolve();
        }, delay);
      });
    };

    class MySequence implements rpc.Parcelable {
      private pixelMap: image.PixelMap | undefined;
      pixel_map: image.PixelMap | undefined;
      constructor(pixelMap: image.PixelMap | undefined) {
        this.pixel_map = pixelMap;
        let color = new ArrayBuffer(calculateBufferSize(4, 6, image.PixelMapFormat.RGBA_8888));
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
  
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        }
        this.pixelMap = image.createPixelMapSync(color, opts);
      }
      marshalling(messageSequence: rpc.MessageSequence) {
        if (this.pixel_map != undefined) {
          this.pixel_map.marshalling(messageSequence);
          return true;
        } else {
          return false;
        }
      }

      unmarshalling(messageSequence: rpc.MessageSequence) {
        this.pixelMap?.unmarshalling(messageSequence).then((pixelMap: image.PixelMap) => {
          this.pixel_map = pixelMap;
        });
        return true;
      }
    }

    const calculateBufferSize = (height: number, width: number, format: image.PixelMapFormat) => {
      switch (format) {
        case RGBA_1010102:
          return height * width * 4;
        case YCBCR_P010:
        case YCRCB_P010:
          return (height * width + ((height + 1) / 2 * (width + 1) / 2) * 2) * 2;
        default:
          return 0;
      }
    }

    const testCreatePixelMap = async (fileName: string, expectFormat: image.PixelMapFormat): Promise<PixelMap> => {
      if (isSupportHdr) {
        return testImageSourceCreatePixelMap(fileName, expectFormat);
      } else {
        return createPixelMapByPixelFormat(expectFormat);
      }
    }

    const createPixelMapByPixelFormat = async (srcPixelFormat: image.PixelMapFormat): Promise<PixelMap> => {
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

    const getBuffer = async (fileName: string) => {
      let filePath = filesDir + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      openHdrPic = { uri: filePath, fd: file.fd, fileSize: fileSize, fileData: bufferRead }
      return bufferRead
    }

    const testImageSourceCreatePixelMap = async (file: string | number | ArrayBuffer, desiredFormat: image.PixelMapFormat) => {
      let imageSource: image.ImageSource;
      if (typeof file == 'string') {
        let buffer = await getBuffer(file);
        imageSource = image.createImageSource(buffer);
      } else if (typeof file == 'number') {
        imageSource = image.createImageSource(file);
      } else {
        imageSource = image.createImageSource(file);
      }
      let decodingOpt: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: desiredFormat,
        desiredDynamicRange: image.DecodingDynamicRange.HDR
      }
      let pixelMap = await imageSource.createPixelMap(decodingOpt);
      if (pixelMap.getImageInfoSync().pixelFormat != desiredFormat) {
        try {
          await pixelMap.convertPixelFormat(desiredFormat);
        } catch (error) {
          hilog.info(0x0000, "image10bitPixelMap", 'convertPixelFormat failed, msg:%{public}s', JSON.stringify(error));
        }
      }
      return pixelMap;
    }

    const writerAndReadPixelsToBuffer = async (done: Function, logger: Logger, type: string, fileName: string, desiredFormat: image.PixelMapFormat) => {
      let pixelmap = await testCreatePixelMap(fileName, desiredFormat);
      if (pixelmap == undefined) {
        logger.log('createPixelMap failed');
        expect(false).assertTrue()
        done();
      } else {
        globalPixelMap = pixelmap;
        let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
        expect(imageInfo.pixelFormat == desiredFormat).assertTrue();
        let region: image.Region = { x: 0, y: 0, size: { height: 4, width: 6 } };
        await pixelmap.crop(region)
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
          pixelmap.writeBufferToPixels(writeColor).then(() => {
            pixelmap.readPixelsToBuffer(readBuffer).then(() => {
              checkBuffer(bufferArr, readBuffer, logger, done);
            })
          })
        } else if (type == 'callback') {
          pixelmap.writeBufferToPixels(writeColor, () => {
            pixelmap.readPixelsToBuffer(readBuffer, () => {
              checkBuffer(bufferArr, readBuffer, logger, done);
            })
          })
        } else {
          try {
            pixelmap.writeBufferToPixelsSync(writeColor);
            logger.log("writeBufferToPixelsSync called.")

            pixelmap.readPixelsToBufferSync(readBuffer);
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

    const checkBuffer = (bufferArr: Uint16Array, readBuffer: ArrayBuffer, logger: Logger, done: Function) => {
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
        done();
      }
    }

    const testReadPixels = async (pixelMap:image.PixelMap): Promise<ArrayBuffer> => {
      const readArea : image.PositionArea = {
        pixels: new ArrayBuffer(96),
        offset: 0,
        stride: 24,
        region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
      };
      await pixelMap.readPixels(readArea)
      return readArea.pixels
    }

    const writerAndReadPixelsToArea = async (done: Function, logger: Logger, type: string, fileName: string, desiredFormat: image.PixelMapFormat) => {
      let pixelmap = await testCreatePixelMap(fileName, desiredFormat);
      if (pixelmap == undefined) {
        logger.log('createPixelMap failed');
        expect(false).assertTrue()
        done();
      } else {
        globalPixelMap = pixelmap;
        let imageInfo: image.ImageInfo = pixelmap.getImageInfoSync();
        expect(imageInfo.pixelFormat == desiredFormat).assertTrue();
        let initialTestReadBuffer = await testReadPixels(pixelmap);
        const writeArea: image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        }
        let bufferArr = new Uint8Array(writeArea.pixels);
        for (let i = 0; i < bufferArr.length; i++) {
          bufferArr[i] = i + 1;
        }
        const readArea: image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        }
        if (type == 'promise') {
          pixelmap.writePixels(writeArea).then(() => {
            pixelmap.readPixels(readArea).then(() => {
              checkArea(initialTestReadBuffer, readArea, logger, done);
            })
          }).catch((err: BusinessError) => {
            logger.log("case test in promise failed. " + err)
            expect().assertFail();
            done();
          })
        } else if (type == 'callback') {
          pixelmap.writePixels(writeArea, () => {
            pixelmap.readPixels(readArea, () => {
              checkArea(initialTestReadBuffer, readArea, logger, done);
            })
          })
        } else {
          try{
            pixelmap.writePixelsSync(writeArea);
            logger.log("writePixelsSync called.")

            pixelmap.readPixelsSync(readArea);
            logger.log("writePixelsSync called.")
            checkArea(initialTestReadBuffer, readArea, logger, done);
          } catch(err) {
            logger.log(' Failed in calling writePixelsSync or readPixelsSync. ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        }
      }
    }

    const checkArea = (initialTestReadBuffer: ArrayBuffer, readArea: image.PositionArea, logger: Logger, done: Function) => {
      let initBuffer = new Uint8Array(initialTestReadBuffer)
      let readArr = new Uint8Array(readArea.pixels);
      logger.log(`readArr: ` + readArr)
      let res = false;
      for (let i = 0; i < readArr.length; i++) {
        if (readArr[i] != initBuffer[i]) {
          res = true;
        }
      }
      expect(res).assertTrue()
      done();
    }

    const getImageInfoTest = async (done: Function, testNum: string, type: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, format);
        logger.log("pixelMap " + (pixelMap != undefined));
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let pixelMapInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(pixelMapInfo.pixelFormat == format).assertTrue();
          if (type == 'promise') {
            pixelMap.getImageInfo()
              .then((imageInfo) => {
                logger.log("getimageInfo success");
                checkImageInfo(imageInfo, done, format);
              })
              .catch((err: BusinessError) => {
                logger.log("getimageInfo err " + JSON.stringify(err));
                expect(false).assertTrue();
                done();
              });
          } else if (type == 'callback') {
            pixelMap.getImageInfo((error, imageInfo) => {
              if (error) {
                logger.log("getimageInfo err " + JSON.stringify(error));
                expect(false).assertTrue();
                done();
              } else {
                if (imageInfo != undefined) {
                  logger.log("success");
                  checkImageInfo(imageInfo, done, format);
                } else {
                  logger.log("imageInfo is empty");
                  expect(false).assertTrue();
                  done();
                }
              }
            });
          } else {
            let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
            console.log(' Succeed in calling pixelMap.getImageInfoSync')
            checkImageInfo(imageInfo, done, format);
          }
        } else {
          logger.log('create pixelMap fail ');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('Failed in calling pixelMap.getImageInfo, error: ' + error);
        expect(false).assertTrue();
        done();
      }
    }

    const checkImageInfo = (imageInfo: image.ImageInfo, done: Function, format: image.PixelMapFormat) => {
      hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', JSON.stringify(imageInfo));
      expect(imageInfo.pixelFormat == format).assertTrue();
      if (isSupportHdr) {
        expect(imageInfo.isHdr == true).assertTrue();
      } else {
        expect(imageInfo.isHdr == false).assertTrue();
      }
      done();
    }

    const opacityTest = async (done: Function, testNum: string, type: string, fileName: string) => {
      let logger = new Logger(testNum)
      try {
        let pixelMap = await testCreatePixelMap(fileName, RGBA_1010102);
        logger.log("pixelMap " + (pixelMap != undefined));
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imageInfo.pixelFormat == RGBA_1010102).assertTrue();
          if (type == 'callback') {
            pixelMap.opacity(0.8, (err) => {
              if (err != undefined) {
                expect(false).assertTrue();
                logger.log('set alpha failed');
              } else {
                logger.log('set alpha success');
              }
              done();
            })
          } else if (type == 'promise') {
            try {
              await pixelMap.opacity(0.8);
              logger.log('set alpha success.');
              done();
            } catch (error) {
              logger.log('set alpha failed. error: ' + error);
              expect(false).assertTrue();
              done();
            }
          } else {
            try {
              pixelMap.opacitySync(0.8)
              logger.log('set alpha success.');
              done();
            } catch (error) {
              logger.log('set alpha failed. error: ' + error);
              expect(false).assertTrue();
              done();
            }
          }
        } else {
          logger.log('creat pixelMap failed');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('failed ' + error);
        expect(false).assertTrue();
        done();
      }
    }

    const checkAlphaPixelmap = async (done: Function, logger: Logger, alphaPixelMap: image.PixelMap) => {
      logger.log("AlphaPixelMap " + alphaPixelMap);
      if (alphaPixelMap != undefined) {
        let imageInfo = await alphaPixelMap.getImageInfo();
        logger.log("AlphaPixelMap pixelformat " + imageInfo.pixelFormat);
        await alphaPixelMap.release();
        expect(imageInfo.pixelFormat == 6).assertTrue();
        done();
      } else {
        logger.log('creat alphaPixelMap failed');
        expect(false).assertTrue();
        done();
      }
    }

    const createAlphaPixelmapTest = async (done: Function, testNum: string, type: string, fileName: string) => {
      let logger = new Logger(testNum)
      try {
        let pixelMap = await testCreatePixelMap(fileName, RGBA_1010102);
        logger.log("PixelMap " + pixelMap);
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imageInfo.pixelFormat == RGBA_1010102).assertTrue();
          if (type == 'callback') {
            pixelMap.createAlphaPixelmap(async (err, alphaPixelMap) => {
              await checkAlphaPixelmap(done, logger, alphaPixelMap)
            })
          } else if (type == 'promise') {
            let alphaPixelMap = await pixelMap.createAlphaPixelmap();
            await checkAlphaPixelmap(done, logger, alphaPixelMap)
          } else {
            let alphaPixelMap: image.PixelMap = pixelMap.createAlphaPixelmapSync();
            await checkAlphaPixelmap(done, logger, alphaPixelMap)
          }
        } else {
          logger.log('creat pixelMap failed');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('failed ' + error);
        expect(false).assertTrue();
        done();
      }
    }

    const applyColorSpaceTest = async (done: Function, testNum: string, type: string, fileName: string) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, RGBA_1010102);
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imageInfo.pixelFormat == RGBA_1010102).assertTrue();
          let csmModify = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
          logger.log("csmModify " + csmModify.getColorSpaceName());
          if (type == 'promise') {
            pixelMap.applyColorSpace(csmModify).then(() => {
              let csmn = pixelMap.getColorSpace().getColorSpaceName();
              logger.log("getColorSpaceName " + csmn);
              expect(csmn == colorSpaceManager.ColorSpace.ADOBE_RGB_1998).assertTrue();
              let pixelSize = pixelMap.getPixelBytesNumber();
              logger.log(`new pixel size ${pixelSize}`);
              done();
            }).catch((error: BusinessError) => {
              logger.log("apply colorSpace failed " + error);
              expect().assertFail();
              done();
            })
          } else {
            pixelMap.applyColorSpace(csmModify, async (err) => {
              if (err) {
                expect(false).assertTrue();
                logger.log("applyColorSpace err " + err);
                done();
                return;
              }
              let csmn = pixelMap.getColorSpace().getColorSpaceName();
              logger.log("getColorSpaceName " + csmn);
              expect(csmn == colorSpaceManager.ColorSpace.ADOBE_RGB_1998).assertTrue();
              let pixelSize = pixelMap.getPixelBytesNumber();
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

    const checkPixelMapInterface = async (done: Function, logger: Logger, pixelMap: image.PixelMap,
                                          orgInfo: image.ImageInfo, sizeCheck: Function) => {
      let newInfo = await pixelMap.getImageInfo()
      sizeCheck(done, logger, orgInfo, newInfo)
      done();
    }

    const pixelMapModifySizeTest = async (done: Function, testNum: string, type: string, pixelMapInterface: string,
                                          fileName: string, format: image.PixelMapFormat, sizeCheck: Function,
                                          ...params: Object[]) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, format)

        logger.log("pixelMap " + (pixelMap != undefined));
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let orgInfo = await pixelMap.getImageInfo()
          logger.log(`orgInfo.pixelFormat : ` + orgInfo.pixelFormat);
          logger.log(`format : ` + format);
          expect(orgInfo.pixelFormat == format).assertTrue();
          if (type == 'callback') {
            pixelMap[pixelMapInterface](...params, async () => {
              await checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck)
            })
          } else if (type == 'promise') {
            await pixelMap[pixelMapInterface](...params);
            await checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck)
          } else {
            pixelMap[pixelMapInterface](...params);
            await checkPixelMapInterface(done, logger, pixelMap, orgInfo, sizeCheck)
          }
        } else {
          logger.log('create pixelMap failed');
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
        writeFile.fd = fd;
        writeFile.uri = filePath;
      } catch (error) {
        console.info("image getWriteFd " + error);
      }
      return writeFile;
    }

    const checkPackResult = async (orgInfo: image.ImageInfo, file: number | ArrayBuffer, format: image.PixelMapFormat, mimeType: string, logger: Logger) => {
      let newPixelMap = await testImageSourceCreatePixelMap(file, format);
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

    const testPack10bitPixelMapToFile = async (done: Function, logger: Logger, writeFile: WriteFile, packOpt: image.PackingOption, type: string,
                                               fileName: string, format: image.PixelMapFormat) => {
      let pixelMap = await testCreatePixelMap(fileName, format);
      let orgInfo = pixelMap.getImageInfoSync();
      expect(orgInfo.pixelFormat == format).assertTrue();
      globalPixelMap = pixelMap;
      try {
        globalPacker = image.createImagePacker();
        expect(globalPacker != undefined).assertTrue();
        if (globalPacker == undefined) {
          done();
          return;
        }
        if (type == "promise") {
          globalPacker.packToFile(pixelMap, writeFile.fd, packOpt).then(async () => {
            let ret = await checkPackResult(orgInfo, writeFile.fd, format, packOpt.format, logger);
            fs.closeSync(writeFile.fd);
            expect(ret).assertTrue();
            done();
          }).catch((error: BusinessError) => {
            fs.closeSync(writeFile.fd);
            if (!isSupportHdr) {
              logger.log(`device not support hdr`);
              done();
              return;
            } else {
              logger.log(`packToFile promise error: ` + error.message);
              expect(false).assertTrue();
              done();
            }
          });
        } else {
          globalPacker.packToFile(pixelMap, writeFile.fd, packOpt, async (err: BusinessError) => {
            if (!isSupportHdr) {
              logger.log(`device not support hdr`);
              done();
              return;
            } else {
              if (err != undefined) {
                logger.log(`packToFile callback error: ` + err.message);
                expect(false).assertTrue();
                done();
                return;
              }
              let ret = await checkPackResult(orgInfo, writeFile.fd, format, packOpt.format, logger);
              fs.closeSync(writeFile.fd);
              expect(ret).assertTrue();
              done();
            }
          })
        }
      } catch (error) {
        logger.log("test packToFile error: " + error.message);
        expect().assertFail();
        done();
      }
    }

    const testPack10bitPixelMapToData = async (done: Function, logger: Logger, packOpt: image.PackingOption, type: string,
                                               fileName: string, format: image.PixelMapFormat) => {
      let pixelMap = await testCreatePixelMap(fileName, format);
      let orgInfo = pixelMap.getImageInfoSync();
      expect(orgInfo.pixelFormat == format).assertTrue();
      globalPixelMap = pixelMap;
      try {
        globalPacker = image.createImagePacker();
        expect(globalPacker != undefined).assertTrue();
        if (globalPacker == undefined) {
          done();
          return;
        }
        if (type == "promise") {
          globalPacker.packing(pixelMap, packOpt).then(async (data: ArrayBuffer) => {
            let ret = await checkPackResult(orgInfo, data, format, packOpt.format, logger);
            expect(ret).assertTrue();
            done();
          }).catch((error: BusinessError) => {
            if (!isSupportHdr) {
              logger.log(`device not support hdr`);
              done();
              return;
            }
            else {
              logger.log("pack 10bit pixelmap failed. " + error);
              expect(false).assertTrue();
              done();
            }
          });
        } else {
          globalPacker.packing(pixelMap, packOpt, async (err: BusinessError, data: ArrayBuffer) => {
            if (!isSupportHdr) {
              logger.log(`device not support hdr`);
              done();
              return;
            } else {
              if (err != undefined) {
                logger.log(`packing callback error: ` + err.message);
                expect(false).assertTrue();
                done();
                return;
              }
              let ret = await checkPackResult(orgInfo, data, format, packOpt.format, logger);
              expect(ret).assertTrue();
              done();
            }

          })
        }
      } catch (error) {
        logger.log("test packing error: " + error);
        expect().assertFail();
        done();
      }
    }

    const testGetBytesNumberPerRow = async (done: Function, testNum: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, format);
        logger.log("pixelMap " + (pixelMap != undefined));
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          let expectNum = 0;
          if (format == RGBA_1010102) {
            expectNum = 4 * imageInfo.size.width;
          } else {
            expectNum = 3 * imageInfo.size.width;
          }
          const num = pixelMap.getBytesNumberPerRow();
          logger.log(`num is ${num}, expectNum is ${expectNum}`);
          logger.log(`width is ${imageInfo.size.width}, height is ${imageInfo.size.height}`);
          expect(num == expectNum).assertTrue();
          expect(imageInfo.pixelFormat == format).assertTrue();
          done();
        } else {
          logger.log('create pixelMap fail ');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('Failed in calling pixelMap.getBytesNumberPerRow, error: ' + error);
        expect(false).assertTrue();
        done();
      }
    }

    const calculatePixelBytesNumber = (height: number, width: number, format: image.PixelMapFormat) => {
      switch (format) {
        case RGBA_1010102:
          return width * height * 4;
        case YCBCR_P010:
        case YCRCB_P010:
          return height * width * 3;
        default:
          return 0;
      }
    }

    const testGetPixelBytesNumber = async (done: Function, testNum: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, format);
        logger.log("pixelMap " + (pixelMap != undefined));
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          let expectNum = calculatePixelBytesNumber(imageInfo.size.height, imageInfo.size.width, format);
          const num = pixelMap.getPixelBytesNumber();
          logger.log(`num is ${num}, expectNum is ${expectNum}`);
          logger.log(`width is ${imageInfo.size.width}, height is ${imageInfo.size.height}`);
          expect(num == expectNum).assertTrue();
          expect(imageInfo.pixelFormat == format).assertTrue();
          done();
        } else {
          logger.log('create pixelMap fail ');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        logger.log('Failed in calling pixelMap.getBytesNumberPerRow, error: ' + error);
        expect(false).assertTrue();
        done();
      }
    }

    const testGetDensity = async (done: Function, testNum: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, format);
        logger.log("PixelMap " + (pixelMap != undefined));
        let imageInfo = await pixelMap.getImageInfo();
        expect(imageInfo.pixelFormat == format).assertTrue();
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let density = pixelMap.getDensity();
          logger.log("getDensity: " + density);
          expect(density == 0).assertTrue();
          done();
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

    const testSetAndGetColorSpace = async (done: Function, testNum: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      try {
        let csm = colorSpaceManager.create(colorSpaceManager.ColorSpace.ADOBE_RGB_1998);
        let pixelMap = await testCreatePixelMap(fileName, format);
        logger.log("PixelMap " + pixelMap);
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imageInfo.pixelFormat == format).assertTrue();
          pixelMap.setColorSpace(csm);
          let csmn = pixelMap.getColorSpace().getColorSpaceName();
          logger.log('csmn ' + csmn);
          expect(csmn == colorSpaceManager.ColorSpace.ADOBE_RGB_1998).assertTrue();
          done();
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

    const testMarshallingPixelmap = async (done: Function, testNum: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      let pixelMap: image.PixelMap = await testCreatePixelMap(fileName, format);
      globalPixelMap = pixelMap;
      let srcInfo: image.ImageInfo = pixelMap.getImageInfoSync();
      let parcelable = new MySequence(pixelMap);
      let data = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);
      let pixel_map = undefined;
      let ret = new MySequence(pixel_map);
      data.readParcelable(ret);
      await sleep(1000);
      if (ret.pixel_map == undefined) {
        logger.log('unmarshalling pixelmap failed');
        expect(false).assertTrue();
        done();
      } else {
        let dstInfo: image.ImageInfo = ret.pixel_map.getImageInfoSync();
        expect(ret.pixel_map.isEditable == pixelMap.isEditable).assertTrue();
        expect(dstInfo.pixelFormat == srcInfo.pixelFormat).assertTrue();
        expect(dstInfo.size.width == srcInfo.size.width).assertTrue();
        expect(dstInfo.size.height == srcInfo.size.height).assertTrue();
        logger.log('success');
        done();
      }
    }

    const testRelease = async (done: Function, testNum: string, fileName: string, format: image.PixelMapFormat, interfaceType: string) => {
      let logger = new Logger(testNum);
      try {
        let pixelMap = await testCreatePixelMap(fileName, format);
        logger.log("PixelMap " + pixelMap);
        if (pixelMap != undefined) {
          if (interfaceType == "promise") {
            await pixelMap.release();
            logger.log('PixelMap release success')
            done();
          } else {
            pixelMap.release(() => {
              logger.log('PixelMap release success')
              done();
            });
          }
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

    const testToSdr = async (done: Function, testNum: string, fileName: string, format: image.PixelMapFormat) => {
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
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0100
     * @tc.name      : test writeBufferToPixels and readPixelsToBuffer promise
     * @tc.desc      : 1.create PixelMap
     *                 2.call writeBufferToPixels
     *                 3.call return undefined
     *                 4.call readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0100');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'promise', "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0200
     * @tc.name      : test writeBufferToPixels and readPixelsToBuffer callback
     * @tc.desc      : 1.create PixelMap
     *                 2.call writeBufferToPixels
     *                 3.call return undefined
     *                 4.call readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0200');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'callback', "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0300
     * @tc.name      : test writeBufferToPixels and readPixelsToBuffer sync
     * @tc.desc      : 1.create PixelMap
     *                 2.call writeBufferToPixels
     *                 3.call return undefined
     *                 4.call readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0300');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToBuffer(done, logger, 'sync', "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0400
     * @tc.name      : test writePixels and readPixels promise
     * @tc.desc      : 1.create PixelMap
     *                 2.call writePixels
     *                 3.call return undefined
     *                 4.call readPixels
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0400');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToArea(done, logger, 'promise',"CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0500
     * @tc.name      : test writePixels and readPixels callback
     * @tc.desc      : 1.create PixelMap
     *                 2.call writePixels
     *                 3.call return undefined
     *                 4.call readPixels
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0500');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToArea(done, logger, 'callback',"HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0600
     * @tc.name      : test writePixels and readPixels sync
     * @tc.desc      : 1.create PixelMap
     *                 2.call writePixels
     *                 3.call return undefined
     *                 4.call readPixels
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0600');
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        await writerAndReadPixelsToArea(done, logger, 'sync',"HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700
     * @tc.name      : test pixelmap.getImageInfo
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getImageInfo-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700', 'device is not support hdr');
        done();
      } else {
        await getImageInfoTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0700', 'promise', "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800
     * @tc.name      : test pixelmap.getImageInfo callback
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getImageInfo-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800', 'device is not support hdr');
        done();
      } else {
        await getImageInfoTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0800', 'callback', "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900
     * @tc.name      : test pixelmap.getImageInfoSync
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getImageInfo-sync
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900', 'device is not support hdr');
        done();
      } else {
        await getImageInfoTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_0900', 'sync', "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000
     * @tc.name      : test pixelmap.getBytesNumberPerRow
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getBytesNumberPerRow
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000', 'device is not support hdr');
        done();
      } else {
        await testGetBytesNumberPerRow(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1000", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100
     * @tc.name      : test pixelmap.getBytesNumberPerRow
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getBytesNumberPerRow
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100', 'device is not support hdr');
        done();
      } else {
        await testGetBytesNumberPerRow(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1100", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200
     * @tc.name      : test pixelmap.getBytesNumberPerRow
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getBytesNumberPerRow
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200', 'device is not support hdr');
        done();
      } else {
        await testGetBytesNumberPerRow(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1200", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300
     * @tc.name      : test pixelmap.getBytesNumberPerRow
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getBytesNumberPerRow
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300', 'device is not support hdr');
        done();
      } else {
        await testGetPixelBytesNumber(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1300", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400
     * @tc.name      : test pixelmap.getBytesNumberPerRow
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getBytesNumberPerRow
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400', 'device is not support hdr');
        done();
      } else {
        await testGetPixelBytesNumber(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1400", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800
     * @tc.name      : test pixelmap.createAlphaPixelmap
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      const region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap:image.PixelMap = await image.createPixelMapFromSurface(surfaceId, region);
        console.info(`Successfully created the image source`); 
        done(); 
      }catch (error) {
        console.error(`failed to pack the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();}
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000
     * @tc.name      : test pixelmap.createAlphaPixelmap
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      try {
        let pixelMap: image.PixelMap = await image.createPixelMapFromSurface(surfaceId);
        console.error("Expected an ereeror but none was thrown");
        done();
      } catch (error) {
        console.error(`Failed to create the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(Number(error.code) == 62980103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_Image_Receiver_Off_ImageArrival_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_Image_Receiver_Off_ImageArrival_0900
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_Image_Receiver_Off_ImageArrival_0900', Level.LEVEL0 , async (done: Function) => {
      let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listening succeeded')
    }
    try {
      receiver.on('imageArrival', callbackFunc)
      receiver.off('imageArrival', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listening error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_Image_Creator_Off_ImageRelease_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_Image_Creator_Off_ImageRelease_1000
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_Image_Creator_Off_ImageRelease_1000', Level.LEVEL0 , async (done: Function) => {
      let creator: image.ImageCreator = image.createImageCreator(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listen succeeded')
    }
    try {
      creator.on('imageRelease', callbackFunc)
      creator.off('imageRelease', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listen error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })  

	/**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800
     * @tc.name      : test pixelmap.createAlphaPixelmap
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_8800', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      const region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let pixelMap: image.PixelMap = await image.createPixelMapFromSurface(surfaceId, region);
        console.info(`Successfully created the image source`); 
        done(); 
      }catch (error) {
        console.error(`failed to pack the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();}
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000
     * @tc.name      : test pixelmap.createAlphaPixelmap
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000', Level.LEVEL0, async (done: Function) => {
      const surfaceId = null; 
      try {
        let pixelMap: image.PixelMap = await image.createPixelMapFromSurface(surfaceId);
        console.error("Expected an ereeror but none was thrown");
        done();
      } catch (error) {
        console.error(`Failed to create the image: ${error.code},error is ${error}`);
        expect(Number(error) == 62980178).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0800', Level.LEVEL0, async (done: Function) => {
      const tag: string = "SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0200"
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 3,
        size: {height: 4, width: 6}
      };
      let pixelMap = image.createPixelMapSync(color, opts);
      try {
        let csm = await pixelMap.getColorSpace();
        console.info(tag + ' Succeeded in getting ColorSpace. csm is ' + csm);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(tag + ` Failed to get ColorSpace. error is ` + error + 'error code is ' + error.code);
        expect(Number(error.code) == 62980103).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0900
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_0900
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_9000', Level.LEVEL0 , async (done: Function) => {
      let receiver: image.ImageReceiver = image.createImageReceiver(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listening succeeded')
    }
    try {
      receiver.on('imageArrival', callbackFunc)
      receiver.off('imageArrival', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listening error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_SOURCE_GET_COLOR_SPACE_1000', Level.LEVEL0 , async (done: Function) => {
      let creator: image.ImageCreator = image.createImageCreator(8192, 8, image.ImageFormat.JPEG, 8);
      let callbackFunc = ()=>{
        console.info('Listen succeeded')
    }
    try {
      creator.on('imageRelease', callbackFunc)
      creator.off('imageRelease', callbackFunc)
      done()
    } catch (error) {
      console.info(`Listen error. ${error.code},error is ${error}`);
      expect(false).assertTrue();
      done()
      }
    })  

/**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5800", Level.LEVEL0, async (done: Function) => {
      let num =  image.AlphaType.UNPREMUL
      console.info(`AlphaType.UNPREMUL ${num}`)
      expect(num == 3).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900", Level.LEVEL0, async (done: Function) => {
      console.info(`----------------SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5900--------------`)
      let num =  image.AlphaType.PREMUL
      console.info(`AlphaType.PREMUL ${num}`)
      expect(num == 2).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000", Level.LEVEL0, async (done: Function) => {
      console.info(`----------------SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6000--------------`)
      let num =  image.AlphaType.UNKNOWN
      console.info(`AlphaType.UNKNOWN ${num}`)
      expect(num == 0).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6100  -------------`)
      let num =  image.ScaleMode.FIT_TARGET_SIZE
      console.info(`ScaleMode.FIT_TARGET_SIZE ${num}`)
      expect(num == 0).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6200  -------------`)
      let num =  image.ScaleMode.CENTER_CROP
      console.info(`ScaleMode.CENTER_CROP ${num}`)
      expect(num == 1).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6300  -------------`)
      let num =  image.ComponentType.YUV_Y
      console.info(`ComponentType.YUV_Y ${num}`)
      expect(num == 1).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6400  -------------`)
      let num =  image.ComponentType.YUV_U
      console.info(`ComponentType.YUV_U ${num}`)
      expect(num == 2).assertTrue()
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6500  -------------`)
      let num =  image.ComponentType.YUV_V
      console.info(`ComponentType.YUV_V ${num}`)
      expect(num == 3).assertTrue()
      done()
    });
  
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6600", Level.LEVEL0, async (done: Function) => {
      let low_quality = image.ResolutionQuality.LOW
      expect(low_quality).assertEqual(1);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is low quality.')
      let medium_quality = image.ResolutionQuality.MEDIUM
      expect(medium_quality).assertEqual(2);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is medium quality.')
      let high_quality = image.ResolutionQuality.HIGH
      expect(high_quality).assertEqual(3);
      console.info('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_xxxxx' + ' The quality of the picture is high quality.')
      done()
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900
     * @tc.name      : 
     * @tc.desc      : 
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900", Level.LEVEL0, async (done: Function) => {
      console.info(`-------------BEGIN   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_6900  -------------`)
      try {
        image.createPremultipliedPixelMap(null, null)
        done()
      }catch (error) {
        console.error(`failed to createPremultipliedPixelMap: ${error.code},error is ${error}`);
        expect(Number(error) == 401).assertTrue();
        done();}
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500
     * @tc.name      : test pixelmap.getBytesNumberPerRow
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getBytesNumberPerRow
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500', 'device is not support hdr');
        done();
      } else {
        await testGetPixelBytesNumber(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1500", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600
     * @tc.name      : test pixelmap.getDensity
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getDensity
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600', 'device is not support hdr');
        done();
      } else {
        await testGetDensity(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1600", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700
     * @tc.name      : test pixelmap.getDensity
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getDensity
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700', 'device is not support hdr');
        done();
      } else {
        await testGetDensity(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1700", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800
     * @tc.name      : test pixelmap.getDensity
     * @tc.desc      : 1. create pixelmap
     *               : 2. call getDensity
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800', 'device is not support hdr');
        done();
      } else {
        await testGetDensity(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1800", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900
     * @tc.name      : test pixelmap.opacity
     * @tc.desc      : 1. create pixelmap
     *               : 2. call opacity-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900', 'device is not support hdr');
        done();
      } else {
        await opacityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_1900', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000
     * @tc.name      : test pixelmap.opacity callback
     * @tc.desc      : 1. create pixelmap
     *               : 2. call opacity-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000', 'device is not support hdr');
        done();
      } else {
        await opacityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2000', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100
     * @tc.name      : test pixelmap.opacitySync
     * @tc.desc      : 1. create pixelmap
     *               : 2. call opacity-sync
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100', 'device is not support hdr');
        done();
      } else {
        await opacityTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2100', 'sync', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200
     * @tc.name      : test pixelmap.createAlphaPixelmap
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', 'device is not support hdr');
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2200', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300
     * @tc.name      : test pixelmap.createAlphaPixelmap callback
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', 'device is not support hdr');
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2300', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400
     * @tc.name      : test pixelmap.createAlphaPixelmapSync
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.create AlphaPixelmap
     *               : 4.call getImageInfo
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', 'device is not support hdr');
        done();
      } else {
        await createAlphaPixelmapTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2400', 'sync', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500
     * @tc.name      : test RGBA_1010102 pixelmap.setColorSpace and pixelmap.getColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.call getColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500', 'device is not support hdr');
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2500",  "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600
     * @tc.name      : test YCBCR_P010 pixelmap.setColorSpace and pixelmap.getColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.call getColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600', 'device is not support hdr');
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2600",  "CUVAHdrMulti.jpg", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700
     * @tc.name      : test YCRCB_P010 pixelmap.setColorSpace and pixelmap.getColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3.call getColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700', 'device is not support hdr');
        done();
      } else {
        await testSetAndGetColorSpace(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2700",  "CUVAHdrMulti.jpg", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800
     * @tc.name      : test pixelmap.applyColorSpace
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3. call applyColorSpace-promise
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', Level.LEVEL1, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', 'device is not support hdr');
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2800', 'promise', "CUVAHdrMulti.jpg");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900
     * @tc.name      : test pixelmap.applyColorSpace callback
     * @tc.desc      : 1.create imagesource
     *               : 2.create pixelmap
     *               : 3. call applyColorSpace-callback
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', Level.LEVEL1, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', 'device is not support hdr');
        done();
      } else {
        await applyColorSpaceTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_2900', 'callback', "HDRVividSingleLayer.heic");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000
     * @tc.name      : test RGBA_1010102 pixelmap.marshalling and pixelmap.unmarshalling
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.marshalling pixelmap into the messageSequence
     *                 5.unmarshalling pixelmap from the messageSequence
     *                 6.return pixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000', 'device is not support hdr');
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3000", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100
     * @tc.name      : test YCBCR_P010 pixelmap.marshalling and pixelmap.unmarshalling
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.marshalling pixelmap into the messageSequence
     *                 5.unmarshalling pixelmap from the messageSequence
     *                 6.return pixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */

    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100', 'device is not support hdr');
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3100", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200
     * @tc.name      : test YCRCB_P010 pixelmap.marshalling and pixelmap.unmarshalling
     * @tc.desc      : 1.create InitializationOptions object
     *                 2.set editable,pixelFormat,size
     *                 3.using color and opts create newPixelMap
     *                 4.marshalling pixelmap into the messageSequence
     *                 5.unmarshalling pixelmap from the messageSequence
     *                 6.return pixelmap not empty
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200', 'device is not support hdr');
        done();
      } else {
        await testMarshallingPixelmap(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3200", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300
     * @tc.name      : test pixelmap.scale
     * @tc.desc      : 1.create pixelmap
     *               : 2.call scale-promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3300',
          'promise', 'scale', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400
     * @tc.name      : test pixelmap.scale callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call scale-callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3400',
          'callback', 'scale', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500
     * @tc.name      : test pixelmap.scaleSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call scaleSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width * 2) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3500',
          'sync', 'scaleSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 2.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600
     * @tc.name      : test pixelmap.translate
     * @tc.desc      : 1.create pixelmap
     *               : 2.call translate -promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
          if (newInfo.size.width != orgInfo.size.width + 3) {
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3600',
          'promise', 'translate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700
     * @tc.name      : test pixelmap.translate callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call translate -callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width + 3) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3700',
          'callback', 'translate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800
     * @tc.name      : test pixelmap.translateSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call translateSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width + 3) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3800',
          'sync', 'translateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 3.0, 1.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900
     * @tc.name      : test pixelmap.rotate
     * @tc.desc      : 1.create pixelmap
     *               : 2.call rotate -promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_3900',
          'promise', 'rotate', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000
     * @tc.name      : test pixelmap.rotate callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call rotate -callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4000',
          'callback', 'rotate', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100
     * @tc.name      : test pixelmap.rotateSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call rotateSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.height) {
            logger.log(`org height ${orgInfo.size.height}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4100',
          'sync', 'rotateSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, 90.0)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200
     * @tc.name      : test pixelmap.flip
     * @tc.desc      : 1.create pixelmap
     *               : 2.call flip -promise
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4200',
          'promise', 'flip', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, false, true)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300
     * @tc.name      : test pixelmap.flip callback
     * @tc.desc      : 1.create pixelmap
     *               : 2.call flip -callback
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4300',
          'callback', 'flip', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, false, true)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400
     * @tc.name      : test pixelmap.flipSync
     * @tc.desc      : 1.create pixelmap
     *               : 2.call flipSync
     *               : 3.get pixelbytesnumber
     *               : 4.read pixels to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400', 'device is not support hdr');
        done();
      } else {
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != orgInfo.size.width) {
            logger.log(`org width ${orgInfo.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4400',
          'sync', 'flipSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, false, true)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500
     * @tc.name      : test pixelmap.crop
     * @tc.desc      : 1.create PixelMap
     *               : 2.call crop -promise
     *               : 3.getImageInfo
     *               : 4.getPixelBytesNumber
     *               : 5.readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500', 'device is not support hdr');
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4500',
          'promise', 'crop', "CUVAHdrMulti.jpg", RGBA_1010102, sizeCheck, region)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600
     * @tc.name      : test pixelmap.crop callback
     * @tc.desc      : 1.create PixelMap
     *               : 2.call crop -callback
     *               : 3.getImageInfo
     *               : 4.getPixelBytesNumber
     *               : 5.readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600', 'device is not support hdr');
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4600',
          'callback', 'crop', "HDRVividSingleLayer.heic", YCBCR_P010, sizeCheck, region)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700
     * @tc.name      : test pixelmap.cropSync
     * @tc.desc      : 1.create PixelMap
     *               : 2.call cropSync
     *               : 3.getImageInfo
     *               : 4.getPixelBytesNumber
     *               : 5.readPixelsToBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700', 'device is not support hdr');
        done();
      } else {
        let region: image.Region = { size: { height: 3, width: 3 }, x: 1, y: 1 };
        let sizeCheck = (done: Function, logger: Logger, orgInfo: image.ImageInfo, newInfo: image.ImageInfo) => {
          if (newInfo.size.width != region.size.width) {
            logger.log(`region width ${region.size.width}, new width ${newInfo.size.width} `);
            expect(false).assertTrue();
            done();
          }
        }
        await pixelMapModifySizeTest(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4700',
          'sync', 'cropSync', "HDRVividSingleLayer.heic", YCRCB_P010, sizeCheck, region)
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800
     * @tc.name      : test pixelmap.release
     * @tc.desc      : 1.create PixelMap
     *               : 2.call release
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800', 'device is not support hdr');
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4800", "CUVAHdrMulti.jpg", RGBA_1010102, "promise");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900
     * @tc.name      : test pixelmap.release
     * @tc.desc      : 1.create PixelMap
     *               : 2.call release
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900', 'device is not support hdr');
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_4900", "HDRVividSingleLayer.heic", YCBCR_P010, "callback");
      }

    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000
     * @tc.name      : test pixelmap.release
     * @tc.desc      : 1.create PixelMap
     *               : 2.call release
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000', 'device is not support hdr');
        done();
      } else {
        await testRelease(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5000", "HDRVividSingleLayer.heic", YCRCB_P010, "callback");
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100
     * @tc.name      : test pack pixelmap to file --promise
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to file
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5100");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_promise.jpg");
        let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "promise", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200
     * @tc.name      : test pack pixelmap to file --callback
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to file
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5200");
      if (!isSupportHdr || !isSupportHEICEncode) {
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
        } else {
          logger.log("device is not support heic encode");
        }
        done();
      } else {
        let writeFile = getWriteFile("test_pack_to_file_callback.heic");
        let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToFile(done, logger, writeFile, packOpt, "callback", "HDRVividSingleLayer.heic", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300
     * @tc.name      : test pack pixelmap to buffer --promise
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5300");
      if (!isSupportHdr) {
        logger.log("device is not support hdr");
        done();
      } else {
        let packOpt: image.PackingOption = { format: "image/jpeg", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToData(done, logger, packOpt, "promise", "HDRVividSingleLayer.heic", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400
     * @tc.name      : test pack pixelmap to buffer --promise
     * @tc.desc      : 1.create PixelMap
     *               : 2.pack pixelmap to buffer
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger("SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5400");
      if (!isSupportHdr || !isSupportHEICEncode) {
        if (!isSupportHdr) {
          logger.log("device is not support hdr");
        } else {
          logger.log("device is not support heic encode");
        }
        done();
      } else {
        let packOpt: image.PackingOption = { format: "image/heic", quality: 100, desiredDynamicRange: image.PackingDynamicRange.AUTO };
        testPack10bitPixelMapToData(done, logger, packOpt, "callback", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500
     * @tc.name      : test pixelmap.toSdr
     * @tc.desc      : 1.create PixelMap
     *               : 2.call toSdr
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500', 'device is not support hdr');
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5500", "CUVAHdrMulti.jpg", RGBA_1010102);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600
     * @tc.name      : test pixelmap.toSdr
     * @tc.desc      : 1.create PixelMap
     *               : 2.call toSdr
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600', 'device is not support hdr');
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5600", "HDRVividSingleLayer.heic", YCBCR_P010);
      }
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700
     * @tc.name      : test pixelmap.toSdr
     * @tc.desc      : 1.create PixelMap
     *               : 2.call toSdr
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', Level.LEVEL0, async (done: Function) => {
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700', 'device is not support hdr');
        done();
      } else {
        await testToSdr(done, "SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_5700", "HDRVividSingleLayer.heic", YCRCB_P010);
      }
    });
  })
}