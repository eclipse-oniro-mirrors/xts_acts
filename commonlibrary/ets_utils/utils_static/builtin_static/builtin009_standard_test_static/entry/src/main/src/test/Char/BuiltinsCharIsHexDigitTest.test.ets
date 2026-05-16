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
export default function builtinsCharIsHexDigitTest() {
  describe("builtinsCharIsHexDigitTest", () => {
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
     * @tc.name    builtinsCharIsHexDigitTest0001
     * @tc.number  BUILTINS_CHAR_IS_HEX_DIGIT_TEST_0001
     * @tc.desc    Test hexadecimal digit recognition with 16-bit character constraint
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsHexDigitTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.CHAR_BIT_SIZE).assertEqual(16);
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'4')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isHexDigit(c'g')).assertFalse();
      expect(Char.isHexDigit(c'\u0010')).assertFalse();
    });

    /**
     * @tc.name    builtinsCharIsHexDigitTest0002
     * @tc.number  BUILTINS_CHAR_IS_HEX_DIGIT_TEST_0002
     * @tc.desc    Test hexadecimal digit recognition with max code point characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsHexDigitTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.MAX_CODE_POINT).assertEqual(0x10FFFF);
      const maxCodePointStr: string = String.fromCodePoint(Char.MAX_CODE_POINT);
      const highSurrogateCh: char = maxCodePointStr.charAt(0) as char;
      const lowSurrogateCh: char = maxCodePointStr.charAt(1) as char;
      expect(Char.isHexDigit(highSurrogateCh)).assertFalse();
      expect(Char.isHexDigit(lowSurrogateCh)).assertFalse();
    });

    /**
     * @tc.name    builtinsCharIsHexDigitTest0003
     * @tc.number  BUILTINS_CHAR_IS_HEX_DIGIT_TEST_0003
     * @tc.desc    Test high surrogate range with hexadecimal digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsHexDigitTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isHexDigit(Char.HIGH_SURROGATE_MIN)).assertFalse();
      expect(Char.isHexDigit(Char.HIGH_SURROGATE_MAX)).assertFalse();
      expect(Char.HIGH_SURROGATE_MIN).assertEqual(c'\uD800');
      expect(Char.HIGH_SURROGATE_MAX).assertEqual(c'\uDBFF');
      expect(Char.isHexDigit(c'\uD800')).assertFalse();
      expect(Char.isHexDigit(c'\uD900')).assertFalse();
      expect(Char.isHexDigit(c'\uDA00')).assertFalse();
      expect(Char.isHexDigit(c'\uDB00')).assertFalse();
      expect(Char.isHexDigit(c'\uDBFF')).assertFalse();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
    });

    /**
     * @tc.name    builtinsCharIsHexDigitTest0004
     * @tc.number  BUILTINS_CHAR_IS_HEX_DIGIT_TEST_0004
     * @tc.desc    Test low surrogate range with hexadecimal digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsHexDigitTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isHexDigit(Char.LOW_SURROGATE_MIN)).assertFalse();
      expect(Char.isHexDigit(Char.LOW_SURROGATE_MAX)).assertFalse();
      expect(Char.LOW_SURROGATE_MIN).assertEqual(c'\uDC00');
      expect(Char.LOW_SURROGATE_MAX).assertEqual(c'\uDFFF');
      expect(Char.isHexDigit(c'\uDC00')).assertFalse();
      expect(Char.isHexDigit(c'\uDD00')).assertFalse();
      expect(Char.isHexDigit(c'\uDE00')).assertFalse();
      expect(Char.isHexDigit(c'\uDF00')).assertFalse();
      expect(Char.isHexDigit(c'\uDFFF')).assertFalse();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
    });

    /**
     * @tc.name    builtinsCharIsHexDigitTest0005
     * @tc.number  BUILTINS_CHAR_IS_HEX_DIGIT_TEST_0005
     * @tc.desc    Test BMP border characters with hexadecimal digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsHexDigitTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const BMP_BORDER: int = 0x10000;
      const borderString: string = String.fromCodePoint(BMP_BORDER);
      const highCh: char = borderString.charAt(0) as char;
      const lowCh: char = borderString.charAt(1) as char;
      expect(Char.isHexDigit(highCh)).assertFalse();
      expect(Char.isHexDigit(lowCh)).assertFalse();
    });

    /**
     * @tc.name    builtinsCharIsHexDigitTest0006
     * @tc.number  BUILTINS_CHAR_IS_HEX_DIGIT_TEST_0006
     * @tc.desc    Test character min and max values with hexadecimal digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsHexDigitTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isHexDigit(Char.MIN_VALUE)).assertFalse();
      expect(Char.isHexDigit(Char.MAX_VALUE)).assertFalse();
      expect(Char.MIN_VALUE).assertEqual(c'\u0000');
      expect(Char.MAX_VALUE).assertEqual(c'\uFFFF');
      expect(Char.isHexDigit(c'0')).assertTrue();
      expect(Char.isHexDigit(c'9')).assertTrue();
      expect(Char.isHexDigit(c'A')).assertTrue();
      expect(Char.isHexDigit(c'F')).assertTrue();
      expect(Char.isHexDigit(c'a')).assertTrue();
      expect(Char.isHexDigit(c'f')).assertTrue();
      expect(Char.isHexDigit(c'G')).assertFalse();
      expect(Char.isHexDigit(c'g')).assertFalse();
      expect(Char.isHexDigit(c'Z')).assertFalse();
      expect(Char.isHexDigit(c'z')).assertFalse();
      expect(Char.isHexDigit(c'\u4E2D')).assertFalse();
      expect(Char.isHexDigit(c'\uD800')).assertFalse();
      expect(Char.isHexDigit(c'\uDC00')).assertFalse();
      expect(Char.isHexDigit(c' ')).assertFalse();
      expect(Char.isHexDigit(c'+')).assertFalse();
      expect(Char.isHexDigit(c'@')).assertFalse();
    });
  })
}