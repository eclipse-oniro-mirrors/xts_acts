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
export default function builtinsCharIsBinDigitTest() {
  describe("builtinsCharIsBinDigitTest", () => {
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
     * @tc.name    builtinsCharIsBinDigitTest0001
     * @tc.number  BUILTINS_CHAR_IS_BIN_DIGIT_TEST_0001
     * @tc.desc    Test binary digit recognition with 16-bit character constraint
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsBinDigitTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isBinDigit(c'0')).assertTrue();
      const zeroCode = 0x30;
      const isZeroIn16BitRange = (zeroCode >= 0 && zeroCode <= 0xFFFF);
      expect(isZeroIn16BitRange).assertTrue();
      expect(Char.CHAR_BIT_SIZE).assertEqual(16);
      expect(Char.isBinDigit(c'1')).assertTrue();
      const oneCode = 0x31;
      const isOneIn16BitRange = (oneCode >= 0 && oneCode <= 0xFFFF);
      expect(isOneIn16BitRange).assertTrue();
      expect(Char.isBinDigit(c'\u0010')).assertFalse();
    });

    /**
     * @tc.name    builtinsCharIsBinDigitTest0002
     * @tc.number  BUILTINS_CHAR_IS_BIN_DIGIT_TEST_0002
     * @tc.desc    Test max code point as character parameter for binary digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsBinDigitTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bmpMaxChar: char = c'\uFFFF';
      expect(Char.isBinDigit(bmpMaxChar)).assertFalse();
      const maxCodePointStr = String.fromCodePoint(Char.MAX_CODE_POINT);
      expect(maxCodePointStr.length).assertEqual(2);
      const char1 = maxCodePointStr.charAt(0) as char;
      const char2 = maxCodePointStr.charAt(1) as char;
      expect(Char.isBinDigit(char1)).assertFalse();
      expect(Char.isBinDigit(char2)).assertFalse();
      const code1 = char1.toString().charCodeAt(0);
      const code2 = char2.toString().charCodeAt(0);
      expect(code1).assertEqual(0xDBFF);
      expect(code2).assertEqual(0xDFFF);
    });

    /**
     * @tc.name    builtinsCharIsBinDigitTest0003
     * @tc.number  BUILTINS_CHAR_IS_BIN_DIGIT_TEST_0003
     * @tc.desc    Test high surrogate boundary values with binary digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsBinDigitTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isBinDigit(Char.HIGH_SURROGATE_MIN)).assertFalse();
      expect(Char.isBinDigit(Char.HIGH_SURROGATE_MAX)).assertFalse();
      expect(Char.HIGH_SURROGATE_MIN).assertEqual(c'\uD800');
      expect(Char.HIGH_SURROGATE_MAX).assertEqual(c'\uDBFF');
    });

    /**
     * @tc.name    builtinsCharIsBinDigitTest0004
     * @tc.number  BUILTINS_CHAR_IS_BIN_DIGIT_TEST_0004
     * @tc.desc    Test low surrogate boundary values with binary digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsBinDigitTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isBinDigit(Char.LOW_SURROGATE_MIN)).assertFalse();
      expect(Char.isBinDigit(Char.LOW_SURROGATE_MAX)).assertFalse();
      expect(Char.LOW_SURROGATE_MIN).assertEqual(c'\uDC00');
      expect(Char.LOW_SURROGATE_MAX).assertEqual(c'\uDFFF');
    });

    /**
     * @tc.name    builtinsCharIsBinDigitTest0005
     * @tc.number  BUILTINS_CHAR_IS_BIN_DIGIT_TEST_0005
     * @tc.desc    Test BMP border character with binary digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsBinDigitTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const BMP_BORDER = 0x10000;
      const borderString = String.fromCodePoint(BMP_BORDER);
      expect(borderString.length).assertEqual(2);
      const highSurrogateChar = borderString.charAt(0) as char;
      const lowSurrogateChar = borderString.charAt(1) as char;
      expect(Char.isBinDigit(highSurrogateChar)).assertFalse();
      expect(Char.isBinDigit(lowSurrogateChar)).assertFalse();
      const highCode = highSurrogateChar.toString().charCodeAt(0);
      const lowCode = lowSurrogateChar.toString().charCodeAt(0);
      expect(highCode).assertEqual(0xD800);
      expect(lowCode).assertEqual(0xDC00);
    });

    /**
     * @tc.name    builtinsCharIsBinDigitTest0006
     * @tc.number  BUILTINS_CHAR_IS_BIN_DIGIT_TEST_0006
     * @tc.desc    Test character min and max values with binary digit check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharIsBinDigitTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isBinDigit(Char.MIN_VALUE)).assertFalse();
      expect(Char.isBinDigit(Char.MAX_VALUE)).assertFalse();
      expect(Char.MIN_VALUE).assertEqual(c'\u0000');
      expect(Char.MAX_VALUE).assertEqual(c'\uFFFF');
    });
  })
}