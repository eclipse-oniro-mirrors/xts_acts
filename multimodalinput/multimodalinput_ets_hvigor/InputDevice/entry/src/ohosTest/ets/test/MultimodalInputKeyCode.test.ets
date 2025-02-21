/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { KeyCode } from '@kit.InputKit';

export default function MultimodalInputKeyCodeTest() {
  describe('MultimodalInputKeyCodeTest', () => {
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
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_SEARCH_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_SEARCH_0100
     * @tc.desc: Test keycode KEYCODE_SEARCH.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_MMI_Input_Api_KEYCODE_SEARCH_0100', 0, async (done: Function) => {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_SEARCH_0100";
      try {
        let KEYCODE_SEARCH = KeyCode.KEYCODE_SEARCH;
        if(KEYCODE_SEARCH == 9) {
          console.info(`${caseName} success`);
          ExpectTrue(true);
          done();
        } else {
          console.info(`${caseName} fail, KeyCode value is ${JSON.stringify(KEYCODE_SEARCH)}`);
          ExpectFalse(true);
          done();
        }
      } catch (error) {
        console.info(`${caseName} catch fail`);
        ExpectFalse(true);
        done();
      }
    });
  });
}