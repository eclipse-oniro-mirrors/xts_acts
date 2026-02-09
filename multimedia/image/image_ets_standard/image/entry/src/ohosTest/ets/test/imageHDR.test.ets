/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll,beforeEach,afterEach, afterAll,it, expect, DEFAULT, Level } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let filePath: string;
let fdNumber: number;
let globalpixelmap: image.PixelMap
let globalimageSource: image.ImageSource;
let globalpacker: image.ImagePacker;

export default function imageHDR() {
  describe('imageHDR', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
          expect().assertFail();
        }
      }
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource.release();
        } catch (error) {
          console.info('globalimageSource release fail');
          expect().assertFail();
        }
        console.info('afterEach case');
      }
      if (globalpacker != undefined) {
        console.info('globalpacker release start');
        try {
          await globalpacker.release();
        } catch (error) {
          console.info('globalpacker release fail');
          expect().assertFail();
        }
        console.info('afterEach case');
      }
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      console.info("image filePath:" + filePath)
      await fs.open(filePath).then(file => {
        fdNumber = file.fd;
        console.info("image case open fd success:" + fdNumber);
      });
    };

    const checkMimeType = async(done: Function, TAG: string, picture: string, mimeType:string) => {
      try {
        await getFd(picture);
        let imageSourceApi = await image.createImageSource(fdNumber);
        if (imageSourceApi != undefined) {
          globalimageSource = imageSourceApi;
          let imageInfo = imageSourceApi.getImageInfoSync();
          console.info(TAG + ' imageInfo.mimeType is ' + imageInfo.mimeType);
          expect(imageInfo.mimeType == mimeType).assertTrue();
          done();
        } else {
          console.info(TAG + ' create imageSource fail');
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.info(TAG + ' check imageInfo.mimeType fail');
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap By DecodingOptions4、GetImageInfo to check whether supported Sdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100", Level.LEVEL2, async (done: Function) => {
      try {
        await getFd("CUVAHdr.jpg");
        const imageSourceApi = image.createImageSource(fdNumber);
        console.info("fdNumber:" + fdNumber)
        if (imageSourceApi == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100 create image source failed:');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          let decodingOption: image.DecodingOptions = {
            desiredDynamicRange: image.DecodingDynamicRange.SDR
          };
          imageSourceApi.createPixelMap(decodingOption).then(pixelmap => {
            globalpixelmap = pixelmap;
            let tempPixelmap = pixelmap
            tempPixelmap.toSdr();
            console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100 success');
            expect(pixelmap != undefined).assertTrue();
            pixelmap.getImageInfo().then(async(info) =>{
              expect(info.isHdr).assertFalse();
              expect(info.pixelFormat == image.PixelMapFormat.RGBA_8888).assertTrue();
            });
            done();
          }).catch((error:BusinessError) => {
              console.log('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100 error:' + error);
              expect().assertFail();
              done();
          });
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100 error:' + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap By DecodingOptions4、GetImageInfo to check whether supported Sdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200", Level.LEVEL2, async (done: Function) => {
      try {
        await getFd("CUVAHdr.jpg");
        const imageSourceApi = image.createImageSource(fdNumber);
        console.info("fdNumber:" + fdNumber)
        if (imageSourceApi == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200 create image source failed:');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          let decodingOption: image.DecodingOptions = {
            desiredDynamicRange: image.DecodingDynamicRange.HDR
          };
          imageSourceApi.createPixelMap(decodingOption).then(pixelmap => {
            globalpixelmap = pixelmap;
            let tempPixelmap = pixelmap
            tempPixelmap.toSdr();
            console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200 success');
            expect(pixelmap != undefined).assertTrue();
            pixelmap.getImageInfo().then(async(info) =>{
              // expect(info.isHdr).assertTrue();
              // expect(info.pixelFormat== image.PixelMapFormat.RGBA_1010102).assertTrue();
            });
            done();
          }).catch((error:BusinessError) => {
            console.log('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200 error:' + error);
            expect().assertFail();
            done();
          });
        }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200 error:' + error);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.pack image,4.createImageSource by pack,5.GetImageInfo to check whether supported Sdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0300", Level.LEVEL2, async (done: Function) => {
      try {
        await getFd("JPEGVividSingle.jpg");
        const imageSourceApi = image.createImageSource(fdNumber);
        console.info("fdNumber:" + fdNumber)
        if (imageSourceApi == undefined) {
          console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0300 create image source failed:');
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0300 create image source success:');
          imageSourceApi.getImageInfo((err: BusinessError, imageinfo: image.ImageInfo) => {
            if (err) {
              console.error('Failed to obtain the image information.code is ${err.code},message is ${err.message}');
            } else {
              console.info('succeeded in obtain the image information.');
            }
            })
            const imagePackerApi = image.createImagePacker();
            if (imagePackerApi == undefined) {
               expect(false).assertTrue();
               console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0300 create imagepacker fail');
               done();
            } else {
              globalpacker = imagePackerApi;
              const dynamicRange = image.PackingDynamicRange.SDR
              let packOpts: image.PackingOption = {
                desiredDynamicRange: dynamicRange,
                format: "image/jpeg",
                quality: 100
              };
              const imageData = await imagePackerApi.packing(imageSourceApi, packOpts)
              let imageSource = image.createImageSource(imageData);
              imageSource.getImageInfo(fdNumber).then(async (info: image.ImageInfo) => {
                expect(info.isHdr).assertFalse();
                expect(info.pixelFormat == image.PixelMapFormat.RGBA_8888).assertTrue();
                console.info('Succeeded in obtaining the image information.');
                }).catch((error:BusinessError) =>{
                console.error('Failed to obtain the image information.code is ${error.code},message is ${error.message}');
              })
              await imageSource?.release();
              done();
            }
          }
      } catch (error) {
        console.info('SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0300 error:' + error);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0100
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0100", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0100';
      await checkMimeType(done, tag, 'mimeType_test.jpg', 'image/jpeg');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0200
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0200", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0200';
      await checkMimeType(done, tag, 'mimeType_test.ico', 'image/x-icon');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0300
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0300
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0300", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0300';
      await checkMimeType(done, tag, 'mimeType_test.dng', 'image/x-adobe-dng');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0400
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0400
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0400", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0400';
      await checkMimeType(done, tag, 'mimeType_test.cr2', 'image/x-canon-cr2');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0500
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0500
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0500", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0500';
      await checkMimeType(done, tag, 'mimeType_test.raf', 'image/x-fuji-raf');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0600
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0600
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0600", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0600';
      await checkMimeType(done, tag, 'mimeType_test.nrw', 'image/x-nikon-nrw');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0700
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0700
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0700", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0700';
      await checkMimeType(done, tag, 'mimeType_test.rw2', 'image/x-panasonic-rw2');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0800
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0800
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0800", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0800';
      await checkMimeType(done, tag, 'mimeType_test.pef', 'image/x-pentax-pef');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_0900
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_0900
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_0900", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_0900';
      await checkMimeType(done, tag, 'mimeType_test.arw', 'image/x-sony-arw');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_1000
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_1000
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_1000", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_1000';
      await checkMimeType(done, tag, 'mimeType_test.nef', 'image/x-nikon-nef');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_1100
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_1100
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_1100", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_1100';
      await checkMimeType(done, tag, 'mimeType_test.orf', 'image/x-olympus-orf');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_1200
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_1200
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_1200", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_1200';
      await checkMimeType(done, tag, 'mimeType_test.srw', 'image/x-samsung-srw');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_1300
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_1300
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_1300", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_1300';
      await checkMimeType(done, tag, 'mimeType_test.cur', 'image/x-icon');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_MIMETYPE_1400
     * @tc.number SUB_MULTIMEDIA_IMAGE_MIMETYPE_1400
     * @tc.desc   1.getimagepath,2.createImageSourceFromFd,3.getImageInfo from ImageSource,4.check the mimetype of different pictures
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_MIMETYPE_1400", Level.LEVEL0, async (done: Function) => {
      let tag = 'SUB_MULTIMEDIA_IMAGE_MIMETYPE_1400';
      await checkMimeType(done, tag, 'mimeType_test.jfif', 'image/jpeg');
    })

  })
}