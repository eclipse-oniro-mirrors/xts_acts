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
import nativeWindow from 'libnativewindow.so'
import { BusinessError } from '@kit.BasicServicesKit'

export default function nativeWindowTest() {
  describe('NativeWindowTest', () => {
    /**
     * @tc.name   testNativeWindowCreateNativeWindowNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0100
     * @tc.desc   testNativeWindowCreateNativeWindowNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCreateNativeWindowNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowDestroyNativeWindowNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0101
     * @tc.desc   testNativeWindowDestroyNativeWindowNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowDestroyNativeWindowNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowDestroyNativeWindowNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowGetSurfaceIdNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0102
     * @tc.desc   testNativeWindowGetSurfaceIdNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetSurfaceIdNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetSurfaceIdNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCreateNativeWindowFromSurfaceIdNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0200
     * @tc.desc   testNativeWindowCreateNativeWindowFromSurfaceIdNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCreateNativeWindowFromSurfaceIdNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowFromSurfaceIdNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowCreateNativeWindowFromSurfaceIdNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0201
     * @tc.desc   testNativeWindowCreateNativeWindowFromSurfaceIdNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowCreateNativeWindowFromSurfaceIdNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowFromSurfaceIdNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0202
     * @tc.desc   testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0300
     * @tc.desc   testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0301
     * @tc.desc   testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowDestroyNativeWindowBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0302
     * @tc.desc   testNativeWindowDestroyNativeWindowBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowDestroyNativeWindowBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowDestroyNativeWindowBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowGetBufferHandleFromNativeNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0303
     * @tc.desc   testNativeWindowGetBufferHandleFromNativeNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetBufferHandleFromNativeNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetBufferHandleFromNativeNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0304
     * @tc.desc   testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0306
     * @tc.desc   testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowRequestBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0400
     * @tc.desc   testNativeWindowNativeWindowRequestBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowRequestBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowNativeWindowAbortBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0401
     * @tc.desc   testNativeWindowNativeWindowAbortBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowAbortBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAbortBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowNativeWindowRequestAbortBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0402
     * @tc.desc   testNativeWindowNativeWindowRequestAbortBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferNormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowNativeWindowRequestAbortBufferAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0403
     * @tc.desc   testNativeWindowNativeWindowRequestAbortBufferAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowNativeWindowRequestBufferFenceFdNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0404
     * @tc.desc   testNativeWindowNativeWindowRequestBufferFenceFdNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowRequestBufferFenceFdNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestBufferFenceFdNormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowNativeWindowRequestBufferFenceFdAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0405
     * @tc.desc   testNativeWindowNativeWindowRequestBufferFenceFdAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowRequestBufferFenceFdAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestBufferFenceFdAbnormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowNativeWindowRequestAbortBufferMax
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0406
     * @tc.desc   testNativeWindowNativeWindowRequestAbortBufferMax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferMax();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testNativeWindowNativeWindowRequestAbortBufferErrorCode
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0407
     * @tc.desc   testNativeWindowNativeWindowRequestAbortBufferErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowWriteToParcelErrptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0500
     * @tc.desc   testNativeWindowWriteToParcelErrptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowWriteToParcelErrptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWriteToParcelErrptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowReadFromParcelErrptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0501
     * @tc.desc   testNativeWindowReadFromParcelErrptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowReadFromParcelErrptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowReadFromParcelErrptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowWRParcelNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0502
     * @tc.desc   testNativeWindowWRParcelNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowWRParcelNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWRParcelNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowWriteToParcelAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0503
     * @tc.desc   testNativeWindowWriteToParcelAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowWriteToParcelAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWriteToParcelAbNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowReadFromParcelAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0504
     * @tc.desc   testNativeWindowReadFromParcelAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowReadFromParcelAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowReadFromParcelAbNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowWRParcelDifferent
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0505
     * @tc.desc   testNativeWindowWRParcelDifferent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowWRParcelDifferent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWRParcelDifferent();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowFlushBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1700
     * @tc.desc   testNativeWindowNativeWindowFlushBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testNativeWindowNativeWindowFlushBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowNativeWindowFlushBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1701
     * @tc.desc   testNativeWindowNativeWindowFlushBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowNativeWindowFlushBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowNativeWindowFlushBufferAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1702
     * @tc.desc   testNativeWindowNativeWindowFlushBufferAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowFlushBufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowNativeWindowFlushBufferErrorCode
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1703
     * @tc.desc   testNativeWindowNativeWindowFlushBufferErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowFlushBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowGetLastFlushedBufferV2Nullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0600
     * @tc.desc   testNativeWindowGetLastFlushedBufferV2Nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetLastFlushedBufferV2Nullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferV2Nullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetLastFlushedBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0601
     * @tc.desc   testNativeWindowGetLastFlushedBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetLastFlushedBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetLastFlushedBufferV2Normal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0602
     * @tc.desc   testNativeWindowGetLastFlushedBufferV2Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowGetLastFlushedBufferV2Normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferV2Normal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetLastFlushedBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0603
     * @tc.desc   testNativeWindowGetLastFlushedBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowGetLastFlushedBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowSetBufferHold
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1600
     * @tc.desc   testNativeWindowSetBufferHold
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowSetBufferHold', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetBufferHold();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetNativeObjectMagicNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0701
     * @tc.desc   testNativeWindowGetNativeObjectMagicNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetNativeObjectMagicNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetNativeObjectMagicNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetNativeObjectMagicNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0700
     * @tc.desc   testNativeWindowGetNativeObjectMagicNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetNativeObjectMagicNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetNativeObjectMagicNullptr();
      expect(result).assertEqual(0);
      done();
    });



    /**
     * @tc.name   testNativeWindowNativeObjectReferenceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0702
     * @tc.desc   testNativeWindowNativeObjectReferenceNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeObjectReferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectReferenceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeObjectReferenceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0703
     * @tc.desc   testNativeWindowNativeObjectReferenceNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeObjectReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectReferenceNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeObjectUnreferenceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0704
     * @tc.desc   testNativeWindowNativeObjectUnreferenceNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeObjectUnreferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectUnreferenceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeObjectUnreferenceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0705
     * @tc.desc   testNativeWindowNativeObjectUnreferenceNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeObjectUnreferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectUnreferenceNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowAttachBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0800
     * @tc.desc   testNativeWindowNativeWindowAttachBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowAttachBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAttachBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowDetachBufferNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0801
     * @tc.desc   testNativeWindowNativeWindowDetachBufferNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowDetachBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowDetachBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowDetachBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0803
     * @tc.desc   testNativeWindowNativeWindowDetachBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowNativeWindowDetachBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowDetachBufferNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowAttachBufferErrorCode
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0807
     * @tc.desc   testNativeWindowNativeWindowAttachBufferErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeWindowNativeWindowAttachBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAttachBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowAttachBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0802
     * @tc.desc   testNativeWindowNativeWindowAttachBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowNativeWindowAttachBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAttachBufferNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowDetachBufferErrorCode
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0807
     * @tc.desc   testNativeWindowNativeWindowDetachBufferErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeWindowNativeWindowDetachBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowDetachBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowAtDetachDifferentBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0804
     * @tc.desc   testNativeWindowNativeWindowAtDetachDifferentBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeWindowNativeWindowAtDetachDifferentBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAtDetachDifferentBufferNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0805
     * @tc.desc   testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0900
     * @tc.desc   testNativeWindowNativeWindowHandleOptNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testNativeWindowNativeWindowHandleOptNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0901
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0902
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetFormatNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0903
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetFormatNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetFormatNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetFormatNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0904
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetUsageNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0905
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetUsageNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetUsageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetUsageNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0906
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetStrideNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0907
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetStrideNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetStrideNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetStrideNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0908
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0909
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0910
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0911
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0912
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetTransformNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0913
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetTransformNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetTransformNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetTransformNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0914
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0915
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0916
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptGetBufferQueueSize
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0917
     * @tc.desc   testNativeWindowNativeWindowHandleOptGetBufferQueueSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeWindowNativeWindowHandleOptGetBufferQueueSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptGetBufferQueueSize();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0918
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0919
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0920
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0921
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0922
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0923
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0924
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number | string = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0925
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowSetSetScalingModeV2Nullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1300
     * @tc.desc   testNativeWindowNativeWindowSetSetScalingModeV2Nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowSetSetScalingModeV2Nullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetSetScalingModeV2Nullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowSetScalingModeV2ScalingMode
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1301
     * @tc.desc   testNativeWindowNativeWindowSetScalingModeV2ScalingMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowNativeWindowSetScalingModeV2ScalingMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetScalingModeV2ScalingMode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetColorSpaceFirst
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1500
     * @tc.desc   testNativeWindowGetColorSpaceFirst
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetColorSpaceFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetColorSpaceFirst();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetColorSpaceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1501
     * @tc.desc   testNativeWindowSetColorSpaceNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowSetColorSpaceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetColorSpaceNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetColorSpaceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1502
     * @tc.desc   testNativeWindowSetColorSpaceNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowSetColorSpaceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetColorSpaceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetColorSpaceAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1503
     * @tc.desc   testNativeWindowSetColorSpaceAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testNativeWindowSetColorSpaceAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetColorSpaceAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetColorSpaceNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1504
     * @tc.desc   testNativeWindowGetColorSpaceNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetColorSpaceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetColorSpaceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetMetadataValueFirst
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1505
     * @tc.desc   testNativeWindowGetMetadataValueFirst
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetMetadataValueFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetMetadataValueFirst();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetDynamicMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1506
     * @tc.desc   testNativeWindowSetDynamicMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowSetDynamicMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetDynamicMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetMetadataValueTimes
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1507
     * @tc.desc   testNativeWindowSetMetadataValueTimes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowSetMetadataValueTimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValueTimes();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetStaticMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1508
     * @tc.desc   testNativeWindowSetStaticMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeWindowSetStaticMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetStaticMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1509
     * @tc.desc   testNativeWindowSetMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeWindowSetMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetNullMetadataValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1510
     * @tc.desc   testNativeWindowSetNullMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testNativeWindowSetNullMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetNullMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetMetadataValueNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1511
     * @tc.desc   testNativeWindowSetMetadataValueNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowSetMetadataValueNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValueNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetMetadataValueAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1512
     * @tc.desc   testNativeWindowGetMetadataValueAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testNativeWindowGetMetadataValueAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetMetadataValueAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowGetMetadataValueNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1513
     * @tc.desc   testNativeWindowGetMetadataValueNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowGetMetadataValueNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetMetadataValueNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1514
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1515
     * @tc.desc   testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeWindowSetMetadataValue_metadata_type
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1516
     * @tc.desc   testNativeWindowSetMetadataValue_metadata_type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowSetMetadataValue_metadata_type', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValue_metadata_type();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCreateNativeWindow
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1517
     * @tc.desc   testNativeWindowCreateNativeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCreateNativeWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindow();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowNativeWindowSetSetScalingMode
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1518
     * @tc.desc   testNativeWindowNativeWindowSetSetScalingMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowSetSetScalingMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetSetScalingMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowNativeWindowSetMetaData
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1519
     * @tc.desc   testNativeWindowNativeWindowSetMetaData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowSetMetaData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetMetaData();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowNativeWindowSetMetaDataSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1520
     * @tc.desc   testNativeWindowNativeWindowSetMetaDataSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowSetMetaDataSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetMetaDataSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowNativeWindowSetTunnelHandle
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1521
     * @tc.desc   testNativeWindowNativeWindowSetMetaDataSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowNativeWindowSetTunnelHandle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetTunnelHandle();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCleanCacheBeforeBufferRequested
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2000
     * @tc.desc   testNativeWindowCleanCacheBeforeBufferRequested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCleanCacheBeforeBufferRequested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCleanCacheBeforeBufferRequested();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCleanCacheWhenBufferRequested
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2001
     * @tc.desc   testNativeWindowCleanCacheWhenBufferRequested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCleanCacheWhenBufferRequested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCleanCacheWhenBufferRequested();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCleanCacheWhenBufferFlushed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2002
     * @tc.desc   testNativeWindowCleanCacheWhenBufferFlushed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCleanCacheWhenBufferFlushed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCleanCacheWhenBufferFlushed();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCleanCacheWhenBufferAcquired
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2003
     * @tc.desc   testNativeWindowCleanCacheWhenBufferAcquired
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCleanCacheWhenBufferAcquired', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCleanCacheWhenBufferAcquired();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCleanCacheWhenBufferReleased
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2004
     * @tc.desc   testNativeWindowCleanCacheWhenBufferAcquired
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCleanCacheWhenBufferReleased', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCleanCacheWhenBufferReleased();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCleanCacheLoopWhenBufferRequested
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2006
     * @tc.desc   testNativeWindowCleanCacheLoopWhenBufferRequested
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCleanCacheLoopWhenBufferRequested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCleanCacheLoopWhenBufferRequested();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowCleanCacheLoopWhenBufferFlushed
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2007
     * @tc.desc   testNativeWindowCleanCacheLoopWhenBufferFlushed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowCleanCacheLoopWhenBufferFlushed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCleanCacheLoopWhenBufferFlushed();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeWindowPreAllocBufferAbNormalPra
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2100
     * @tc.desc   testNativeWindowPreAllocBufferAbNormalPra
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowPreAllocBufferAbNormalPra', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowPreAllocBufferAbNormalPra();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowPreAllocBufferAbNormalPra2
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2101
     * @tc.desc   testNativeWindowPreAllocBufferAbNormalPra2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowPreAllocBufferAbNormalPra2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowPreAllocBufferAbNormalPra2();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowPreAllocBufferBufferCnt
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2102
     * @tc.desc   testNativeWindowPreAllocBufferBufferCnt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowPreAllocBufferBufferCnt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowPreAllocBufferBufferCnt();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowPreAllocBufferAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2103
     * @tc.desc   testNativeWindowPreAllocBufferAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowPreAllocBufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowPreAllocBufferAbnormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowPreAllocBufferDetachAttach
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2104
     * @tc.desc   testNativeWindowPreAllocBufferDetachAttach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowPreAllocBufferDetachAttach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowPreAllocBufferDetachAttach();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowPreAllocBufferDetachAttach02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2105
     * @tc.desc   testNativeWindowPreAllocBufferDetachAttach02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowPreAllocBufferDetachAttach02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowPreAllocBufferDetachAttach02();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowPreAllocBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2106
     * @tc.desc   testNativeWindowPreAllocBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowPreAllocBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowPreAllocBufferNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowCleanBufferUsage
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2200
     * @tc.desc   testNativeWindowCleanBufferUsage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowCleanBufferUsage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowCleanBufferUsage();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowLockBufferNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2300
     * @tc.desc   testNativeWindowLockBufferNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeWindowLockBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowLockBufferNormal();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowUnlockAndFlushBufferAbnormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2301
     * @tc.desc   testNativeWindowUnlockAndFlushBufferAbnormal01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowUnlockAndFlushBufferAbnormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowUnlockAndFlushBufferAbnormal01();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowUnlockAndFlushBufferAbnormal02
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2302
     * @tc.desc   testNativeWindowUnlockAndFlushBufferAbnormal02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowUnlockAndFlushBufferAbnormal02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowUnlockAndFlushBufferAbnormal02();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowUnlockAndFlushBufferAbnormal03
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2303
     * @tc.desc   testNativeWindowUnlockAndFlushBufferAbnormal03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowUnlockAndFlushBufferAbnormal03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowUnlockAndFlushBufferAbnormal03();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowUnlockAndFlushBufferAbnormal04
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2304
     * @tc.desc   testNativeWindowUnlockAndFlushBufferAbnormal04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowUnlockAndFlushBufferAbnormal04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowUnlockAndFlushBufferAbnormal04();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowLockBufferNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2305
     * @tc.desc   testNativeWindowLockBufferNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowLockBufferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowLockBufferNull();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowUnLockAndFlushBufferNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2306
     * @tc.desc   testNativeWindowUnLockAndFlushBufferNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowUnLockAndFlushBufferNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowUnLockAndFlushBufferNull();
        expect(result).assertEqual(40001000);
        done();
      });

    /**
     * @tc.name   testNativeWindowLockBufferUpdateArea
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2307
     * @tc.desc   testNativeWindowLockBufferUpdateArea
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowLockBufferUpdateArea', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowLockBufferUpdateArea();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowLockBufferUpperLimit
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2308
     * @tc.desc   testNativeWindowLockBufferUpperLimit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowLockBufferUpperLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowLockBufferUpperLimit();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowLockBufferMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2309
     * @tc.desc   testNativeWindowLockBufferMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowLockBufferMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowLockBufferMultipleCalls();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowUnLockAndFlushBufferMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2310
     * @tc.desc   testNativeWindowUnLockAndFlushBufferMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowUnLockAndFlushBufferMultipleCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowUnLockAndFlushBufferMultipleCalls();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeWindowLockAndUnLockAndRequest
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2311
     * @tc.desc   testNativeWindowLockAndUnLockAndRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeWindowLockAndUnLockAndRequest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.testNativeWindowLockAndUnLockAndRequest();
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.name   testNativeErrorCodeCover
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_2400
     * @tc.desc   test ErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeErrorCodeCover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let result: number = nativeWindow.OHNativeErrorCodeCover();
        expect(result).assertEqual(0);
        done();
      });
  })
}
