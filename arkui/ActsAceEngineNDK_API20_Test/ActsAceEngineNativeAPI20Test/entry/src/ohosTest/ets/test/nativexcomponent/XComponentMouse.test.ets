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

import { beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";
import { MouseButton, Point } from "@kit.TestKit";

export default function XComponentMouseTest() {
  describe('XComponentMouseTest', () => {
    const x1: number = Math.floor(globalThis.winWidth / 2 + globalThis.winLeft);
    const y1: number = Math.floor(globalThis.winHeight / 2 + globalThis.winTop);
    const x2: number = Math.floor(globalThis.winWidth / 4 + globalThis.winLeft);
    const y2: number = Math.floor(globalThis.winHeight / 4 + globalThis.winTop);
    const moveFrom: Point = { x: x1, y: y1 };
    const moveTo: Point = { x: x2, y: y2 };
    const speed: number = 2500;
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`NativeXComponent/MouseNativeXComponent`, done);
    })
    /**
     * @tc.name   testMouseEventAction004
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_MOUSEEVENTACTION_0400
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMouseEventAction004', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_MOUSEEVENTACTION_0400 start<====`);
        await Utils.driver.mouseMoveWithTrack(moveFrom, moveTo, speed);
        let Result: number = nativexcomponent.MouseEventAction(3);
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_MOUSEEVENTACTION_0400 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testMouseEventTimeStamp
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_MOUSEEVENT_TIMESTAMP_0100
     * @tc.desc   Test SUB_ARKUI_ACE_ENGINE_GetTouchPointDisplayY function works fine.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMouseEventTimeStamp', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_MOUSEEVENT_TIMESTAMP_0100 start<====`);
        await Utils.driver.mouseClick(moveTo, MouseButton.MOUSE_BUTTON_LEFT);
        let Result: number = nativexcomponent.MouseEventTimeStamp();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_NATIVEXCOMPONENT_MOUSEEVENT_TIMESTAMP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
  })
}