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
function createTreeString(size: number): string {
  let result = '[';
  while (result.length < size) {
    result += '{"a":1},';
  }
  result += '{"a":1}]';
  return result;
}
export default function builtinsCharCharsToCodePointTest() {
  describe("builtinsCharCharsToCodePointTest", () => {
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
     * @tc.name    builtinsCharCharsToCodePointTest0001
     * @tc.number  BUILTINS_CHAR_CHARS_TO_CODE_POINT_TEST_0001
     * @tc.desc    Test conversion of two 16-bit surrogate chars to code point
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharCharsToCodePointTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.CHAR_BIT_SIZE).assertEqual(16);
      const highSurrogate: char = c'\uD83D';
      const lowSurrogate: char = c'\uDE00';
      const codePoint = Char.charsToCodePoint(highSurrogate, lowSurrogate);
      expect(codePoint).assertEqual(0x1F600);
      const exceeds16Bits = (codePoint > 0xFFFF);
      expect(exceeds16Bits).assertTrue();
      const result = Char.charsToCodePoint(c'\u0010', c'\u0010');
      const expected = 0x10000 + (0x0010 - 0xD800) * 0x400 + (0x0010 - 0xDC00);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsCharCharsToCodePointTest0002
     * @tc.number  BUILTINS_CHAR_CHARS_TO_CODE_POINT_TEST_0002
     * @tc.desc    Test maximum code point conversion using surrogate pair
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharCharsToCodePointTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxCodePoint = Char.MAX_CODE_POINT;
      const code = maxCodePoint - 0x10000;
      const highSurrogateValue = (code >> 10) + 0xD800;
      const lowSurrogateValue = (code & 0x3FF) + 0xDC00;
      const highSurrogate: char = c'\uDBFF';
      const lowSurrogate: char = c'\uDFFF';
      const result = Char.charsToCodePoint(highSurrogate, lowSurrogate);
      expect(result).assertEqual(maxCodePoint);
      expect(result).assertEqual(0x10FFFF);
    });

    /**
     * @tc.name    builtinsCharCharsToCodePointTest0003
     * @tc.number  BUILTINS_CHAR_CHARS_TO_CODE_POINT_TEST_0003
     * @tc.desc    Test high surrogate boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharCharsToCodePointTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minResult = Char.charsToCodePoint(
        Char.HIGH_SURROGATE_MIN,
        c'\uDC00'
      );
      expect(minResult).assertEqual(0x10000);
      const maxHighResult = Char.charsToCodePoint(
        Char.HIGH_SURROGATE_MAX,
        c'\uDC00'
      );
      expect(maxHighResult).assertEqual(0x10FC00);
    });

    /**
     * @tc.name    builtinsCharCharsToCodePointTest0004
     * @tc.number  BUILTINS_CHAR_CHARS_TO_CODE_POINT_TEST_0004
     * @tc.desc    Test low surrogate boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharCharsToCodePointTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minLowResult = Char.charsToCodePoint(
        c'\uD800',
      Char.LOW_SURROGATE_MIN
      );
      expect(minLowResult).assertEqual(0x10000);
      const maxLowResult = Char.charsToCodePoint(
        c'\uD800',
      Char.LOW_SURROGATE_MAX
      );
      expect(maxLowResult).assertEqual(0x103FF);
      const maxBothResult = Char.charsToCodePoint(
        c'\uDBFF',
      Char.LOW_SURROGATE_MAX
      );
      expect(maxBothResult).assertEqual(0x10FFFF);
    });

    /**
     * @tc.name    builtinsCharCharsToCodePointTest0005
     * @tc.number  BUILTINS_CHAR_CHARS_TO_CODE_POINT_TEST_0005
     * @tc.desc    Test BMP border distinction and supplementary plane minimum
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharCharsToCodePointTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const minSupplHigh: char = c'\uD800';
      const minSupplLow: char = c'\uDC00';
      const minSupplResult = Char.charsToCodePoint(minSupplHigh, minSupplLow);
      expect(minSupplResult).assertEqual(0x10000);
      const isGreaterThanBMP = (minSupplResult !== 0xFFFF);
      expect(isGreaterThanBMP).assertTrue();
    });

    /**
     * @tc.name    builtinsCharCharsToCodePointTest0006
     * @tc.number  BUILTINS_CHAR_CHARS_TO_CODE_POINT_TEST_0006
     * @tc.desc    Test char min and max values with surrogate conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsCharCharsToCodePointTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.MIN_VALUE).assertEqual(c'\u0000');
      expect(Char.MAX_VALUE).assertEqual(c'\uFFFF');
      const result = Char.charsToCodePoint(Char.MIN_VALUE, Char.MIN_VALUE);
      const expected = 0x10000 + (0x0000 - 0xD800) * 0x400 + (0x0000 - 0xDC00);
      expect(result).assertEqual(expected);
    });
  })
}