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

class TestRuntimeLinker extends RuntimeLinker {
  findAndLoadClass(clsName: string, init: boolean): Class | undefined {
    return undefined
  }
}
export default function builtinsCharToLowerCaseTest() {
  describe("builtinsCharToLowerCaseTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
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
     * @tc.name    builtinsCharToLowerCaseTest0001
     * @tc.number  BUILTINS_CHAR_TO_LOWER_CASE_TEST_0001
     * @tc.desc    Test lowercase conversion with 16-bit character constraint
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToLowerCaseTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.CHAR_BIT_SIZE).assertEqual(16);
      expect(Char.toLowerCase(c'A')).assertEqual(c'a');
      expect(Char.toLowerCase(c'B')).assertEqual(c'b');
      expect(Char.toLowerCase(c'C')).assertEqual(c'c');
      expect(Char.toLowerCase(c'M')).assertEqual(c'm');
      expect(Char.toLowerCase(c'X')).assertEqual(c'x');
      expect(Char.toLowerCase(c'Y')).assertEqual(c'y');
      expect(Char.toLowerCase(c'Z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'a')).assertEqual(c'a');
      expect(Char.toLowerCase(c'b')).assertEqual(c'b');
      expect(Char.toLowerCase(c'c')).assertEqual(c'c');
      expect(Char.toLowerCase(c'm')).assertEqual(c'm');
      expect(Char.toLowerCase(c'z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'0')).assertEqual(c'0');
      expect(Char.toLowerCase(c'9')).assertEqual(c'9');
      expect(Char.toLowerCase(c' ')).assertEqual(c' ');
      expect(Char.toLowerCase(c'+')).assertEqual(c'+');
      expect(Char.toLowerCase(c'@')).assertEqual(c'@');
      expect(Char.toLowerCase(c'\u0010')).assertEqual(c'\u0010');
    });

    /**
     * @tc.name    builtinsCharToLowerCaseTest0002
     * @tc.number  BUILTINS_CHAR_TO_LOWER_CASE_TEST_0002
     * @tc.desc    Test lowercase conversion with max code point characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToLowerCaseTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.MAX_CODE_POINT).assertEqual(0x10FFFF);
      expect(Char.toLowerCase(c'A')).assertEqual(c'a');
      expect(Char.toLowerCase(c'Z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'a')).assertEqual(c'a');
      expect(Char.toLowerCase(c'z')).assertEqual(c'z');
      const maxCodePointStr: string = String.fromCodePoint(Char.MAX_CODE_POINT);
      const highSurrogateCh: char = maxCodePointStr.charAt(0) as char;
      const lowSurrogateCh: char = maxCodePointStr.charAt(1) as char;
      expect(Char.toLowerCase(highSurrogateCh)).assertEqual(highSurrogateCh);
      expect(Char.toLowerCase(lowSurrogateCh)).assertEqual(lowSurrogateCh);
    });

    /**
     * @tc.name    builtinsCharToLowerCaseTest0003
     * @tc.number  BUILTINS_CHAR_TO_LOWER_CASE_TEST_0003
     * @tc.desc    Test high surrogate range with lowercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToLowerCaseTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLowerCase(Char.HIGH_SURROGATE_MIN)).assertEqual(Char.HIGH_SURROGATE_MIN);
      expect(Char.toLowerCase(Char.HIGH_SURROGATE_MAX)).assertEqual(Char.HIGH_SURROGATE_MAX);
      expect(Char.HIGH_SURROGATE_MIN).assertEqual(c'\uD800');
      expect(Char.HIGH_SURROGATE_MAX).assertEqual(c'\uDBFF');
      expect(Char.toLowerCase(c'\uD800')).assertEqual(c'\uD800');
      expect(Char.toLowerCase(c'\uD900')).assertEqual(c'\uD900');
      expect(Char.toLowerCase(c'\uDA00')).assertEqual(c'\uDA00');
      expect(Char.toLowerCase(c'A')).assertEqual(c'a');
      expect(Char.toLowerCase(c'a')).assertEqual(c'a');
    });

    /**
     * @tc.name    builtinsCharToLowerCaseTest0004
     * @tc.number  BUILTINS_CHAR_TO_LOWER_CASE_TEST_0004
     * @tc.desc    Test low surrogate range with lowercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToLowerCaseTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLowerCase(Char.LOW_SURROGATE_MIN)).assertEqual(Char.LOW_SURROGATE_MIN);
      expect(Char.toLowerCase(Char.LOW_SURROGATE_MAX)).assertEqual(Char.LOW_SURROGATE_MAX);
      expect(Char.LOW_SURROGATE_MIN).assertEqual(c'\uDC00');
      expect(Char.LOW_SURROGATE_MAX).assertEqual(c'\uDFFF');
      expect(Char.toLowerCase(c'\uDC00')).assertEqual(c'\uDC00');
      expect(Char.toLowerCase(c'\uDD00')).assertEqual(c'\uDD00');
      expect(Char.toLowerCase(c'\uDE00')).assertEqual(c'\uDE00');
      expect(Char.toLowerCase(c'Z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'z')).assertEqual(c'z');
    });

    /**
     * @tc.name    builtinsCharToLowerCaseTest0005
     * @tc.number  BUILTINS_CHAR_TO_LOWER_CASE_TEST_0005
     * @tc.desc    Test BMP border characters with lowercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToLowerCaseTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const BMP_BORDER: int = 0x10000;
      const borderString: string = String.fromCodePoint(BMP_BORDER);
      const highCh: char = borderString.charAt(0) as char;
      const lowCh: char = borderString.charAt(1) as char;
      expect(Char.toLowerCase(highCh)).assertEqual(highCh);
      expect(Char.toLowerCase(lowCh)).assertEqual(lowCh);
      expect(Char.toLowerCase(c'A')).assertEqual(c'a');
      expect(Char.toLowerCase(c'Z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'a')).assertEqual(c'a');
      expect(Char.toLowerCase(c'z')).assertEqual(c'z');
      expect(Char.toLowerCase(c' ')).assertEqual(c' ');
      expect(Char.toLowerCase(c'0')).assertEqual(c'0');
    });

    /**
     * @tc.name    builtinsCharToLowerCaseTest0006
     * @tc.number  BUILTINS_CHAR_TO_LOWER_CASE_TEST_0006
     * @tc.desc    Test character min and max values with lowercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToLowerCaseTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLowerCase(Char.MIN_VALUE)).assertEqual(Char.MIN_VALUE);
      expect(Char.toLowerCase(Char.MAX_VALUE)).assertEqual(Char.MAX_VALUE);
      expect(Char.MIN_VALUE).assertEqual(c'\u0000');
      expect(Char.MAX_VALUE).assertEqual(c'\uFFFF');
      expect(Char.toLowerCase(c'A')).assertEqual(c'a');
      expect(Char.toLowerCase(c'Z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'a')).assertEqual(c'a');
      expect(Char.toLowerCase(c'z')).assertEqual(c'z');
      expect(Char.toLowerCase(c'0')).assertEqual(c'0');
      expect(Char.toLowerCase(c'9')).assertEqual(c'9');
      expect(Char.toLowerCase(c' ')).assertEqual(c' ');
      expect(Char.toLowerCase(c'+')).assertEqual(c'+');
      expect(Char.toLowerCase(Char.MIN_VALUE)).assertEqual(Char.MIN_VALUE);
      expect(Char.toLowerCase(Char.MAX_VALUE)).assertEqual(Char.MAX_VALUE);
    });
  })
}