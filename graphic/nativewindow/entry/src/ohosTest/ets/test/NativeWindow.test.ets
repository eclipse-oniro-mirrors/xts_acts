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
    const SUCCESS = 0;
    const FAIL = -1;

    // Native Window Test

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0100
     * @tc.name       : testNativeWindowCreateNativeWindowNullptr
     * @tc.desc       : testNativeWindowCreateNativeWindowNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowCreateNativeWindowNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0101
     * @tc.name       : testNativeWindowDestroyNativeWindowNullptr
     * @tc.desc       : testNativeWindowDestroyNativeWindowNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowDestroyNativeWindowNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowDestroyNativeWindowNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0102
     * @tc.name       : testNativeWindowGetSurfaceIdNullptr
     * @tc.desc       : testNativeWindowGetSurfaceIdNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetSurfaceIdNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetSurfaceIdNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0200
     * @tc.name       : testNativeWindowCreateNativeWindowFromSurfaceIdNullptr
     * @tc.desc       : testNativeWindowCreateNativeWindowFromSurfaceIdNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowCreateNativeWindowFromSurfaceIdNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowFromSurfaceIdNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0201
     * @tc.name       : testNativeWindowCreateNativeWindowFromSurfaceIdNormal
     * @tc.desc       : testNativeWindowCreateNativeWindowFromSurfaceIdNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowCreateNativeWindowFromSurfaceIdNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowFromSurfaceIdNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0202
     * @tc.name       : testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId
     * @tc.desc       : testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0300
     * @tc.name       : testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr
     * @tc.desc       : testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0301
     * @tc.name       : testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr
     * @tc.desc       : testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0302
     * @tc.name       : testNativeWindowDestroyNativeWindowBufferNullptr
     * @tc.desc       : testNativeWindowDestroyNativeWindowBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowDestroyNativeWindowBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowDestroyNativeWindowBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0303
     * @tc.name       : testNativeWindowGetBufferHandleFromNativeNullptr
     * @tc.desc       : testNativeWindowGetBufferHandleFromNativeNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetBufferHandleFromNativeNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetBufferHandleFromNativeNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0304
     * @tc.name       : testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal
     * @tc.desc       : testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0306
     * @tc.name       : testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch
     * @tc.desc       : testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0400
     * @tc.name       : testNativeWindowNativeWindowRequestBufferNullptr
     * @tc.desc       : testNativeWindowNativeWindowRequestBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowRequestBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0401
     * @tc.name       : testNativeWindowNativeWindowAbortBufferNullptr
     * @tc.desc       : testNativeWindowNativeWindowAbortBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowAbortBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAbortBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0402
     * @tc.name       : testNativeWindowNativeWindowRequestAbortBufferNormal
     * @tc.desc       : testNativeWindowNativeWindowRequestAbortBufferNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferNormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0403
     * @tc.name       : testNativeWindowNativeWindowRequestAbortBufferAbnormal
     * @tc.desc       : testNativeWindowNativeWindowRequestAbortBufferAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0404
     * @tc.name       : testNativeWindowNativeWindowRequestBufferFenceFdNormal
     * @tc.desc       : testNativeWindowNativeWindowRequestBufferFenceFdNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowRequestBufferFenceFdNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestBufferFenceFdNormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0405
     * @tc.name       : testNativeWindowNativeWindowRequestBufferFenceFdAbnormal
     * @tc.desc       : testNativeWindowNativeWindowRequestBufferFenceFdAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowRequestBufferFenceFdAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestBufferFenceFdAbnormal();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0406
     * @tc.name       : testNativeWindowNativeWindowRequestAbortBufferMax
     * @tc.desc       : testNativeWindowNativeWindowRequestAbortBufferMax
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferMax();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0407
     * @tc.name       : testNativeWindowNativeWindowRequestAbortBufferErrorCode
     * @tc.desc       : testNativeWindowNativeWindowRequestAbortBufferErrorCode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowRequestAbortBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowRequestAbortBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0500
     * @tc.name       : testNativeWindowWriteToParcelErrptr
     * @tc.desc       : testNativeWindowWriteToParcelErrptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowWriteToParcelErrptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWriteToParcelErrptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0501
     * @tc.name       : testNativeWindowReadFromParcelErrptr
     * @tc.desc       : testNativeWindowReadFromParcelErrptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowReadFromParcelErrptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowReadFromParcelErrptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0502
     * @tc.name       : testNativeWindowWRParcelNormal
     * @tc.desc       : testNativeWindowWRParcelNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowWRParcelNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWRParcelNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0503
     * @tc.name       : testNativeWindowWriteToParcelAbNormal
     * @tc.desc       : testNativeWindowWriteToParcelAbNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowWriteToParcelAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWriteToParcelAbNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0504
     * @tc.name       : testNativeWindowReadFromParcelAbNormal
     * @tc.desc       : testNativeWindowReadFromParcelAbNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowReadFromParcelAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowReadFromParcelAbNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0505
     * @tc.name       : testNativeWindowWRParcelDifferent
     * @tc.desc       : testNativeWindowWRParcelDifferent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowWRParcelDifferent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowWRParcelDifferent();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1700
     * @tc.name       : testNativeWindowNativeWindowFlushBufferNullptr
     * @tc.desc       : testNativeWindowNativeWindowFlushBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeWindowNativeWindowFlushBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1701
     * @tc.name       : testNativeWindowNativeWindowFlushBufferNormal
     * @tc.desc       : testNativeWindowNativeWindowFlushBufferNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowNativeWindowFlushBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1702
     * @tc.name       : testNativeWindowNativeWindowFlushBufferAbnormal
     * @tc.desc       : testNativeWindowNativeWindowFlushBufferAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowFlushBufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1703
     * @tc.name       : testNativeWindowNativeWindowFlushBufferErrorCode
     * @tc.desc       : testNativeWindowNativeWindowFlushBufferErrorCode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowFlushBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowFlushBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0600
     * @tc.name       : testNativeWindowGetLastFlushedBufferV2Nullptr
     * @tc.desc       : testNativeWindowGetLastFlushedBufferV2Nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetLastFlushedBufferV2Nullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferV2Nullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0601
     * @tc.name       : testNativeWindowGetLastFlushedBufferNullptr
     * @tc.desc       : testNativeWindowGetLastFlushedBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetLastFlushedBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0602
     * @tc.name       : testNativeWindowGetLastFlushedBufferV2Normal
     * @tc.desc       : testNativeWindowGetLastFlushedBufferV2Normal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowGetLastFlushedBufferV2Normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferV2Normal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0603
     * @tc.name       : testNativeWindowGetLastFlushedBufferNormal
     * @tc.desc       : testNativeWindowGetLastFlushedBufferNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowGetLastFlushedBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetLastFlushedBufferNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1600
     * @tc.name       : testNativeWindowSetBufferHold
     * @tc.desc       : testNativeWindowSetBufferHold
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowSetBufferHold', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetBufferHold();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0701
     * @tc.name       : testNativeWindowGetNativeObjectMagicNormal
     * @tc.desc       : testNativeWindowGetNativeObjectMagicNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowGetNativeObjectMagicNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetNativeObjectMagicNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0700
     * @tc.name       : testNativeWindowGetNativeObjectMagicNullptr
     * @tc.desc       : testNativeWindowGetNativeObjectMagicNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetNativeObjectMagicNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetNativeObjectMagicNullptr();
      expect(result).assertEqual(0);
      done();
    });



    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0702
     * @tc.name       : testNativeWindowNativeObjectReferenceNullptr
     * @tc.desc       : testNativeWindowNativeObjectReferenceNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeObjectReferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectReferenceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0703
     * @tc.name       : testNativeWindowNativeObjectReferenceNormal
     * @tc.desc       : testNativeWindowNativeObjectReferenceNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowNativeObjectReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectReferenceNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0704
     * @tc.name       : testNativeWindowNativeObjectUnreferenceNullptr
     * @tc.desc       : testNativeWindowNativeObjectUnreferenceNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeObjectUnreferenceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectUnreferenceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0705
     * @tc.name       : testNativeWindowNativeObjectUnreferenceNormal
     * @tc.desc       : testNativeWindowNativeObjectUnreferenceNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeObjectUnreferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeObjectUnreferenceNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0800
     * @tc.name       : testNativeWindowNativeWindowAttachBufferNullptr
     * @tc.desc       : testNativeWindowNativeWindowAttachBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowAttachBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAttachBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0801
     * @tc.name       : testNativeWindowNativeWindowDetachBufferNullptr
     * @tc.desc       : testNativeWindowNativeWindowDetachBufferNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowDetachBufferNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowDetachBufferNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0803
     * @tc.name       : testNativeWindowNativeWindowDetachBufferNormal
     * @tc.desc       : testNativeWindowNativeWindowDetachBufferNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowNativeWindowDetachBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowDetachBufferNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0807
     * @tc.name       : testNativeWindowNativeWindowAttachBufferErrorCode
     * @tc.desc       : testNativeWindowNativeWindowAttachBufferErrorCode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNativeWindowNativeWindowAttachBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAttachBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0802
     * @tc.name       : testNativeWindowNativeWindowAttachBufferNormal
     * @tc.desc       : testNativeWindowNativeWindowAttachBufferNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowNativeWindowAttachBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAttachBufferNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0807
     * @tc.name       : testNativeWindowNativeWindowDetachBufferErrorCode
     * @tc.desc       : testNativeWindowNativeWindowDetachBufferErrorCode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNativeWindowNativeWindowDetachBufferErrorCode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowDetachBufferErrorCode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0804
     * @tc.name       : testNativeWindowNativeWindowAtDetachDifferentBufferNormal
     * @tc.desc       : testNativeWindowNativeWindowAtDetachDifferentBufferNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNativeWindowNativeWindowAtDetachDifferentBufferNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAtDetachDifferentBufferNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0805
     * @tc.name       : testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal
     * @tc.desc       : testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0900
     * @tc.name       : testNativeWindowNativeWindowHandleOptNullptr
     * @tc.desc       : testNativeWindowNativeWindowHandleOptNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeWindowNativeWindowHandleOptNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0901
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0902
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0903
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetFormatNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetFormatNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetFormatNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetFormatNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0904
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0905
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetUsageNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetUsageNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetUsageNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetUsageNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0906
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0907
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetStrideNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetStrideNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetStrideNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetStrideNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0908
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0909
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0910
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0911
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0912
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0913
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetTransformNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetTransformNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetTransformNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetTransformNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0914
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0915
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0916
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0917
     * @tc.name       : testNativeWindowNativeWindowHandleOptGetBufferQueueSize
     * @tc.desc       : testNativeWindowNativeWindowHandleOptGetBufferQueueSize
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNativeWindowNativeWindowHandleOptGetBufferQueueSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptGetBufferQueueSize();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0918
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0919
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0920
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0921
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0922
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0923
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0924
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: number | string = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_0925
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1300
     * @tc.name       : testNativeWindowNativeWindowSetSetScalingModeV2Nullptr
     * @tc.desc       : testNativeWindowNativeWindowSetSetScalingModeV2Nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowSetSetScalingModeV2Nullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetSetScalingModeV2Nullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1301
     * @tc.name       : testNativeWindowNativeWindowSetScalingModeV2ScalingMode
     * @tc.desc       : testNativeWindowNativeWindowSetScalingModeV2ScalingMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowNativeWindowSetScalingModeV2ScalingMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetScalingModeV2ScalingMode();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1500
     * @tc.name       : testNativeWindowGetColorSpaceFirst
     * @tc.desc       : testNativeWindowGetColorSpaceFirst
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetColorSpaceFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetColorSpaceFirst();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1501
     * @tc.name       : testNativeWindowSetColorSpaceNormal
     * @tc.desc       : testNativeWindowSetColorSpaceNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowSetColorSpaceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetColorSpaceNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1502
     * @tc.name       : testNativeWindowSetColorSpaceNullptr
     * @tc.desc       : testNativeWindowSetColorSpaceNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowSetColorSpaceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetColorSpaceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1503
     * @tc.name       : testNativeWindowSetColorSpaceAbnormal
     * @tc.desc       : testNativeWindowSetColorSpaceAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeWindowSetColorSpaceAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetColorSpaceAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1504
     * @tc.name       : testNativeWindowGetColorSpaceNullptr
     * @tc.desc       : testNativeWindowGetColorSpaceNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetColorSpaceNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetColorSpaceNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1505
     * @tc.name       : testNativeWindowGetMetadataValueFirst
     * @tc.desc       : testNativeWindowGetMetadataValueFirst
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetMetadataValueFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetMetadataValueFirst();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1506
     * @tc.name       : testNativeWindowSetDynamicMetadataValue
     * @tc.desc       : testNativeWindowSetDynamicMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNativeWindowSetDynamicMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetDynamicMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1507
     * @tc.name       : testNativeWindowSetMetadataValueTimes
     * @tc.desc       : testNativeWindowSetMetadataValueTimes
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowSetMetadataValueTimes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValueTimes();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1508
     * @tc.name       : testNativeWindowSetStaticMetadataValue
     * @tc.desc       : testNativeWindowSetStaticMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNativeWindowSetStaticMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetStaticMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1509
     * @tc.name       : testNativeWindowSetMetadataValue
     * @tc.desc       : testNativeWindowSetMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testNativeWindowSetMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1510
     * @tc.name       : testNativeWindowSetNullMetadataValue
     * @tc.desc       : testNativeWindowSetNullMetadataValue
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeWindowSetNullMetadataValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetNullMetadataValue();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1511
     * @tc.name       : testNativeWindowSetMetadataValueNullptr
     * @tc.desc       : testNativeWindowSetMetadataValueNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowSetMetadataValueNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValueNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1512
     * @tc.name       : testNativeWindowGetMetadataValueAbnormal
     * @tc.desc       : testNativeWindowGetMetadataValueAbnormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeWindowGetMetadataValueAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetMetadataValueAbnormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1513
     * @tc.name       : testNativeWindowGetMetadataValueNullptr
     * @tc.desc       : testNativeWindowGetMetadataValueNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowGetMetadataValueNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowGetMetadataValueNullptr();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1514
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1515
     * @tc.name       : testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal
     * @tc.desc       : testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal();
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1516
     * @tc.name       : testNativeWindowSetMetadataValue_metadata_type
     * @tc.desc       : testNativeWindowSetMetadataValue_metadata_type
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowSetMetadataValue_metadata_type', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowSetMetadataValue_metadata_type();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1517
     * @tc.name       : testNativeWindowCreateNativeWindow
     * @tc.desc       : testNativeWindowCreateNativeWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowCreateNativeWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowCreateNativeWindow();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1518
     * @tc.name       : testNativeWindowNativeWindowSetSetScalingMode
     * @tc.desc       : testNativeWindowNativeWindowSetSetScalingMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowSetSetScalingMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetSetScalingMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1519
     * @tc.name       : testNativeWindowNativeWindowSetMetaData
     * @tc.desc       : testNativeWindowNativeWindowSetMetaData
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowSetMetaData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetMetaData();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1520
     * @tc.name       : testNativeWindowNativeWindowSetMetaDataSet
     * @tc.desc       : testNativeWindowNativeWindowSetMetaDataSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowSetMetaDataSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetMetaDataSet();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_WINDOW_1521
     * @tc.name       : testNativeWindowNativeWindowSetMetaDataSet
     * @tc.desc       : testNativeWindowNativeWindowSetMetaDataSet
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testNativeWindowNativeWindowSetTunnelHandle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result: number = nativeWindow.testNativeWindowNativeWindowSetTunnelHandle();
      expect(result).assertEqual(0);
      done();
    });
  })
}
