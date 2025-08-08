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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import input from 'libinputndksys.so';

export default function MultimodalInputNdkSysTest() {
  describe('MultimodalInputNdkSysTest', () => {

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
     * @tc.number: SUB_MMI_Input_Api_NdkSys_CreateAxisEvent_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_CreateAxisEvent_0100
     * @tc.desc: OH_Input_CreateAxisEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_CreateAxisEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_CreateAxisEvent_0100';
      console.info(`${caseName} start to test OH_Input_CreateAxisEvent`);
      try {
        let data = input.CreateAxisEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateAxisEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0100
     * @tc.desc: OH_Input_SetAxisEventAction Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventAction`);
      try {
        let data = input.SetAxisEventAction();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0100
     * @tc.desc: OH_Input_GetAxisEventAction Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAction`);
      try {
        let data = input.GetAxisEventAction();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0100
     * @tc.desc: OH_Input_SetAxisEventDisplayX Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventDisplayX`);
      try {
        let data = input.SetAxisEventDisplayX();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventDisplayX`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0100
     * @tc.desc: OH_Input_GetAxisEventDisplayX Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventDisplayX`);
      try {
        let data = input.GetAxisEventDisplayX();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventDisplayX`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0100
     * @tc.desc: OH_Input_SetAxisEventDisplayY Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventDisplayY`);
      try {
        let data = input.SetAxisEventDisplayY();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0100
     * @tc.desc: OH_Input_GetAxisEventDisplayY Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventDisplayY`);
      try {
        let data = input.GetAxisEventDisplayY();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0100
     * @tc.desc: OH_Input_SetAxisEventAxisValue Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventAxisValue`);
      try {
        let data = input.SetAxisEventAxisValue();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0100
     * @tc.desc: OH_Input_GetAxisEventAxisValue Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAxisValue`);
      try {
        let data = input.GetAxisEventAxisValue();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0100
     * @tc.desc: OH_Input_SetAxisEventActionTime Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventActionTime`);
      try {
        let data = input.SetAxisEventActionTime();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0100
     * @tc.desc: OH_Input_GetAxisEventActionTime Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventActionTime`);
      try {
        let data = input.GetAxisEventActionTime();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0100
     * @tc.desc: OH_Input_SetAxisEventType Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventType`);
      try {
        let data = input.SetAxisEventType();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0100
     * @tc.desc: OH_Input_GetAxisEventType Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventType`);
      try {
        let data = input.GetAxisEventType();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0100
     * @tc.desc: OH_Input_SetAxisEventSourceType Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventSourceType`);
      try {
        let data = input.SetAxisEventSourceType();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventSourceType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0100
     * @tc.desc: OH_Input_GetAxisEventSourceType Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventSourceType`);
      try {
        let data = input.GetAxisEventSourceType();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventSourceType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0100
     * @tc.desc: OH_Input_DestroyAxisEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0100';
      console.info(`${caseName} start to test OH_Input_DestroyAxisEvent`);
      try {
        let data = input.DestroyAxisEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyAxisEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0200
     * @tc.desc: OH_Input_DestroyAxisEvent Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_DestroyAxisEvent_0200';
      console.info(`${caseName} start to test OH_Input_DestroyAxisEvent`);
      try {
        let data = input.DestroyAxisEvent2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyAxisEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0200
     * @tc.desc: OH_Input_SetAxisEventAction Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventAction_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventAction`);
      try {
        let data = input.SetAxisEventAction2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0200
     * @tc.desc: OH_Input_GetAxisEventAction Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0200';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAction`);
      try {
        let data = input.GetAxisEventAction2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0300
     * @tc.desc: OH_Input_GetAxisEventAction Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAction_0300';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAction`);
      try {
        let data = input.GetAxisEventAction3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0200
     * @tc.desc: OH_Input_SetAxisEventDisplayX Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayX_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventDisplayX`);
      try {
        let data = input.SetAxisEventDisplayX2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventDisplayX`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0200
     * @tc.desc: OH_Input_GetAxisEventDisplayX Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0200';
      console.info(`${caseName} start to test OH_Input_GetAxisEventDisplayX`);
      try {
        let data = input.GetAxisEventDisplayX2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventDisplayX`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0300
     * @tc.desc: OH_Input_GetAxisEventDisplayX Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayX_0300';
      console.info(`${caseName} start to test OH_Input_GetAxisEventDisplayX`);
      try {
        let data = input.GetAxisEventDisplayX3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventDisplayX`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0200
     * @tc.desc: OH_Input_SetAxisEventDisplayY Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventDisplayY_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventDisplayY`);
      try {
        let data = input.SetAxisEventDisplayY2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0200
     * @tc.desc: OH_Input_GetAxisEventDisplayY Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0200';
      console.info(`${caseName} start to test OH_Input_GetAxisEventDisplayY`);
      try {
        let data = input.GetAxisEventDisplayY2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0300
     * @tc.desc: OH_Input_GetAxisEventDisplayY Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0300';
      console.info(`${caseName} start to test OH_Input_GetAxisEventDisplayY`);
      try {
        let data = input.GetAxisEventDisplayY3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0400
     * @tc.desc: OH_Input_GetAxisEventDisplayY Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventDisplayY_0400';
      console.info(`${caseName} start to test OH_Input_GetAxisEventDisplayY`);
      try {
        let data = input.GetAxisEventDisplayY4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0200
     * @tc.desc: OH_Input_SetAxisEventAxisValue Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventAxisValue_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventAxisValue`);
      try {
        let data = input.SetAxisEventAxisValue2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0200
     * @tc.desc: OH_Input_GetAxisEventAxisValue Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0200';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAxisValue`);
      try {
        let data = input.GetAxisEventAxisValue2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0300
     * @tc.desc: OH_Input_GetAxisEventAxisValue Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0300';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAxisValue`);
      try {
        let data = input.GetAxisEventAxisValue3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0400
     * @tc.desc: OH_Input_GetAxisEventAxisValue Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0400';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAxisValue`);
      try {
        let data = input.GetAxisEventAxisValue4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0500
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0500
     * @tc.desc: OH_Input_GetAxisEventAxisValue Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventAxisValue_0500';
      console.info(`${caseName} start to test OH_Input_GetAxisEventAxisValue`);
      try {
        let data = input.GetAxisEventAxisValue5();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0200
     * @tc.desc: OH_Input_SetAxisEventActionTime Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventActionTime_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventActionTime`);
      try {
        let data = input.SetAxisEventActionTime2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0200
     * @tc.desc: OH_Input_GetAxisEventActionTime Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0200';
      console.info(`${caseName} start to test OH_Input_GetAxisEventActionTime`);
      try {
        let data = input.GetAxisEventActionTime2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0300
     * @tc.desc: OH_Input_GetAxisEventActionTime Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0300';
      console.info(`${caseName} start to test OH_Input_GetAxisEventActionTime`);
      try {
        let data = input.GetAxisEventActionTime3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0400
     * @tc.desc: OH_Input_GetAxisEventActionTime Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventActionTime_0400';
      console.info(`${caseName} start to test OH_Input_GetAxisEventActionTime`);
      try {
        let data = input.GetAxisEventActionTime4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0200
     * @tc.desc: OH_Input_SetAxisEventType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventType_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventType`);
      try {
        let data = input.SetAxisEventType2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0200
     * @tc.desc: OH_Input_GetAxisEventType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0200';
      console.info(`${caseName} start to test OH_Input_GetAxisEventType`);
      try {
        let data = input.GetAxisEventType2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0300
     * @tc.desc: OH_Input_GetAxisEventType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0300';
      console.info(`${caseName} start to test OH_Input_GetAxisEventType`);
      try {
        let data = input.GetAxisEventType3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0400
     * @tc.desc: OH_Input_GetAxisEventType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventType_0400';
      console.info(`${caseName} start to test OH_Input_GetAxisEventType`);
      try {
        let data = input.GetAxisEventType4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0200
     * @tc.desc: OH_Input_SetAxisEventSourceType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventSourceType_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventSourceType`);
      try {
        let data = input.SetAxisEventSourceType2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventSourceType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0200
     * @tc.desc: OH_Input_GetAxisEventSourceType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0200';
      console.info(`${caseName} start to test OH_Input_GetAxisEventSourceType`);
      try {
        let data = input.GetAxisEventSourceType2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventSourceType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0300
     * @tc.desc: OH_Input_GetAxisEventSourceType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0300';
      console.info(`${caseName} start to test OH_Input_GetAxisEventSourceType`);
      try {
        let data = input.GetAxisEventSourceType3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventSourceType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0400
     * @tc.desc: OH_Input_GetAxisEventSourceType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventSourceType_0400';
      console.info(`${caseName} start to test OH_Input_GetAxisEventSourceType`);
      try {
        let data = input.GetAxisEventSourceType4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventSourceType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0100
     * @tc.desc: OH_Input_AddKeyEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddKeyEventMonitor`);
      try {
        let data = input.AddKeyEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0100
     * @tc.desc: OH_Input_RemoveKeyEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventMonitor`);
      try {
        let data = input.RemoveKeyEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0200
     * @tc.desc: OH_Input_AddKeyEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_AddKeyEventMonitor`);
      try {
        let data = input.AddKeyEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0200
     * @tc.desc: OH_Input_RemoveKeyEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventMonitor`);
      try {
        let data = input.RemoveKeyEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0300
     * @tc.desc: OH_Input_RemoveKeyEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventMonitor`);
      try {
        let data = input.RemoveKeyEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0300
     * @tc.desc: OH_Input_AddKeyEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddKeyEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_AddKeyEventMonitor`);
      try {
        let data = input.AddKeyEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0400
     * @tc.desc: OH_Input_RemoveKeyEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveKeyEventMonitor_0400';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventMonitor`);
      try {
        let data = input.RemoveKeyEventMonitor4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0100
     * @tc.desc: OH_Input_AddMouseEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddMouseEventMonitor`);
      try {
        let data = input.AddMouseEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddMouseEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0100
     * @tc.desc: OH_Input_RemoveMouseEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_RemoveMouseEventMonitor`);
      try {
        let data = input.RemoveMouseEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveMouseEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0200
     * @tc.desc: OH_Input_AddMouseEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_AddMouseEventMonitor`);
      try {
        let data = input.AddMouseEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddMouseEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0200
     * @tc.desc: OH_Input_RemoveMouseEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_RemoveMouseEventMonitor`);
      try {
        let data = input.RemoveMouseEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveMouseEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0300
     * @tc.desc: OH_Input_RemoveMouseEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_RemoveMouseEventMonitor`);
      try {
        let data = input.RemoveMouseEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveMouseEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0300
     * @tc.desc: OH_Input_AddMouseEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddMouseEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_AddMouseEventMonitor`);
      try {
        let data = input.AddMouseEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddMouseEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0400
     * @tc.desc: OH_Input_RemoveMouseEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveMouseEventMonitor_0400';
      console.info(`${caseName} start to test OH_Input_RemoveMouseEventMonitor`);
      try {
        let data = input.RemoveMouseEventMonitor4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveMouseEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0100
     * @tc.desc: OH_Input_AddTouchEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddTouchEventMonitor`);
      try {
        let data = input.AddTouchEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddTouchEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0100
     * @tc.desc: OH_Input_RemoveTouchEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_RemoveTouchEventMonitor`);
      try {
        let data = input.RemoveTouchEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveTouchEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0200
     * @tc.desc: OH_Input_AddTouchEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_AddTouchEventMonitor`);
      try {
        let data = input.AddTouchEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddTouchEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0200
     * @tc.desc: OH_Input_RemoveTouchEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_RemoveTouchEventMonitor`);
      try {
        let data = input.RemoveTouchEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveTouchEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0300
     * @tc.desc: OH_Input_RemoveTouchEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_RemoveTouchEventMonitor`);
      try {
        let data = input.RemoveTouchEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveTouchEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0300
     * @tc.desc: OH_Input_AddTouchEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddTouchEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_AddTouchEventMonitor`);
      try {
        let data = input.AddTouchEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddTouchEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0400
     * @tc.desc: OH_Input_RemoveTouchEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveTouchEventMonitor_0400';
      console.info(`${caseName} start to test OH_Input_RemoveTouchEventMonitor`);
      try {
        let data = input.RemoveTouchEventMonitor4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveTouchEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0100
     * @tc.desc: OH_Input_AddAxisEventMonitorForAll Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0100';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitorForAll`);
      try {
        let data = input.AddAxisEventMonitorForAll();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitorForAll`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0100
     * @tc.desc: OH_Input_RemoveAxisEventMonitorForAll Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0100';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitorForAll`);
      try {
        let data = input.RemoveAxisEventMonitorForAll();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitorForAll`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0200
     * @tc.desc: OH_Input_AddAxisEventMonitorForAll Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0200';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitorForAll`);
      try {
        let data = input.AddAxisEventMonitorForAll2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitorForAll`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0200
     * @tc.desc: OH_Input_RemoveAxisEventMonitorForAll Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0200';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitorForAll`);
      try {
        let data = input.RemoveAxisEventMonitorForAll2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitorForAll`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0300
     * @tc.desc: OH_Input_RemoveAxisEventMonitorForAll Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0300';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitorForAll`);
      try {
        let data = input.RemoveAxisEventMonitorForAll3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitorForAll`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0300
     * @tc.desc: OH_Input_AddAxisEventMonitorForAll Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitorForAll_0300';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitorForAll`);
      try {
        let data = input.AddAxisEventMonitorForAll3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitorForAll`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0400
     * @tc.desc: OH_Input_RemoveAxisEventMonitorForAll Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitorForAll_0400';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitorForAll`);
      try {
        let data = input.RemoveAxisEventMonitorForAll4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitorForAll`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0100
     * @tc.desc: OH_Input_AddAxisEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitor`);
      try {
        let data = input.AddAxisEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0100
     * @tc.desc: OH_Input_RemoveAxisEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0100';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitor`);
      try {
        let data = input.RemoveAxisEventMonitor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0200
     * @tc.desc: OH_Input_AddAxisEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitor`);
      try {
        let data = input.AddAxisEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0200
     * @tc.desc: OH_Input_RemoveAxisEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0200';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitor`);
      try {
        let data = input.RemoveAxisEventMonitor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0300
     * @tc.desc: OH_Input_RemoveAxisEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitor`);
      try {
        let data = input.RemoveAxisEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0300
     * @tc.desc: OH_Input_AddAxisEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddAxisEventMonitor_0300';
      console.info(`${caseName} start to test OH_Input_AddAxisEventMonitor`);
      try {
        let data = input.AddAxisEventMonitor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0400
     * @tc.desc: OH_Input_RemoveAxisEventMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0400';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitor`);
      try {
        let data = input.RemoveAxisEventMonitor4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0500
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0500
     * @tc.desc: OH_Input_RemoveAxisEventMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveAxisEventMonitor_0500';
      console.info(`${caseName} start to test OH_Input_RemoveAxisEventMonitor`);
      try {
        let data = input.RemoveAxisEventMonitor5();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveAxisEventMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0100
     * @tc.desc: OH_Input_AddKeyEventInterceptor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0100';
      console.info(`${caseName} start to test OH_Input_AddKeyEventInterceptor`);
      try {
        let data = input.AddKeyEventInterceptor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0200
     * @tc.desc: OH_Input_AddKeyEventInterceptor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0200';
      console.info(`${caseName} start to test OH_Input_AddKeyEventInterceptor`);
      try {
        let data = input.AddKeyEventInterceptor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0300
     * @tc.desc: OH_Input_AddKeyEventInterceptor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0300';
      console.info(`${caseName} start to test OH_Input_AddKeyEventInterceptor`);
      try {
        let data = input.AddKeyEventInterceptor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0100
     * @tc.desc: OH_Input_RemoveKeyEventInterceptor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0100';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventInterceptor`);
      try {
        let data = input.RemoveKeyEventInterceptor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0200
     * @tc.desc: OH_Input_RemoveKeyEventInterceptor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0200';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventInterceptor`);
      try {
        let data = input.RemoveKeyEventInterceptor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0400
     * @tc.desc: OH_Input_AddKeyEventInterceptor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddKeyEventInterceptor_0400';
      console.info(`${caseName} start to test OH_Input_AddKeyEventInterceptor`);
      try {
        let data = input.AddKeyEventInterceptor4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddKeyEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0300
     * @tc.desc: OH_Input_RemoveKeyEventInterceptor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveKeyEventInterceptor_0300';
      console.info(`${caseName} start to test OH_Input_RemoveKeyEventInterceptor`);
      try {
        let data = input.RemoveKeyEventInterceptor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveKeyEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0100
     * @tc.desc: OH_Input_AddInputEventInterceptor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0100';
      console.info(`${caseName} start to test OH_Input_AddInputEventInterceptor`);
      try {
        let data = input.AddInputEventInterceptor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddInputEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0200
     * @tc.desc: OH_Input_AddInputEventInterceptor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0200';
      console.info(`${caseName} start to test OH_Input_AddInputEventInterceptor`);
      try {
        let data = input.AddInputEventInterceptor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddInputEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0300
     * @tc.desc: OH_Input_AddInputEventInterceptor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0300';
      console.info(`${caseName} start to test OH_Input_AddInputEventInterceptor`);
      try {
        let data = input.AddInputEventInterceptor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddInputEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0100
     * @tc.desc: OH_Input_RemoveInputEventInterceptor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0100';
      console.info(`${caseName} start to test OH_Input_RemoveInputEventInterceptor`);
      try {
        let data = input.RemoveInputEventInterceptor();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveInputEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0200
     * @tc.desc: OH_Input_RemoveInputEventInterceptor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0200';
      console.info(`${caseName} start to test OH_Input_RemoveInputEventInterceptor`);
      try {
        let data = input.RemoveInputEventInterceptor2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveInputEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0400
     * @tc.name: SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0400
     * @tc.desc: OH_Input_AddInputEventInterceptor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_AddInputEventInterceptor_0400';
      console.info(`${caseName} start to test OH_Input_AddInputEventInterceptor`);
      try {
        let data = input.AddInputEventInterceptor4();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddInputEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0300
     * @tc.desc: OH_Input_RemoveInputEventInterceptor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_RemoveInputEventInterceptor_0300';
      console.info(`${caseName} start to test OH_Input_RemoveInputEventInterceptor`);
      try {
        let data = input.RemoveInputEventInterceptor3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveInputEventInterceptor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0100
     * @tc.desc: OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId`);
      try {
        let data = input.SetKeyEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0200
     * @tc.desc: OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0200';
      console.info(`${caseName} start to test OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId`);
      try {
        let data = input.SetKeyEventWindowId2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0300
     * @tc.desc: OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetKeyEventWindowId_0300';
      console.info(`${caseName} start to test OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId`);
      try {
        let data = input.SetKeyEventWindowId3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetKeyEventWindowId and OH_Input_SetKeyEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetKeyEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetKeyEventWindowId_0100
     * @tc.desc: OH_Input_GetKeyEventWindowId and OH_Input_GetKeyEventDisplayId Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetKeyEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetKeyEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyEventWindowId and OH_Input_GetKeyEventDisplayId`);
      try {
        let data = input.GetKeyEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventWindowId and OH_Input_GetKeyEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0100
     * @tc.desc: OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId`);
      try {
        let data = input.SetMouseEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0200
     * @tc.desc: OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0200';
      console.info(`${caseName} start to test OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId`);
      try {
        let data = input.SetMouseEventWindowId2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0300
     * @tc.desc: OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetMouseEventWindowId_0300';
      console.info(`${caseName} start to test OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId`);
      try {
        let data = input.SetMouseEventWindowId3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetMouseEventWindowId and OH_Input_SetMouseEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetMouseEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetMouseEventWindowId_0100
     * @tc.desc: OH_Input_GetMouseEventWindowId and OH_Input_GetMouseEventDisplayId Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetMouseEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetMouseEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventWindowId and OH_Input_GetMouseEventDisplayId`);
      try {
        let data = input.GetMouseEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetMouseEventWindowId and OH_Input_GetMouseEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0100
     * @tc.desc: OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId`);
      try {
        let data = input.SetTouchEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0200
     * @tc.desc: OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0200';
      console.info(`${caseName} start to test OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId`);
      try {
        let data = input.SetTouchEventWindowId2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0300
     * @tc.desc: OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetTouchEventWindowId_0300';
      console.info(`${caseName} start to test OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId`);
      try {
        let data = input.SetTouchEventWindowId3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetTouchEventWindowId and OH_Input_SetTouchEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetTouchEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetTouchEventWindowId_0100
     * @tc.desc: OH_Input_GetTouchEventWindowId and OH_Input_GetTouchEventDisplayId Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetTouchEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetTouchEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventWindowId and OH_Input_GetTouchEventDisplayId`);
      try {
        let data = input.GetTouchEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetTouchEventWindowId and OH_Input_GetTouchEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0100
     * @tc.desc: OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId`);
      try {
        let data = input.SetAxisEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0200
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0200
     * @tc.desc: OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0200';
      console.info(`${caseName} start to test OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId`);
      try {
        let data = input.SetAxisEventWindowId2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0300
     * @tc.name: SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0300
     * @tc.desc: OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_SetAxisEventWindowId_0300';
      console.info(`${caseName} start to test OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId`);
      try {
        let data = input.SetAxisEventWindowId3();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetAxisEventWindowId and OH_Input_SetAxisEventDisplayId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_NdkSys_GetAxisEventWindowId_0100
     * @tc.name: SUB_MMI_Input_Api_NdkSys_GetAxisEventWindowId_0100
     * @tc.desc: OH_Input_GetAxisEventWindowId and OH_Input_GetAxisEventDisplayId Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_NdkSys_GetAxisEventWindowId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_NdkSys_GetAxisEventWindowId_0100';
      console.info(`${caseName} start to test OH_Input_GetAxisEventWindowId and OH_Input_GetAxisEventDisplayId`);
      try {
        let data = input.GetAxisEventWindowId();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAxisEventWindowId and OH_Input_GetAxisEventDisplayId`);
    });
  });
}