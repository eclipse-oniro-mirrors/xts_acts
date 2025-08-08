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

import { describe, expect, it } from '@ohos/hypium';
import input from 'libinputndk.so';
import { inputConsumer } from '@kit.InputKit';

export default function MultimodalInputNdkTest() {
  describe('MultimodalInputNdkTest', () => {

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
     * @tc.number: SUB_MMI_Input_Api_Ndk_CreateKeyState_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_CreateKeyState_0100
     * @tc.desc: OH_Input_CreateKeyState Interface testing, verify the create of key states.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_CreateKeyState_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_CreateKeyState_0100';
      console.info(`${caseName} start to test OH_Input_CreateKeyState`);
      try {
        let data = input.CreateKeyState();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} created keyState success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} created keyState fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateKeyState`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_DestroyKeyState_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_DestroyKeyState_0100
     * @tc.desc: OH_Input_DestroyKeyState Interface testing, verify the destroy of key states.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_DestroyKeyState_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_DestroyKeyState_0100';
      console.info(`${caseName} start to test OH_Input_DestroyKeyState`);
      try {
        let data = input.DestroyKeyState();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroyed keyState success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} destroyed keyState fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyKeyState`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_SetKeyCode_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_SetKeyCode_0100
     * @tc.desc: OH_Input_SetKeyCode Interface testing, verify the set and get of key states.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_SetKeyCode_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_SetKeyCode_0100';
      console.info(`${caseName} start to test OH_Input_SetKeyCode`);
      try {
        let data = input.SetKeyCode(2000);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} set keyCode success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} set keyCode fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetKeyCode`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_SetKeyPressed_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_SetKeyPressed_0100
     * @tc.desc: OH_Input_SetKeyPressed Interface testing, verify the set and get of key states.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_SetKeyPressed_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_SetKeyPressed_0100';
      console.info(`${caseName} start to test OH_Input_SetKeyPressed`);
      try {
        let data = input.SetKeyPressed(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} set keyState success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} set keyState fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetKeyPressed`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_SetKeySwitch_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_SetKeySwitch_0100
     * @tc.desc: OH_Input_SetKeySwitch Interface testing, verify the set and get of key switch.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_SetKeySwitch_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_SetKeySwitch_0100';
      console.info(`${caseName} start to test OH_Input_SetKeySwitch`);
      try {
        let data = input.SetKeySwitch(2);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} set keySwitch success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} set keySwitch fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_SetKeySwitch`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyPressed_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyPressed_0100
     * @tc.desc: OH_Input_GetKeyPressed Interface testing, verify the set and get of key pressed.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyPressed_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyPressed_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyPressed`);
      try {
        let data = input.GetKeyPressed(2012);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyPressed success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyPressed fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyPressed`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeySwitch_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeySwitch_0100
     * @tc.desc: OH_Input_GetKeySwitch Interface testing, verify the set and get of key switch.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeySwitch_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeySwitch_0100';
      console.info(`${caseName} start to test OH_Input_GetKeySwitch`);
      try {
        let data = input.GetKeySwitch(2012);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keySwitch success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keySwitch fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeySwitch`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyState_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyState_0100
     * @tc.desc: OH_Input_GetKeyState Interface testing, verify the get of key state.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyState_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyState_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyState`);
      try {
        let data = input.GetKeyState(2012);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyState success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyState fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyState`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyState_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyState_0200
     * @tc.desc: OH_Input_GetKeyState Interface testing, verify the get of key state fail(number 1).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyState_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyState_0200';
      console.info(`${caseName} start to test OH_Input_GetKeyState`);
      try {
        let data = input.GetKeyState2(2001);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyState success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyState fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyState`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyState_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyState_0300
     * @tc.desc: OH_Input_GetKeyState Interface testing, verify the get of key state fail(letter A).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyState_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyState_0300';
      console.info(`${caseName} start to test OH_Input_GetKeyState`);
      try {
        let data = input.GetKeyState2(2017);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyState success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyState fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyState`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyState_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyState_0400
     * @tc.desc: OH_Input_GetKeyState Interface testing, verify the get of key state fail(@).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyState_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyState_0400';
      console.info(`${caseName} start to test OH_Input_GetKeyState`);
      try {
        let data = input.GetKeyState2(2065);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyState success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyState fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyState`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_CreateKeyEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_CreateKeyEvent_0100
     * @tc.desc: OH_Input_CreateKeyEvent Interface testing, verify the create of key event.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_CreateKeyEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_CreateKeyEvent_0100';
      console.info(`${caseName} start to test OH_Input_CreateKeyEvent`);
      try {
        let data = input.CreateKeyEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} created keyEvent success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} created keyEvent fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateKeyEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_InjectKeyEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_InjectKeyEvent_0100
     * @tc.desc: OH_Input_InjectKeyEvent Interface testing, verify the inject of key event.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_InjectKeyEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_InjectKeyEvent_0100';
      console.info(`${caseName} start to test OH_Input_InjectKeyEvent`);
      try {
        let data = input.InjectKeyEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} injected keyEvent success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} injected keyEvent fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_InjectKeyEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_DestroyKeyEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_DestroyKeyEvent_0100
     * @tc.desc: OH_Input_DestroyKeyEvent Interface testing, verify the destroy of key event.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_DestroyKeyEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_DestroyKeyEvent_0100';
      console.info(`${caseName} start to test OH_Input_DestroyKeyEvent`);
      try {
        let data = input.DestroyKeyEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroyed keyEvent success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} destroyed keyEvent fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyKeyEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0100
     * @tc.desc: OH_Input_GetKeyEventAction Interface testing, verify the set and get of keyEvent action.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyEventAction`);
      try {
        let data = input.GetKeyEventAction();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyEvent action success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyEvent action fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0200
     * @tc.desc: OH_Input_GetKeyEventAction Interface testing, verify the destroy of keyEvent action.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyEventAction_0200';
      console.info(`${caseName} start to test OH_Input_GetKeyEventAction`);
      try {
        let data = input.GetKeyEventActionDestroy();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroyed keyEvent action success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} destroyed keyEvent action fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventAction`);
    });


    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0100
     * @tc.desc: OH_Input_GetKeyEventKeyCode Interface testing, verify the set and get of keyEvent code.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyEventKeyCode`);
      try {
        let data = input.GetKeyEventKeyCode();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyEvent code success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyEvent code fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventKeyCode`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0200
     * @tc.desc: OH_Input_GetKeyEventKeyCode Interface testing, verify the destroy of keyEvent code.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyEventKeyCode_0200';
      console.info(`${caseName} start to test OH_Input_GetKeyEventKeyCode`);
      try {
        let data = input.GetKeyEventKeyCodeDestroy();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroy keyEvent code success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} destroy keyEvent code fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventKeyCode`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0100
     * @tc.desc: OH_Input_GetKeyEventActionTime Interface testing, verify the set and get of keyEvent time.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyEventActionTime`);
      try {
        let data = input.GetKeyEventActionTime(200);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} get keyEvent time success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} get keyEvent time fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0200
     * @tc.desc: OH_Input_GetKeyEventActionTime Interface testing, verify the destroy of keyEvent time.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyEventActionTime_0200';
      console.info(`${caseName} start to test OH_Input_GetKeyEventActionTime`);
      try {
        let data = input.GetKeyEventActionTimeDestroy(200);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroyed keyEvent time success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} destroyed keyEvent time fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetKeyEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_CreateTouchEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_CreateTouchEvent_0100
     * @tc.desc: OH_Input_CreateTouchEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_CreateTouchEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_CreateTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_CreateTouchEvent`);
      try {
        let data = input.createTouchEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
          console.info(`${caseName} created TouchEvent success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} created TouchEvent fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateTouchEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_DestroyTouchEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_DestroyTouchEvent_0100
     * @tc.desc: OH_Input_DestroyTouchEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_DestroyTouchEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_DestroyTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_DestroyTouchEvent`);
      try {
        let data = input.destroyTouchEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} destroy TouchEvent success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} destroy TouchEvent fail`);
          ExpectFalse(true);
          done();
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_DestroyTouchEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_TouchEventAction_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_TouchEventAction_0100
     * @tc.desc: OH_Input_GetTouchEventAction Interface testing, verify the set and get of touchEvent action
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_TouchEventAction_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_TouchEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventAction`);
      try {
        let data = input.touchEventAction(1);
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
      console.info(`${caseName} end to test OH_Input_GetTouchEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_TouchEventFingerId_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_TouchEventFingerId_0100
     * @tc.desc: OH_Input_GetTouchEventFingerId Interface testing, verify the set and get of touchEvent id
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_TouchEventFingerId_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_TouchEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventFingerId`);
      try {
        let data = input.touchEventFingerId(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
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
      console.info(`${caseName} end to test OH_Input_GetTouchEventFingerId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_TouchEventDisplayX_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_TouchEventDisplayX_0100
     * @tc.desc: OH_Input_GetTouchEventDisplayX Interface testing, verify the set and get of touchEvent displayX
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_TouchEventDisplayX_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_TouchEventDisplayX_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventDisplayX`);
      try {
        let data = input.touchEventDisplayX(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
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
      console.info(`${caseName} end to test OH_Input_GetTouchEventDisplayX`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_TouchEventDisplayY_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_TouchEventDisplayY_0100
     * @tc.desc: OH_Input_GetTouchEventDisplayY Interface testing, verify the set and get of touchEvent displayY
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_TouchEventDisplayY_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_TouchEventDisplayY_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventDisplayY`);
      try {
        let data = input.touchEventDisplayY(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
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
      console.info(`${caseName} end to test OH_Input_GetTouchEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_TouchEventActionTime_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_TouchEventActionTime_0100
     * @tc.desc: OH_Input_GetTouchEventActionTime Interface testing, verify the set and get of touchEvent actionTime
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_TouchEventActionTime_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_TouchEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_GetTouchEventActionTime`);
      try {
        let data = input.touchEventActionTime(200);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 200) {
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
      console.info(`${caseName} end to test OH_Input_GetTouchEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_InjectTouchEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_InjectTouchEvent_0100
     * @tc.desc: OH_Input_InjectTouchEvent Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_InjectTouchEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_InjectTouchEvent_0100';
      console.info(`${caseName} start to test OH_Input_InjectTouchEvent`);
      try {
        let data = input.injectTouchEvent(-671, -10);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 401) {
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
      console.info(`${caseName} end to test OH_Input_InjectTouchEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_CreateMouseEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_CreateMouseEvent_0100
     * @tc.desc: OH_Input_CreateMouseEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_CreateMouseEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_CreateMouseEvent_0100';
      console.info(`${caseName} start to test OH_Input_CreateMouseEvent`);
      try {
        let data = input.createMouseEvent();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
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
      console.info(`${caseName} end to test OH_Input_CreateMouseEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_DestroyMouseEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_DestroyMouseEvent_0100
     * @tc.desc: OH_Input_DestroyMouseEvent Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_DestroyMouseEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_DestroyMouseEvent_0100';
      console.info(`${caseName} start to test OH_Input_DestroyMouseEvent`);
      try {
        let data = input.destroyMouseEvent();
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
      console.info(`${caseName} end to test OH_Input_DestroyMouseEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_MouseEventAction_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_MouseEventAction_0100
     * @tc.desc: OH_Input_GetMouseEventAction Interface testing, verify the set and get of mouseEvent action
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_MouseEventAction_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_MouseEventAction_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventAction`);
      try {
        let data = input.mouseEventAction(2);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 2) {
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
      console.info(`${caseName} end to test OH_Input_GetMouseEventAction`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_MouseEventDisplayX_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_MouseEventDisplayX_0100
     * @tc.desc: OH_Input_GetMouseEventDisplayX Interface testing, verify the set and get of mouseEvent displayX
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_MouseEventDisplayX_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_MouseEventDisplayX_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventDisplayX`);
      try {
        let data = input.mouseEventDisplayX(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
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
      console.info(`${caseName} end to test OH_Input_GetMouseEventDisplayX`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_MouseEventDisplayY_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_MouseEventDisplayY_0100
     * @tc.desc: OH_Input_GetMouseEventDisplayY Interface testing, verify the set and get of mouseEvent displayY
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_MouseEventDisplayY_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_MouseEventDisplayY_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventDisplayY`);
      try {
        let data = input.mouseEventDisplayY(100);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 100) {
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
      console.info(`${caseName} end to test OH_Input_GetMouseEventDisplayY`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_MouseEventButton_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_MouseEventButton_0100
     * @tc.desc: OH_Input_GetMouseEventButton Interface testing, verify the set and get of mouseEvent button
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_MouseEventButton_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_MouseEventButton_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventButton`);
      try {
        let data = input.mouseEventButton(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
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
      console.info(`${caseName} end to test OH_Input_GetMouseEventButton`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_MouseEventAxisType_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_MouseEventAxisType_0100
     * @tc.desc: OH_Input_GetMouseEventAxisType Interface testing, verify the set and get of mouseEvent axisType
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_MouseEventAxisType_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_MouseEventAxisType_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventAxisType`);
      try {
        let data = input.mouseEventAxisType(0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 0) {
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
      console.info(`${caseName} end to test OH_Input_GetMouseEventAxisType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_MouseEventAxisValue_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_MouseEventAxisValue_0100
     * @tc.desc: OH_Input_GetMouseEventAxisValue Interface testing, verify the set and get of mouseEvent axisValue
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_MouseEventAxisValue_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_MouseEventAxisValue_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventAxisValue`);
      try {
        let data = input.mouseEventAxisValue(15.0);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 15.0) {
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
      console.info(`${caseName} end to test OH_Input_GetMouseEventAxisValue`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_MouseEventActionTime_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_MouseEventActionTime_0100
     * @tc.desc: OH_Input_GetMouseEventActionTime Interface testing, verify the set and get of mouseEvent actionTime
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_MouseEventActionTime_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_MouseEventActionTime_0100';
      console.info(`${caseName} start to test OH_Input_GetMouseEventActionTime`);
      try {
        let data = input.mouseEventActionTime(200);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 200) {
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
      console.info(`${caseName} end to test OH_Input_GetMouseEventActionTime`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0100
     * @tc.desc: OH_Input_InjectMouseEvent Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0100';
      console.info(`${caseName} start to test OH_Input_InjectMouseEvent`);
      try {
        let data = input.injectMouseEvent(350, -2);
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 401) {
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
      console.info(`${caseName} end to test OH_Input_InjectMouseEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0200
     * @tc.desc: OH_Input_InjectMouseEvent Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_InjectMouseEvent_0200';
      console.info(`${caseName} start to test OH_Input_InjectMouseEvent`);
      try {
        let data = input.injectMouseEvent2();
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
      console.info(`${caseName} end to test OH_Input_InjectMouseEvent`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0100
     * @tc.desc: OH_Input_RegisterDeviceListener Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0100';
      console.info(`${caseName} start to test OH_Input_RegisterDeviceListener`);
      try {
        let data = input.RegisterDeviceListener();
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
      console.info(`${caseName} end to test OH_Input_RegisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0100
     * @tc.desc: OH_Input_UnregisterDeviceListener Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0100';
      console.info(`${caseName} start to test OH_Input_UnregisterDeviceListener`);
      try {
        let data = input.UnregisterDeviceListener();
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
      console.info(`${caseName} end to test OH_Input_UnregisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0200
     * @tc.desc: OH_Input_RegisterDeviceListener Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0200';
      console.info(`${caseName} start to test OH_Input_RegisterDeviceListener`);
      try {
        let data = input.RegisterDeviceListener2();
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
      console.info(`${caseName} end to test OH_Input_RegisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0200
     * @tc.desc: OH_Input_UnregisterDeviceListener Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0200';
      console.info(`${caseName} start to test OH_Input_UnregisterDeviceListener`);
      try {
        let data = input.UnregisterDeviceListener2();
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
      console.info(`${caseName} end to test OH_Input_UnregisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListeners_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListeners_0100
     * @tc.desc: OH_Input_UnregisterDeviceListeners Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_UnregisterDeviceListeners_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_UnregisterDeviceListeners_0100';
      console.info(`${caseName} start to test OH_Input_UnregisterDeviceListeners`);
      try {
        let data = input.UnregisterDeviceListeners();
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
      console.info(`${caseName} end to test OH_Input_UnregisterDeviceListeners`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0300
     * @tc.desc: OH_Input_RegisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0300';
      console.info(`${caseName} start to test OH_Input_RegisterDeviceListener`);
      try {
        let data = input.RegisterDeviceListener3();
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
      console.info(`${caseName} end to test OH_Input_RegisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0300
     * @tc.desc: OH_Input_UnregisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0300';
      console.info(`${caseName} start to test OH_Input_UnregisterDeviceListener`);
      try {
        let data = input.UnregisterDeviceListener3();
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
      console.info(`${caseName} end to test OH_Input_UnregisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0400
     * @tc.desc: OH_Input_RegisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0400';
      console.info(`${caseName} start to test OH_Input_RegisterDeviceListener`);
      try {
        let data = input.RegisterDeviceListener4();
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
      console.info(`${caseName} end to test OH_Input_RegisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0400
     * @tc.desc: OH_Input_UnregisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0400';
      console.info(`${caseName} start to test OH_Input_UnregisterDeviceListener`);
      try {
        let data = input.UnregisterDeviceListener4();
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
      console.info(`${caseName} end to test OH_Input_UnregisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0500
     * @tc.name: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0500
     * @tc.desc: OH_Input_RegisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0500';
      console.info(`${caseName} start to test OH_Input_RegisterDeviceListener`);
      try {
        let data = input.RegisterDeviceListener5();
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
      console.info(`${caseName} end to test OH_Input_RegisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0500
     * @tc.name: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0500
     * @tc.desc: OH_Input_UnregisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0500';
      console.info(`${caseName} start to test OH_Input_UnregisterDeviceListener`);
      try {
        let data = input.UnregisterDeviceListener5();
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
      console.info(`${caseName} end to test OH_Input_UnregisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0600
     * @tc.name: SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0600
     * @tc.desc: OH_Input_RegisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0600', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_RegisterDeviceListener_0600';
      console.info(`${caseName} start to test OH_Input_RegisterDeviceListener`);
      try {
        let data = input.RegisterDeviceListener6();
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
      console.info(`${caseName} end to test OH_Input_RegisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0600
     * @tc.name: SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0600
     * @tc.desc: OH_Input_UnregisterDeviceListener Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0600', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_UnregisterDeviceListener_0600';
      console.info(`${caseName} start to test OH_Input_UnregisterDeviceListener`);
      try {
        let data = input.UnregisterDeviceListener6();
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
      console.info(`${caseName} end to test OH_Input_UnregisterDeviceListener`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0100
     * @tc.desc: OH_Input_GetDeviceIds Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceIds_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceIds_0100';
      console.info(`${caseName} start to test OH_Input_GetDeviceIds`);
      try {
        let data = input.GetDeviceIds();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceIds`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0200
     * @tc.desc: OH_Input_GetDeviceIds Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceIds_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceIds_0200';
      console.info(`${caseName} start to test OH_Input_GetDeviceIds`);
      try {
        let data = input.GetDeviceIds2();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceIds`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0300
     * @tc.desc: OH_Input_GetDeviceIds Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceIds_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceIds_0300';
      console.info(`${caseName} start to test OH_Input_GetDeviceIds`);
      try {
        let data = input.GetDeviceIds3();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceIds`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0400
     * @tc.desc: OH_Input_GetDeviceIds Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceIds_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceIds_0400';
      console.info(`${caseName} start to test OH_Input_GetDeviceIds`);
      try {
        let data = input.GetDeviceIds4();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceIds`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0500
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceIds_0500
     * @tc.desc: OH_Input_GetDeviceIds Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceIds_0500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceIds_0500';
      console.info(`${caseName} start to test OH_Input_GetDeviceIds`);
      try {
        let data = input.GetDeviceIds5();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceIds`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0100
     * @tc.desc: OH_Input_GetKeyboardType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyboardType_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyboardType_0100';
      console.info(`${caseName} start to test OH_Input_GetKeyboardType`);
      try {
        let data = input.GetKeyboardType();
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
      console.info(`${caseName} end to test OH_Input_GetKeyboardType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0200
     * @tc.desc: OH_Input_GetKeyboardType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyboardType_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyboardType_0200';
      console.info(`${caseName} start to test OH_Input_GetKeyboardType`);
      try {
        let data = input.GetKeyboardType2();
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
      console.info(`${caseName} end to test OH_Input_GetKeyboardType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0300
     * @tc.desc: OH_Input_GetKeyboardType Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyboardType_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyboardType_0300';
      console.info(`${caseName} start to test OH_Input_GetKeyboardType`);
      try {
        let data = input.GetKeyboardType3();
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
      console.info(`${caseName} end to test OH_Input_GetKeyboardType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetKeyboardType_0400
     * @tc.desc: OH_Input_GetKeyboardType Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetKeyboardType_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetKeyboardType_0400';
      console.info(`${caseName} start to test OH_Input_GetKeyboardType`);
      try {
        let data = input.GetKeyboardType4();
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
      console.info(`${caseName} end to test OH_Input_GetKeyboardType`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDevice_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDevice_0100
     * @tc.desc: OH_Input_GetDevice Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDevice_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDevice_0100';
      console.info(`${caseName} start to test OH_Input_GetDevice`);
      try {
        let data = input.GetDevice();
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
      console.info(`${caseName} end to test OH_Input_GetDevice`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDevice_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDevice_0200
     * @tc.desc: OH_Input_GetDevice Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDevice_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDevice_0200';
      console.info(`${caseName} start to test OH_Input_GetDevice`);
      try {
        let data = input.GetDevice2();
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
      console.info(`${caseName} end to test OH_Input_GetDevice`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDevice_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDevice_0300
     * @tc.desc: OH_Input_GetDevice Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDevice_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDevice_0300';
      console.info(`${caseName} start to test OH_Input_GetDevice`);
      try {
        let data = input.GetDevice3();
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
      console.info(`${caseName} end to test OH_Input_GetDevice`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDevice_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDevice_0400
     * @tc.desc: OH_Input_GetDevice Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDevice_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDevice_0400';
      console.info(`${caseName} start to test OH_Input_GetDevice`);
      try {
        let data = input.GetDevice4();
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
      console.info(`${caseName} end to test OH_Input_GetDevice`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceName_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceName_0100
     * @tc.desc: OH_Input_GetDeviceName Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceName_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceName_0100';
      console.info(`${caseName} start to test OH_Input_GetDeviceName`);
      try {
        let data = input.GetDeviceName();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceName`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceName_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceName_0200
     * @tc.desc: OH_Input_GetDeviceName Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceName_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceName_0200';
      console.info(`${caseName} start to test OH_Input_GetDeviceName`);
      try {
        let data = input.GetDeviceName2();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceName`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceName_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceName_0300
     * @tc.desc: OH_Input_GetDeviceName Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceName_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceName_0300';
      console.info(`${caseName} start to test OH_Input_GetDeviceName`);
      try {
        let data = input.GetDeviceName3();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceName`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceName_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceName_0400
     * @tc.desc: OH_Input_GetDeviceName Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceName_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceName_0400';
      console.info(`${caseName} start to test OH_Input_GetDeviceName`);
      try {
        let data = input.GetDeviceName4();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceName`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0100
     * @tc.desc: OH_Input_GetDeviceAddress Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0100';
      console.info(`${caseName} start to test OH_Input_GetDeviceAddress`);
      try {
        let data = input.GetDeviceAddress();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceAddress`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0200
     * @tc.desc: OH_Input_GetDeviceAddress Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0200';
      console.info(`${caseName} start to test OH_Input_GetDeviceAddress`);
      try {
        let data = input.GetDeviceAddress2();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceAddress`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0300
     * @tc.desc: OH_Input_GetDeviceAddress Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0300';
      console.info(`${caseName} start to test OH_Input_GetDeviceAddress`);
      try {
        let data = input.GetDeviceAddress3();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceAddress`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0400
     * @tc.desc: OH_Input_GetDeviceAddress Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceAddress_0400';
      console.info(`${caseName} start to test OH_Input_GetDeviceAddress`);
      try {
        let data = input.GetDeviceAddress4();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceAddress`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceId_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceId_0100
     * @tc.desc: OH_Input_GetDeviceId Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceId_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceId_0100';
      console.info(`${caseName} start to test OH_Input_GetDeviceId`);
      try {
        let data = input.GetDeviceId();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceId_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceId_0200
     * @tc.desc: OH_Input_GetDeviceId Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceId_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceId_0200';
      console.info(`${caseName} start to test OH_Input_GetDeviceId`);
      try {
        let data = input.GetDeviceId2();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceId_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceId_0300
     * @tc.desc: OH_Input_GetDeviceId Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceId_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceId_0300';
      console.info(`${caseName} start to test OH_Input_GetDeviceId`);
      try {
        let data = input.GetDeviceId3();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceId`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetCapabilities_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetCapabilities_0100
     * @tc.desc: OH_Input_GetCapabilities Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetCapabilities_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetCapabilities_0100';
      console.info(`${caseName} start to test OH_Input_GetCapabilities`);
      try {
        let data = input.GetCapabilities();
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
      console.info(`${caseName} end to test OH_Input_GetCapabilities`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetCapabilities_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetCapabilities_0200
     * @tc.desc: OH_Input_GetCapabilities Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetCapabilities_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetCapabilities_0200';
      console.info(`${caseName} start to test OH_Input_GetCapabilities`);
      try {
        let data = input.GetCapabilities2();
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
      console.info(`${caseName} end to test OH_Input_GetCapabilities`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetCapabilities_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetCapabilities_0300
     * @tc.desc: OH_Input_GetCapabilities Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetCapabilities_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetCapabilities_0300';
      console.info(`${caseName} start to test OH_Input_GetCapabilities`);
      try {
        let data = input.GetCapabilities3();
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
      console.info(`${caseName} end to test OH_Input_GetCapabilities`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetCapabilities_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetCapabilities_0400
     * @tc.desc: OH_Input_GetCapabilities Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetCapabilities_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetCapabilities_0400';
      console.info(`${caseName} start to test OH_Input_GetCapabilities`);
      try {
        let data = input.GetCapabilities4();
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
      console.info(`${caseName} end to test OH_Input_GetCapabilities`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0100
     * @tc.desc: OH_Input_GetDeviceVersion Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0100';
      console.info(`${caseName} start to test OH_Input_GetDeviceVersion`);
      try {
        let data = input.GetDeviceVersion();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVersion`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0200
     * @tc.desc: OH_Input_GetDeviceVersion Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0200';
      console.info(`${caseName} start to test OH_Input_GetDeviceVersion`);
      try {
        let data = input.GetDeviceVersion2();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVersion`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0300
     * @tc.desc: OH_Input_GetDeviceVersion Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0300';
      console.info(`${caseName} start to test OH_Input_GetDeviceVersion`);
      try {
        let data = input.GetDeviceVersion3();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVersion`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0400
     * @tc.desc: OH_Input_GetDeviceVersion Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVersion_0400';
      console.info(`${caseName} start to test OH_Input_GetDeviceVersion`);
      try {
        let data = input.GetDeviceVersion4();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVersion`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0100
     * @tc.desc: OH_Input_GetDeviceProduct Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0100';
      console.info(`${caseName} start to test OH_Input_GetDeviceProduct`);
      try {
        let data = input.GetDeviceProduct();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceProduct`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0200
     * @tc.desc: OH_Input_GetDeviceProduct Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0200';
      console.info(`${caseName} start to test OH_Input_GetDeviceProduct`);
      try {
        let data = input.GetDeviceProduct2();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceProduct`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0300
     * @tc.desc: OH_Input_GetDeviceProduct Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0300';
      console.info(`${caseName} start to test OH_Input_GetDeviceProduct`);
      try {
        let data = input.GetDeviceProduct3();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceProduct`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0400
     * @tc.desc: OH_Input_GetDeviceProduct Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceProduct_0400';
      console.info(`${caseName} start to test OH_Input_GetDeviceProduct`);
      try {
        let data = input.GetDeviceProduct4();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceProduct`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0100
     * @tc.desc: OH_Input_GetDeviceVendor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0100';
      console.info(`${caseName} start to test OH_Input_GetDeviceVendor`);
      try {
        let data = input.GetDeviceVendor();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVendor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0200
     * @tc.desc: OH_Input_GetDeviceVendor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0200';
      console.info(`${caseName} start to test OH_Input_GetDeviceVendor`);
      try {
        let data = input.GetDeviceVendor2();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVendor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0300
     * @tc.desc: OH_Input_GetDeviceVendor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0300';
      console.info(`${caseName} start to test OH_Input_GetDeviceVendor`);
      try {
        let data = input.GetDeviceVendor3();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVendor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0400
     * @tc.desc: OH_Input_GetDeviceVendor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetDeviceVendor_0400';
      console.info(`${caseName} start to test OH_Input_GetDeviceVendor`);
      try {
        let data = input.GetDeviceVendor4();
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
      console.info(`${caseName} end to test OH_Input_GetDeviceVendor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_DestroyDeviceInfo_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_DestroyDeviceInfo_0100
     * @tc.desc: OH_Input_DestroyDeviceInfo Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_DestroyDeviceInfo_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_DestroyDeviceInfo_0100';
      console.info(`${caseName} start to test OH_Input_DestroyDeviceInfo`);
      try {
        let data = input.DestroyDeviceInfo();
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
      console.info(`${caseName} end to test OH_Input_DestroyDeviceInfo`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0100
     * @tc.desc: OH_Input_GetAllSystemHotkeys Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0100';
      console.info(`${caseName} start to test OH_Input_GetAllSystemHotkeys`);
      try {
        let data = input.GetAllSystemHotkeys();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        console.info(`${caseName} success`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAllSystemHotkeys`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0100
     * @tc.desc: OH_Input_CreateAllSystemHotkeys Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0100';
      console.info(`${caseName} start to test OH_Input_CreateAllSystemHotkeys`);
      try {
        let data = input.CreateAllSystemHotkeys();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        if (data == 1) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          inputConsumer.getAllSystemHotkeys().then((data: Array<inputConsumer.HotkeyOptions>) => {
            console.info(`${caseName} list of system hotkeys: ${JSON.stringify(data)}`);
            ExpectTrue(data.length == 0);
            done();
          });
        }
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_CreateAllSystemHotkeys`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0200
     * @tc.desc: OH_Input_GetAllSystemHotkeys Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0200';
      console.info(`${caseName} start to test OH_Input_GetAllSystemHotkeys`);
      try {
        let data = input.GetAllSystemHotkeys2();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        console.info(`${caseName} success`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_GetAllSystemHotkeys`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0300
     * @tc.desc: OH_Input_GetAllSystemHotkeys Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetAllSystemHotkeys_0300';
      console.info(`${caseName} start to test OH_Input_GetAllSystemHotkeys`);
      try {
        let data = input.GetAllSystemHotkeys3();
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
      console.info(`${caseName} end to test OH_Input_GetAllSystemHotkeys`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0200
     * @tc.desc: OH_Input_CreateAllSystemHotkeys Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_CreateAllSystemHotkeys_0200';
      console.info(`${caseName} start to test OH_Input_CreateAllSystemHotkeys`);
      try {
        let data = input.CreateAllSystemHotkeys2();
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
      console.info(`${caseName} end to test OH_Input_CreateAllSystemHotkeys`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetIntervalSinceLastInput_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetIntervalSinceLastInput_0100
     * @tc.desc: OH_Input_GetIntervalSinceLastInput Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetIntervalSinceLastInput_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetIntervalSinceLastInput_0100';
      console.info(`${caseName} start to test OH_Input_GetIntervalSinceLastInput`);
      try {
        let data = input.GetIntervalSinceLastInput();
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
      console.info(`${caseName} end to test OH_Input_GetIntervalSinceLastInput`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_CreateHotkey_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_CreateHotkey_0100
     * @tc.desc: OH_Input_CreateHotkey Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_CreateHotkey_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_CreateHotkey_0100';
      console.info(`${caseName} start to test OH_Input_CreateHotkey`);
      try {
        let data = input.CreateHotkey();
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
      console.info(`${caseName} end to test OH_Input_CreateHotkey`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0100
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Z
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0100';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0200
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Alt + Z
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0200';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor2();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0300
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Shift + Alt + Z
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0300';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor3();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0400
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Alt + Z
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0400';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor4();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0500
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0500
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Shift + C
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0500';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor5();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0600
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0600
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + 9
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0600', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0600';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor6();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0700
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0700
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + �?     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0700', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0700';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor7();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0800
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0800
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + �?     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0800', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0800';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor8();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0900
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0900
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + F1
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0900', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_0900';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor9();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1000
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1000
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Home
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1000', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1000';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor10();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1100
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1100
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Enter
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1100';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor11();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1200
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1200
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + P
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1200';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor12();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1300
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1300
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Alt + D + C
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1300';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor13();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1400
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1400
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Alt + D + C
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1400';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor14();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1500
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1500
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe 9 + D
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1500';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor15();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1600
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1600
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe F + D
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1600', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1600';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor16();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1700
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1700
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Meta
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1700', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1700';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor17();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1800
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1800
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Right_Ctrl
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1800', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1800';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor18();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1900
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1900
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Scroll Lock
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1900', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_1900';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor19();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2000
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2000
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2000', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2000';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor20();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2100
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2100
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2100';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor21();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2200
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2200
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Ctrl + Table
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2200';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor22();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2300
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2300
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Alt + Table
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2300';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor23();
        console.info(`${caseName} Test NAPI data= ${JSON.stringify(data)}`);
        console.info(`${caseName} success`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2400
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2400
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe Alt + Table again
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2400';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor24();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2500
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2500
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to set HotkeyCallback as nullptr
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2500', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2500';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor25();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2600
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2600
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe a nonexistent preKeys
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2600', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2600';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor26();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2700
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2700
     * @tc.desc: OH_Input_AddHotkeyMonitor Interface testing to subscribe a nonexistent finalKey
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2700', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2700';
      console.info(`${caseName} start to test OH_Input_AddHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor27();
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
      console.info(`${caseName} end to test OH_Input_AddHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2800
     * @tc.name: SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2800
     * @tc.desc: OH_Input_RemoveHotkeyMonitor Interface testing to set HotkeyCallback as nullptr
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2800', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_AddHotkeyMonitor_2800';
      console.info(`${caseName} start to test OH_Input_RemoveHotkeyMonitor`);
      try {
        let data = input.AddHotkeyMonitor28();
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
      console.info(`${caseName} end to test OH_Input_RemoveHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0100
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0100
     * @tc.desc: OH_Input_GetFunctionKeyState Interface testing.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0100', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0100';
      console.info(`${caseName} start to test OH_Input_GetFunctionKeyState`);
      try {
        let data = input.GetFunctionKeyState();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0200
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0200
     * @tc.desc: OH_Input_GetFunctionKeyState Interface testing to set error keyCode(10000).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0200', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0200';
      console.info(`${caseName} start to test OH_Input_GetFunctionKeyState`);
      try {
        let data = input.GetFunctionKeyState2();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0300
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0300
     * @tc.desc: OH_Input_GetFunctionKeyState Interface testing to set error keyCode(-1).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0300', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0300';
      console.info(`${caseName} start to test OH_Input_GetFunctionKeyState`);
      try {
        let data = input.GetFunctionKeyState3();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveHotkeyMonitor`);
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0400
     * @tc.name: SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0400
     * @tc.desc: OH_Input_GetFunctionKeyState Interface testing to set state as nullptr.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0400', 0, async (done: Function) => {
      let caseName = 'SUB_MMI_Input_Api_Ndk_GetFunctionKeyState_0400';
      console.info(`${caseName} start to test OH_Input_GetFunctionKeyState`);
      try {
        let data = input.GetFunctionKeyState4();
        console.info(`${caseName} success, test NAPI data= ${JSON.stringify(data)}`);
        ExpectTrue(data == 1);
        done();
      } catch (err) {
        console.info(`${caseName} fail, error is ${JSON.stringify(err)}`);
        ExpectFalse(true);
        done();
      }
      console.info(`${caseName} end to test OH_Input_RemoveHotkeyMonitor`);
    });
  });
}