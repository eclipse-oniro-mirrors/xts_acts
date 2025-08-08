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

import pointer from '@ohos.multimodalInput.pointer'
import hilog from '@ohos.hilog'
import window from '@ohos.window'
import image from '@ohos.multimedia.image'
import { BusinessError } from "@ohos.base"
import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";

let domain: number = 0x0000;
let tag: string = 'testTag';
let COMMON_PARAMETER_CODE: number = 401;
let DEVICE_NOT_SUPPORT: number = 401;

let PARAMETER_CALLBACK_TYPE_MSG: string = 'Parameter error. The type of callback must be function.';
let PARAMETER_WINDOWID_TYPE_MSG: string = 'Parameter error. The type of windowId must be number.';

export default function MultimodalInputPointerTest() {
  describe("MultimodalInputPointerTest", (): void => {
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
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0100
     * @tc.name SUB_MMI_Input_Api_Pointer_setPointerStyle_0100
     * @tc.desc Test SUB_MMI_Input_Api_Pointer_setPointerStyle_0100
     * @tc.level: Level 2
     * @tc.type: Function
     * @tc.size: MediumTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_MMI_Input_Api_Pointer_setPointerStyle_0100 enter');
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0100";
      let ifSetPointerStyleSuccess = 0;
      try {
        pointer.setPointerStyle(100000, pointer.PointerStyle.CROSS, (err: Error | undefined): void => {
          hilog.info(domain, tag, `${caseName} Set pointer style success`);
          ifSetPointerStyleSuccess++;
          ExpectTrue(ifSetPointerStyleSuccess == 1);
          done();
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, `${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    })
  })
}