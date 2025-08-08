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
import vsync from 'libnativevsync.so'

export default function nativeVsyncTest() {
  describe('NativeVsyncTest', () => {

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0100
     * @tc.name       : testNativeVSyncCreateNull
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */
    it('testNativeVSyncCreateNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateNull();
      console.info("testNativeVSyncCreateNull result:" + result)
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0101
     * @tc.name       : testNativeVSyncCreateNotEq
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncCreateNotEq', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateNotEq();
      console.info("testNativeVSyncCreateNotEq result:" + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0102
     * @tc.name       : testNativeVSyncCreateNormal
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeVSyncCreateNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncCreateNormal();
      console.info("testNativeVSyncCreateNormal result:" + result)
      expect(result[0]).assertEqual(0);
      // 有错误，再次调用接口调用成功，
      // expect(result[1]).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0103
     * @tc.name       : testNativeVSyncCreateAbnormal
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncCreateAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateAbnormal();
      console.info("testNativeVSyncCreateAbnormal result:" + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0104
     * @tc.name       : testNativeVSyncCreateDifLenth
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */

    it('testNativeVSyncCreateDifLenth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncCreateDifLenth();
      console.info("testNativeVSyncCreateDifLenth result:" + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0105
     * @tc.name       : testNativeVSyncCreateMuch
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeVSyncCreateMuch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateMuch();
      console.info("testNativeVSyncCreateMuch result:" + result)
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0106
     * @tc.name       : testNativeVSyncGetPeriodNullptr
     * @tc.desc       : test OH_NativeVSync_GetPeriod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncGetPeriodNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL00,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriodNullptr();
      console.info("testNativeVSyncGetPeriodNullptr result:" + result);
      expect(result).assertEqual(40001000);
      done();
    });
    
    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0109
     * @tc.name       : testNativeVSyncRequestFrameNullptr
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeVSyncRequestFrameNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncRequestFrameNullptr();
      console.info("testNativeVSyncRequestFrameNullptr result:" + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0110
     * @tc.name       : testNativeVSyncRequestFrameNormal
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeVSyncRequestFrameNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameNormal();
      console.info("testNativeVSyncRequestFrameNormal result:" + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0111
     * @tc.name       : testNativeVSyncRequestFrameParamErr
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 4
     */

    it('testNativeVSyncRequestFrameParamErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameParamErr();
      console.info("testNativeVSyncRequestFrameParamErr result:" + result);
      expect(result).assertEqual(0);
      done();
    });

    it('testOHNativeVSyncCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_CREATE_0200
     * @tc.name       : testOHNativeVSyncCreate002
     * @tc.desc       : test OH_NativeVSync_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateFOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_REQUESTFRAME_0100
     * @tc.name       : testOHNativeVSyncRequestFrame001
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrame001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrame();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_REQUESTFRAME_0200
     * @tc.name       : testOHNativeVSyncRequestFrame002
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrame002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameFOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_REQUESTFRAME_0300
     * @tc.name       : testOHNativeVSyncRequestFrame003
     * @tc.desc       : test OH_NativeVSync_RequestFrame
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrame003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameFTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_GETPERIOD_0100
     * @tc.name       : testOHNativeVSyncGetPeriod001
     * @tc.desc       : test OH_NativeVSync_GetPeriod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncGetPeriod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriod();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_NATIVEVSYNC_GETPERIOD_0100
     * @tc.name       : testOHNativeVSyncGetPeriod002
     * @tc.desc       : test OH_NativeVSync_GetPeriod
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncGetPeriod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL00,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriodFOne();
      expect(result).assertEqual(0);
      done();
    });

   /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_CREATE_ASSOCIATEDWINDOW_0100
     * @tc.name       : testOHNativeVSyncCreateForAssociatedWindowNormal
     * @tc.desc       : test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncCreateForAssociatedWindowNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateForAssociatedWindowNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_CREATE_ASSOCIATEDWINDOW_0200
     * @tc.name       : testOHNativeVSyncCreateForAssociatedWindowAbNormal01
     * @tc.desc       : test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHNativeVSyncCreateForAssociatedWindowAbNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncCreateForAssociatedWindowAbNormal01();
      console.info("testOHNativeVSyncCreateForAssociatedWindowAbNormal result:" + result);
      expect(result[0]).assertEqual(-1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_CREATE_ASSOCIATEDWINDOW_0300
     * @tc.name       : testOHNativeVSyncCreateForAssociatedWindowAbNormal02
     * @tc.desc       : test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHNativeVSyncCreateForAssociatedWindowAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncCreateForAssociatedWindowAbNormal02();
      console.info("testOHNativeVSyncCreateForAssociatedWindowAbNormal result:" + result);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OH_CREATE_ASSOCIATEDWINDOW_0400
     * @tc.name       : testOHNativeVSyncCreateForAssociatedWindowAbNormal03
     * @tc.desc       : test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHNativeVSyncCreateForAssociatedWindowAbNormal03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateForAssociatedWindowAbNormal03();
      console.info("testOHNativeVSyncCreateForAssociatedWindowAbNormal result:" + result);
      expect(result).assertEqual(0);
      done();
    });
	
	/**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OHNativeVSyncDVSyncSwitch
     * @tc.name       : testOHNativeVSyncDVSyncSwitch
     * @tc.desc       : test OHNativeVSyncDVSyncSwitch
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncDVSyncSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncDVSyncSwitch();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_OHNativeVSyncDVSyncSwitchNullptr
     * @tc.name       : testOHNativeVSyncDVSyncSwitchNullptr
     * @tc.desc       : test OHNativeVSyncDVSyncSwitchNullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncDVSyncSwitchNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncDVSyncSwitchNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_MultiCallbackNormal_0100
     * @tc.name       : testOHNativeVSyncMultiCallbackNormal
     * @tc.desc       : test OHNativeVSyncMultiCallbackNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrameWithMultiCallbackNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncRequestFrameWithMultiCallbackNormal();
      console.info("testOHNativeVSyncRequestFrameWithMultiCallbackNormal result:" + result);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });
    
    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_MultiCallbackNormal_0200
     * @tc.name       : testOHNativeVSyncMultiCallbackNormal01
     * @tc.desc       : test OHNativeVSyncMultiCallbackNormal01
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHNativeVSyncRequestFrameWithMultiCallbackNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncRequestFrameWithMultiCallbackNormal01();
      console.info("testOHNativeVSyncRequestFrameWithMultiCallbackNormal01 result:" + result);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_MultiCallbackAbNormal_0100
     * @tc.name       : testOHNativeVSyncMultiCallbackAbNormal
     * @tc.desc       : test testOHNativeVSyncMultiCallbackAbNormal
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHNativeVSyncRequestFrameWithMultiCallbackAbNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncRequestFrameWithMultiCallbackAbNormal();
      console.info("testOHNativeVSyncRequestFrameWithMultiCallbackAbNormal result:" + result);
      expect(result[0]).assertEqual(40001000);
      expect(result[1]).assertEqual(40001000);
      expect(result[2]).assertEqual(40001000);
      done();
    });

    /**
     * @tc.number     : SUB_GRAPHIC_GRAPHIC_2D_NATIVE_VSYNC_MultiCallbackAbNormal_0200
     * @tc.name       : testOHNativeVSyncMultiCallbackAbNormal01
     * @tc.desc       : test testOHNativeVSyncMultiCallbackAbNormal01
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOHNativeVSyncRequestFrameWithMultiCallbackAbNormal01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncRequestFrameWithMultiCallbackAbNormal01();
      console.info("testOHNativeVSyncRequestFrameWithMultiCallbackAbNormal01 result:" + result);
      expect(result[0]).assertEqual(40001000);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      done();
    });
  })
}