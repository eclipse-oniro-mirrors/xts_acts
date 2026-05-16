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

import { AxisValue, MouseEvent, Action, Button, Axis, ToolType } from '@ohos.multimodalInput.mouseEvent';
import { KeyCode } from '@ohos.multimodalInput.keyCode';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalMouseEventComplementTest() {
  describe("MultimodalMouseEventComplementTest", (): void => {

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_MouseEvent_0100
     * @tc.number SUB_MMI_Input_Api_Pointer_MouseEvent_0100
     * @tc.desc   Test MouseEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_Pointer_MouseEvent_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_MouseEvent_0100";
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
            globalX: 1,
            globalY: 1,
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
          expect(testMouseEvent.action).assertEqual(Action.CANCEL);
          expect(testMouseEvent.screenX).assertEqual(1);
          expect(testMouseEvent.screenY).assertEqual(1);
          expect(testMouseEvent.windowX).assertEqual(1);
          expect(testMouseEvent.windowY).assertEqual(1);
          expect(testMouseEvent.rawDeltaX).assertEqual(1);
          expect(testMouseEvent.rawDeltaY).assertEqual(1);
          expect(testMouseEvent.globalX).assertEqual(1);
          expect(testMouseEvent.globalY).assertEqual(1);
          expect(testMouseEvent.button).assertEqual(Button.LEFT);
          expect(testMouseEvent.pressedButtons[0]).assertEqual(Button.LEFT);
          expect(testMouseEvent.axes[0].axis).assertEqual(Axis.SCROLL_VERTICAL);
          expect(testMouseEvent.pressedKeys[0]).assertEqual(KeyCode.KEYCODE_FN);
          expect(testMouseEvent.ctrlKey).assertEqual(true);
          expect(testMouseEvent.altKey).assertEqual(true);
          expect(testMouseEvent.shiftKey).assertEqual(true);
          expect(testMouseEvent.logoKey).assertEqual(true);
          expect(testMouseEvent.fnKey).assertEqual(true);
          expect(testMouseEvent.capsLock).assertEqual(true);
          expect(testMouseEvent.numLock).assertEqual(true);
          expect(testMouseEvent.scrollLock).assertEqual(true);
          expect(testMouseEvent.toolType).assertEqual(ToolType.MOUSE);
          done();
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

  })
}