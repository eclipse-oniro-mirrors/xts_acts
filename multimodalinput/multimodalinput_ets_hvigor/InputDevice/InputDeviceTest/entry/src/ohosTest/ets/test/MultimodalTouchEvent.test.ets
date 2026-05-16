/*
 * Copyright (C) 2026 Huawei Device cO., lTD.
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
import touchEvent from '@ohos.multimodalInput.touchEvent';

export default function MultimodalTouchEventTest() {
  describe("MultimodalTouchEventTest", ()=> {

    /**
     * @tc.name   SUB_MMI_Input_Api_TouchEvent_Action_0100
     * @tc.number SUB_MMI_Input_Api_TouchEvent_Action_0100
     * @tc.desc   Test TouchEvent Action.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_TouchEvent_Action_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_TouchEvent_Action_0100";
      console.info(`${caseName} enter`);
      try {
        expect(touchEvent.Action.PULL_DOWN == 4).assertTrue();
        expect(touchEvent.Action.PULL_MOVE == 5).assertTrue();
        expect(touchEvent.Action.PULL_UP == 6).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName} catch fail`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} exit`);
    });
  });
}