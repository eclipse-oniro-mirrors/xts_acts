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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextMenuItemIdTest() {
  describe('TextMenuItemIdTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextMenuItemIdTest beforeEach start");
      try {
        router.clear();
        console.info("TextMenuItemIdTest router clear success");
      } catch (err) {
        console.error("TextMenuItemIdTest router clear error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextMenuItemIdTest after each called");
    });

    /**
     * @tc.name   TextMenuItemIdTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0010
     * @tc.desc   test: Edge.Center = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0010] START');
      expect(Edge.Center).assertEqual(1);
      console.info("[TextMenuItemIdTest_0010] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0020
     * @tc.desc   test: Edge.Baseline = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0020] START');
      expect(Edge.Baseline).assertEqual(3);
      console.info("[TextMenuItemIdTest_0020] END");
      done();
    });

    /**
     * @tc.name   TextMenuItemIdTest_0030
     * @tc.number SUB_ACE_BASIC_ETS_API_TextMenuItemIdTest_0290
     * @tc.desc   test: Edge.Middle = 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextMenuItemIdTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextMenuItemIdTest_0030] START');
      expect(Edge.Middle).assertEqual(5);
      console.info("[TextMenuItemIdTest_0030] END");
      done();
    });
  })
}