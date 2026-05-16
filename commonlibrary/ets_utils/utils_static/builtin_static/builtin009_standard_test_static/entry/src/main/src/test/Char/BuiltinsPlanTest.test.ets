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

export default function builtinsPlanTest() {
  describe('builtinsPlanTest', () => {
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
    * @tc.name    builtinsPlanTest0001
    * @tc.number  BUILTINS_PLAN_TEST_0001
    * @tc.desc    Test isInBasicMultilingualPlane(char) returns true for regular BMP values
    * @tc.type    FUNCTION
    * @tc.size    SMALLTEST
    * @tc.level   LEVEL0
    */
    it('builtinsPlanTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.isInBasicMultilingualPlane(c'A')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(c'\u4E2D')).assertTrue();
      expect(Char.isInBasicMultilingualPlane(Char.MIN_VALUE)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(Char.MAX_VALUE)).assertTrue();
    });
        /**
     * @tc.name    builtinsPlanTest0002
     * @tc.number  BUILTINS_PLAN_TEST_0002
     * @tc.desc    Test isInBasicMultilingualPlane returns true for basic ASCII letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(c'A');
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(c'z');
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(c'M');
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0003
     * @tc.number  BUILTINS_PLAN_TEST_0003
     * @tc.desc    Test isInBasicMultilingualPlane returns true for ASCII digits and symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(c'0');
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(c'9');
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(c'@');
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0004
     * @tc.number  BUILTINS_PLAN_TEST_0004
     * @tc.desc    Test isInBasicMultilingualPlane returns false for all values in high surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(Char.HIGH_SURROGATE_MIN);
      expect(result1).assertFalse();
      let result2 = Char.isInBasicMultilingualPlane(c'\uDA88');
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(Char.HIGH_SURROGATE_MAX);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0005
     * @tc.number  BUILTINS_PLAN_TEST_0005
     * @tc.desc    Test isInBasicMultilingualPlane returns false for all values in low surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(Char.LOW_SURROGATE_MIN);
      expect(result1).assertFalse();
      let result2 = Char.isInBasicMultilingualPlane(c'\uDF01');
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(Char.LOW_SURROGATE_MAX);
      expect(result3).assertFalse();
    });
    /**
     * @tc.name    builtinsPlanTest0006
     * @tc.number  BUILTINS_PLAN_TEST_0006
     * @tc.desc    Test instance isInBasicMultilingualPlane method returns correct results for MIN_VALUE, Chinese ideograph, HIGH_SURROGATE_MIN and MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(Char.MIN_VALUE);
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\u4E2D');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
      let instance3 = new Char(Char.HIGH_SURROGATE_MIN);
      let result3 = instance3.isInBasicMultilingualPlane();
      expect(result3).assertFalse();
      let instance4 = new Char(Char.MAX_VALUE);
      let result4 = instance4.isInBasicMultilingualPlane();
      expect(result4).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0007
     * @tc.number  BUILTINS_PLAN_TEST_0007
     * @tc.desc    Test isInBasicMultilingualPlane for values immediately before and after surrogate ranges
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(c'\uD7FF');
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(c'\uE000');
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(c'\uFFFF');
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0008
     * @tc.number  BUILTINS_PLAN_TEST_0008
     * @tc.desc    Test static isInBasicMultilingualPlane with code point parameters for zero and maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0);
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(0xFFFF);
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0009
     * @tc.number  BUILTINS_PLAN_TEST_0009
     * @tc.desc    Test static isInBasicMultilingualPlane with code point parameters at surrogate boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0xD7FF);
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(0xD800);
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(0xDFFF);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0010
     * @tc.number  BUILTINS_PLAN_TEST_0010
     * @tc.desc    Test static isInBasicMultilingualPlane with code point parameters beyond basic multilingual plane
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0x10000);
      expect(result1).assertFalse();
      let result2 = Char.isInBasicMultilingualPlane(0x1F600);
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(Char.MAX_CODE_POINT);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0011
     * @tc.number  BUILTINS_PLAN_TEST_0011
     * @tc.desc    Test isInBasicMultilingualPlane returns true for various writing system values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(c'\u30A2');
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(c'\u0645');
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(c'\uAC00');
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0012
     * @tc.number  BUILTINS_PLAN_TEST_0012
     * @tc.desc    Test isInBasicMultilingualPlane returns true for private use area values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(c'\uE000');
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(c'\uF000');
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(c'\uFFFF');
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0013
     * @tc.number  BUILTINS_PLAN_TEST_0013
     * @tc.desc    Comprehensive test covering high and low surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(c'\uD800');
      expect(result1).assertFalse();
      let result2 = Char.isInBasicMultilingualPlane(c'\uDABC');
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(c'\uDFFF');
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0014
     * @tc.number  BUILTINS_PLAN_TEST_0014
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters for basic BMP values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0);
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(0xFFFF);
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(0x4E2D);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0015
     * @tc.number  BUILTINS_PLAN_TEST_0015
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters at surrogate range boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0xD7FF);
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(0xD800);
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(0xDFFF);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0016
     * @tc.number  BUILTINS_PLAN_TEST_0016
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters after surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0xE000);
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(0xF000);
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(0xFFFF);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0017
     * @tc.number  BUILTINS_PLAN_TEST_0017
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters beyond BMP range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0x10000);
      expect(result1).assertFalse();
      let result2 = Char.isInBasicMultilingualPlane(0x1F600);
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(Char.MAX_CODE_POINT);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0018
     * @tc.number  BUILTINS_PLAN_TEST_0018
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters inside high surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0xD850);
      expect(result1).assertFalse();
      let result2 = Char.isInBasicMultilingualPlane(0xDA88);
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(0xDBFF);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0019
     * @tc.number  BUILTINS_PLAN_TEST_0019
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters inside low surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0xDC00);
      expect(result1).assertFalse();
      let result2 = Char.isInBasicMultilingualPlane(0xDF01);
      expect(result2).assertFalse();
      let result3 = Char.isInBasicMultilingualPlane(0xDFFF);
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0020
     * @tc.number  BUILTINS_PLAN_TEST_0020
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters for common symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(0x00A5);
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(0x20AC);
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(0x00A9);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0021
     * @tc.number  BUILTINS_PLAN_TEST_0021
     * @tc.desc    Test isInBasicMultilingualPlane with code point parameters at critical boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result1 = Char.isInBasicMultilingualPlane(1);
      expect(result1).assertTrue();
      let result2 = Char.isInBasicMultilingualPlane(0xD7FF);
      expect(result2).assertTrue();
      let result3 = Char.isInBasicMultilingualPlane(0xE000);
      expect(result3).assertTrue();
    });
    /**
     * @tc.name    builtinsPlanTest0022
     * @tc.number  BUILTINS_PLAN_TEST_0022
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance = new Char(Char.MIN_VALUE);
      let result = instance.isInBasicMultilingualPlane();
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0023
     * @tc.number  BUILTINS_PLAN_TEST_0023
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance = new Char(Char.MAX_VALUE);
      let result = instance.isInBasicMultilingualPlane();
      expect(result).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0024
     * @tc.number  BUILTINS_PLAN_TEST_0024
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for basic English letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'A');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'z');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0025
     * @tc.number  BUILTINS_PLAN_TEST_0025
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for ASCII digits and common symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'7');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'#');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0026
     * @tc.number  BUILTINS_PLAN_TEST_0026
     * @tc.desc    Test instance isInBasicMultilingualPlane returns false for high surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(Char.HIGH_SURROGATE_MIN);
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertFalse();
      let instance2 = new Char(c'\uDABC');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertFalse();
      let instance3 = new Char(Char.HIGH_SURROGATE_MAX);
      let result3 = instance3.isInBasicMultilingualPlane();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0027
     * @tc.number  BUILTINS_PLAN_TEST_0027
     * @tc.desc    Test instance isInBasicMultilingualPlane returns false for low surrogate range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(Char.LOW_SURROGATE_MIN);
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertFalse();
      let instance2 = new Char(c'\uDF22');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertFalse();
      let instance3 = new Char(Char.LOW_SURROGATE_MAX);
      let result3 = instance3.isInBasicMultilingualPlane();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name    builtinsPlanTest0028
     * @tc.number  BUILTINS_PLAN_TEST_0028
     * @tc.desc    Test instance isInBasicMultilingualPlane for values immediately before and after surrogate ranges
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\uD7FF');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\uE000');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0029
     * @tc.number  BUILTINS_PLAN_TEST_0029
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for common Chinese ideographs
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\u4E2D');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\u56FD');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0030
     * @tc.number  BUILTINS_PLAN_TEST_0030
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for Japanese Katakana
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\u30A2');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\u30D5');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0031
     * @tc.number  BUILTINS_PLAN_TEST_0031
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for Korean syllables
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\uAC00');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\uD7A3');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0032
     * @tc.number  BUILTINS_PLAN_TEST_0032
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for Arabic letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\u0645');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\u0627');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0033
     * @tc.number  BUILTINS_PLAN_TEST_0033
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for private use area values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\uE000');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\uF000');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
      let instance3 = new Char(c'\uFFFF');
      let result3 = instance3.isInBasicMultilingualPlane();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0034
     * @tc.number  BUILTINS_PLAN_TEST_0034
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for common symbols and punctuation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c'\u00A5');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\u00A9');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
      let instance3 = new Char(c'\u20AC');
      let result3 = instance3.isInBasicMultilingualPlane();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name    builtinsPlanTest0035
     * @tc.number  BUILTINS_PLAN_TEST_0035
     * @tc.desc    Test instance isInBasicMultilingualPlane returns true for whitespace values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsPlanTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let instance1 = new Char(c' ');
      let result1 = instance1.isInBasicMultilingualPlane();
      expect(result1).assertTrue();
      let instance2 = new Char(c'\t');
      let result2 = instance2.isInBasicMultilingualPlane();
      expect(result2).assertTrue();
    });
  })
}