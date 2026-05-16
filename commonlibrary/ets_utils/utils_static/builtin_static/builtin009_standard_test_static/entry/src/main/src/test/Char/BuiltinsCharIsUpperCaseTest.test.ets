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
export default function builtinsCharIsUpperCaseTest() {
  describe("builtinsCharIsUpperCaseTest", () => {
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
     * @tc.name    builtinsCharIsUpperCaseTest0001
     * @tc.number  BUILTINS_CHAR_IS_UPPER_CASE_TEST_0001
     * @tc.desc    Test uppercase letter recognition with 16-bit character constraint
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsUpperCaseTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.CHAR_BIT_SIZE).assertEqual(16);
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'B')).assertTrue();
      expect(Char.isUpperCase(c'C')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
      expect(Char.isUpperCase(c'X')).assertTrue();
      expect(Char.isUpperCase(c'Y')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'b')).assertFalse();
      expect(Char.isUpperCase(c'm')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
      expect(Char.isUpperCase(c'0')).assertFalse();
      expect(Char.isUpperCase(c'5')).assertFalse();
      expect(Char.isUpperCase(c'9')).assertFalse();
      expect(Char.isUpperCase(c' ')).assertFalse();
      expect(Char.isUpperCase(c'+')).assertFalse();
      expect(Char.isUpperCase(c'@')).assertFalse();
      expect(Char.isUpperCase(c'\u0010')).assertFalse();
    });

    /**
     * @tc.name    builtinsCharIsUpperCaseTest0002
     * @tc.number  BUILTINS_CHAR_IS_UPPER_CASE_TEST_0002
     * @tc.desc    Test uppercase recognition with max code point characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsUpperCaseTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.MAX_CODE_POINT).assertEqual(0x10FFFF);
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      const maxCodePointStr: string = String.fromCodePoint(Char.MAX_CODE_POINT);
      const highSurrogateCh: char = maxCodePointStr.charAt(0) as char;
      const lowSurrogateCh: char = maxCodePointStr.charAt(1) as char;
      expect(Char.isUpperCase(highSurrogateCh)).assertFalse();
      expect(Char.isUpperCase(lowSurrogateCh)).assertFalse();
    });

    /**
     * @tc.name    builtinsCharIsUpperCaseTest0003
     * @tc.number  BUILTINS_CHAR_IS_UPPER_CASE_TEST_0003
     * @tc.desc    Test high surrogate range with uppercase check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsUpperCaseTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isUpperCase(Char.HIGH_SURROGATE_MIN)).assertFalse();
      expect(Char.isUpperCase(Char.HIGH_SURROGATE_MAX)).assertFalse();
      expect(Char.HIGH_SURROGATE_MIN).assertEqual(c'\uD800');
      expect(Char.HIGH_SURROGATE_MAX).assertEqual(c'\uDBFF');
      expect(Char.isUpperCase(c'\uD800')).assertFalse();
      expect(Char.isUpperCase(c'\uD900')).assertFalse();
      expect(Char.isUpperCase(c'\uDA00')).assertFalse();
      expect(Char.isUpperCase(c'\uDB00')).assertFalse();
      expect(Char.isUpperCase(c'\uDBFF')).assertFalse();
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
    });

    /**
     * @tc.name    builtinsCharIsUpperCaseTest0004
     * @tc.number  BUILTINS_CHAR_IS_UPPER_CASE_TEST_0004
     * @tc.desc    Test low surrogate range with uppercase check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsUpperCaseTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isUpperCase(Char.LOW_SURROGATE_MIN)).assertFalse();
      expect(Char.isUpperCase(Char.LOW_SURROGATE_MAX)).assertFalse();
      expect(Char.LOW_SURROGATE_MIN).assertEqual(c'\uDC00');
      expect(Char.LOW_SURROGATE_MAX).assertEqual(c'\uDFFF');
      expect(Char.isUpperCase(c'\uDC00')).assertFalse();
      expect(Char.isUpperCase(c'\uDD00')).assertFalse();
      expect(Char.isUpperCase(c'\uDE00')).assertFalse();
      expect(Char.isUpperCase(c'\uDF00')).assertFalse();
      expect(Char.isUpperCase(c'\uDFFF')).assertFalse();
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
    });

    /**
     * @tc.name    builtinsCharIsUpperCaseTest0005
     * @tc.number  BUILTINS_CHAR_IS_UPPER_CASE_TEST_0005
     * @tc.desc    Test BMP border characters with uppercase check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsUpperCaseTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const BMP_BORDER: int = 0x10000;
      const borderString: string = String.fromCodePoint(BMP_BORDER);
      const highCh: char = borderString.charAt(0) as char;
      const lowCh: char = borderString.charAt(1) as char;
      expect(Char.isUpperCase(highCh)).assertFalse();
      expect(Char.isUpperCase(lowCh)).assertFalse();
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'm')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
    });

    /**
     * @tc.name    builtinsCharIsUpperCaseTest0006
     * @tc.number  BUILTINS_CHAR_IS_UPPER_CASE_TEST_0006
     * @tc.desc    Test character min and max values with uppercase check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsUpperCaseTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isUpperCase(Char.MIN_VALUE)).assertFalse();
      expect(Char.isUpperCase(Char.MAX_VALUE)).assertFalse();
      expect(Char.MIN_VALUE).assertEqual(c'\u0000');
      expect(Char.MAX_VALUE).assertEqual(c'\uFFFF');
      expect(Char.isUpperCase(c'A')).assertTrue();
      expect(Char.isUpperCase(c'Z')).assertTrue();
      expect(Char.isUpperCase(c'M')).assertTrue();
      expect(Char.isUpperCase(c'a')).assertFalse();
      expect(Char.isUpperCase(c'z')).assertFalse();
      expect(Char.isUpperCase(c'm')).assertFalse();
      expect(Char.isUpperCase(c'0')).assertFalse();
      expect(Char.isUpperCase(c'9')).assertFalse();
      expect(Char.isUpperCase(c' ')).assertFalse();
      expect(Char.isUpperCase(c'+')).assertFalse();
      expect(Char.isUpperCase(Char.MIN_VALUE)).assertFalse();
      expect(Char.isUpperCase(Char.MAX_VALUE)).assertFalse();
    });
  })
}
