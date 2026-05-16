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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import mouse from 'libmousendk.so';

export default function MultimodalMouseNdkTest() {
  describe('MultimodalMouseNdkTest', () => {

    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerLocation_0100
     * @tc.number SUB_MMI_Input_Api_GetPointerLocation_0100
     * @tc.desc   OH_Input_GetPointerLocation Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_GetPointerLocation_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerLocation_0100';
      console.info(`${caseName} start to test OH_Input_GetPointerLocation`);
      try {
        let data = mouse.GetPointerLocation1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetPointerLocation`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerLocation_0200
     * @tc.number SUB_MMI_Input_Api_GetPointerLocation_0200
     * @tc.desc   OH_Input_GetPointerLocation Interface testing to set displayId as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerLocation_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerLocation_0200';
      console.info(`${caseName} start to test OH_Input_GetPointerLocation`);
      try {
        let data = mouse.GetPointerLocation2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetPointerLocation`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerLocation_0300
     * @tc.number SUB_MMI_Input_Api_GetPointerLocation_0300
     * @tc.desc   OH_Input_GetPointerLocation Interface testing to set displayX as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerLocation_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerLocation_0300';
      console.info(`${caseName} start to test OH_Input_GetPointerLocation`);
      try {
        let data = mouse.GetPointerLocation3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetPointerLocation`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerLocation_0400
     * @tc.number SUB_MMI_Input_Api_GetPointerLocation_0400
     * @tc.desc   OH_Input_GetPointerLocation Interface testing to set displayY as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerLocation_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerLocation_0400';
      console.info(`${caseName} start to test OH_Input_GetPointerLocation`);
      try {
        let data = mouse.GetPointerLocation4();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetPointerLocation`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerLocation_0500
     * @tc.number SUB_MMI_Input_Api_GetPointerLocation_0500
     * @tc.desc   OH_Input_GetPointerLocation Interface testing to set displayId displayX displayY as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerLocation_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerLocation_0500';
      console.info(`${caseName} start to test OH_Input_GetPointerLocation`);
      try {
        let data = mouse.GetPointerLocation5();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetPointerLocation`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_RequestInjection_0100
     * @tc.number SUB_MMI_Input_Api_RequestInjection_0100
     * @tc.desc   OH_Input_RequestInjection Interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_RequestInjection_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_RequestInjection_0100';
      console.info(`${caseName} start to test OH_Input_RequestInjection`);
      try {
        let data = mouse.RequestInjection1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RequestInjection`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_QueryAuthorizedStatus_0100
     * @tc.number SUB_MMI_Input_Api_QueryAuthorizedStatus_0100
     * @tc.desc   OH_Input_QueryAuthorizedStatus Interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_QueryAuthorizedStatus_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_QueryAuthorizedStatus_0100';
      console.info(`${caseName} start to test OH_Input_QueryAuthorizedStatus`);
      try {
        let data = mouse.QueryAuthorizedStatus1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_QueryAuthorizedStatus`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InjectMouseEventGlobal_0100
     * @tc.number SUB_MMI_Input_Api_InjectMouseEventGlobal_0100
     * @tc.desc   OH_Input_InjectMouseEventGlobal Interface testing to set globalX globalY as 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_InjectMouseEventGlobal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_InjectMouseEventGlobal_0100';
      console.info(`${caseName} start to test OH_Input_InjectMouseEventGlobal`);
      try {
        let data = mouse.InjectMouseEventGlobal1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_InjectMouseEventGlobal`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InjectMouseEventGlobal_0200
     * @tc.number SUB_MMI_Input_Api_InjectMouseEventGlobal_0200
     * @tc.desc   OH_Input_GetMouseEventGlobalX Interface testing to set globalX as 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_InjectMouseEventGlobal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_InjectMouseEventGlobal_0200';
      console.info(`${caseName} start to test OH_Input_GetMouseEventGlobalX`);
      try {
        let data = mouse.InjectMouseEventGlobal2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventGlobalX`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_InjectMouseEventGlobal_0300
     * @tc.number SUB_MMI_Input_Api_InjectMouseEventGlobal_0300
     * @tc.desc   OH_Input_GetMouseEventGlobalY Interface testing to set globalY as 100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_InjectMouseEventGlobal_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_InjectMouseEventGlobal_0300';
      console.info(`${caseName} start to test OH_Input_GetMouseEventGlobalY`);
      try {
        let data = mouse.InjectMouseEventGlobal3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventGlobalY`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_SetPointerVisibleNdk_0100
     * @tc.number SUB_MMI_Input_Api_SetPointerVisibleNdk_0100
     * @tc.desc   OH_Input_SetPointerVisible Interface testing to set visible as false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_SetPointerVisibleNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_SetPointerVisibleNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.SetPointerVisible1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_SetPointerVisibleNdk_0200
     * @tc.number SUB_MMI_Input_Api_SetPointerVisibleNdk_0200
     * @tc.desc   OH_Input_SetPointerVisible Interface testing to set visible as true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_SetPointerVisibleNdk_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_SetPointerVisibleNdk_0200';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.SetPointerVisible2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerStyleNdk_0100
     * @tc.number SUB_MMI_Input_Api_GetPointerStyleNdk_0100
     * @tc.desc   OH_Input_GetPointerStyle Interface testing to set windowId as -1, pointerStyle as -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerStyleNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerStyleNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.GetPointerStyle1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerStyleNdk_0200
     * @tc.number SUB_MMI_Input_Api_GetPointerStyleNdk_0200
     * @tc.desc   OH_Input_GetPointerStyle Interface testing to set windowId as 100000, pointerStyle as -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerStyleNdk_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerStyleNdk_0200';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.GetPointerStyle2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerStyleNdk_0300
     * @tc.number SUB_MMI_Input_Api_GetPointerStyleNdk_0300
     * @tc.desc   OH_Input_GetPointerStyle Interface testing to set windowId as -2, pointerStyle as -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerStyleNdk_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerStyleNdk_0300';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.GetPointerStyle3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_GetPointerStyleNdk_0400
     * @tc.number SUB_MMI_Input_Api_GetPointerStyleNdk_0400
     * @tc.desc   OH_Input_GetPointerStyle Interface testing to set windowId as 0, pointerStyle as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MMI_Input_Api_GetPointerStyleNdk_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_GetPointerStyleNdk_0400';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.GetPointerStyle4();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_SetPointerStyleNdk_0100
     * @tc.number SUB_MMI_Input_Api_SetPointerStyleNdk_0100
     * @tc.desc   OH_Input_SetPointerStyle Interface testing to set windowId as -1, pointerStyle as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_SetPointerStyleNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_SetPointerStyleNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.SetPointerStyle1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_SetPointerStyleNdk_0200
     * @tc.number SUB_MMI_Input_Api_SetPointerStyleNdk_0200
     * @tc.desc   OH_Input_SetPointerStyle Interface testing to set windowId as 100000, pointerStyle as 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_SetPointerStyleNdk_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_SetPointerStyleNdk_0200';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.SetPointerStyle2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_SetPointerStyleNdk_0300
     * @tc.number SUB_MMI_Input_Api_SetPointerStyleNdk_0300
     * @tc.desc   OH_Input_SetPointerStyle Interface testing to set windowId as 0, pointerStyle as -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_SetPointerStyleNdk_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_SetPointerStyleNdk_0300';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.SetPointerStyle3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_SetPointerStyleNdk_0500
     * @tc.number SUB_MMI_Input_Api_SetPointerStyleNdk_0500
     * @tc.desc   OH_Input_SetPointerStyle Interface testing to set windowId as 0, pointerStyle as 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_SetPointerStyleNdk_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_SetPointerStyleNdk_0500';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.SetPointerStyle5();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0100
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0100
     * @tc.desc   OH_Input_CustomCursor_Create Interface testing to set pixelMap as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0200
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0200
     * @tc.desc   OH_Input_CustomCursor_Destroy Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0200';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0300
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0300
     * @tc.desc   OH_Input_CustomCursor_GetPixelMap Interface testing to set customCursor as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0300';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0400
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0400
     * @tc.desc   OH_Input_CustomCursor_GetPixelMap Interface testing to set pixelMap as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0400';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor4();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0500
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0500
     * @tc.desc   OH_Input_CustomCursor_GetAnchor Interface testing to set customCursor as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0500';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor5();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0600
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0600
     * @tc.desc   OH_Input_CustomCursor_GetAnchor Interface testing to set anchorX as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0600';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor6();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0700
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0700
     * @tc.desc   OH_Input_CustomCursor_GetAnchor Interface testing to set anchorY as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0700';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor7();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0800
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0800
     * @tc.desc   OH_Input_CursorConfig_IsFollowSystem Interface testing to set isfollowSystem as true..
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0800';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor8();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_0900
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_0900
     * @tc.desc   OH_Input_CursorConfig_IsFollowSystem Interface testing to set cursorConfig as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_0900';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor9();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1000
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1000
     * @tc.desc   OH_Input_CursorConfig_IsFollowSystem Interface testing to set isfollowSystem as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1000';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor10();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1100
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1100
     * @tc.desc   OH_Input_CursorConfig_IsFollowSystem Interface testing to set isfollowSystem as false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor11();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1200
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1200
     * @tc.desc   OH_Input_SetCustomCursor Interface testing to set windowId as -1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1200';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor12();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1300
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1300
     * @tc.desc   OH_Input_SetCustomCursor Interface testing to set windowId as 10000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1300';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor13();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0100
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0100
     * @tc.desc   OH_Input_CursorInfo_Create Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0200
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0200
     * @tc.desc   OH_Input_CursorInfo_Destroy Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0200';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0300
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0300
     * @tc.desc   CursorInfo four attribute Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0300';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0400
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0400
     * @tc.desc   CursorInfo four attribute Interface testing to set cursorInfo as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0400';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo4();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0500
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0500
     * @tc.desc   CursorInfo four attribute Interface testing to set attribute as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0500';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo5();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0600
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0600
     * @tc.desc   OH_Input_GetMouseEventCursorInfo Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0600';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo6();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0700
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0700
     * @tc.desc   OH_Input_GetMouseEventCursorInfo Interface testing to set mouseEvent as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0700';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo7();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0800
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0800
     * @tc.desc   OH_Input_GetMouseEventCursorInfo Interface testing to set cursorInfo as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0800';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo8();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_0900
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_0900
     * @tc.desc   OH_Input_GetCursorInfo Interface testing to set pixelmap as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_0900';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo9();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_1000
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_1000
     * @tc.desc   OH_Input_GetCursorInfo Interface testing to set cursorInfo as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_1000';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo10();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_1100
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_1100
     * @tc.desc   OH_Input_GetCursorInfo Interface testing to set all parameter as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_1100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo11();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_1200
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_1200
     * @tc.desc   OH_Input_GetCursorInfo Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_1200';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo12();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
    
    /**
     * @tc.name   SUB_MMI_Input_Api_CursorInfoNdk_1300
     * @tc.number SUB_MMI_Input_Api_CursorInfoNdk_1300
     * @tc.desc   CursorInfo four attribute Interface testing to set attribute as nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CursorInfoNdk_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CursorInfoNdk_1300';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CursorInfo13();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1400
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1400
     * @tc.desc   OH_Input_SetCustomCursor Interface testing to set windowId as 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1400';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor14();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1500
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1500
     * @tc.desc   OH_Input_SetCustomCursor Interface testing INPUT_SERVICE_EXCEPTION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1500';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor15();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1600
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1600
     * @tc.desc   OH_Input_CursorConfig_Create Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1600';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor16();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1700
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1700
     * @tc.desc   OH_Input_CustomCursor_GetAnchor Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1700';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor17();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CustomCursorNdk_1800
     * @tc.number SUB_MMI_Input_Api_CustomCursorNdk_1800
     * @tc.desc   OH_Input_CustomCursor_GetPixelMap Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CustomCursorNdk_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CustomCursorNdk_1800';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CustomCursor18();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CreateDeviceInfoNdk_0100
     * @tc.number SUB_MMI_Input_Api_CreateDeviceInfoNdk_0100
     * @tc.desc   OH_Input_CreateDeviceInfo Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CreateDeviceInfoNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CreateDeviceInfoNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CreateDeviceInfo1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_Api_CreateHotkeyNdk_0100
     * @tc.number SUB_MMI_Input_Api_CreateHotkeyNdk_0100
     * @tc.desc   OH_Input_CreateHotkey Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_Api_CreateHotkeyNdk_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_CreateHotkeyNdk_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.CreateHotkey1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_GetIntervalSinceLastInput_0100
     * @tc.number SUB_MMI_Input_GetIntervalSinceLastInput_0100
     * @tc.desc   OH_Input_GetIntervalSinceLastInput Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_GetIntervalSinceLastInput_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_GetIntervalSinceLastInput_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.GetInterSinceLastInput1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_RemoveKeyEventHook_0100
     * @tc.number SUB_MMI_Input_RemoveKeyEventHook_0100
     * @tc.desc   OH_Input_RemoveKeyEventHook Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_RemoveKeyEventHook_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_RemoveKeyEventHook_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.RemoveKeyEventHook1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_DispatchToNextHandler_0100
     * @tc.number SUB_MMI_Input_DispatchToNextHandler_0100
     * @tc.desc   OH_Input_DispatchToNextHandler Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_DispatchToNextHandler_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_DispatchToNextHandler_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.DispatchToNextHandler1();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });

    /**
     * @tc.name   SUB_MMI_Input_GetKeyEventId_0100
     * @tc.number SUB_MMI_Input_GetKeyEventId_0100
     * @tc.desc   OH_Input_GetKeyEventId Interface testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MMI_Input_GetKeyEventId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_GetKeyEventId_0100';
      console.info(`${caseName} start to test`);
      try {
        let data = mouse.GetKeyEventId();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        expect(data).assertEqual(1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} end to test`);
    });
  });
}