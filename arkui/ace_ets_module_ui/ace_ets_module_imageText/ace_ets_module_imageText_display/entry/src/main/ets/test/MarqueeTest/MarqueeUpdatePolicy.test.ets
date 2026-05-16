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

export default function MarqueeUpdatePolicyTest() {
  describe('MarqueeUpdatePolicyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("MarqueeUpdatePolicyTest beforeEach start");
      try {
        router.clear();
        console.info("MarqueeUpdatePolicyTest router clear success");
      } catch (err) {
        console.error("MarqueeUpdatePolicyTest router clear error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("MarqueeUpdatePolicyTest after each called");
    });

    /**
     * @tc.name   MarqueeUpdatePolicyTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_MarqueeUpdatePolicyTest_0010
     * @tc.desc   test: MarqueeUpdatePolicy.DEFAULT = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MarqueeUpdatePolicyTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[MarqueeUpdatePolicyTest_0010] START');
      expect(MarqueeUpdatePolicy.DEFAULT).assertEqual(0);
      console.info("[MarqueeUpdatePolicyTest_0010] END");
      done();
    });

    /**
     * @tc.name   MarqueeUpdatePolicyTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_MarqueeUpdatePolicyTest_0020
     * @tc.desc   test: MarqueeUpdatePolicy.PRESERVE_POSITION = 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MarqueeUpdatePolicyTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[MarqueeUpdatePolicyTest_0020] START');
      expect(MarqueeUpdatePolicy.PRESERVE_POSITION).assertEqual(1);
      console.info("[MarqueeUpdatePolicyTest_0020] END");
      done();
    });
  })
}