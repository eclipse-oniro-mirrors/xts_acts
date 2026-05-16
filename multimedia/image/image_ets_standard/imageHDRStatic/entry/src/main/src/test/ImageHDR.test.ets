/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll,beforeEach,afterEach, afterAll,it, expect, DEFAULT, Level, Hypium } from '../../../hypium/index';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import { initialize } from './AbilityContextHelper.test';
import { BusinessError } from '@ohos.base';

export default function imageHDR() {
  describe('imageHDR', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let filesDir: string | undefined | null;
    let isSupportHdr: Boolean;

    let filePath: string;
    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalimageSource: image.ImageSource | undefined = undefined;

    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      try {
        isSupportHdr = await fs.access('/system/lib64/ndk/libvideo_processing_capi_impl.so');
      } catch (err: BusinessError) {
        console.error("access failed with error message: " + err.message + ", error code: " + err.code);
        isSupportHdr = false;
      }
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The int of execution times is the same as the int of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The int of execution times is the same as the int of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      console.info('afterEach case');
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath);
      return file.fd as int;
    };

    /**
     * @tc.name   CASE_STATIC_01
     * @tc.number CASE_STATIC_01
     * @tc.desc   PixelMap toSdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("CASE_STATIC_01", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportHdr) {
        console.info("device is not support hdr")
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        try {
          let fd: int = getFd('CUVAHdr.jpg');
          let imageSourceApi = image.createImageSource(fd);
          console.info("CASE_STATIC_01 fd:" + fd)
          if (imageSourceApi == undefined) {
            console.info('CASE_STATIC_01 create image source failed:');
            expect(false).assertTrue();
            done();
          } else {
            globalimageSource = imageSourceApi;
            let decodingOption: image.DecodingOptions = {
              desiredDynamicRange: image.DecodingDynamicRange.SDR
            };
            let pixelmap = await imageSourceApi.createPixelMap(decodingOption);
            if (pixelmap == undefined) {
              console.info('CASE_STATIC_01 createPixelMap failed, pixelMap is undefined');
              expect(false).assertTrue();
              return undefined;
            }
            globalpixelmap = pixelmap;
            let tempPixelmap = pixelmap
            try {
              await tempPixelmap.toSdr();
              expect(false).assertTrue();
              done();
            } catch (error) {
              console.info('CASE_STATIC_01 success: toSdr failed as expected, because of SDR image can not call toSdr! ' + error);
              done();
            }
          }
        } catch (error) {
          console.info('CASE_STATIC_01 error:' + error);
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   CASE_STATIC_02
     * @tc.number CASE_STATIC_02
     * @tc.desc   PixelMap toSdr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("CASE_STATIC_02", Level.LEVEL0, async (done: () => void): Promise<void> => {
      if (!isSupportHdr) {
        console.info("device is not support hdr")
        expect(!isSupportHdr).assertTrue();
        done();
      } else {
        try {
          let fd: int = getFd('CUVAHdr.jpg');
          let imageSourceApi = image.createImageSource(fd);
          console.info("fd:" + fd)
          if (imageSourceApi == undefined) {
            console.info('CASE_STATIC_02 create image source failed:');
            expect(false).assertTrue();
            done();
          } else {
            globalimageSource = imageSourceApi;
            let decodingOption: image.DecodingOptions = {
              desiredDynamicRange: image.DecodingDynamicRange.HDR
            };
            try {
              let pixelmap = await imageSourceApi.createPixelMap(decodingOption);
              if (pixelmap == undefined) {
                console.info('CASE_STATIC_02 createPixelMap failed, pixelMap is undefined');
                expect(false).assertTrue();
                return undefined;
              }
              globalpixelmap = pixelmap;
              let tempPixelmap = pixelmap
              await tempPixelmap.toSdr();
              console.info('CASE_STATIC_02 success');
              expect(pixelmap != undefined).assertTrue();
              try {
                let info = await pixelmap.getImageInfo();
                expect(info.isHdr).assertFalse();
                expect(info.pixelFormat == image.PixelMapFormat.RGBA_1010102).assertFalse();
              } catch (error) {
                console.info('CASE_STATIC_02 getImageInfo error:' + error);
                expect(false).assertTrue();
                done();
              }
              done();
            } catch (error) {
              console.log('CASE_STATIC_02 error:' + error);
              expect().assertFail();
              done();
            }
          }
        } catch (error) {
          console.info('CASE_STATIC_02 error:' + error);
          expect(false).assertTrue();
          done();
        }
      }

    });
  })
}
