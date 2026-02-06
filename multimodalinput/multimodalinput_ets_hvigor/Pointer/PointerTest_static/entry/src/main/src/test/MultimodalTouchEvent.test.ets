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

import { Touch, TouchEvent, Action, ToolType, SourceType, FixedMode } from '@ohos.multimodalInput.touchEvent';
import { InputEvent } from '@ohos.multimodalInput.inputEvent'
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalTouchEventTest() {
  describe("MultimodalTouchEventTest", (): void => {
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
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Action_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Action_0100
     * @tc.desc   Test TouchEvent Action
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_Action_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_Action_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(Action.CANCEL == 0);
          ExpectTrue(Action.DOWN == 1);
          ExpectTrue(Action.MOVE == 2);
          ExpectTrue(Action.UP == 3);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_ToolType_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_ToolType_0100
     * @tc.desc   Test TouchEvent ToolType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_ToolType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_ToolType_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(ToolType.FINGER == 0);
          ExpectTrue(ToolType.PEN == 1);
          ExpectTrue(ToolType.RUBBER == 2);
          ExpectTrue(ToolType.BRUSH == 3);
          ExpectTrue(ToolType.PENCIL == 4);
          ExpectTrue(ToolType.AIRBRUSH == 5);
          ExpectTrue(ToolType.MOUSE == 6);
          ExpectTrue(ToolType.LENS == 7);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_SourceType_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_SourceType_0100
     * @tc.desc   Test TouchEvent SourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_SourceType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_SourceType_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(SourceType.TOUCH_SCREEN == 0);
          ExpectTrue(SourceType.PEN == 1);
          ExpectTrue(SourceType.TOUCH_PAD == 2);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_FixedMode_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_FixedMode_0100
     * @tc.desc   Test TouchEvent FixedMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_FixedMode_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_FixedMode_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          ExpectTrue(FixedMode.NONE == 0);
          ExpectTrue(FixedMode.AUTO == 1);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Touch_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Touch_0100
     * @tc.desc   Test TouchEvent Touch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_Touch_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_Touch_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testTouch: Touch = {
            id: 1,
            pressedTime: 1,
            screenX: 1,
            screenY: 1,
            windowX: 1,
            windowY: 1,
            pressure: 1.0,
            width: 1,
            height: 1,
            tiltX: 1,
            tiltY: 1,
            toolX: 1,
            toolY: 1,
            toolWidth: 1,
            toolHeight: 1,
            rawX: 1,
            rawY: 1,
            toolType: ToolType.FINGER,
            fixedDisplayX: 1,
            fixedDisplayY: 1,
          };
          ExpectTrue(testTouch.id == 1);
          ExpectTrue(testTouch.pressedTime == 1);
          ExpectTrue(testTouch.screenX == 1);
          ExpectTrue(testTouch.screenY == 1);
          ExpectTrue(testTouch.windowX == 1);
          ExpectTrue(testTouch.windowY == 1);
          ExpectTrue(testTouch.pressure == 1.0);
          ExpectTrue(testTouch.width == 1);
          ExpectTrue(testTouch.height == 1);
          ExpectTrue(testTouch.tiltX == 1);
          ExpectTrue(testTouch.tiltY == 1);
          ExpectTrue(testTouch.toolX == 1);
          ExpectTrue(testTouch.toolY == 1);
          ExpectTrue(testTouch.toolWidth == 1);
          ExpectTrue(testTouch.toolHeight == 1);
          ExpectTrue(testTouch.rawX == 1);
          ExpectTrue(testTouch.rawY == 1);
          ExpectTrue(testTouch.toolType == ToolType.FINGER);
          ExpectTrue(testTouch.fixedDisplayX == 1);
          ExpectTrue(testTouch.fixedDisplayY == 1);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Touch_0200
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Touch_0200
     * @tc.desc   Test TouchEvent TouchEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_Touch_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_Touch_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testTouch: Touch = {
            id: 1,
            pressedTime: 1,
            screenX: 1,
            screenY: 1,
            windowX: 1,
            windowY: 1,
            pressure: 1.0,
            width: 1,
            height: 1,
            tiltX: 1,
            tiltY: 1,
            toolX: 1,
            toolY: 1,
            toolWidth: 1,
            toolHeight: 1,
            rawX: 1,
            rawY: 1,
            toolType: ToolType.FINGER,
            fixedDisplayX: 1,
            fixedDisplayY: 1,
          };
          let testTouchEvent: TouchEvent = {
            id: 1,
            deviceId: 1,
            actionTime: 1,
            screenId: 1,
            windowId: 1,
            action: Action.CANCEL,
            touch: testTouch,
            touches: [testTouch],
            sourceType: SourceType.TOUCH_SCREEN,
            fixedMode: FixedMode.NONE,
          };
          ExpectTrue(testTouchEvent.action == Action.CANCEL);
          ExpectTrue(testTouchEvent.touch.id == 1);
          ExpectTrue(testTouchEvent.touches[0].id == 1);
          ExpectTrue(testTouchEvent.sourceType == SourceType.TOUCH_SCREEN);
          ExpectTrue(testTouchEvent.fixedMode == FixedMode.NONE);
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_InputEvent_0100
     * @tc.number SUB_MMI_Input_Api_InputEvent_0100
     * @tc.desc   Test InputEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_InputEvent_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_InputEvent_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let testInputEvent: InputEvent = {
            id: 1,
            deviceId: 1,
            actionTime: 1,
            screenId: 1,
            windowId: 1
          };
          ExpectTrue(testInputEvent.id == 1);
          ExpectTrue(testInputEvent.actionTime == 1);
          ExpectTrue(testInputEvent.deviceId == 1);
          ExpectTrue(testInputEvent.screenId == 1);
          ExpectTrue(testInputEvent.windowId == 1);
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