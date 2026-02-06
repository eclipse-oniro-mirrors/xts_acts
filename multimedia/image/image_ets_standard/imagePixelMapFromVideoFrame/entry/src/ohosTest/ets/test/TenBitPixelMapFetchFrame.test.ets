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

import hilog from '@ohos.hilog';
import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import rpc from '@ohos.rpc';
import resourceManager from '@ohos.resourceManager';
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
import hdrCapability from '@ohos.graphics.hdrCapability';
import display from '@ohos.display';
import media from '@ohos.multimedia.media';

let mImageGenerator: media.AVImageGenerator | undefined;

let isSupportHdr: boolean;

export default function image10bitPixelMapFetchFrame() {
  let globalPixelMap: image.PixelMap | undefined;
  const RGBA_1010102: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
  const YCBCR_P010: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
  const YCRCB_P010: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
  let testContext: common.UIAbilityContext;

  describe('image10bitPixelMapFetchFrame', () => {
    beforeAll(async () => {
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

    const fetchFrameByTimeFromVideo = async(fileName: string, timeUs: number,
      options: media.AVImageQueryOptions, param: media.PixelMapParams): Promise<PixelMap> => {
      console.info('begin.');
      mImageGenerator = await media.createAVImageGenerator();
      if(mImageGenerator == undefined){
        console.info('failed createAVImageGenerator');
        expect().assertFail();
      }
      const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
      mImageGenerator.fdSrc = await resourceMgr.getRawFd(fileName)
      let pixelMap = await mImageGenerator.fetchFrameByTime(timeUs, options, param);
      if(pixelMap == undefined){
        console.info('failed fetch pixelmap');
        expect().assertFail();
      }
      await mImageGenerator.release();
      return pixelMap
    }


    const writerAndReadPixelsToAreaThrowFetchFrame = async (done: Function, logger: Logger, type: string, fileName: string, desiredFormat: image.PixelMapFormat) => {
      let timeUs: number = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 1920,
        height: 1440
      }
      let pixelmap = await fetchFrameByTimeFromVideo(fileName, timeUs, queryOption, param);
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

    const getImageInfoTestThrowFetchFrame = async (done: Function, testNum: string, type: string, fileName: string, format: image.PixelMapFormat) => {
      let logger = new Logger(testNum);
      try {
        let timeUs: number = 0;
        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
        let param: media.PixelMapParams = {
          width: 1920,
          height: 1440
        }
        let pixelMap = await fetchFrameByTimeFromVideo(fileName, timeUs, queryOption, param);
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

    const opacityTestThrowFetchFrame = async (done: Function, testNum: string, type: string, fileName: string) => {
      let result = true
      let logger = new Logger(testNum)
      try {
        let timeUs: number = 0;
        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
        let param: media.PixelMapParams = {
          width: 1920,
          height: 1440
        }
        let pixelMap = await fetchFrameByTimeFromVideo(fileName, timeUs, queryOption, param);
        logger.log("pixelMap " + (pixelMap != undefined));
        if (pixelMap != undefined) {
          globalPixelMap = pixelMap;
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          expect(imageInfo.pixelFormat == RGBA_1010102).assertTrue();
          if (type == 'callback') {
            pixelMap.opacity(0.8, (err) => {
              result = (err == undefined)
              if (result) {
                logger.log('set alpha success');
              } else {
                
                logger.log('set alpha failed');
              }
              expect(result).assertTrue();
              done();
            })
          } else if (type == 'promise') {
            try {
              await pixelMap.opacity(0.8);
              logger.log('set alpha success.');
              expect(result).assertTrue();
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
              expect(result).assertTrue();
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

    const testReleaseThrowFetchFrame = async (done: Function, testNum: string, fileName: string, interfaceType: string) => {
      let result = true
      let logger = new Logger(testNum);
      try {
        let timeUs: number = 0;
        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
        let param: media.PixelMapParams = {
          width: 1920,
          height: 1440
        }
        let pixelMap = await fetchFrameByTimeFromVideo(fileName, timeUs, queryOption, param);
        logger.log("PixelMap " + pixelMap);
        if (pixelMap != undefined) {
          if (interfaceType == "promise") {
            await pixelMap.release();
            logger.log('PixelMap release success')
            expect(result).assertTrue();
            done();
          } else {
            pixelMap.release(() => {
              logger.log('PixelMap release success')
              expect(result).assertTrue();
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

    const testToSdrThrowFetchFrame = async (done: Function, testNum: string, fileName: string) => {
      let logger = new Logger(testNum);
      try {
        let timeUs: number = 0;
        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
        let param: media.PixelMapParams = {
          width: 1920,
          height: 1440
        }
        let pixelMap = await fetchFrameByTimeFromVideo(fileName, timeUs, queryOption, param);
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

    const applyColorSpaceTestThrowFetchFrame = async (done: Function, testNum: string, type: string, fileName: string) => {
      let logger = new Logger(testNum);
      try {
        let timeUs: number = 0;
        let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
        let param: media.PixelMapParams = {
          width: 1920,
          height: 1440
        }
        let pixelMap = await fetchFrameByTimeFromVideo(fileName, timeUs, queryOption, param);
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

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0100
     * @tc.desc   1.writerAndReadPixelsToAreaThrowFetchFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0100', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0100');
      if (!isSupportHdr) {
        logger.log('device is not support hdr');
        done();
      } else {
        try{
          await writerAndReadPixelsToAreaThrowFetchFrame(done, logger, 'promise', "test.mp4", RGBA_1010102);
        } catch(err) {
          logger.log(' Failed in writerAndReadPixelsToAreaThrowFetchFrame. ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0200
     * @tc.desc   1.getImageInfoTestThrowFetchFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0200', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0200');
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0200', 'device is not support hdr');
        done();
      } else {
        try{
          await getImageInfoTestThrowFetchFrame(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0200', 'promise', "test.mp4", YCBCR_P010);
        } catch(err) {
          logger.log(' Failed in getImageInfoTestThrowFetchFrame. ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0300
     * @tc.desc   1.opacityTestThrowFetchFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0300', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0300');
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0300', 'device is not support hdr');
        done();
      } else {
        try{
          await opacityTestThrowFetchFrame(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0300', 'promise', "test.mp4");
        } catch(err) {
          logger.log(' Failed in opacityTestThrowFetchFrame. ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0400
     * @tc.desc   1.testReleaseThrowFetchFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0400', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0400');
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0400', 'device is not support hdr');
        done();
      } else {
        try{
          await testReleaseThrowFetchFrame(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0400', "test.mp4", 'promise');
        } catch(err) {
          logger.log(' Failed in testReleaseThrowFetchFrame. ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0500
     * @tc.desc   1.testToSdrThrowFetchFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0500', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0500');
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0500', 'device is not support hdr');
        done();
      } else {
        try{
          await testToSdrThrowFetchFrame(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0500', "test.mp4");
        } catch(err) {
          logger.log(' Failed in testToSdrThrowFetchFrame. ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0600
     * @tc.desc   1.applyColorSpaceTestThrowFetchFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0600', Level.LEVEL0, async (done: Function) => {
      let logger = new Logger('SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0600');
      if (!isSupportHdr) {
        hilog.info(0x0000, "image10bitPixelMap", 'case: %{public}s msg:%{public}s', 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0600', 'device is not support hdr');
        done();
      } else {
        try{
          await applyColorSpaceTestThrowFetchFrame(done, 'SUB_MULTIMEDIA_IMAGE_PIXELMAPADAPTION_10bit_USE_FETCHFRAME_0600', 'promise', "test.mp4");
        } catch(err) {
          logger.log(' Failed in applyColorSpaceTestThrowFetchFrame. ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    });

  })
}