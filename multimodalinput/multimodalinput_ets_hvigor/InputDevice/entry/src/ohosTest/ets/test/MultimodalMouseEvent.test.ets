/*
 * Copyright (C) 2025 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError }  from '@ohos.base';
import mouseEvent from '@ohos.multimodalInput.mouseEvent';

export default function MultimodalMouseEventTest() {
  describe("MultimodalMouseEventTest", ()=> {
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
     * @tc.number: SUB_MMI_Input_Api_mouseEvent_ACTION_DOWN_0100
     * @tc.name: SUB_MMI_Input_Api_mouseEvent_ACTION_DOWN_0100
     * @tc.desc: Test ACTION_DOWN.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_mouseEvent_ACTION_DOWN_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_mouseEvent_ACTION_DOWN_0100";
      try {
        let ACTION_DOWN = mouseEvent.Action.ACTION_DOWN;
        console.info(`${caseName} success, ACTION_DOWN value ${JSON.stringify(ACTION_DOWN)}`);
        ExpectTrue(ACTION_DOWN == 7);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_mouseEvent_ACTION_UP_0100
     * @tc.name: SUB_MMI_Input_Api_mouseEvent_ACTION_UP_0100
     * @tc.desc: Test ACTION_UP.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_mouseEvent_ACTION_UP_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_mouseEvent_ACTION_UP_0100";
      try {
        let ACTION_UP = mouseEvent.Action.ACTION_UP;
        console.info(`${caseName} success, ACTION_UP value ${JSON.stringify(ACTION_UP)}`);
        ExpectTrue(ACTION_UP == 8);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_mouseEvent_UNKNOWN_0100
     * @tc.name: SUB_MMI_Input_Api_mouseEvent_UNKNOWN_0100
     * @tc.desc: Test ToolType.UNKNOWN.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_mouseEvent_UNKNOWN_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_mouseEvent_UNKNOWN_0100";
      try {
        let UNKNOWN = mouseEvent.ToolType.UNKNOWN;
        console.info(`${caseName} success, UNKNOWN value ${JSON.stringify(UNKNOWN)}`);
        ExpectTrue(UNKNOWN == 0);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_mouseEvent_JOYSTICK_0100
     * @tc.name: SUB_MMI_Input_Api_mouseEvent_JOYSTICK_0100
     * @tc.desc: Test ToolType.JOYSTICK.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_mouseEvent_JOYSTICK_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_mouseEvent_JOYSTICK_0100";
      try {
        let JOYSTICK = mouseEvent.ToolType.JOYSTICK;
        console.info(`${caseName} success, JOYSTICK value ${JSON.stringify(JOYSTICK)}`);
        ExpectTrue(JOYSTICK == 2);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_mouseEvent_TOUCHPAD_0100
     * @tc.name: SUB_MMI_Input_Api_mouseEvent_TOUCHPAD_0100
     * @tc.desc: Test ToolType.TOUCHPAD.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_mouseEvent_TOUCHPAD_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_mouseEvent_TOUCHPAD_0100";
      try {
        let TOUCHPAD = mouseEvent.ToolType.TOUCHPAD;
        console.info(`${caseName} success, TOUCHPAD value ${JSON.stringify(TOUCHPAD)}`);
        ExpectTrue(TOUCHPAD == 3);
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });
  });
}