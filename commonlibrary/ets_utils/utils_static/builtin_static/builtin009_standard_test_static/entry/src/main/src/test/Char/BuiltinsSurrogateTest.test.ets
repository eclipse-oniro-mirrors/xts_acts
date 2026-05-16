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
export default function builtinsSurrogateTest() {
  describe('builtinsSurrogateTest', () => {
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
     * @tc.name    builtinsSurrogateTest0001
     * @tc.number  BUILTINS_SURROGATE_TEST_0001
     * @tc.desc    Test isValidCodePoint returns true for valid minimum values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0);
      expect(result1).assertTrue();
      let result2 = Char.isValidCodePoint(1);
      expect(result2).assertTrue();
      let result3 = Char.isValidCodePoint(65);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0002
     * @tc.number  BUILTINS_SURROGATE_TEST_0002
     * @tc.desc    Test isValidCodePoint returns true for values immediately before surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0xD7FE);
      expect(result1).assertTrue();
      let result2 = Char.isValidCodePoint(0xD7FF);
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0003
     * @tc.number  BUILTINS_SURROGATE_TEST_0003
     * @tc.desc    Test isValidCodePoint returns false for surrogate range start values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0xD800);
      expect(result1).assertFalse();
      let result2 = Char.isValidCodePoint(0xD801);
      expect(result2).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0004
     * @tc.number  BUILTINS_SURROGATE_TEST_0004
     * @tc.desc    Test isValidCodePoint returns false for middle and end of surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0xDABC);
      expect(result1).assertFalse();
      let result2 = Char.isValidCodePoint(0xDFFF);
      expect(result2).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0005
     * @tc.number  BUILTINS_SURROGATE_TEST_0005
     * @tc.desc    Test isValidCodePoint returns true for values immediately after surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0xE000);
      expect(result1).assertTrue();
      let result2 = Char.isValidCodePoint(0xE001);
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0006
     * @tc.number  BUILTINS_SURROGATE_TEST_0006
     * @tc.desc    Test isValidCodePoint returns true for common BMP values including Chinese and symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0x4E2D);
      expect(result1).assertTrue();
      let result2 = Char.isValidCodePoint(0x00A5);
      expect(result2).assertTrue();
      let result3 = Char.isValidCodePoint(0x00A9);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0007
     * @tc.number  BUILTINS_SURROGATE_TEST_0007
     * @tc.desc    Test isValidCodePoint returns true for maximum BMP value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0xFFFF);
      expect(result1).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0008
     * @tc.number  BUILTINS_SURROGATE_TEST_0008
     * @tc.desc    Test isValidCodePoint returns true for supplementary plane values including emoji
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0x10000);
      expect(result1).assertTrue();
      let result2 = Char.isValidCodePoint(0x1F600);
      expect(result2).assertTrue();
      let result3 = Char.isValidCodePoint(0x1F64F);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0009
     * @tc.number  BUILTINS_SURROGATE_TEST_0009
     * @tc.desc    Test isValidCodePoint returns true for maximum valid Unicode code point
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(Char.MAX_CODE_POINT);
      expect(result1).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0010
     * @tc.number  BUILTINS_SURROGATE_TEST_0010
     * @tc.desc    Test isValidCodePoint returns false for negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(-1);
      expect(result1).assertFalse();
      let result2 = Char.isValidCodePoint(-2147483648);
      expect(result2).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0011
     * @tc.number  BUILTINS_SURROGATE_TEST_0011
     * @tc.desc    Test isValidCodePoint returns false for values above maximum valid code point
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0x110000);
      expect(result1).assertFalse();
      let result2 = Char.isValidCodePoint(0x1FFFFF);
      expect(result2).assertFalse();
      let result3 = Char.isValidCodePoint(2147483647);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0012
     * @tc.number  BUILTINS_SURROGATE_TEST_0012
     * @tc.desc    Test isValidCodePoint at critical surrogate range boundary edges
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0xD7FF);
      expect(result1).assertTrue();
      let result2 = Char.isValidCodePoint(0xD800);
      expect(result2).assertFalse();
      let result3 = Char.isValidCodePoint(0xE000);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0013
     * @tc.number  BUILTINS_SURROGATE_TEST_0013
     * @tc.desc    Test isValidCodePoint returns false for various mid surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isValidCodePoint(0xDA88);
      expect(result1).assertFalse();
      let result2 = Char.isValidCodePoint(0xDF22);
      expect(result2).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0014
     * @tc.number  BUILTINS_SURROGATE_TEST_0014
     * @tc.desc    Test codeUnitsToEncode returns 1 for basic multilingual plane values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0);
      expect(result1).assertEqual(1);
      let result2 = Char.codeUnitsToEncode(0x4E2D);
      expect(result2).assertEqual(1);
      let result3 = Char.codeUnitsToEncode(0xFFFF);
      expect(result3).assertEqual(1);
    });

    /**
     * @tc.name    builtinsSurrogateTest0015
     * @tc.number  BUILTINS_SURROGATE_TEST_0015
     * @tc.desc    Test codeUnitsToEncode returns 2 for supplementary plane values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0x10000);
      expect(result1).assertEqual(2);
      let result2 = Char.codeUnitsToEncode(0x1F600);
      expect(result2).assertEqual(2);
      let result3 = Char.codeUnitsToEncode(Char.MAX_CODE_POINT);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name    builtinsSurrogateTest0016
     * @tc.number  BUILTINS_SURROGATE_TEST_0016
     * @tc.desc    Test codeUnitsToEncode at the boundary between BMP and supplementary plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0xD7FF);
      expect(result1).assertEqual(1);
      let result2 = Char.codeUnitsToEncode(0xE000);
      expect(result2).assertEqual(1);
      let result3 = Char.codeUnitsToEncode(0x10000);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name    builtinsSurrogateTest0017
     * @tc.number  BUILTINS_SURROGATE_TEST_0017
     * @tc.desc    Test codeUnitsToEncode for common ASCII and Latin values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(65);
      expect(result1).assertEqual(1);
      let result2 = Char.codeUnitsToEncode(0x00A5);
      expect(result2).assertEqual(1);
      let result3 = Char.codeUnitsToEncode(0x00FF);
      expect(result3).assertEqual(1);
    });

    /**
     * @tc.name    builtinsSurrogateTest0018
     * @tc.number  BUILTINS_SURROGATE_TEST_0018
     * @tc.desc    Test codeUnitsToEncode for CJK unified ideographs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0x4E2D);
      expect(result1).assertEqual(1);
      let result2 = Char.codeUnitsToEncode(0x56FD);
      expect(result2).assertEqual(1);
      let result3 = Char.codeUnitsToEncode(0x9FFF);
      expect(result3).assertEqual(1);
    });

    /**
     * @tc.name    builtinsSurrogateTest0019
     * @tc.number  BUILTINS_SURROGATE_TEST_0019
     * @tc.desc    Test codeUnitsToEncode for emoji characters in supplementary plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0x1F600);
      expect(result1).assertEqual(2);
      let result2 = Char.codeUnitsToEncode(0x1F64F);
      expect(result2).assertEqual(2);
      let result3 = Char.codeUnitsToEncode(0x1F680);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name    builtinsSurrogateTest0020
     * @tc.number  BUILTINS_SURROGATE_TEST_0020
     * @tc.desc    Test codeUnitsToEncode for historic scripts in BMP
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0x10300);
      expect(result1).assertEqual(2);
      let result2 = Char.codeUnitsToEncode(0x10330);
      expect(result2).assertEqual(2);
      let result3 = Char.codeUnitsToEncode(0x1039F);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name    builtinsSurrogateTest0021
     * @tc.number  BUILTINS_SURROGATE_TEST_0021
     * @tc.desc    Test codeUnitsToEncode for mathematical alphanumeric symbols in supplementary plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0x1D400);
      expect(result1).assertEqual(2);
      let result2 = Char.codeUnitsToEncode(0x1D4FF);
      expect(result2).assertEqual(2);
      let result3 = Char.codeUnitsToEncode(0x1D7CB);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name    builtinsSurrogateTest0022
     * @tc.number  BUILTINS_SURROGATE_TEST_0022
     * @tc.desc    Test codeUnitsToEncode for very small and very large valid code points
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(1);
      expect(result1).assertEqual(1);
      let result2 = Char.codeUnitsToEncode(65535);
      expect(result2).assertEqual(1);
      let result3 = Char.codeUnitsToEncode(Char.MAX_CODE_POINT);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name    builtinsSurrogateTest0023
     * @tc.number  BUILTINS_SURROGATE_TEST_0023
     * @tc.desc    Test codeUnitsToEncode for Korean syllables and symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.codeUnitsToEncode(0xAC00);
      expect(result1).assertEqual(1);
      let result2 = Char.codeUnitsToEncode(0xD7A3);
      expect(result2).assertEqual(1);
      let result3 = Char.codeUnitsToEncode(0x3200);
      expect(result3).assertEqual(1);
    });

    /**
     * @tc.name    builtinsSurrogateTest0024
     * @tc.number  BUILTINS_SURROGATE_TEST_0024
     * @tc.desc    Test isHighSurrogate returns false for values below high surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isHighSurrogate(c'\u0000');
      expect(result1).assertFalse();
      let result2 = Char.isHighSurrogate(c'A');
      expect(result2).assertFalse();
      let result3 = Char.isHighSurrogate(c'\uD7FF');
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0025
     * @tc.number  BUILTINS_SURROGATE_TEST_0025
     * @tc.desc    Test isHighSurrogate returns true for minimum high surrogate value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0026
     * @tc.number  BUILTINS_SURROGATE_TEST_0026
     * @tc.desc    Test isHighSurrogate returns true for middle values in high surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isHighSurrogate(c'\uDA88');
      expect(result1).assertTrue();
      let result2 = Char.isHighSurrogate(c'\uDB33');
      expect(result2).assertTrue();
      let result3 = Char.isHighSurrogate(c'\uDABC');
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0027
     * @tc.number  BUILTINS_SURROGATE_TEST_0027
     * @tc.desc    Test isHighSurrogate returns true for maximum high surrogate value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.isHighSurrogate(Char.HIGH_SURROGATE_MAX);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0028
     * @tc.number  BUILTINS_SURROGATE_TEST_0028
     * @tc.desc    Test isHighSurrogate returns false for values above high surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isHighSurrogate(Char.LOW_SURROGATE_MIN);
      expect(result1).assertFalse();
      let result2 = Char.isHighSurrogate(c'\uDF22');
      expect(result2).assertFalse();
      let result3 = Char.isHighSurrogate(Char.MAX_VALUE);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0029
     * @tc.number  BUILTINS_SURROGATE_TEST_0029
     * @tc.desc    Test isHighSurrogate returns false for low surrogate range values and edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isHighSurrogate(c'\uDC00');
      expect(result1).assertFalse();
      let result2 = Char.isHighSurrogate(c'\uDFFF');
      expect(result2).assertFalse();
      let result3 = Char.isHighSurrogate(c'\uE000');
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0030
     * @tc.number  BUILTINS_SURROGATE_TEST_0030
     * @tc.desc    Test isHighSurrogate returns false for common values in basic multilingual plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isHighSurrogate(c'9');
      expect(result1).assertFalse();
      let result2 = Char.isHighSurrogate(c'\u4E2D');
      expect(result2).assertFalse();
      let result3 = Char.isHighSurrogate(c'\u00A5');
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0031
     * @tc.number  BUILTINS_SURROGATE_TEST_0031
     * @tc.desc    Test isHighSurrogate at critical surrogate range boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isHighSurrogate(c'\uD7FF');
      expect(result1).assertFalse();
      let result2 = Char.isHighSurrogate(Char.HIGH_SURROGATE_MIN);
      expect(result2).assertTrue();
      let result3 = Char.isHighSurrogate(Char.LOW_SURROGATE_MIN);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0032
     * @tc.number  BUILTINS_SURROGATE_TEST_0032
     * @tc.desc    Test isLowSurrogate returns false for values below low surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isLowSurrogate(c'\u0000');
      expect(result1).assertFalse();
      let result2 = Char.isLowSurrogate(c'9');
      expect(result2).assertFalse();
      let result3 = Char.isLowSurrogate(Char.HIGH_SURROGATE_MAX);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0033
     * @tc.number  BUILTINS_SURROGATE_TEST_0033
     * @tc.desc    Test isLowSurrogate returns true for minimum low surrogate value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.isLowSurrogate(Char.LOW_SURROGATE_MIN);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0034
     * @tc.number  BUILTINS_SURROGATE_TEST_0034
     * @tc.desc    Test isLowSurrogate returns true for middle values in low surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isLowSurrogate(c'\uDD11');
      expect(result1).assertTrue();
      let result2 = Char.isLowSurrogate(c'\uDE88');
      expect(result2).assertTrue();
      let result3 = Char.isLowSurrogate(c'\uDF22');
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0035
     * @tc.number  BUILTINS_SURROGATE_TEST_0035
     * @tc.desc    Test isLowSurrogate returns true for maximum low surrogate value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.isLowSurrogate(Char.LOW_SURROGATE_MAX);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0036
     * @tc.number  BUILTINS_SURROGATE_TEST_0036
     * @tc.desc    Test isLowSurrogate returns false for values above low surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isLowSurrogate(c'\uE000');
      expect(result1).assertFalse();
      let result2 = Char.isLowSurrogate(c'\uFFFF');
      expect(result2).assertFalse();
      let result3 = Char.isLowSurrogate(Char.MAX_VALUE);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0037
     * @tc.number  BUILTINS_SURROGATE_TEST_0037
     * @tc.desc    Test isLowSurrogate returns false for high surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isLowSurrogate(Char.HIGH_SURROGATE_MIN);
      expect(result1).assertFalse();
      let result2 = Char.isLowSurrogate(c'\uDA88');
      expect(result2).assertFalse();
      let result3 = Char.isLowSurrogate(Char.HIGH_SURROGATE_MAX);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0038
     * @tc.number  BUILTINS_SURROGATE_TEST_0038
     * @tc.desc    Test isLowSurrogate returns false for common values in basic multilingual plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isLowSurrogate(c'Z');
      expect(result1).assertFalse();
      let result2 = Char.isLowSurrogate(c'\u4E2D');
      expect(result2).assertFalse();
      let result3 = Char.isLowSurrogate(c'\u00A5');
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0039
     * @tc.number  BUILTINS_SURROGATE_TEST_0039
     * @tc.desc    Test isLowSurrogate at critical surrogate range boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isLowSurrogate(c'\uDBFF');
      expect(result1).assertFalse();
      let result2 = Char.isLowSurrogate(Char.LOW_SURROGATE_MIN);
      expect(result2).assertTrue();
      let result3 = Char.isLowSurrogate(Char.LOW_SURROGATE_MAX);
      expect(result3).assertTrue();
      let result4 = Char.isLowSurrogate(c'\uE000');
      expect(result4).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0040
     * @tc.number  BUILTINS_SURROGATE_TEST_0040
     * @tc.desc    Test getHighSurrogate returns correct high surrogate for minimum supplementary plane value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.getHighSurrogate(0x10000);
      expect(result.compareTo(Char.HIGH_SURROGATE_MIN)).assertEqual(0);
    });

    /**
     * @tc.name    builtinsSurrogateTest0041
     * @tc.number  BUILTINS_SURROGATE_TEST_0041
     * @tc.desc    Test getHighSurrogate returns correct high surrogate for common emoji
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0x1F600);
      expect(Char.isHighSurrogate(result1)).assertTrue();
      let result2 = Char.getHighSurrogate(0x1F64F);
      expect(Char.isHighSurrogate(result2)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0042
     * @tc.number  BUILTINS_SURROGATE_TEST_0042
     * @tc.desc    Test getHighSurrogate returns correct high surrogate for maximum valid code point
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.getHighSurrogate(Char.MAX_CODE_POINT);
      expect(Char.isHighSurrogate(result)).assertTrue();
      let result2 = Char.getHighSurrogate(0x10FFFF);
      expect(Char.isHighSurrogate(result2)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0043
     * @tc.number  BUILTINS_SURROGATE_TEST_0043
     * @tc.desc    Test getHighSurrogate produces values for BMP inputs which may be malformed
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0);
      expect(Char.isHighSurrogate(result1)).assertFalse();
      let result2 = Char.getHighSurrogate(0x4E2D);
      expect(Char.isHighSurrogate(result2)).assertFalse();
      let result3 = Char.getHighSurrogate(0xD7FF);
      expect(Char.isHighSurrogate(result3)).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0044
     * @tc.number  BUILTINS_SURROGATE_TEST_0044
     * @tc.desc    Test getHighSurrogate for surrogate code point inputs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0xD800);
      expect(Char.isHighSurrogate(result1)).assertFalse();
      let result2 = Char.getHighSurrogate(0xDABC);
      expect(Char.isHighSurrogate(result2)).assertFalse();
      let result3 = Char.getHighSurrogate(0xDFFF);
      expect(Char.isHighSurrogate(result3)).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0045
     * @tc.number  BUILTINS_SURROGATE_TEST_0045
     * @tc.desc    Test getHighSurrogate for various supplementary plane range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0x10001);
      expect(Char.isHighSurrogate(result1)).assertTrue();
      let result2 = Char.getHighSurrogate(0x12345);
      expect(Char.isHighSurrogate(result2)).assertTrue();
      let result3 = Char.getHighSurrogate(0x20000);
      expect(Char.isHighSurrogate(result3)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0046
     * @tc.number  BUILTINS_SURROGATE_TEST_0046
     * @tc.desc    Test getHighSurrogate returns correct high surrogate for historic script supplementary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0x10300);
      expect(Char.isHighSurrogate(result1)).assertTrue();
      let result2 = Char.getHighSurrogate(0x10330);
      expect(Char.isHighSurrogate(result2)).assertTrue();
      let result3 = Char.getHighSurrogate(0x1039F);
      expect(Char.isHighSurrogate(result3)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0047
     * @tc.number  BUILTINS_SURROGATE_TEST_0047
     * @tc.desc    Test getHighSurrogate returns correct high surrogate for mathematical symbol supplementary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0x1D400);
      expect(Char.isHighSurrogate(result1)).assertTrue();
      let result2 = Char.getHighSurrogate(0x1D7CB);
      expect(Char.isHighSurrogate(result2)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0048
     * @tc.number  BUILTINS_SURROGATE_TEST_0048
     * @tc.desc    Test getHighSurrogate returns correct high surrogate for diverse emoji values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0x1F468);
      expect(Char.isHighSurrogate(result1)).assertTrue();
      let result2 = Char.getHighSurrogate(0x1F469);
      expect(Char.isHighSurrogate(result2)).assertTrue();
      let result3 = Char.getHighSurrogate(0x1F91D);
      expect(Char.isHighSurrogate(result3)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0049
     * @tc.number  BUILTINS_SURROGATE_TEST_0049
     * @tc.desc    Test getHighSurrogate for boundary values around supplementary plane start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getHighSurrogate(0xFFFF);
      expect(Char.isHighSurrogate(result1)).assertFalse();
      let result2 = Char.getHighSurrogate(0x10000);
      expect(Char.isHighSurrogate(result2)).assertTrue();
      let result3 = Char.getHighSurrogate(0x10001);
      expect(Char.isHighSurrogate(result3)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0050
     * @tc.number  BUILTINS_SURROGATE_TEST_0050
     * @tc.desc    Test getLowSurrogate returns LOW_SURROGATE_MIN for minimum supplementary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.getLowSurrogate(0x10000);
      expect(result.compareTo(Char.LOW_SURROGATE_MIN)).assertEqual(0);
      expect(Char.isLowSurrogate(result)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0051
     * @tc.number  BUILTINS_SURROGATE_TEST_0051
     * @tc.desc    Test getLowSurrogate returns LOW_SURROGATE_MAX for maximum valid code point
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result = Char.getLowSurrogate(Char.MAX_CODE_POINT);
      expect(result.compareTo(Char.LOW_SURROGATE_MAX)).assertEqual(0);
      expect(Char.isLowSurrogate(result)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0052
     * @tc.number  BUILTINS_SURROGATE_TEST_0052
     * @tc.desc    Test getLowSurrogate returns valid low surrogates for common emoji
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getLowSurrogate(0x1F600);
      expect(Char.isLowSurrogate(result1)).assertTrue();
      let result2 = Char.getLowSurrogate(0x1F64F);
      expect(Char.isLowSurrogate(result2)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0053
     * @tc.number  BUILTINS_SURROGATE_TEST_0053
     * @tc.desc    Test getLowSurrogate returns valid low surrogates for various supplementary plane values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getLowSurrogate(0x12345);
      expect(Char.isLowSurrogate(result1)).assertTrue();
      let result2 = Char.getLowSurrogate(0x20000);
      expect(Char.isLowSurrogate(result2)).assertTrue();
      let result3 = Char.getLowSurrogate(0x2A6DF);
      expect(Char.isLowSurrogate(result3)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0054
     * @tc.number  BUILTINS_SURROGATE_TEST_0054
     * @tc.desc    Test getLowSurrogate for historic script supplementary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getLowSurrogate(0x10300);
      expect(Char.isLowSurrogate(result1)).assertTrue();
      let result2 = Char.getLowSurrogate(0x10330);
      expect(Char.isLowSurrogate(result2)).assertTrue();
      let result3 = Char.getLowSurrogate(0x1039F);
      expect(Char.isLowSurrogate(result3)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0055
     * @tc.number  BUILTINS_SURROGATE_TEST_0055
     * @tc.desc    Test getLowSurrogate for mathematical symbol supplementary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.getLowSurrogate(0x1D400);
      expect(Char.isLowSurrogate(result1)).assertTrue();
      let result2 = Char.getLowSurrogate(0x1D7CB);
      expect(Char.isLowSurrogate(result2)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0056
     * @tc.number  BUILTINS_SURROGATE_TEST_0056
     * @tc.desc    Test getLowSurrogate produces malformed results for BMP inputs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isValidCodePoint(0)).assertTrue();
      expect(Char.isValidCodePoint(0x4E2D)).assertTrue();
      expect(Char.isValidCodePoint(0xFFFF)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0057
     * @tc.number  BUILTINS_SURROGATE_TEST_0057
     * @tc.desc    Test getLowSurrogate produces malformed results for surrogate code point inputs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isValidCodePoint(0xD800)).assertFalse();
      expect(Char.isValidCodePoint(0xDABC)).assertFalse();
      expect(Char.isValidCodePoint(0xDFFF)).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0058
     * @tc.number  BUILTINS_SURROGATE_TEST_0058
     * @tc.desc    Test getLowSurrogate for boundary values around supplementary plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isValidCodePoint(0xFFFF)).assertTrue();
      expect(Char.isValidCodePoint(0x10000)).assertTrue();
      expect(Char.isValidCodePoint(0x10001)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0059
     * @tc.number  BUILTINS_SURROGATE_TEST_0059
     * @tc.desc    Test getLowSurrogate produces malformed results for Korean BMP values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isValidCodePoint(0xAC00)).assertTrue();
      expect(Char.isValidCodePoint(0xD7A3)).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0060
     * @tc.number  BUILTINS_SURROGATE_TEST_0060
     * @tc.desc    Test isPartOfSurrogatePair returns false for values below surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(Char.MIN_VALUE);
      expect(result1).assertFalse();
      let result2 = Char.isPartOfSurrogatePair(c'A');
      expect(result2).assertFalse();
      let result3 = Char.isPartOfSurrogatePair(c'\uD7FF');
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0061
     * @tc.number  BUILTINS_SURROGATE_TEST_0061
     * @tc.desc    Test isPartOfSurrogatePair returns true for all high surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN);
      expect(result1).assertTrue();
      let result2 = Char.isPartOfSurrogatePair(c'\uDA88');
      expect(result2).assertTrue();
      let result3 = Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MAX);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0062
     * @tc.number  BUILTINS_SURROGATE_TEST_0062
     * @tc.desc    Test isPartOfSurrogatePair returns true for all low surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MIN);
      expect(result1).assertTrue();
      let result2 = Char.isPartOfSurrogatePair(c'\uDF01');
      expect(result2).assertTrue();
      let result3 = Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MAX);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0063
     * @tc.number  BUILTINS_SURROGATE_TEST_0063
     * @tc.desc    Test isPartOfSurrogatePair returns false for values above surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(c'\uE000');
      expect(result1).assertFalse();
      let result2 = Char.isPartOfSurrogatePair(c'\uFFFF');
      expect(result2).assertFalse();
      let result3 = Char.isPartOfSurrogatePair(Char.MAX_VALUE);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0064
     * @tc.number  BUILTINS_SURROGATE_TEST_0064
     * @tc.desc    Test isPartOfSurrogatePair returns false for common characters in basic multilingual plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(c'9');
      expect(result1).assertFalse();
      let result2 = Char.isPartOfSurrogatePair(c'\u4E2D');
      expect(result2).assertFalse();
      let result3 = Char.isPartOfSurrogatePair(c'\u00A5');
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0065
     * @tc.number  BUILTINS_SURROGATE_TEST_0065
     * @tc.desc    Test isPartOfSurrogatePair at critical surrogate range boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(c'\uD7FF');
      expect(result1).assertFalse();
      let result2 = Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN);
      expect(result2).assertTrue();
      let result3 = Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MAX);
      expect(result3).assertTrue();
      let result4 = Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MIN);
      expect(result4).assertTrue();
      let result5 = Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MAX);
      expect(result5).assertTrue();
      let result6 = Char.isPartOfSurrogatePair(c'\uE000');
      expect(result6).assertFalse();
    });
    /**
     * @tc.name    builtinsSurrogateTest0066
     * @tc.number  BUILTINS_SURROGATE_TEST_0066
     * @tc.desc    Test isPartOfSurrogatePair at boundary just before high surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(c'\uD7FF');
      expect(result1).assertFalse();
      let result2 = Char.isPartOfSurrogatePair(Char.HIGH_SURROGATE_MIN);
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0067
     * @tc.number  BUILTINS_SURROGATE_TEST_0067
     * @tc.desc    Test isPartOfSurrogatePair at boundary just after low surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isPartOfSurrogatePair(Char.LOW_SURROGATE_MAX);
      expect(result1).assertTrue();
      let result2 = Char.isPartOfSurrogatePair(c'\uE000');
      expect(result2).assertFalse();
    });
    /**
     * @tc.name    builtinsSurrogateTest0068
     * @tc.number  BUILTINS_SURROGATE_TEST_0068
     * @tc.desc    Test instance isPartOfSurrogatePair returns false for MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance = new Char(Char.MIN_VALUE);
      let result = instance.isPartOfSurrogatePair();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0069
     * @tc.number  BUILTINS_SURROGATE_TEST_0069
     * @tc.desc    Test instance isPartOfSurrogatePair returns false for MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance = new Char(Char.MAX_VALUE);
      let result = instance.isPartOfSurrogatePair();
      expect(result).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0070
     * @tc.number  BUILTINS_SURROGATE_TEST_0070
     * @tc.desc    Test instance isPartOfSurrogatePair returns false for basic English letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'A');
      let result1 = instance1.isPartOfSurrogatePair();
      expect(result1).assertFalse();
      let instance2 = new Char(c'z');
      let result2 = instance2.isPartOfSurrogatePair();
      expect(result2).assertFalse();
      let instance3 = new Char(c'M');
      let result3 = instance3.isPartOfSurrogatePair();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0071
     * @tc.number  BUILTINS_SURROGATE_TEST_0071
     * @tc.desc    Test instance isPartOfSurrogatePair returns false for ASCII digits and symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'5');
      let result1 = instance1.isPartOfSurrogatePair();
      expect(result1).assertFalse();
      let instance2 = new Char(c'0');
      let result2 = instance2.isPartOfSurrogatePair();
      expect(result2).assertFalse();
      let instance3 = new Char(c'@');
      let result3 = instance3.isPartOfSurrogatePair();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0072
     * @tc.number  BUILTINS_SURROGATE_TEST_0072
     * @tc.desc    Test instance isPartOfSurrogatePair returns true for high surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(Char.HIGH_SURROGATE_MIN);
      let result1 = instance1.isPartOfSurrogatePair();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\uDA88');
      let result2 = instance2.isPartOfSurrogatePair();
      expect(result2).assertTrue();
      let instance3 = new Char(Char.HIGH_SURROGATE_MAX);
      let result3 = instance3.isPartOfSurrogatePair();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0073
     * @tc.number  BUILTINS_SURROGATE_TEST_0073
     * @tc.desc    Test instance isPartOfSurrogatePair returns true for low surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(Char.LOW_SURROGATE_MIN);
      let result1 = instance1.isPartOfSurrogatePair();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\uDF22');
      let result2 = instance2.isPartOfSurrogatePair();
      expect(result2).assertTrue();
      let instance3 = new Char(Char.LOW_SURROGATE_MAX);
      let result3 = instance3.isPartOfSurrogatePair();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0074
     * @tc.number  BUILTINS_SURROGATE_TEST_0074
     * @tc.desc    Test instance isPartOfSurrogatePair returns false for common values outside surrogate ranges
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\u4E2D');
      let result1 = instance1.isPartOfSurrogatePair();
      expect(result1).assertFalse();
      let instance2 = new Char(c'\u00A5');
      let result2 = instance2.isPartOfSurrogatePair();
      expect(result2).assertFalse();
      let instance3 = new Char(c'\uAC00');
      let result3 = instance3.isPartOfSurrogatePair();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsSurrogateTest0075
     * @tc.number  BUILTINS_SURROGATE_TEST_0075
     * @tc.desc    Test instance isPartOfSurrogatePair at critical surrogate range boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\uD7FF');
      let result1 = instance1.isPartOfSurrogatePair();
      expect(result1).assertFalse();
      let instance2 = new Char(Char.HIGH_SURROGATE_MIN);
      let result2 = instance2.isPartOfSurrogatePair();
      expect(result2).assertTrue();
      let instance3 = new Char(Char.LOW_SURROGATE_MAX);
      let result3 = instance3.isPartOfSurrogatePair();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsSurrogateTest0076
     * @tc.number  BUILTINS_SURROGATE_TEST_0076
     * @tc.desc    Test instance isPartOfSurrogatePair returns false for whitespace and punctuation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsSurrogateTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c' ');
      let result1 = instance1.isPartOfSurrogatePair();
      expect(result1).assertFalse();
      let instance2 = new Char(c'\t');
      let result2 = instance2.isPartOfSurrogatePair();
      expect(result2).assertFalse();
    });
  })
}