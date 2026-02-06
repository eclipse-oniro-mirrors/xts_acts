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

import { describe, beforeAll, afterEach, it, expect, Level } from '@ohos/hypium'
import ndkTest, { IImageInfo } from 'libImageNdk.so'
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

export default function imageNdkDecodeTest() {
  describe('ImageNdkDecodeTest', () => {
    let testContext: common.UIAbilityContext;
    afterEach(async () => {
      console.info('afterEach case');
    })

    beforeAll(async () => {
      filesDir = AppStorage.get('pathDir')
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    })

    let filePath: string;
    let fileFd: number;
    let buffer: ArrayBuffer;
    let filesDir: string | undefined

    const getFd = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      fileFd = file.fd;
    }

    const getBuffer = async (fileName: string) => {
      filePath = filesDir + '/' + fileName;
      console.log('filePath:', filePath)
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      buffer = bufferRead
    }

    const Ndk_CropAndScaleStrategyDecode = async (done: Function, filename: string, TAG: string, desiredWidth: number, desiredHeight: number, regionX: number, regionY: number, regionWidth: number, regionHeight: number, cropAndScaleStrategy: number, imageWidth:number, imageHeight:number) => {
      try {
        await getFd(filename);
        let result = await ndkTest.testCropAndScaleStrategy(fileFd, desiredWidth, desiredHeight, regionX, regionY, regionWidth, regionHeight, cropAndScaleStrategy, imageWidth, imageHeight);
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` result is `+ result);
        expect(result == 0).assertTrue();
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test success`);
        done();
      } catch (error) {
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test fail`);
        expect(false).assertTrue();
        done();
      }
    }
    
    const Ndk_CropAndScaleStrategyDecodeWithCropRegion = async (done: Function, filename: string, TAG: string, regionX: number, regionY: number, regionWidth: number, regionHeight: number, cropAndScaleStrategy: number, imageWidth:number, imageHeight:number) => {
      try {
        await getFd(filename);
        let result = await ndkTest.testCropAndScaleStrategyWithCropRegion(fileFd, regionX, regionY, regionWidth, regionHeight, cropAndScaleStrategy, imageWidth, imageHeight);
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` result is `+ result);
        expect(result == 0).assertTrue();
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test success`);
        done();
      } catch (error) {
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test fail`);
        expect(false).assertTrue();
        done();
      }
    }

    const Ndk_CropAndScaleStrategyDecodeErr = async (done: Function, filename: string, TAG: string, desiredWidth: number, desiredHeight: number, regionX: number, regionY: number, regionWidth: number, regionHeight: number, cropAndScaleStrategy: number) => {
      try {
        await getFd(filename);
        let result = await ndkTest.testCropAndScaleStrategyErr(fileFd, desiredWidth, desiredHeight, regionX, regionY, regionWidth, regionHeight, cropAndScaleStrategy);
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` result is `+ result);
        expect(result == 0).assertTrue();
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test success`);
        done();
      } catch (error) {
        hilog.info(0x0000, 'ImageNdkCropAndScaleStrategyTest', '%{public}s', TAG + ` test fail`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0010
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0010", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0010';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_1440x1920.bmp', tag, 800, 800, 0, 0, 500, 1000, 0, 800, 800);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0020
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0020", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0020';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_1440x1920.bmp', tag, 800, 800, 0, 0, 500, 1000, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0030
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0030", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0030';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_1440x1920.bmp', tag, 800, 800, 0, 0, 500, 1000, 2, 800, 800);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0040
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0040", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0040';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_1440x1920.bmp', tag, 960, 1440, 1500, 2000, 300, 300, 0);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0050
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0050", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0050';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_1440x1920.bmp', tag, 960, 1440, 1500, 2000, 300, 300, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0060
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0060", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0060';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_1440x1920.bmp', tag, 960, 1440, 1500, 2000, 300, 300, 2);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0070
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0070", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0070';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_1440x1920.bmp', tag, 960, 1440, 1000, 1000, 500, 1000, 0, 960, 1440);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0080
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0080", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0080';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_1440x1920.bmp', tag, 960, 1440, 1000, 1000, 500, 1000, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0090
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0090", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0090';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_1440x1920.bmp', tag, 960, 1440, 1000, 1000, 500, 1000, 2);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0100
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0100", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0100';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 2000, 300, 500, 2000, 3000, 0, 1000, 2000);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0110
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0110", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0110';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 2000, 300, 500, 2000, 3000, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0120
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0120", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0120';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 2000, 300, 500, 2000, 3000, 2, 1000, 2000);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0130
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0130", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0130';
      await Ndk_CropAndScaleStrategyDecodeWithCropRegion(done, 'pixel_bmp_3072x4096.bmp', tag, 300, 500, 1000, 1500, 0, 1000, 1500);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0140
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0140", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0140';
      await Ndk_CropAndScaleStrategyDecodeWithCropRegion(done, 'pixel_bmp_3072x4096.bmp', tag, 300, 500, 1000, 1500, 0, 1000, 1500);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0150
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0150", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0150';
      await Ndk_CropAndScaleStrategyDecodeWithCropRegion(done, 'pixel_bmp_3072x4096.bmp', tag, 300, 500, 1000, 1500, 0, 1000, 1500);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0160
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0160", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0160';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 1000, 300, 500, 1000, 1500, 0, 1000, 1000);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0170
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0170", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0170';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 1000, 300, 500, 1000, 1500, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0180
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0180", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0180';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 1000, 300, 500, 1000, 1500, 2, 1000, 1000);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0190
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0190", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0190';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 2000, 300, 500, 4000, 5000, 0, 1000, 2000);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0200
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0200", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0200';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 2000, 300, 500, 4000, 5000, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0210
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0210", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0210';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_3072x4096.bmp', tag, 1000, 2000, 300, 500, 4000, 5000, 2);
    })
    
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0220
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0220", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0220';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 4000, 5000, 300, 500, 1000, 1500, 0, 4000, 5000);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0230
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0230", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0230';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 4000, 5000, 300, 500, 1000, 1500, 1, 1000, 1500);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0240
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0240", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0240';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_3072x4096.bmp', tag, 4000, 5000, 300, 500, 1000, 1500, 2, 4000, 5000);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0250
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0250", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0250';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_6144x8192.bmp', tag, 3072, 4096, 800, 1000, 4096, 6144, 0, 3072, 4096);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0260
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0260", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0260';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_6144x8192.bmp', tag, 3072, 4096, 800, 1000, 4096, 6144, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0270
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0270", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0270';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_6144x8192.bmp', tag, 3072, 4096, 800, 1000, 4096, 6144, 2, 3072, 4096);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0280
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0280", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0280';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_480x360.bmp', tag, 240, 180, 0, 0, 240, 180, 0, 240, 180);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0290
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0290", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0290';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_480x360.bmp', tag, 240, 180, 0, 0, 240, 180, 1, 240, 180);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0300
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0300", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0300';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_480x360.bmp', tag, 240, 180, 0, 0, 240, 180, 2, 240, 180);
    })
    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0310
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0310", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0310';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_481x361.bmp', tag, 360, 240, 50, 50, 360, 240, 0, 360, 240);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0320
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0320", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0320';
      await Ndk_CropAndScaleStrategyDecodeErr(done, 'pixel_bmp_481x361.bmp', tag, 360, 240, 50, 50, 360, 240, 1);
    })

    /**
     * @tc.number   : SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0330
     * @tc.name     : decode image
     * @tc.desc     : 1.getimagepath,2.createImageSourceFromFd,3.CreateDecodingOptions,4.DecodingOptionsSetDesiredSize, 5.DecodingOptionsSetDesiredRegion,6.CreatePixelMap
     * @tc.size     : MediumTest
     * @tc.type     : Functional
     * @tc.level    : Level 2
     */
    it("SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0330", Level.LEVEL2, async (done: Function) => {
      const tag = 'SUB_MULTIMEDIA_IMAGE_NDK_CROP_AND_SCALE_Strategy_0330';
      await Ndk_CropAndScaleStrategyDecode(done, 'pixel_bmp_481x361.bmp', tag, 360, 240, 50, 50, 360, 240, 2, 360, 240);
    })
    
  })
}