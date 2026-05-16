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
export default function builtinsCharToUpperCaseTest() {
  describe("builtinsCharToUpperCaseTest", () => {
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
     * @tc.name    builtinsCharToUpperCaseTest0001
     * @tc.number  BUILTINS_CHAR_TO_UPPER_CASE_TEST_0001
     * @tc.desc    Test uppercase conversion with 16-bit character constraint
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToUpperCaseTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.CHAR_BIT_SIZE).assertEqual(16);
      expect(Char.toUpperCase(c'a')).assertEqual(c'A');
      expect(Char.toUpperCase(c'b')).assertEqual(c'B');
      expect(Char.toUpperCase(c'c')).assertEqual(c'C');
      expect(Char.toUpperCase(c'm')).assertEqual(c'M');
      expect(Char.toUpperCase(c'x')).assertEqual(c'X');
      expect(Char.toUpperCase(c'y')).assertEqual(c'Y');
      expect(Char.toUpperCase(c'z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'A')).assertEqual(c'A');
      expect(Char.toUpperCase(c'B')).assertEqual(c'B');
      expect(Char.toUpperCase(c'C')).assertEqual(c'C');
      expect(Char.toUpperCase(c'M')).assertEqual(c'M');
      expect(Char.toUpperCase(c'Z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'0')).assertEqual(c'0');
      expect(Char.toUpperCase(c'9')).assertEqual(c'9');
      expect(Char.toUpperCase(c' ')).assertEqual(c' ');
      expect(Char.toUpperCase(c'+')).assertEqual(c'+');
      expect(Char.toUpperCase(c'@')).assertEqual(c'@');
      expect(Char.toUpperCase(c'\u0010')).assertEqual(c'\u0010');
    });

    /**
     * @tc.name    builtinsCharToUpperCaseTest0002
     * @tc.number  BUILTINS_CHAR_TO_UPPER_CASE_TEST_0002
     * @tc.desc    Test uppercase conversion with max code point characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToUpperCaseTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.MAX_CODE_POINT).assertEqual(0x10FFFF);
      expect(Char.toUpperCase(c'a')).assertEqual(c'A');
      expect(Char.toUpperCase(c'z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'A')).assertEqual(c'A');
      expect(Char.toUpperCase(c'Z')).assertEqual(c'Z');
      const maxCodePointStr: string = String.fromCodePoint(Char.MAX_CODE_POINT);
      const highSurrogateCh: char = maxCodePointStr.charAt(0) as char;
      const lowSurrogateCh: char = maxCodePointStr.charAt(1) as char;
      expect(Char.toUpperCase(highSurrogateCh)).assertEqual(highSurrogateCh);
      expect(Char.toUpperCase(lowSurrogateCh)).assertEqual(lowSurrogateCh);
    });

    /**
     * @tc.name    builtinsCharToUpperCaseTest0003
     * @tc.number  BUILTINS_CHAR_TO_UPPER_CASE_TEST_0003
     * @tc.desc    Test high surrogate range with uppercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToUpperCaseTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toUpperCase(Char.HIGH_SURROGATE_MIN)).assertEqual(Char.HIGH_SURROGATE_MIN);
      expect(Char.toUpperCase(Char.HIGH_SURROGATE_MAX)).assertEqual(Char.HIGH_SURROGATE_MAX);
      expect(Char.HIGH_SURROGATE_MIN).assertEqual(c'\uD800');
      expect(Char.HIGH_SURROGATE_MAX).assertEqual(c'\uDBFF');
      expect(Char.toUpperCase(c'\uD800')).assertEqual(c'\uD800');
      expect(Char.toUpperCase(c'\uD900')).assertEqual(c'\uD900');
      expect(Char.toUpperCase(c'\uDA00')).assertEqual(c'\uDA00');
      expect(Char.toUpperCase(c'a')).assertEqual(c'A');
      expect(Char.toUpperCase(c'A')).assertEqual(c'A');
    });

    /**
     * @tc.name    builtinsCharToUpperCaseTest0004
     * @tc.number  BUILTINS_CHAR_TO_UPPER_CASE_TEST_0004
     * @tc.desc    Test low surrogate range with uppercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToUpperCaseTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toUpperCase(Char.LOW_SURROGATE_MIN)).assertEqual(Char.LOW_SURROGATE_MIN);
      expect(Char.toUpperCase(Char.LOW_SURROGATE_MAX)).assertEqual(Char.LOW_SURROGATE_MAX);
      expect(Char.LOW_SURROGATE_MIN).assertEqual(c'\uDC00');
      expect(Char.LOW_SURROGATE_MAX).assertEqual(c'\uDFFF');
      expect(Char.toUpperCase(c'\uDC00')).assertEqual(c'\uDC00');
      expect(Char.toUpperCase(c'\uDD00')).assertEqual(c'\uDD00');
      expect(Char.toUpperCase(c'\uDE00')).assertEqual(c'\uDE00');
      expect(Char.toUpperCase(c'z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'Z')).assertEqual(c'Z');
    });

    /**
     * @tc.name    builtinsCharToUpperCaseTest0005
     * @tc.number  BUILTINS_CHAR_TO_UPPER_CASE_TEST_0005
     * @tc.desc    Test BMP border characters with uppercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToUpperCaseTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const BMP_BORDER: int = 0x10000;
      const borderString: string = String.fromCodePoint(BMP_BORDER);
      const highCh: char = borderString.charAt(0) as char;
      const lowCh: char = borderString.charAt(1) as char;
      expect(Char.toUpperCase(highCh)).assertEqual(highCh);
      expect(Char.toUpperCase(lowCh)).assertEqual(lowCh);
      expect(Char.toUpperCase(c'a')).assertEqual(c'A');
      expect(Char.toUpperCase(c'z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'A')).assertEqual(c'A');
      expect(Char.toUpperCase(c'Z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c' ')).assertEqual(c' ');
      expect(Char.toUpperCase(c'0')).assertEqual(c'0');
    });

    /**
     * @tc.name    builtinsCharToUpperCaseTest0006
     * @tc.number  BUILTINS_CHAR_TO_UPPER_CASE_TEST_0006
     * @tc.desc    Test character min and max values with uppercase conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharToUpperCaseTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toUpperCase(Char.MIN_VALUE)).assertEqual(Char.MIN_VALUE);
      expect(Char.toUpperCase(Char.MAX_VALUE)).assertEqual(Char.MAX_VALUE);
      expect(Char.MIN_VALUE).assertEqual(c'\u0000');
      expect(Char.MAX_VALUE).assertEqual(c'\uFFFF');
      expect(Char.toUpperCase(c'a')).assertEqual(c'A');
      expect(Char.toUpperCase(c'z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'A')).assertEqual(c'A');
      expect(Char.toUpperCase(c'Z')).assertEqual(c'Z');
      expect(Char.toUpperCase(c'0')).assertEqual(c'0');
      expect(Char.toUpperCase(c'9')).assertEqual(c'9');
      expect(Char.toUpperCase(c' ')).assertEqual(c' ');
      expect(Char.toUpperCase(c'+')).assertEqual(c'+');
    });
  })
}