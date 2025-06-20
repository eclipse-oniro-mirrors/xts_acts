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
import hilog from '@ohos.hilog';
import { describe, beforeAll,beforeEach,afterEach, afterAll,it, expect, DEFAULT } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let imageSourceApi: image.ImageSource;
let pixelMap: image.PixelMap;
let filesDir: string | undefined
let cacheDir: string | undefined

export default function imageHDR() {
  describe('imageHDR', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    let filePath: string;
    let fdNumber: number;
    let globalpixelmap: image.PixelMap
    let globalimageSource: image.ImageSource;

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      console.info("image filePath:" + filePath)
      await fs.open(filePath).then(file => {
        fdNumber = file.fd;
        console.info("image case open fd success:" + fdNumber);
      });
    };

    it("CASE01", 0, async (done: Function) => {
      try {
        await getFd("CUVAHdr.jpg");
        const imageSourceApi = image.createImageSource(fdNumber);
        console.info("fdNumber:" + fdNumber)
        if (imageSourceApi == undefined) {
          console.info('case01 create image source failed:');
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
            console.info('case01 success');
            expect(pixelmap != undefined).assertTrue();
            pixelmap.getImageInfo().then(async(info) =>{
              expect(info.isHdr).assertFalse();
              expect(info.pixelFormat == image.PixelMapFormat.RGBA_8888).assertTrue();
            });
            done();
          }).catch((error:BusinessError) => {
              console.log('case01 error:' + error);
              expect().assertFail();
              done();
          });
        }
      } catch (error) {
        console.info('case01 error:' + error);
        expect(false).assertTrue();
        done();
      }
    });

    it("CASE02", 0, async (done: Function) => {
      try {
        await getFd("CUVAHdr.jpg");
        const imageSourceApi = image.createImageSource(fdNumber);
        console.info("fdNumber:" + fdNumber)
        if (imageSourceApi == undefined) {
          console.info('case02 create image source failed:');
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
            console.info('case02 success');
            expect(pixelmap != undefined).assertTrue();
            pixelmap.getImageInfo().then(async(info) =>{
              // expect(info.isHdr).assertTrue();
              // expect(info.pixelFormat== image.PixelMapFormat.RGBA_1010102).assertTrue();
            });
            done();
          }).catch((error:BusinessError) => {
            console.log('case02 error:' + error);
            expect().assertFail();
            done();
          });
        }
      } catch (error) {
        console.info('case02 error:' + error);
        expect(false).assertTrue();
        done();
      }
    });

    it("CASE03", 0, async (done: Function) => {
      try {
        await getFd("JPEGVividSingle.jpg");
        const imageSourceApi = image.createImageSource(fdNumber);
        console.info("fdNumber:" + fdNumber)
        if (imageSourceApi == undefined) {
          console.info('case03 create image source failed:');
          expect(false).assertTrue();
          done();
        } else {
          console.info('case03 create image source success:');
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
               console.info('case03 create imagepacker fail');
               done();
            } else {
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
              done();
            }
          }
      } catch (error) {
        console.info('case03 error:' + error);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
