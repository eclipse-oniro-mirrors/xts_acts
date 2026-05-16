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

import { Touch, TouchEvent, Action, ToolType, SourceType } from '@ohos.multimodalInput.touchEvent';
import { InputEvent } from '@ohos.multimodalInput.inputEvent'
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalTouchEventComplementTest() {
  describe("MultimodalTouchEventComplementTest", (): void => {

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Touch_0150
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Touch_0150
     * @tc.desc   Test TouchEvent Touch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_TouchEvent_Touch_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_TouchEvent_Touch_0150";
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
            globalX: 1,
            globalY: 1,
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
          expect(testTouch.id).assertEqual(1);
          expect(testTouch.pressedTime).assertEqual(1);
          expect(testTouch.screenX).assertEqual(1);
          expect(testTouch.screenY).assertEqual(1);
          expect(testTouch.windowX).assertEqual(1);
          expect(testTouch.windowY).assertEqual(1);
          expect(testTouch.pressure).assertEqual(1.0);
          expect(testTouch.globalX).assertEqual(1);
          expect(testTouch.globalY).assertEqual(1);
          expect(testTouch.width).assertEqual(1);
          expect(testTouch.height).assertEqual(1);
          expect(testTouch.tiltX).assertEqual(1);
          expect(testTouch.tiltY).assertEqual(1);
          expect(testTouch.toolX).assertEqual(1);
          expect(testTouch.toolY).assertEqual(1);
          expect(testTouch.toolWidth).assertEqual(1);
          expect(testTouch.toolHeight).assertEqual(1);
          expect(testTouch.rawX).assertEqual(1);
          expect(testTouch.rawY).assertEqual(1);
          expect(testTouch.toolType).assertEqual(ToolType.FINGER);
          expect(testTouch.fixedDisplayX).assertEqual(1);
          expect(testTouch.fixedDisplayY).assertEqual(1);
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