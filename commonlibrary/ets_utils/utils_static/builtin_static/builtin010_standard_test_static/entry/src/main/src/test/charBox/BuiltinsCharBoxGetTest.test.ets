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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function builtinsCharBoxGetText() {
  describe("builtinsCharBoxGetText", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    builtinsCharBoxGetText0001
     * @tc.number  BUILTINS_CHAR_BOX_GET_TEXT_0001
     * @tc.desc    Test CharBox get method returns initial null character
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxGetText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox();
      expect(box.get()).assertEqual(c'\0');
    });

    /**
     * @tc.name    builtinsCharBoxGetText0002
     * @tc.number  BUILTINS_CHAR_BOX_GET_TEXT_0002
     * @tc.desc    Test CharBox get method returns 'A' after constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxGetText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'A');
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.name    builtinsCharBoxGetText0003
     * @tc.number  BUILTINS_CHAR_BOX_GET_TEXT_0003
     * @tc.desc    Test CharBox get method returns minimum value 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxGetText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'\u0000');
      expect(box.get()).assertEqual(c'\u0000');
    });

    /**
     * @tc.name    builtinsCharBoxGetText0004
     * @tc.number  BUILTINS_CHAR_BOX_GET_TEXT_0004
     * @tc.desc    Test CharBox get method returns maximum value 65535
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxGetText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'\uFFFF');
      expect(box.get()).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.name    builtinsCharBoxGetText0005
     * @tc.number  BUILTINS_CHAR_BOX_GET_TEXT_0005
     * @tc.desc    Test CharBox get method returns '\n' after constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxGetText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'\n');
      expect(box.get()).assertEqual(c'\n');
    });

    /**
     * @tc.name    builtinsCharBoxGetText0006
     * @tc.number  BUILTINS_CHAR_BOX_GET_TEXT_0006
     * @tc.desc    Test CharBox get method after set method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxGetText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'X');
      box.set(c'Y');
      expect(box.get()).assertEqual(c'Y');
    });
  })
}