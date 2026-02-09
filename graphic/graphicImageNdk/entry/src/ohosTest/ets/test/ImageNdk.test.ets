/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, TestType, Level, Size } from '@ohos/hypium'
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

    /**
     * @tc.name   testCreatePixelMapWithStrideAbnormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_CreatePixelmapWithStride_0100
     * @tc.desc   1.testCreatePixelMapWithStrideAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePixelMapWithStrideAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testCreatePixelMapWithStrideAbnormal()
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testInitializationOptionsSetRowStrideNormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_InitializationOptionsSetRowStrideNormal_0200
     * @tc.desc   1.testInitializationOptionsSetRowStrideNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInitializationOptionsSetRowStrideNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      // Set a number 16, that is a multiple of 1 byte
      let result: number = ndkTest.testInitializationOptionsSetRowStrideNormal(16)
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeScaleWithAntiAliasingAbNormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_Native_ScaleWithAntiAliasing_0400
     * @tc.desc   1.testNativeScaleWithAntiAliasingAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeScaleWithAntiAliasingAbNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      // The scaling ratio is 100%
      let result: number = ndkTest.testNativeScaleWithAntiAliasingAbnormal()
      let msg = "testNativeScaleWithAntiAliasingAbNormal result: "
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testScaleWithAntiAliasingAbnormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_ScaleWithAntiAliasing_0500
     * @tc.desc   1.testScaleWithAntiAliasingAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScaleWithAntiAliasingAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      // The scaling ratio is 100%
      let result: number = ndkTest.testScaleWithAntiAliasingAbnormal(100, 100)
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetNativeBufferAbnormal
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetNativeBuffer_0600
     * @tc.desc   1.testNativeGetNativeBufferAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetNativeBufferAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetNativeBufferAbnormal()
      let msg = 'testNativeGetNativeBufferAbnormal result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetMetaDataNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMetaData_0700
     * @tc.desc   1.testNativeSetMetaDataNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetMetaDataNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetMetaDataNull()
      let msg = 'testNativeSetMetaDataNull result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetMetaDataNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetMetaData_0800
     * @tc.desc   1.testNativeGetMetaDataNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetMetaDataNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetMetaDataNull()
      let msg = 'testNativeGetMetaDataNull result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetMemoryName
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_0900
     * @tc.desc   1.testNativeSetMemoryName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetMemoryName',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetMemoryName()
      let msg = 'testNativeSetMemoryName result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetArgbPixels
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_1000
     * @tc.desc   1.testNativeGetArgbPixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetArgbPixels',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetArgbPixels()
      let msg = 'testNativeGetArgbPixels result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeGetColorSpaceNative
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_1100
     * @tc.desc   1.testNativeGetColorSpaceNative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetColorSpaceNative',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeGetColorSpaceNative()
      let msg = 'testNativeGetColorSpaceNative result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetColorSpaceNative
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetMemoryName_1200
     * @tc.desc   1.testNativeSetColorSpaceNative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetColorSpaceNative',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetColorSpaceNative()
      let msg = 'testNativeSetColorSpaceNative result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeSetGetSrcPixelFormat
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeSetGetSrcPixelFormat_1300
     * @tc.desc   1.testNativeSetGetSrcPixelFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeSetGetSrcPixelFormat',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeSetGetSrcPixelFormat()
      let msg = 'testNativeSetGetSrcPixelFormat result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeCreateEmptyPixelmap
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateEmptyPixelmap_1400
     * @tc.desc   1.testNativeCreateEmptyPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreateEmptyPixelmap',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeCreateEmptyPixelmap()
      let msg = 'testNativeCreateEmptyPixelmap result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeConvertAlphaFormat
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeConvertAlphaFormat_1500
     * @tc.desc   1.testNativeConvertAlphaFormat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeConvertAlphaFormat',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeConvertAlphaFormat()
      let msg = 'testNativeConvertAlphaFormat result: '
      console.info(msg + result);
      expect(result).assertEqual(0)
      done();
    })

    /**
     * @tc.name   testNativeReadPixelsFromArea
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeReadPixelsFromArea_1600
     * @tc.desc   1.testNativeReadPixelsFromArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeReadPixelsFromArea',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeReadPixelsFromArea(pixelMap, 0, 0, 5, 5, false);
      let msg = 'testNativeReadPixelsFromArea result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testNativeReadPixelsFromAreaInvalidRegion
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeReadPixelsFromArea_1700
     * @tc.desc   1.testNativeReadPixelsFromAreaInvalidRegion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeReadPixelsFromAreaInvalidRegion',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeReadPixelsFromArea(pixelMap, -1, 0, 11, 100, false);
      let msg = 'testNativeReadPixelsFromAreaInvalidRegion result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeReadPixelsFromAreaNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeReadPixelsFromArea_1800
     * @tc.desc   1.testNativeReadPixelsFromAreaNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeReadPixelsFromAreaNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeReadPixelsFromArea(pixelMap, 0, 0, 5, 5, true);
      let msg = 'testNativeReadPixelsFromAreaNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeWritePixelsToArea
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeWritePixelsToArea_1900
     * @tc.desc   1.testNativeWritePixelsToArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWritePixelsToArea',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 },
        editable: true
      };
      const pixels = new ArrayBuffer(5 * 5 * 4);
      const view = new Uint8Array(pixels);
      view.fill(0xFF);
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeWritePixelsToArea(pixelMap, 0, 0, 5, 5, pixels, false);
      let msg = 'testNativeWritePixelsToArea result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testNativeWritePixelsToAreaInvalidRegion
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeWritePixelsToArea_2000
     * @tc.desc   1.testNativeWritePixelsToAreaInvalidRegion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWritePixelsToAreaInvalidRegion',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 },
        editable: true
      };
      const pixels = new ArrayBuffer(5 * 5 * 4);
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeWritePixelsToArea(pixelMap, -1, 0, 11, 100, pixels, false);
      let msg = 'testNativeWritePixelsToAreaInvalidRegion result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeWritePixelsToAreaUneditable
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeWritePixelsToArea_2100
     * @tc.desc   1.testNativeWritePixelsToAreaUneditable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWritePixelsToAreaUneditable',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 },
        editable: false
      };
      const pixels = new ArrayBuffer(5 * 5 * 4);
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeWritePixelsToArea(pixelMap, 0, 0, 5, 5, pixels, false);
      let msg = 'testNativeWritePixelsToAreaUneditable result: '
      console.info(msg + result);
      expect(result).assertEqual(7600201);
      done();
    })

    /**
     * @tc.name   testNativeWritePixelsToAreaNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeWritePixelsToArea_2200
     * @tc.desc   1.testNativeWritePixelsToAreaNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWritePixelsToAreaNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 },
        editable: true
      };
      const pixels = new ArrayBuffer(5 * 5 * 4);
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeWritePixelsToArea(pixelMap, 0, 0, 5, 5, pixels, true);
      let msg = 'testNativeWritePixelsToAreaNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeCreateAlphaPixelmap
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateAlphaPixelmap_2300
     * @tc.desc   1.testNativeCreateAlphaPixelmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreateAlphaPixelmap',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeCreateAlphaPixelmap(pixelMap, false);
      let msg = 'testNativeCreateAlphaPixelmap result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testNativeCreateAlphaPixelmapNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateAlphaPixelmap_2400
     * @tc.desc   1.testNativeCreateAlphaPixelmapNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreateAlphaPixelmapNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeCreateAlphaPixelmap(pixelMap, true);
      let msg = 'testNativeCreateAlphaPixelmapNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeClone
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeClone_2500
     * @tc.desc   1.testNativeClone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeClone',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeClone(pixelMap, false);
      let msg = 'testNativeClone result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testNativeCloneNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeClone_2600
     * @tc.desc   1.testNativeCloneNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCloneNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeClone(pixelMap, true);
      let msg = 'testNativeCloneNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeCreateCroppedAndScaledPixelMap
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateCroppedAndScaledPixelMap_2700
     * @tc.desc   1.testNativeCreateCroppedAndScaledPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreateCroppedAndScaledPixelMap',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeCreateCroppedAndScaledPixelMap(pixelMap, 0, 0, 5, 5, 1.5, -2, 0, false);
      let msg = 'testNativeCreateCroppedAndScaledPixelMap result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testNativeCreateCroppedAndScaledPixelMapInvalidRegion
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateCroppedAndScaledPixelMap_2800
     * @tc.desc   1.testNativeCreateCroppedAndScaledPixelMapInvalidRegion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreateCroppedAndScaledPixelMapInvalidRegion',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeCreateCroppedAndScaledPixelMap(pixelMap, -1, 0, 11, 100, 1, -2, 0, false);
      let msg = 'testNativeCreateCroppedAndScaledPixelMapInvalidRegion result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeCreateCroppedAndScaledPixelMapNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreateCroppedAndScaledPixelMap_2900
     * @tc.desc   1.testNativeCreateCroppedAndScaledPixelMapNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreateCroppedAndScaledPixelMapNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeCreateCroppedAndScaledPixelMap(pixelMap, 0, 0, 5, 5, 1.5, -2, 0, true);
      let msg = 'testNativeCreateCroppedAndScaledPixelMapNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeCreatePixelmapFromNativeBuffer
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreatePixelmapFromNativeBuffer_3000
     * @tc.desc   1.testNativeCreatePixelmapFromNativeBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreatePixelmapFromNativeBuffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 },
        pixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap = image.createPixelMapUsingAllocatorSync(options, image.AllocatorType.DMA);
      let result: number = ndkTest.testNativeCreatePixelmapFromNativeBuffer(pixelMap, false);
      let msg = 'testNativeCreatePixelmapFromNativeBuffer result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testNativeCreatePixelmapFromNativeBufferNotDMA
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreatePixelmapFromNativeBuffer_3100
     * @tc.desc   1.testNativeCreatePixelmapFromNativeBufferNotDMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreatePixelmapFromNativeBufferNotDMA',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 },
        pixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap = image.createPixelMapUsingAllocatorSync(options, image.AllocatorType.SHARE_MEMORY);
      let result: number = ndkTest.testNativeCreatePixelmapFromNativeBuffer(pixelMap, false);
      let msg = 'testNativeCreatePixelmapFromNativeBufferNotDMA result: '
      console.info(msg + result);
      expect(result).assertEqual(7600173);
      done();
    })

    /**
     * @tc.name   testNativeCreatePixelmapFromNativeBufferNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreatePixelmapFromNativeBuffer_3200
     * @tc.desc   1.testNativeCreatePixelmapFromNativeBufferNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreatePixelmapFromNativeBufferNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 },
        pixelFormat: image.PixelMapFormat.RGBA_8888
      };
      const pixelMap = image.createPixelMapUsingAllocatorSync(options, image.AllocatorType.DMA);
      let result: number = ndkTest.testNativeCreatePixelmapFromNativeBuffer(pixelMap, true);
      let msg = 'testNativeCreatePixelmapFromNativeBufferNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeCreatePixelmapFromSurface
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreatePixelmapFromSurface_3300
     * @tc.desc   1.testNativeCreatePixelmapFromSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreatePixelmapFromSurface',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeCreatePixelmapFromSurface('123', false);
      let msg = 'testNativeCreatePixelmapFromSurface result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      result = ndkTest.testNativeCreatePixelmapFromSurface('1', false); // 1 length
      msg = 'testNativeCreatePixelmapFromSurface result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      result = ndkTest.testNativeCreatePixelmapFromSurface(
        '1234567890123456789012345678901234567890123456789012345678901234', false); // 64 length
      msg = 'testNativeCreatePixelmapFromSurface result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeCreatePixelmapFromSurfaceInvalidId
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreatePixelmapFromSurface_3400
     * @tc.desc   1.testNativeCreatePixelmapFromSurfaceInvalidId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreatePixelmapFromSurfaceInvalidId',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeCreatePixelmapFromSurface('ABC', false);
      let msg = 'testNativeCreatePixelmapFromSurfaceInvalidId result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      result = ndkTest.testNativeCreatePixelmapFromSurface('', false); // 0 length
      msg = 'testNativeCreatePixelmapFromSurfaceInvalidId result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      result = ndkTest.testNativeCreatePixelmapFromSurface(
        '12345678901234567890123456789012345678901234567890123456789012345', false); // 65 length
      msg = 'testNativeCreatePixelmapFromSurfaceInvalidId result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeCreatePixelmapFromSurfaceNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeCreatePixelmapFromSurface_3500
     * @tc.desc   1.testNativeCreatePixelmapFromSurfaceNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeCreatePixelmapFromSurfaceNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testNativeCreatePixelmapFromSurface('123', true);
      let msg = 'testNativeCreatePixelmapFromSurfaceNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeGetUniqueId
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetUniqueId_3600
     * @tc.desc   1.testNativeGetUniqueId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetUniqueId',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeGetUniqueId(pixelMap, false);
      let msg = 'testNativeGetUniqueId result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   testNativeGetUniqueIdNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeGetUniqueId_3700
     * @tc.desc   1.testNativeGetUniqueIdNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeGetUniqueIdNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeGetUniqueId(pixelMap, true);
      let msg = 'testNativeGetUniqueIdNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeIsReleased
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeIsReleased_3800
     * @tc.desc   1.testNativeIsReleased
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeIsReleased',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeIsReleased(pixelMap, false, false);
      let msg = 'testNativeIsReleased result: '
      console.info(msg + result);
      expect(result).assertEqual(0);
      done();
    })
    
    /**
     * @tc.name   testNativeIsReleasedAfterRelease
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeIsReleased_3900
     * @tc.desc   1.testNativeIsReleasedAfterRelease
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeIsReleasedAfterRelease',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeIsReleased(pixelMap, true, false);
      let msg = 'testNativeIsReleasedAfterRelease result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   testNativeIsReleasedNull
     * @tc.number SUB_MULTIMEDIA_PIXELMAPCAPI_NativeIsReleased_4000
     * @tc.desc   1.testNativeIsReleasedNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeIsReleasedNull',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const options: image.InitializationOptions = {
        size: { width: 10, height: 10 }
      };
      const pixelMap = image.createPixelMapSync(options);
      let result: number = ndkTest.testNativeIsReleased(pixelMap, false, true);
      let msg = 'testNativeIsReleasedNull result: '
      console.info(msg + result);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   createPixelmapFromSurfaceWithTransformation001
     * @tc.number SUB_GRAPHIC_IMAGE_PIXELMAP_Native_CreatePixelmapFromSurfaceWithTransformation001
     * @tc.desc   test createPixelmapFromSurfaceWithTransformation get surface's data fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelmapFromSurfaceWithTransformation001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.createPixelmapFromSurfaceWithTransformation001('123', true);
      expect(result).assertEqual(7600104); // IMAGE_GET_IMAGE_DATA_FAILED is 7600104
      done();
    })

    /**
     * @tc.name   createPixelmapFromSurfaceWithTransformation002
     * @tc.number SUB_GRAPHIC_IMAGE_PIXELMAP_Native_CreatePixelmapFromSurfaceWithTransformation002
     * @tc.desc   test createPixelmapFromSurfaceWithTransformation surface id nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelmapFromSurfaceWithTransformation002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.createPixelmapFromSurfaceWithTransformation002('', false);
      expect(result).assertEqual(7600206); // IMAGE_INVALID_PARAMETER is 7600206
      done();
    })

    /**
     * @tc.name   createPixelmapFromSurfaceWithTransformation003
     * @tc.number SUB_GRAPHIC_IMAGE_PIXELMAP_Native_CreatePixelmapFromSurfaceWithTransformation003
     * @tc.desc   test createPixelmapFromSurfaceWithTransformation surface id is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelmapFromSurfaceWithTransformation003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.createPixelmapFromSurfaceWithTransformation003('', false);
      expect(result).assertEqual(7600206); // IMAGE_INVALID_PARAMETER is 7600206
      done();
    })

    /**
     * @tc.name   createPixelmapFromSurfaceWithTransformation004
     * @tc.number SUB_GRAPHIC_IMAGE_PIXELMAP_Native_CreatePixelmapFromSurfaceWithTransformation004
     * @tc.desc   test createPixelmapFromSurfaceWithTransformation errorcode exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelmapFromSurfaceWithTransformation004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.createPixelmapFromSurfaceWithTransformation004('', false);
      expect(result).assertEqual(7600305); // IMAGE_CREATE_PIXELMAP_FAILED is 7600305
      done();
    })

    /**
     * @tc.name   createPixelmapFromSurfaceWithTransformation005
     * @tc.number SUB_GRAPHIC_IMAGE_PIXELMAP_Native_CreatePixelmapFromSurfaceWithTransformation005
     * @tc.desc   test createPixelmapFromSurfaceWithTransformation errorcode exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelmapFromSurfaceWithTransformation005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.createPixelmapFromSurfaceWithTransformation005('', false);
      expect(result).assertEqual(0); // IMAGE_SUCCESS is 0
      done();
    })

    /**
     * @tc.name   createPixelmapFromSurfaceWithTransformation006
     * @tc.number SUB_GRAPHIC_IMAGE_PIXELMAP_Native_CreatePixelmapFromSurfaceWithTransformation006
     * @tc.desc   test createPixelmapFromSurfaceWithTransformation errorcode exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelmapFromSurfaceWithTransformation006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.createPixelmapFromSurfaceWithTransformation006('', false);
      expect(result).assertEqual(7600201); // IMAGE_UNSUPPORTED_OPERATION is 7600201
      done();
    })

  })
}