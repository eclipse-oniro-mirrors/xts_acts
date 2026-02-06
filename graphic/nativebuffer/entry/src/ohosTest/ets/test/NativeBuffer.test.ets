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
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_ALLOC_0100
     * @tc.name       : testOHNativeBufferAlloc001
     * @tc.desc       : test OH_NativeBuffer_Alloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferAlloc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAlloc();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_REFERENCE_0100
     * @tc.name       : testOHNativeBufferReference001
     * @tc.desc       : test OH_NativeBuffer_Reference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferReference001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReference();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNREFERENCE_0100
     * @tc.name       : testOHNativeBufferUnreference001
     * @tc.desc       : test OH_NativeBuffer_Unreference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferUnreference001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnreference();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_GETCONFIG_0100
     * @tc.name       : testOHNativeBufferGetConfig001
     * @tc.desc       : test OH_NativeBuffer_GetConfig
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferGetConfig001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetConfig();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_MAP_0100
     * @tc.name       : testOHNativeBufferMap001
     * @tc.desc       : test OH_NativeBuffer_Map
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMap();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNMAP_0100
     * @tc.name       : testOHNativeBufferUnmap001
     * @tc.desc       : test OH_NativeBuffer_Unmap
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferUnmap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnmap();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_GETSEQNUM_0100
     * @tc.name       : testOHNativeBufferGetSeqNum001
     * @tc.desc       : test OH_NativeBuffer_GetSeqNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferGetSeqNum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNum();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_ALLOC_0200
     * @tc.name       : testOHNativeBufferAlloc002
     * @tc.desc       : test OH_NativeBuffer_Alloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferAlloc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAllocAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_REFERENCE_0200
     * @tc.name       : testOHNativeBufferReference002
     * @tc.desc       : test OH_NativeBuffer_Reference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferReference002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReferenceAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNREFERENCE_0200
     * @tc.name       : testOHNativeBufferUnreference002
     * @tc.desc       : test OH_NativeBuffer_Unreference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferUnreference002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnreferenceAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_MAP_0200
     * @tc.name       : testOHNativeBufferMap002
     * @tc.desc       : test OH_NativeBuffer_Map
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_UNMAP_0200
     * @tc.name       : testOHNativeBufferUnmap002
     * @tc.desc       : test OH_NativeBuffer_Unmap
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferUnmap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnmapAbnormal();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_BUFFER_OH_NATIVE_BUFFER_GETSEQNUM_0200
     * @tc.name       : testOHNativeBufferGetSeqNum002
     * @tc.desc       : test OH_NativeBuffer_GetSeqNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeBufferGetSeqNum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNumAbnormal();
      expect(result).assertEqual(-1);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0100
     * @tc.name       : testNativeBufferAllocNullptr
     * @tc.desc       : test OH_NativeBuffer_Alloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBufferAllocNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAllocNullptr();
      console.info('testNativeBufferAllocNullptr result: ' + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0101
     * @tc.name       : testNativeBufferAllocNormal
     * @tc.desc       : test OH_NativeBuffer_Alloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0102
     * @tc.name       : testNativeBufferAllocAbormal
     * @tc.desc       : test OH_NativeBuffer_Alloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0103
     * @tc.name       : testNativeBufferAllocMuch
     * @tc.desc       : test OH_NativeBuffer_Alloc
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBufferAllocMuch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferAllocMuch();
      console.info('testNativeBufferAllocMuch result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0200
     * @tc.name       : testNativeBufferFromNativeWindowBufferNullptr
     * @tc.desc       : test OH_NativeBuffer_FromNativeWindowBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0201
     * @tc.name       : testNativeBufferFromNativeWindowBufferNormal
     * @tc.desc       : test OH_NativeBuffer_FromNativeWindowBuffer
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0300
     * @tc.name       : testNativeBufferGetConfigNullptr
     * @tc.desc       : test OH_NativeBuffer_GetConfig
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBufferGetConfigNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetConfigNullptr();
      console.info('testNativeBufferGetConfigNullptr result: ' + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0301
     * @tc.name       : testNativeBufferGetConfigNormal
     * @tc.desc       : test OH_NativeBuffer_GetConfig
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferGetConfigNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetConfigNormal();
      console.info('testNativeBufferGetConfigNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0400
     * @tc.name       : testNativeBufferGetSeqNumNullptr
     * @tc.desc       : test OH_NativeBuffer_GetSeqNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBufferGetSeqNumNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNumNullptr();
      console.info('testNativeBufferGetSeqNumNullptr result: ' + result);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0401
     * @tc.name       : testNativeBufferGetSeqNumNormal
     * @tc.desc       : test OH_NativeBuffer_GetSeqNum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferGetSeqNumNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferGetSeqNumNormal();
      console.info('testNativeBufferGetSeqNumNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0500
     * @tc.name       : testNativeBuffeMapNullptr
     * @tc.desc       : test OH_NativeBuffer_Map
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBuffeMapNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeMapNullptr();
      console.info('testNativeBuffeMapNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0501
     * @tc.name       : testNativeBufferMapNormal
     * @tc.desc       : test OH_NativeBuffer_Map
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferMapNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferMapNormal();
      console.info('testNativeBufferMapNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0600
     * @tc.name       : testNativeBuffeMapPlanesNullptr
     * @tc.desc       : test OH_NativeBuffer_MapPlanes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0601
     * @tc.name       : testNativeBufferMapPlanesAbNormal
     * @tc.desc       : test OH_NativeBuffer_MapPlanes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferMapPlanesAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = nativebuffer.oHNativeBufferMapPlanesAbNormal();
      console.info('testNativeBufferMapPlanesAbNormal result: ' + result);
      expect(result).assertEqual(50007000);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0602
     * @tc.name       : testNativeBufferMapPlanesNormal
     * @tc.desc       : test OH_NativeBuffer_MapPlanes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0700
     * @tc.name       : testNativeBuffeReferenceNullptr
     * @tc.desc       : test OH_NativeBuffer_Reference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBuffeReferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeReferenceNullptr();
      console.info('testNativeBuffeReferenceNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0701
     * @tc.name       : testNativeBuffeUnreferenceNullptr
     * @tc.desc       : test OH_NativeBuffer_Unreference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBuffeUnreferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeUnreferenceNullptr();
      console.info('testNativeBuffeUnreferenceNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0702
     * @tc.name       : testNativeBufferReferenceNormal
     * @tc.desc       : test OH_NativeBuffer_Reference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReferenceNormal();
      console.info('testNativeBufferReferenceNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0703
     * @tc.name       : testNativeBufferReferenceMax
     * @tc.desc       : test OH_NativeBuffer_Reference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferReferenceMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferReferenceMax();
      console.info('testNativeBufferReferenceMax result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0704
     * @tc.name       : testNativeBufferUnreferenceNormal
     * @tc.desc       : test OH_NativeBuffer_Unreference
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferUnreferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnreferenceNormal();
      console.info('testNativeBufferUnreferenceNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0800
     * @tc.name       : testNativeBuffeUnmapNullptr
     * @tc.desc       : test OH_NativeBuffer_Unmap
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeBuffeUnmapNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBuffeUnmapNullptr();
      console.info('testNativeBuffeUnmapNullptr result: ' + result);
      expect(result).assertEqual(40001000);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0801
     * @tc.name       : testNativeBufferUnmapNormal
     * @tc.desc       : test OH_NativeBuffer_Unmap
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeBufferUnmapNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativebuffer.oHNativeBufferUnmapNormal();
      console.info('testNativeBufferUnmapNormal result: ' + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0900
     * @tc.name       : testNativeBufferGetColorSpaceFirst
     * @tc.desc       : test OH_NativeBuffer_GetColorSpace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0901
     * @tc.name       : testNativeBufferSetColorSpaceNormal
     * @tc.desc       : test OH_NativeBuffer_GetColorSpace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0902
     * @tc.name       : testNativeBufferSetColorSpaceNullptr
     * @tc.desc       : test OH_NativeBuffer_GetColorSpace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0903
     * @tc.name       : testNativeBufferSetColorSpaceAbnormal
     * @tc.desc       : test OH_NativeBuffer_GetColorSpace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeBufferSetColorSpaceAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      // if (deviceTypeInfo == "default") {
      //   expect(0).assertEqual(0);
      //   done();
      // } else {
        let result: number = nativebuffer.oHNativeBufferSetColorSpaceAbnormal();
        console.info('testNativeBufferSetColorSpaceAbnormal result: ' + result);
        expect(result).assertEqual(40001000);
        done();
      // }
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0904
     * @tc.name       : testNativeBufferGetColorSpaceNullptr
     * @tc.desc       : test OH_NativeBuffer_GetColorSpace
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0905
     * @tc.name       : testNativeBufferGetMetadataValueFirst
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0906
     * @tc.name       : testNativeBufferSetDynamicMetadataValue
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0907
     * @tc.name       : testNativeBufferSetMetadataValueTimes
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0908
     * @tc.name       : testNativeBufferSetStaticMetadataValue
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0909
     * @tc.name       : testNativeBufferSetMetadataValue
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0910
     * @tc.name       : testNativeBufferSetNullMetadataValue
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0911
     * @tc.name       : testNativeBufferSetMetadataValueNullptr
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0912
     * @tc.name       : testNativeBufferGetMetadataValueAbnormal
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0913
     * @tc.name       : testNativeBufferGetMetadataValueNullptr
     * @tc.desc       : test OH_NativeBuffer_GetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_BUFFER_0914
     * @tc.name       : testNativeBufferY8Y16USAGEandAlloc
     * @tc.desc       : test NATIVEBUFFER_PIXEL_FMT_Y8 NATIVEBUFFER_PIXEL_FMT_Y16 NATIVEBUFFER_USAGE_MEM_MMZ_CACHE
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
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
  })
}
