/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Level, Size } from '@ohos/hypium'
import nativebuffer from 'libnativebuffer.so'
import deviceInfo from '@ohos.deviceInfo'

export default function nativeBufferTest() {
  describe('NativeBufferTest', () => {
    let deviceTypeInfo: string = deviceInfo.deviceType;
    /**
     * @tc.name   testOHNativeBufferAlloc001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_ALLOC_0100
     * @tc.desc   test OH_NativeBuffer_Alloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferAlloc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAlloc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferReference001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_REFERENCE_0100
     * @tc.desc   test OH_NativeBuffer_Reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferReference001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReference();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferUnreference001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNREFERENCE_0100
     * @tc.desc   test OH_NativeBuffer_Unreference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferUnreference001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnreference();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferGetConfig001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_GETCONFIG_0100
     * @tc.desc   test OH_NativeBuffer_GetConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferGetConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetConfig();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferMap001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_MAP_0100
     * @tc.desc   test OH_NativeBuffer_Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMap();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferUnmap001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNMAP_0100
     * @tc.desc   test OH_NativeBuffer_Unmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferUnmap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnmap();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferGetSeqNum001
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_GETSEQNUM_0100
     * @tc.desc   test OH_NativeBuffer_GetSeqNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferGetSeqNum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNum();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferAlloc002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_ALLOC_0200
     * @tc.desc   test OH_NativeBuffer_Alloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferAlloc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAllocAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferReference002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_REFERENCE_0200
     * @tc.desc   test OH_NativeBuffer_Reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferReference002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReferenceAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferUnreference002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNREFERENCE_0200
     * @tc.desc   test OH_NativeBuffer_Unreference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferUnreference002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnreferenceAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferMap002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_MAP_0200
     * @tc.desc   test OH_NativeBuffer_Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferUnmap002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNMAP_0200
     * @tc.desc   test OH_NativeBuffer_Unmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferUnmap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnmapAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferGetSeqNum002
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_GETSEQNUM_0200
     * @tc.desc   test OH_NativeBuffer_GetSeqNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferGetSeqNum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNumAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeBufferAllocNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0100
     * @tc.desc   test OH_NativeBuffer_Alloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferAllocNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAllocNullptr();
      console.info('testNativeBufferAllocNullptr result: ' + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeBufferAllocNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0101
     * @tc.desc   test OH_NativeBuffer_Alloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferAllocNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = nativebuffer.oHNativeBufferAllocNormal();
      console.info('testNativeBufferAllocNormal result: ' + result);
      for (let i = 0; i < result.length; i++) {
        expect(result[i]).assertEqual(0);
      }
      done();
    });

    /**
     * @tc.name   testNativeBufferAllocAbormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0102
     * @tc.desc   test OH_NativeBuffer_Alloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferAllocAbormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = nativebuffer.oHNativeBufferAllocAbormal();
      console.info('testNativeBufferAllocAbormal result: ' + result);
      for (let i = 0; i < result.length; i++) {
        expect(result[i]).assertEqual(-1);
      }
      done();
    });

    /**
     * @tc.name   testNativeBufferAllocMuch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0103
     * @tc.desc   test OH_NativeBuffer_Alloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferAllocMuch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAllocMuch();
      console.info('testNativeBufferAllocMuch result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferFromNativeWindowBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0200
     * @tc.desc   test OH_NativeBuffer_FromNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferFromNativeWindowBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativebuffer.oHNativeBufferFromNativeWindowBufferNullptr();
      console.info('testNativeBufferFromNativeWindowBufferNullptr result: ' + result);
      expect(result[0]).assertEqual(40001000);
      expect(result[1]).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testNativeBufferFromNativeWindowBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0201
     * @tc.desc   test OH_NativeBuffer_FromNativeWindowBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferFromNativeWindowBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativebuffer.oHNativeBufferFromNativeWindowBufferNormal();
      console.info("testNativeBufferFromNativeWindowBufferNormal result: " + result)
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferGetConfigNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0300
     * @tc.desc   test OH_NativeBuffer_GetConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetConfigNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetConfigNullptr();
      console.info('testNativeBufferGetConfigNullptr result: ' + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeBufferGetConfigNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0301
     * @tc.desc   test OH_NativeBuffer_GetConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetConfigNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetConfigNormal();
      console.info('testNativeBufferGetConfigNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferGetSeqNumNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0400
     * @tc.desc   test OH_NativeBuffer_GetSeqNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetSeqNumNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNumNullptr();
      console.info('testNativeBufferGetSeqNumNullptr result: ' + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testNativeBufferGetSeqNumNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0401
     * @tc.desc   test OH_NativeBuffer_GetSeqNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetSeqNumNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNumNormal();
      console.info('testNativeBufferGetSeqNumNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBuffeMapNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0500
     * @tc.desc   test OH_NativeBuffer_Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBuffeMapNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeMapNullptr();
      console.info('testNativeBuffeMapNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0501
     * @tc.desc   test OH_NativeBuffer_Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapNormal();
      console.info('testNativeBufferMapNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBuffeMapPlanesNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0600
     * @tc.desc   test OH_NativeBuffer_MapPlanes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBuffeMapPlanesNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativebuffer.oHNativeBuffeMapPlanesNullptr();
      console.info('testNativeBuffeMapPlanesNullptr result: ' + result);
      expect(result[0]).assertEqual(40001000);
      expect(result[1]).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapPlanesAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0601
     * @tc.desc   test OH_NativeBuffer_MapPlanes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapPlanesAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativebuffer.oHNativeBufferMapPlanesAbNormal();
      console.info('testNativeBufferMapPlanesAbNormal result: ' + result);
      expect(result).assertEqual(50007000);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapPlanesNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0602
     * @tc.desc   test OH_NativeBuffer_MapPlanes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapPlanesNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferMapPlanesNormal();
        console.info('testNativeBufferMapPlanesNormal result: ' + result);
        expect(result).assertEqual(0);
        done();
      }
    });


    /**
     * @tc.name   testNativeBufferMapPlanesNormal1
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0603
     * @tc.desc   test OH_NativeBuffer_MapPlanes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapPlanesNormal1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        if (deviceTypeInfo == "default") {
          expect(0).assertEqual(0);
          done();
        } else {
          let result: Array<number> = nativebuffer.oHNativeBufferMapPlanesNormal1();
          console.info('testNativeBufferMapPlanesNormal1 result: ' + result);
          expect(result).assertEqual(0);
          done();
        }
      });
    /**
     * @tc.name   testNativeBuffeReferenceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0700
     * @tc.desc   test OH_NativeBuffer_Reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBuffeReferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeReferenceNullptr();
      console.info('testNativeBuffeReferenceNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testNativeBuffeUnreferenceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0701
     * @tc.desc   test OH_NativeBuffer_Unreference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBuffeUnreferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeUnreferenceNullptr();
      console.info('testNativeBuffeUnreferenceNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testNativeBufferReferenceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0702
     * @tc.desc   test OH_NativeBuffer_Reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReferenceNormal();
      console.info('testNativeBufferReferenceNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferReferenceMax
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0703
     * @tc.desc   test OH_NativeBuffer_Reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferReferenceMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReferenceMax();
      console.info('testNativeBufferReferenceMax result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferUnreferenceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0704
     * @tc.desc   test OH_NativeBuffer_Unreference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferUnreferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnreferenceNormal();
      console.info('testNativeBufferUnreferenceNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBuffeUnmapNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0800
     * @tc.desc   test OH_NativeBuffer_Unmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBuffeUnmapNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeUnmapNullptr();
      console.info('testNativeBuffeUnmapNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testNativeBufferUnmapNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0801
     * @tc.desc   test OH_NativeBuffer_Unmap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferUnmapNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnmapNormal();
      console.info('testNativeBufferUnmapNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferGetColorSpaceFirst
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0900
     * @tc.desc   test OH_NativeBuffer_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetColorSpaceFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: number = nativebuffer.oHNativeBufferGetColorSpaceFirst();
        console.info('testNativeBufferGetColorSpaceFirst result: ' + result);
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetColorSpaceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0901
     * @tc.desc   test OH_NativeBuffer_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetColorSpaceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferSetColorSpaceNormal();
        console.info('testNativeBufferSetColorSpaceNormal result: ' + result);
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetColorSpaceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0902
     * @tc.desc   test OH_NativeBuffer_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetColorSpaceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: number = nativebuffer.oHNativeBufferSetColorSpaceNullptr();
        console.info('testNativeBufferSetColorSpaceNullptr result: ' + result);
        expect(result).assertEqual(40001000);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetColorSpaceAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0903
     * @tc.desc   test OH_NativeBuffer_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetColorSpaceAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferSetColorSpaceAbnormal();
      console.info('testNativeBufferSetColorSpaceAbnormal result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.name   testNativeBufferGetColorSpaceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0904
     * @tc.desc   test OH_NativeBuffer_GetColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetColorSpaceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferGetColorSpaceNullptr();
        console.info('testNativeBufferGetColorSpaceNullptr result: ' + result);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(40001000);
        expect(result[2]).assertEqual(40001000);
        expect(result[3]).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferGetMetadataValueFirst
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0905
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetMetadataValueFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: number = nativebuffer.oHNativeBufferGetMetadataValueFirst();
        console.info('testNativeBufferGetMetadataValueFirst result: ' + result);
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetDynamicMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0906
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetDynamicMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferSetDynamicMetadataValue();
        console.info('testNativeBufferSetDynamicMetadataValue result: ' + result)
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetMetadataValueTimes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0907
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetMetadataValueTimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: number = nativebuffer.oHNativeBufferSetMetadataValueTimes();
        console.info('testNativeBufferSetMetadataValueTimes result: ' + result);
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetStaticMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0908
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetStaticMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferSetStaticMetadataValue();
        console.info('testNativeBufferSetStaticMetadataValue result: ' + result)
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0909
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferSetMetadataValue();
        console.info('testNativeBufferSetMetadataValue result: ' + result)
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetNullMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0910
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetNullMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: number = nativebuffer.oHNativeBufferSetNullMetadataValue();
        console.info('testNativeBufferSetNullMetadataValue result: ' + result);
        expect(result).assertEqual(50002000);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetMetadataValueNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0911
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetMetadataValueNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferSetMetadataValueNullptr();
        console.info('testNativeBufferSetMetadataValueNullptr result: ' + result);
        expect(result[0]).assertEqual(40001000);
        expect(result[1]).assertEqual(40001000);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferGetMetadataValueAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0912
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetMetadataValueAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferGetMetadataValueAbnormal();
        console.info('testNativeBufferGetMetadataValueAbnormal result: ' + result);
        expect(result[0]).assertEqual(40001000);
        expect(result[1]).assertEqual(40001000);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferGetMetadataValueNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0913
     * @tc.desc   test OH_NativeBuffer_GetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferGetMetadataValueNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferGetMetadataValueNullptr();
        console.info("testNativeBufferGetMetadataValueNullptr result: " + result)
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferY8Y16USAGEandAlloc
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0914
     * @tc.desc   test NATIVEBUFFER_PIXEL_FMT_Y8 NATIVEBUFFER_PIXEL_FMT_Y16 NATIVEBUFFER_USAGE_MEM_MMZ_CACHE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferY8Y16USAGEandAlloc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: Array<number> = nativebuffer.oHNativeBufferY8Y16USAGEandAlloc();
        console.info("testNativeBufferY8Y16USAGEandAlloc result: " + result)
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferMapWaitFence0ms
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1000
     * @tc.desc   test OH_NativeBuffer_MapWaitFence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapWaitFence0ms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapWaitFence0ms();
      console.info("testNativeBufferMapWaitFence0ms result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapWaitFence100ms
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1001
     * @tc.desc   test OH_NativeBuffer_MapWaitFence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapWaitFence100ms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapWaitFence100ms();
      console.info("testNativeBufferMapWaitFence100ms result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapWaitFence5000ms
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1002
     * @tc.desc   test OH_NativeBuffer_MapWaitFence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapWaitFence5000ms', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapWaitFence5000ms();
      console.info("testNativeBufferMapWaitFence5000ms result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapWaitFenceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1003
     * @tc.desc   test OH_NativeBuffer_MapWaitFence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapWaitFenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapWaitFenceNullptr();
      console.info("testNativeBufferMapWaitFenceNullptr result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapWaitFenceAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1004
     * @tc.desc   test OH_NativeBuffer_MapWaitFence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferMapWaitFenceAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapWaitFenceAbnormal();
      console.info("testNativeBufferMapWaitFenceAbnormal result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeBufferMetadataTypeEnumTraversal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1100
     * @tc.desc   test OH_NativeBuffer_MetadataType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeBufferMetadataTypeEnumTraversal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: number = nativebuffer.oHNativeBufferSetMetadataValueEnumTraversal();
        console.info("testOHNativeBufferMetadataType result: " + result)
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferSetMetadataValueREGION
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1200
     * @tc.desc   test OH_REGION_OF_INTEREST_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeBufferSetMetadataValueREGION', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      if (deviceTypeInfo == "default") {
        expect(0).assertEqual(0);
        done();
      } else {
        let result: number = nativebuffer.oHNativeBufferSetMetadataValueREGION();
        console.info("testNativeBufferSetMetadataValueREGION result: " + result)
        expect(result).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.name   testNativeBufferIsSupportedNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1300
     * @tc.desc   test OH_NativeBuffer_IsSupported
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testNativeBufferIsSupportedNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferIsSupportedNormal();
      console.info("testNativeBufferIsSupportedNormal result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferIsSupportedNull01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1301
     * @tc.desc   test OH_NativeBuffer_IsSupported
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferIsSupportedNull01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferIsSupportedNull01();
      console.info("testNativeBufferIsSupportedNull01 result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferIsSupportedNull02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1302
     * @tc.desc   test OH_NativeBuffer_IsSupported
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferIsSupportedNull02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferIsSupportedNull02();
      console.info("testNativeBufferIsSupportedNull02 result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferIsSupportedAbnormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1303
     * @tc.desc   test OH_NativeBuffer_IsSupported
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferIsSupportedAbnormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferIsSupportedAbnormal01();
      console.info("testNativeBufferIsSupportedAbnormal01 result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferIsSupportedAbnormal02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1304
     * @tc.desc   test OH_NativeBuffer_IsSupported
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferIsSupportedAbnormal02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferIsSupportedAbnormal02();
      console.info("testNativeBufferIsSupportedAbnormal02 result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferIsSupportedMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1305
     * @tc.desc   test OH_NativeBuffer_IsSupported
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferIsSupportedMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferIsSupportedMultipleCalls();
      console.info("testNativeBufferIsSupportedMultipleCalls result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapAndGetConfilgNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1400
     * @tc.desc   test OH_NativeBuffer_MapAndGetConfilg
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testNativeBufferMapAndGetConfilgNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAndGetConfilgNormal();
      console.info("testNativeBufferMapAndGetConfilgNormal result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapAndGetConfilgNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1401
     * @tc.desc   test OH_NativeBuffer_MapAndGetConfilg
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferMapAndGetConfilgNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAndGetConfilgNull();
      console.info("testNativeBufferMapAndGetConfilgNull result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapAndGetConfilgMultipleCalls01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1402
     * @tc.desc   test OH_NativeBuffer_MapAndGetConfilg
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferMapAndGetConfilgMultipleCalls01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAndGetConfilgMultipleCalls01();
      console.info("testNativeBufferMapAndGetConfilgMultipleCalls01 result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapAndGetConfilgMultipleCalls02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1403
     * @tc.desc   test OH_NativeBuffer_MapAndGetConfilg
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferMapAndGetConfilgMultipleCalls02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAndGetConfilgMultipleCalls02();
      console.info("testNativeBufferMapAndGetConfilgMultipleCalls02 result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapAll
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1404
     * @tc.desc   test OH_NativeBuffer_MapAndGetConfilg
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferMapAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAll();
      console.info("testNativeBufferMapAll result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferMapAndUnmap
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1405
     * @tc.desc   test OH_NativeBuffer_MapAndGetConfilg
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferMapAndUnmap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAndUnmap();
      console.info("testNativeBufferMapAndUnmap result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferWriteToParcelNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1500
     * @tc.desc   test OH_NativeBuffer_WriteToParcel
     * @tc.size   MediumTest
     * @tc.type   Funct
     * @tc.level  Level 0
     */
    it('testNativeBufferWriteToParcelNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferWriteToParcelNormal();
      console.info("testNativeBufferWriteToParcelNormal result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     *@tc.name   testNativeBufferWriteToParcelNull
     *@tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1501
     *@tc.desc   test OH_NativeBuffer_WriteToParcel
     *@tc.size   MediumTest
     *@tc.type   Function
     *@tc.level  Level 3
     */
    it('testNativeBufferWriteToParcelNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferWriteToParcelNull();
      console.info("testNativeBufferWriteToParcelNull result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferReadFromParcelNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1600
     * @tc.desc   test OH_NativeBuffer_WriteToParcel
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testNativeBufferReadFromParcelNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReadFromParcelNormal();
      console.info("testNativeBufferReadFromParcelNormal result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferReadFromParcelNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1601
     * @tc.desc   test OH_NativeBuffer_WriteToParcel
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferReadFromParcelNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReadFromParcelNull();
      console.info("testNativeBufferReadFromParcelNull result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferReadFromParcelAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1602
     * @tc.desc   test OH_NativeBuffer_WriteToParcel
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferReadFromParcelAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReadFromParcelAbnnormal();
      console.info("testNativeBufferReadFromParcelAbnnormal result: " + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeBufferWriteAndReadParcelMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1603
     * @tc.desc   test OH_NativeBuffer_WriteToParcel
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeBufferWriteAndReadParcelMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferWriteAndReadParcelMultipleCalls();
      console.info("testNativeBufferWriteAndReadParcelMultipleCalls result: " + result)
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeErrorCodeCover
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_1700
     * @tc.desc   test ErrorCode
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testNativeErrorCodeCover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativebuffer.oHNativeErrorCodeCover();
        console.info("testNativeErrorCodeCover result: " + result)
        expect(result).assertEqual(0);
        done();
      });
  });
}