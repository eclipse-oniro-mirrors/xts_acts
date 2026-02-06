/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { AxisValue, MouseEvent, Action, Button, Axis, ToolType } from '@ohos.multimodalInput.mouseEvent';
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalMouseEventTest() {
  describe("MultimodalMouseEventTest", (): void => {
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
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_Action_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_Action_0100
     * @tc.desc   Test MouseEvent Action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_MouseEvent_Action_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_Action_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(Action.CANCEL == 0);
          ExpectTrue(Action.MOVE == 1);
          ExpectTrue(Action.BUTTON_DOWN == 2);
          ExpectTrue(Action.BUTTON_UP == 3);
          ExpectTrue(Action.AXIS_BEGIN == 4);
          ExpectTrue(Action.AXIS_UPDATE == 5);
          ExpectTrue(Action.AXIS_END == 6);
          ExpectTrue(Action.ACTION_DOWN == 7);
          ExpectTrue(Action.ACTION_UP == 8);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_Button_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_Button_0100
     * @tc.desc   Test MouseEvent Button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_MouseEvent_Button_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_Button_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(Button.LEFT == 0);
          ExpectTrue(Button.MIDDLE == 1);
          ExpectTrue(Button.RIGHT == 2);
          ExpectTrue(Button.SIDE == 3);
          ExpectTrue(Button.EXTRA == 4);
          ExpectTrue(Button.FORWARD == 5);
          ExpectTrue(Button.BACK == 6);
          ExpectTrue(Button.TASK == 7);

          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_Axis_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_Axis_0100
     * @tc.desc   Test MouseEvent Axis
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_Axis_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_Axis_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(Axis.SCROLL_VERTICAL == 0);
          ExpectTrue(Axis.SCROLL_HORIZONTAL == 1);
          ExpectTrue(Axis.PINCH == 2);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_AxisValue_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_AxisValue_0100
     * @tc.desc   Test MouseEvent AxisValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_AxisValue_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_AxisValue_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testAxisValue: AxisValue = {
            axis: Axis.SCROLL_VERTICAL,
            value: 1
          };
          ExpectTrue(testAxisValue.axis == Axis.SCROLL_VERTICAL);
          ExpectTrue(testAxisValue.value == 1);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_ToolType_0100
     * @tc.number SUB_MMI_Input_Api_MouseEvent_ToolType_0100
     * @tc.desc   Test MouseEvent ToolType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_ToolType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_ToolType_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(ToolType.UNKNOWN == 0);
          ExpectTrue(ToolType.MOUSE == 1);
          ExpectTrue(ToolType.JOYSTICK == 2);
          ExpectTrue(ToolType.TOUCHPAD == 3);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_MouseEvent_ToolType_0200
     * @tc.number SUB_MMI_Input_Api_MouseEvent_ToolType_0200
     * @tc.desc   Test MouseEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_MouseEvent_ToolType_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_MouseEvent_ToolType_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testAxisValue: AxisValue = {
            axis: Axis.SCROLL_VERTICAL,
            value: 1
          };
          let testMouseEvent: MouseEvent = {
            id: 1,
            deviceId: 1,
            actionTime: 1,
            screenId: 1,
            windowId: 1,
            action: Action.CANCEL,
            screenX: 1,
            screenY: 1,
            windowX: 1,
            windowY: 1,
            rawDeltaX: 1,
            rawDeltaY: 1,
            button: Button.LEFT,
            pressedButtons: [Button.LEFT],
            axes: [testAxisValue],
            pressedKeys: [KeyCode.KEYCODE_FN],
            ctrlKey: true,
            altKey: true,
            shiftKey: true,
            logoKey: true,
            fnKey: true,
            capsLock: true,
            numLock: true,
            scrollLock: true,
            toolType: ToolType.MOUSE
          };
          ExpectTrue(testMouseEvent.action == Action.CANCEL);
          ExpectTrue(testMouseEvent.screenX == 1);
          ExpectTrue(testMouseEvent.screenY == 1);
          ExpectTrue(testMouseEvent.windowX == 1);
          ExpectTrue(testMouseEvent.windowY == 1);
          ExpectTrue(testMouseEvent.rawDeltaX == 1);
          ExpectTrue(testMouseEvent.rawDeltaY == 1);
          ExpectTrue(testMouseEvent.button == Button.LEFT);
          ExpectTrue(testMouseEvent.pressedButtons[0] == Button.LEFT);
          ExpectTrue(testMouseEvent.axes[0].axis == Axis.SCROLL_VERTICAL);
          ExpectTrue(testMouseEvent.pressedKeys[0] == KeyCode.KEYCODE_FN);
          ExpectTrue(testMouseEvent.ctrlKey == true);
          ExpectTrue(testMouseEvent.altKey == true);
          ExpectTrue(testMouseEvent.shiftKey == true);
          ExpectTrue(testMouseEvent.logoKey == true);
          ExpectTrue(testMouseEvent.fnKey == true);
          ExpectTrue(testMouseEvent.capsLock == true);
          ExpectTrue(testMouseEvent.numLock == true);
          ExpectTrue(testMouseEvent.scrollLock == true);
          ExpectTrue(testMouseEvent.toolType == ToolType.MOUSE);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
  })
}