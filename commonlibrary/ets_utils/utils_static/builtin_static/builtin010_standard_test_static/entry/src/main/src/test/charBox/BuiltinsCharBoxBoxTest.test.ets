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

export default function builtinsCharBoxBoxText() {
  describe("builtinsCharBoxBoxText", () => {
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
     * @tc.name    builtinsCharBoxBoxText0001
     * @tc.number  BUILTINS_CHAR_BOX_BOX_TEXT_0001
     * @tc.desc    Test CharBox.box method with minimum value 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxBoxText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = CharBox.box(c'\u0000');
      const result: char = box.get();
      expect(result).assertEqual(c'\u0000');
    });

    /**
     * @tc.name    builtinsCharBoxBoxText0002
     * @tc.number  BUILTINS_CHAR_BOX_BOX_TEXT_0002
     * @tc.desc    Test CharBox.box method with maximum value 65535
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxBoxText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = CharBox.box(c'\uFFFF');
      const result: char = box.get();
      expect(result).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.name    builtinsCharBoxBoxText0003
     * @tc.number  BUILTINS_CHAR_BOX_BOX_TEXT_0003
     * @tc.desc    Test CharBox.box method with ASCII character 'A'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxBoxText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = CharBox.box(c'A');
      const result: char = box.get();
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.name    builtinsCharBoxBoxText0004
     * @tc.number  BUILTINS_CHAR_BOX_BOX_TEXT_0004
     * @tc.desc    Test CharBox.box method with middle value 32767
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxBoxText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = CharBox.box(c'\u7FFF');
      const result: char = box.get();
      expect(result).assertEqual(c'\u7FFF');
    });

    /**
     * @tc.name    builtinsCharBoxBoxText0005
     * @tc.number  BUILTINS_CHAR_BOX_BOX_TEXT_0005
     * @tc.desc    Test CharBox.box method with newline character
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxBoxText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = CharBox.box(c'\n');
      const result: char = box.get();
      expect(result).assertEqual(c'\n');
    });

  })
}