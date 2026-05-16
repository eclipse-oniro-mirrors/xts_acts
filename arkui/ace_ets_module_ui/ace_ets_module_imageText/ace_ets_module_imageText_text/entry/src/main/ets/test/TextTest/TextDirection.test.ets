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

export default function TextDirectionTest() {
  describe('TextDirectionTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextDirectionTest beforeEach start");
      try {
        router.clear();
        console.info("TextDirectionTest router clear success");
      } catch (err) {
        console.error("TextDirectionTest router clear error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextDirectionTest after each called");
    });

    /**
     * @tc.name   TextDirectionTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextDirectionTest_0010
     * @tc.desc   test: TextDirection.DEFAULT = 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextDirectionTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextDirectionTest_0010] START');
      expect(TextDirection.DEFAULT).assertEqual(2);
      console.info("[TextDirectionTest_0010] END");
      done();
    });

    /**
     * @tc.name   TextDirectionTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextDirectionTest_0020
     * @tc.desc   test: TextDirection.AUTO = 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextDirectionTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextDirectionTest_0020] START');
      expect(TextDirection.AUTO).assertEqual(3);
      console.info("[TextDirectionTest_0020] END");
      done();
    });

    /**
     * @tc.name   TextDirectionTest_0030
     * @tc.number SUB_ACE_BASIC_ETS_API_TextDirectionTest_0030
     * @tc.desc   test: TextAlign.LEFT = 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextDirectionTest_0030', Level.LEVEL2, async (done: Function) => {
      console.info('[TextDirectionTest_0030] START');
      expect(TextAlign.LEFT).assertEqual(4);
      console.info("[TextDirectionTest_0030] END");
      done();
    });

    /**
     * @tc.name   TextDirectionTest_0040
     * @tc.number SUB_ACE_BASIC_ETS_API_TextDirectionTest_0040
     * @tc.desc   test: TextAlign.RIGHT = 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextDirectionTest_0040', Level.LEVEL2, async (done: Function) => {
      console.info('[TextDirectionTest_0040] START');
      expect(TextAlign.RIGHT).assertEqual(5);
      console.info("[TextDirectionTest_0040] END");
      done();
    });
  })
}