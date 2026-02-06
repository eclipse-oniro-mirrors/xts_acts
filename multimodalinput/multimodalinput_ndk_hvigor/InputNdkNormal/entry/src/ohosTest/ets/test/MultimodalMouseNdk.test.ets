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
     * @tc.number: SUB_MMI_Input_Api_GetPointerLocation_0100
     * @tc.name: SUB_MMI_Input_Api_GetPointerLocation_0100
     * @tc.desc: OH_Input_GetPointerLocation Interface testing.
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_GetPointerLocation_0200
     * @tc.name: SUB_MMI_Input_Api_GetPointerLocation_0200
     * @tc.desc: OH_Input_GetPointerLocation Interface testing to set displayId as nullptr.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_GetPointerLocation_0300
     * @tc.name: SUB_MMI_Input_Api_GetPointerLocation_0300
     * @tc.desc: OH_Input_GetPointerLocation Interface testing to set displayX as nullptr.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_GetPointerLocation_0400
     * @tc.name: SUB_MMI_Input_Api_GetPointerLocation_0400
     * @tc.desc: OH_Input_GetPointerLocation Interface testing to set displayY as nullptr.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_GetPointerLocation_0500
     * @tc.name: SUB_MMI_Input_Api_GetPointerLocation_0500
     * @tc.desc: OH_Input_GetPointerLocation Interface testing to set displayId displayX displayY as nullptr.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_RequestInjection_0100
     * @tc.name: SUB_MMI_Input_Api_RequestInjection_0100
     * @tc.desc: OH_Input_RequestInjection Interface test.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_QueryAuthorizedStatus_0100
     * @tc.name: SUB_MMI_Input_Api_QueryAuthorizedStatus_0100
     * @tc.desc: OH_Input_QueryAuthorizedStatus Interface test.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_InjectMouseEventGlobal_0100
     * @tc.name: SUB_MMI_Input_Api_InjectMouseEventGlobal_0100
     * @tc.desc: OH_Input_InjectMouseEventGlobal Interface testing to set globalX globalY as 100.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_InjectMouseEventGlobal_0200
     * @tc.name: SUB_MMI_Input_Api_InjectMouseEventGlobal_0200
     * @tc.desc: OH_Input_GetMouseEventGlobalX Interface testing to set globalX as 100.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
     * @tc.number: SUB_MMI_Input_Api_InjectMouseEventGlobal_0300
     * @tc.name: SUB_MMI_Input_Api_InjectMouseEventGlobal_0300
     * @tc.desc: OH_Input_GetMouseEventGlobalY Interface testing to set globalY as 100.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
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
  });
}