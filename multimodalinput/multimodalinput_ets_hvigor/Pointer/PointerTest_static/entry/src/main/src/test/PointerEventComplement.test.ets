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

import pointer from '@ohos.multimodalInput.pointer';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";

let domain: int = 0x0000;
let tag: string = 'testTag';


export default function MultimodalInputPointerComplementTest() {
  describe("MultimodalInputPointerComplementTest", (): void => {

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_RightClickType_0150
     * @tc.number SUB_MMI_Input_Api_Pointer_RightClickType_0150
     * @tc.desc   Test RightClickType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_Pointer_RightClickType_0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Pointer_RightClickType_0150";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON).assertEqual(4);
          expect(pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON).assertEqual(5);
          expect(pointer.RightClickType.TOUCHPAD_RIGHT_BUTTON).assertEqual(1);
          expect(pointer.RightClickType.TOUCHPAD_LEFT_BUTTON).assertEqual(2);
          expect(pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP).assertEqual(3);
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