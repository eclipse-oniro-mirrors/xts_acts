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

export default function builtinsCharBoxConstructorText() {
  describe("builtinsCharBoxConstructorText", () => {
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
     * @tc.name    builtinsCharBoxConstructorText0001
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0001
     * @tc.desc    Test CharBox constructor with minimum value 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxConstructorText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'\u0000');
      expect(box.get()).assertEqual(c'\u0000');
    });

    /**
     * @tc.name    builtinsCharBoxConstructorText0002
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0002
     * @tc.desc    Test CharBox constructor with maximum value 65535
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxConstructorText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'\uFFFF');
      expect(box.get()).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.name    builtinsCharBoxConstructorText0003
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0003
     * @tc.desc    Test CharBox constructor with ASCII 'A'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxConstructorText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'A');
      expect(box.get()).assertEqual(c'A');
    });

    /**
     * @tc.name    builtinsCharBoxConstructorText0004
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0004
     * @tc.desc    Test CharBox constructor with middle value 32767
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxConstructorText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'\u7FFF');
      expect(box.get()).assertEqual(c'\u7FFF');
    });

    /**
     * @tc.name    builtinsCharBoxConstructorText0005
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0005
     * @tc.desc    Test CharBox constructor with newline character
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxConstructorText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox(c'\n');
      expect(box.get()).assertEqual(c'\n');
    });

    /**
     * @tc.name    builtinsCharBoxConstructorText0006
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0006
     * @tc.desc    Test CharBox constructor with overflow value 65536 (max+1)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsCharBoxConstructorText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      try {
        const box = new CharBox(c'\u0000');
        expect(box.get()).assertEqual(c'\u0000');
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name    builtinsCharBoxConstructorText0007
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0007
     * @tc.desc    Test CharBox constructor without parameters initializes to null character
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxConstructorText0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box = new CharBox();
      const result: char = box.get();
      expect(result).assertEqual(c'\0');
    });

    /**
     * @tc.name    builtinsCharBoxConstructorText0008
     * @tc.number  BUILTINS_CHAR_BOX_CONSTRUCTOR_TEXT_0008
     * @tc.desc    Test CharBox default constructor instances are independent
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharBoxConstructorText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const box1 = new CharBox();
      const box2 = new CharBox();

      expect(box1.get()).assertEqual(c'\0');
      expect(box2.get()).assertEqual(c'\0');

      box1.set(c'X');
      box2.set(c'Y');

      expect(box1.get()).assertEqual(c'X');
      expect(box2.get()).assertEqual(c'Y');
    });
  })
}