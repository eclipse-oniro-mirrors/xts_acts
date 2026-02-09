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
     * @tc.name   testNativeVSyncCreateNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0100
     * @tc.desc   test OH_NativeVSync_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncCreateNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateNull();
      console.info("testNativeVSyncCreateNull result:" + result)
      expect(result).assertEqual(-1);
      done();
    });


    /**
     * @tc.name   testNativeVSyncCreateNotEq
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0200
     * @tc.desc   testNativeVSyncCreateNotEq
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncCreateNotEq', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateNotEq();
      console.info("testNativeVSyncCreateNotEq result:" + result)
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeVSyncCreateNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0300
     * @tc.desc   testNativeVSyncCreateNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testNativeVSyncCreateAbnormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0400
     * @tc.desc   testNativeVSyncCreateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncCreateAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateAbnormal();
      console.info("testNativeVSyncCreateAbnormal result:" + result)
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeVSyncCreateDifLenth
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0500
     * @tc.desc   testNativeVSyncCreateDifLenth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncCreateDifLenth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncCreateDifLenth();
      console.info("testNativeVSyncCreateDifLenth result:" + result)
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeVSyncCreateMuch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0600
     * @tc.desc   testNativeVSyncCreateMuch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncCreateMuch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateMuch();
      console.info("testNativeVSyncCreateMuch result:" + result)
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeVSyncGetPeriodNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0700
     * @tc.desc   testNativeVSyncGetPeriodNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncGetPeriodNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriodNullptr();
      console.info("testNativeVSyncGetPeriodNullptr result:" + result);
      expect(result).assertEqual(40001000);
      done();
    });
    

    /**
     * @tc.name   testNativeVSyncRequestFrameNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0800
     * @tc.desc   testNativeVSyncRequestFrameNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncRequestFrameNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncRequestFrameNullptr();
      console.info("testNativeVSyncRequestFrameNullptr result:" + result);
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeVSyncRequestFrameNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_0900
     * @tc.desc   testNativeVSyncRequestFrameNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncRequestFrameNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameNormal();
      console.info("testNativeVSyncRequestFrameNormal result:" + result);
      expect(result).assertEqual(0);
      done();
    });


    /**
     * @tc.name   testNativeVSyncRequestFrameParamErr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1000
     * @tc.desc   testNativeVSyncRequestFrameParamErr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeVSyncRequestFrameParamErr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameParamErr();
      console.info("testNativeVSyncRequestFrameParamErr result:" + result);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncCreate001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1100
     * @tc.desc   testOHNativeVSyncCreate001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncCreate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncCreate002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1200
     * @tc.desc   test OH_NativeVSync_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncCreate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateFOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncRequestFrame001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1300
     * @tc.desc   test OH_NativeVSync_RequestFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncRequestFrame001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrame();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncRequestFrame002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1400
     * @tc.desc   test OH_NativeVSync_RequestFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncRequestFrame002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameFOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncRequestFrame003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1500
     * @tc.desc   test OH_NativeVSync_RequestFrame
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncRequestFrame003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncRequestFrameFTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncGetPeriod001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1600
     * @tc.desc   test OH_NativeVSync_GetPeriod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncGetPeriod001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriod();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncGetPeriod002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1700
     * @tc.desc   test OH_NativeVSync_GetPeriod
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncGetPeriod002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncGetPeriodFOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncCreateForAssociatedWindowNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1800
     * @tc.desc   test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncCreateForAssociatedWindowNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateForAssociatedWindowNormal();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncCreateForAssociatedWindowAbNormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_1900
     * @tc.desc   test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testOHNativeVSyncCreateForAssociatedWindowAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2000
     * @tc.desc   test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testOHNativeVSyncCreateForAssociatedWindowAbNormal03
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2100
     * @tc.desc   test OH_NativeVSync_Create_ForAssociatedWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncCreateForAssociatedWindowAbNormal03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncCreateForAssociatedWindowAbNormal03();
      console.info("testOHNativeVSyncCreateForAssociatedWindowAbNormal result:" + result);
      expect(result).assertEqual(0);
      done();
    });
	
    /**
     * @tc.name   testOHNativeVSyncDVSyncSwitch
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2200
     * @tc.desc   test OHNativeVSyncDVSyncSwitch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncDVSyncSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = vsync.oHNativeVSyncDVSyncSwitch();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncDVSyncSwitchNullptr
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2300
     * @tc.desc   test OHNativeVSyncDVSyncSwitchNullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncDVSyncSwitchNullptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncDVSyncSwitchNullptr();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncRequestFrameWithMultiCallbackNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2400
     * @tc.desc   test OHNativeVSyncMultiCallbackNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testOHNativeVSyncRequestFrameWithMultiCallbackNormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2500
     * @tc.desc   test OHNativeVSyncMultiCallbackNormal01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testOHNativeVSyncRequestFrameWithMultiCallbackAbNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2600
     * @tc.desc   test testOHNativeVSyncMultiCallbackAbNormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testOHNativeVSyncRequestFrameWithMultiCallbackAbNormal01
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2700
     * @tc.desc   test testOHNativeVSyncMultiCallbackAbNormal01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   testOHNativeVSyncSetExpectedFrameRateRange001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2800
     * @tc.desc   test OHNativeVSyncSetExpectedFrameRateRange001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncSetExpectedFrameRateRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncSetExpectedFrameRateRange001();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncSetExpectedFrameRateRange002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_2900
     * @tc.desc   test OHNativeVSyncSetExpectedFrameRateRange002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncSetExpectedFrameRateRange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: number = vsync.oHNativeVSyncSetExpectedFrameRateRange002();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHNativeVSyncSetExpectedFrameRateRange003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_3000
     * @tc.desc   test OHNativeVSyncSetExpectedFrameRateRange003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHNativeVSyncSetExpectedFrameRateRange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result: Array<number> = vsync.oHNativeVSyncSetExpectedFrameRateRange003();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testNativeErrorCodeCover
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_VSYNC_3100
     * @tc.desc   test ErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeErrorCodeCover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let result: number = vsync.oHNativeErrorCodeCover();
        expect(result).assertEqual(0);
        done();
      });
  })
}