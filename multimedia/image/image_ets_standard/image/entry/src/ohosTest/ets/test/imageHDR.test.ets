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

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0100
     * @tc.name     : decode hdr image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap By DecodingOptions4、GetImageInfo to check whether supported Sdr
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200
     * @tc.name     : decode hdr image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreatePixelMap By DecodingOptions4、GetImageInfo to check whether supported Sdr
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
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
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_DECODE_HDR_0200
     * @tc.name     : decode hdr image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.pack image,4.createImageSource by pack,5.GetImageInfo to check whether supported Sdr
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
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
  })
}
