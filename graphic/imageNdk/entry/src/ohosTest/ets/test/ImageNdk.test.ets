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

import { describe, beforeAll, afterEach, it, expect } from '@ohos/hypium'
import ndkTest from 'libImageNdk.so'
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';

export default function imageNdkTest() {
  describe('ImageNdkTest', () => {
    let globalpixelmap: image.PixelMap;
    let outBuffer: ArrayBuffer = new ArrayBuffer(1200000)
    let testContext: common.UIAbilityContext;
    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
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

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmapWithStride_0100
     * @tc.name      : testCreatePixelMapWithStrideAbnormal
     * @tc.desc      : 1.testCreatePixelMapWithStrideAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : FunctioXn
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelMapWithStride_0100', 0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelMapWithStrideAbnormal()
      expect(result).assertEqual(0)
      done();
    })

    /*
     * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptionsSetRowStrideNormal_0200
     * @tc.name      : testInitializationOptionsSetRowStrideNormal
     * @tc.desc      : 1.testInitializationOptionsSetRowStrideNormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptionsSetRowStrideNormal_0200', 0, (done: Function) => {
      // Set a number 16, that is a multiple of 1 byte
      let result: number = ndkTest.testInitializationOptionsSetRowStrideNormal(16)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_Native_ScaleWithAntiAliasing_0400
    * @tc.name      : testNativeScaleWithAntiAliasingAbNormal
    * @tc.desc      : 1.testNativeScaleWithAntiAliasingAbNormal
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_Native_ScaleWithAntiAliasing_0400', 0, (done: Function) => {
      // The scaling ratio is 100%
      let result: number = ndkTest.testNativeScaleWithAntiAliasingAbnormal()
      let msg = "testNativeScaleWithAntiAliasingAbNormal result: "
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_ScaleWithAntiAliasing_0500
    * @tc.name      : testScaleWithAntiAliasingAbnormal
    * @tc.desc      : 1.testScaleWithAntiAliasingAbnormal
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_ScaleWithAntiAliasing_0500', 0, (done: Function) => {
      // The scaling ratio is 100%
      let result: number = ndkTest.testScaleWithAntiAliasingAbnormal(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetNativeBuffer_0600
    * @tc.name      : testNativeGetNativeBufferAbnormal
    * @tc.desc      : 1.testNativeGetNativeBufferAbnormal
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetNativeBuffer_0600', 0, (done: Function) => {
      let result: number = ndkTest.testNativeGetNativeBufferAbnormal()
      let msg = 'testNativeGetNativeBufferAbnormal result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMetaData_0700
    * @tc.name      : testNativeSetMetaDataNull
    * @tc.desc      : 1.testNativeSetMetaDataNull
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMetaData_0700', 0, (done: Function) => {
      let result: number = ndkTest.testNativeSetMetaDataNull()
      let msg = 'testNativeSetMetaDataNull result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetMetaData_0800
    * @tc.name      : testNativeGetMetaDataNull
    * @tc.desc      : 1.testNativeGetMetaDataNull
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetMetaData_0800', 0, (done: Function) => {
      let result: number = ndkTest.testNativeGetMetaDataNull()
      let msg = 'testNativeGetMetaDataNull result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

   /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_0900
    * @tc.name      : testNativeSetMemoryName
    * @tc.desc      : 1.testNativeSetMemoryName
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_0900', 0, (done: Function) => {
      let result: number = ndkTest.testNativeSetMemoryName()
      let msg = 'testNativeSetMemoryName result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

   /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_0900
    * @tc.name      : testNativeGetArgbPixels
    * @tc.desc      : 1.testNativeGetArgbPixels
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetArgbPixels_1000', 0, (done: Function) => {
      let result: number = ndkTest.testNativeGetArgbPixels()
      let msg = 'testNativeGetArgbPixels result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

   /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_0900
    * @tc.name      : testNativeGetColorSpaceNative
    * @tc.desc      : 1.testNativeGetColorSpaceNative
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetColorSpaceNative_1100', 0, (done: Function) => {
      let result: number = ndkTest.testNativeGetColorSpaceNative()
      let msg = 'testNativeGetColorSpaceNative result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

   /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_0900
    * @tc.name      : testNativeSetColorSpaceNative
    * @tc.desc      : 1.testNativeSetColorSpaceNative
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetColorSpaceNative_1200', 0, (done: Function) => {
      let result: number = ndkTest.testNativeSetColorSpaceNative()
      let msg = 'testNativeSetColorSpaceNative result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetGetSrcPixelFormat_1300
    * @tc.name      : testNativeSetGetSrcPixelFormat
    * @tc.desc      : 1.testNativeSetGetSrcPixelFormat
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetGetSrcPixelFormat_1300', 0, (done: Function) => {
      let result: number = ndkTest.testNativeSetGetSrcPixelFormat()
      let msg = 'testNativeSetGetSrcPixelFormat result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

   /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateEmptyPixelmap_1400
    * @tc.name      : testNativeCreateEmptyPixelmap
    * @tc.desc      : 1.testNativeCreateEmptyPixelmap
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateEmptyPixelmap_1400', 0, (done: Function) => {
      let result: number = ndkTest.testNativeCreateEmptyPixelmap()
      let msg = 'testNativeCreateEmptyPixelmap result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

   /*
    * @tc.number    : SUB_MULTIMEDIA_PIXELMAPCAPI_NativeConvertAlphaFormat_1500
    * @tc.name      : testNativeConvertAlphaFormat
    * @tc.desc      : 1.testNativeConvertAlphaFormat
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    it('SUB_MULTIMEDIA_PIXELMAPCAPI_NativeConvertAlphaFormat_1500', 0, (done: Function) => {
      let result: number = ndkTest.testNativeConvertAlphaFormat()
      let msg = 'testNativeConvertAlphaFormat result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

  })
}