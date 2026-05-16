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

export default function builtinsValueConversionTest() {
  describe('builtinsValueConversionTest', () => {
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
     * @tc.name    builtinsValueConversionTest0001
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0001
     * @tc.desc    Test toByte method with minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0000');
      expect(c.toByte()).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0002
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0002
     * @tc.desc    Test toByte method with maximum byte range value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u007F');
      expect(c.toByte()).assertEqual(127);
    });

    /**
     * @tc.name    builtinsValueConversionTest0003
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0003
     * @tc.desc    Test toByte method with value exceeding byte range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0080');
      expect(c.toByte()).assertEqual(-128);
    });

    /**
     * @tc.name    builtinsValueConversionTest0004
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0004
     * @tc.desc    Test toByte method with maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFF');
      expect(c.toByte()).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsValueConversionTest0005
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0005
     * @tc.desc    Test toShort method with minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0000');
      expect(c.toShort()).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0006
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0006
     * @tc.desc    Test toShort method with maximum positive short range value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u7FFF');
      expect(c.toShort()).assertEqual(32767);
    });

    /**
     * @tc.name    builtinsValueConversionTest0007
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0007
     * @tc.desc    Test toShort method with value exceeding positive short range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u8000');
      expect(c.toShort()).assertEqual(-32768);
    });

    /**
     * @tc.name    builtinsValueConversionTest0008
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0008
     * @tc.desc    Test toShort method with maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFF');
      expect(c.toShort()).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsValueConversionTest0009
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0009
     * @tc.desc    Test toInt method with minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0000');
      expect(c.toInt()).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0010
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0010
     * @tc.desc    Test toInt method with ASCII digit
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'5');
      expect(c.toInt()).assertEqual(53);
    });

    /**
     * @tc.name    builtinsValueConversionTest0011
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0011
     * @tc.desc    Test toInt method with uppercase letter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'A');
      expect(c.toInt()).assertEqual(65);
    });

    /**
     * @tc.name    builtinsValueConversionTest0012
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0012
     * @tc.desc    Test toInt method with lowercase letter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'z');
      expect(c.toInt()).assertEqual(122);
    });

    /**
     * @tc.name    builtinsValueConversionTest0013
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0013
     * @tc.desc    Test toInt method with BMP border value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFE');
      expect(c.toInt()).assertEqual(65534);
    });

    /**
     * @tc.name    builtinsValueConversionTest0014
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0014
     * @tc.desc    Test toInt method with maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFF');
      expect(c.toInt()).assertEqual(65535);
    });

    /**
     * @tc.name    builtinsValueConversionTest0015
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0015
     * @tc.desc    Test toLong method with minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0000');
      expect(c.toLong()).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0016
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0016
     * @tc.desc    Test toLong method with typical ASCII value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'M');
      expect(c.toLong()).assertEqual(77);
    });

    /**
     * @tc.name    builtinsValueConversionTest0017
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0017
     * @tc.desc    Test toLong method with high range value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uD7FF');
      expect(c.toLong()).assertEqual(55295);
    });

    /**
     * @tc.name    builtinsValueConversionTest0018
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0018
     * @tc.desc    Test toLong method with maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFF');
      expect(c.toLong()).assertEqual(65535);
    });

    /**
     * @tc.name    builtinsValueConversionTest0019
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0019
     * @tc.desc    Test toFloat method with minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0000');
      expect(c.toFloat()).assertEqual(0.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0020
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0020
     * @tc.desc    Test toFloat method with typical ASCII value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'@');
      expect(c.toFloat()).assertEqual(64.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0021
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0021
     * @tc.desc    Test toFloat method with surrogate range start value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uD800');
      expect(c.toFloat()).assertEqual(55296.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0022
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0022
     * @tc.desc    Test toFloat method with maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFF');
      expect(c.toFloat()).assertEqual(65535.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0023
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0023
     * @tc.desc    Test toDouble method with minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0000');
      expect(c.toDouble()).assertEqual(0.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0024
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0024
     * @tc.desc    Test toDouble method with typical alphanumeric value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'3');
      expect(c.toDouble()).assertEqual(51.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0025
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0025
     * @tc.desc    Test toDouble method with punctuation value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'~');
      expect(c.toDouble()).assertEqual(126.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0026
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0026
     * @tc.desc    Test toDouble method with maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFF');
      expect(c.toDouble()).assertEqual(65535.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0027
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0027
     * @tc.desc    Test toChar method with minimum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\u0000');
      expect(c.toChar()).assertEqual(c'\u0000');
    });

    /**
     * @tc.name    builtinsValueConversionTest0028
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0028
     * @tc.desc    Test toChar method with ASCII value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'X');
      expect(c.toChar()).assertEqual(c'X');
    });

    /**
     * @tc.name    builtinsValueConversionTest0029
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0029
     * @tc.desc    Test toChar method with high range code unit
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uE000');
      expect(c.toChar()).assertEqual(c'\uE000');
    });

    /**
     * @tc.name    builtinsValueConversionTest0030
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0030
     * @tc.desc    Test toChar method with maximum value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let c: Char = new Char(c'\uFFFF');
      expect(c.toChar()).assertEqual(c'\uFFFF');
    });
    /**
     * @tc.name    builtinsValueConversionTest0031
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0031
     * @tc.desc    Test static toByte method with minimum input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toByte(c'\u0000')).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0032
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0032
     * @tc.desc    Test static toByte method with maximum positive range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toByte(c'\u007F')).assertEqual(127);
    });

    /**
     * @tc.name    builtinsValueConversionTest0033
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0033
     * @tc.desc    Test static toByte method with negative overflow boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toByte(c'\u0080')).assertEqual(-128);
    });

    /**
     * @tc.name    builtinsValueConversionTest0034
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0034
     * @tc.desc    Test static toByte method with all bits set
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toByte(c'\uFFFF')).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsValueConversionTest0035
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0035
     * @tc.desc    Test static toShort method with zero input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toShort(c'\u0000')).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0036
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0036
     * @tc.desc    Test static toShort method with positive maximum
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toShort(c'\u7FFF')).assertEqual(32767);
    });

    /**
     * @tc.name    builtinsValueConversionTest0037
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0037
     * @tc.desc    Test static toShort method with negative range start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toShort(c'\u8000')).assertEqual(-32768);
    });

    /**
     * @tc.name    builtinsValueConversionTest0038
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0038
     * @tc.desc    Test static toShort method with full range value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toShort(c'\uFFFF')).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsValueConversionTest0039
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0039
     * @tc.desc    Test static toInt method with null value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'\u0000')).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0040
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0040
     * @tc.desc    Test static toInt method with printable symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'+')).assertEqual(43);
    });

    /**
     * @tc.name    builtinsValueConversionTest0041
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0041
     * @tc.desc    Test static toInt method with uppercase alphabetical symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'K')).assertEqual(75);
    });

    /**
     * @tc.name    builtinsValueConversionTest0042
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0042
     * @tc.desc    Test static toInt method with lowercase alphabetical symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'n')).assertEqual(110);
    });

    /**
     * @tc.name    builtinsValueConversionTest0043
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0043
     * @tc.desc    Test static toInt method with near maximum limit
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'\uFFFE')).assertEqual(65534);
    });

    /**
     * @tc.name    builtinsValueConversionTest0044
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0044
     * @tc.desc    Test static toInt method with maximum possible value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'\uFFFF')).assertEqual(65535);
    });

    /**
     * @tc.name    builtinsValueConversionTest0045
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0045
     * @tc.desc    Test static toLong method with zero input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLong(c'\u0000')).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0046
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0046
     * @tc.desc    Test static toLong method with common punctuation mark
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLong(c'*')).assertEqual(42);
    });

    /**
     * @tc.name    builtinsValueConversionTest0047
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0047
     * @tc.desc    Test static toLong method with high BMP boundary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLong(c'\uD7FF')).assertEqual(55295);
    });

    /**
     * @tc.name    builtinsValueConversionTest0048
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0048
     * @tc.desc    Test static toLong method with all bits set value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLong(c'\uFFFF')).assertEqual(65535);
    });

    /**
     * @tc.name    builtinsValueConversionTest0049
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0049
     * @tc.desc    Test static toFloat method with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toFloat(c'\u0000')).assertEqual(0.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0050
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0050
     * @tc.desc    Test static toFloat method with common punctuation symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toFloat(c',')).assertEqual(44.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0051
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0051
     * @tc.desc    Test static toFloat method with surrogate pair start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toFloat(c'\uD800')).assertEqual(55296.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0052
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0052
     * @tc.desc    Test static toFloat method with maximum possible value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toFloat(c'\uFFFF')).assertEqual(65535.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0053
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0053
     * @tc.desc    Test static toDouble method with null input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toDouble(c'\u0000')).assertEqual(0.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0054
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0054
     * @tc.desc    Test static toDouble method with numeric symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toDouble(c'7')).assertEqual(55.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0055
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0055
     * @tc.desc    Test static toDouble method with special bracket symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toDouble(c'}')).assertEqual(125.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0056
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0056
     * @tc.desc    Test static toDouble method with maximum possible value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toDouble(c'\uFFFF')).assertEqual(65535.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0057
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0057
     * @tc.desc    Test static toString method with uppercase alphabetical symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toString(c'A')).assertEqual("A");
    });

    /**
     * @tc.name    builtinsValueConversionTest0058
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0058
     * @tc.desc    Test static toString method with digit symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toString(c'9')).assertEqual("9");
    });

    /**
     * @tc.name    builtinsValueConversionTest0059
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0059
     * @tc.desc    Test static toString method with whitespace symbol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toString(c' ')).assertEqual(" ");
    });

    /**
     * @tc.name    builtinsValueConversionTest0060
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0060
     * @tc.desc    Test instance toString method with MIN_VALUE (0x0000)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.MIN_VALUE)).toString()).assertEqual("\u0000");
    });

    /**
     * @tc.name    builtinsValueConversionTest0061
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0061
     * @tc.desc    Test instance toString method with MAX_VALUE (0xFFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.MAX_VALUE)).toString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.name    builtinsValueConversionTest0062
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0062
     * @tc.desc    Test instance toString method with uppercase alphabetical symbol 'A'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'A')).toString()).assertEqual("A");
    });

    /**
     * @tc.name    builtinsValueConversionTest0063
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0063
     * @tc.desc    Test instance toString method with lowercase alphabetical symbol 'z'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'z')).toString()).assertEqual("z");
    });

    /**
     * @tc.name    builtinsValueConversionTest0064
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0064
     * @tc.desc    Test instance toString method with decimal digit '0'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'0')).toString()).assertEqual("0");
    });

    /**
     * @tc.name    builtinsValueConversionTest0065
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0065
     * @tc.desc    Test instance toString method with BMP last valid char (0xD7FF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'\uD7FF')).toString()).assertEqual("\uD7FF");
    });

    /**
     * @tc.name    builtinsValueConversionTest0066
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0066
     * @tc.desc    Test instance toString method with HIGH_SURROGATE_MIN (0xD800)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.HIGH_SURROGATE_MIN)).toString()).assertEqual("\uD800");
    });

    /**
     * @tc.name    builtinsValueConversionTest0067
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0067
     * @tc.desc    Test instance toString method with HIGH_SURROGATE_MAX (0xDBFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.HIGH_SURROGATE_MAX)).toString()).assertEqual("\uDBFF");
    });

    /**
     * @tc.name    builtinsValueConversionTest0068
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0068
     * @tc.desc    Test instance toString method with LOW_SURROGATE_MIN (0xDC00)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.LOW_SURROGATE_MIN)).toString()).assertEqual("\uDC00");
    });

    /**
     * @tc.name    builtinsValueConversionTest0069
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0069
     * @tc.desc    Test instance toString method with LOW_SURROGATE_MAX (0xDFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.LOW_SURROGATE_MAX)).toString()).assertEqual("\uDFFF");
    });

    /**
     * @tc.name    builtinsValueConversionTest0070
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0070
     * @tc.desc    Test instance toString method with first char after surrogate range (0xE000)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'\uE000')).toString()).assertEqual("\uE000");
    });

    /**
     * @tc.name    builtinsValueConversionTest0071
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0071
     * @tc.desc    Test instance toString method with whitespace character (space)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c' ')).toString()).assertEqual(" ");
    });

    /**
     * @tc.name    builtinsValueConversionTest0072
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0072
     * @tc.desc    Test instance toString method with common symbol '@'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'@')).toString()).assertEqual("@");
    });
    /**
     * @tc.name    builtinsValueConversionTest0073
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0073
     * @tc.desc    Test instance toLocaleString method with MIN_VALUE (0x0000)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.MIN_VALUE)).toLocaleString()).assertEqual("\u0000");
    });

    /**
     * @tc.name    builtinsValueConversionTest0074
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0074
     * @tc.desc    Test instance toLocaleString method with MAX_VALUE (0xFFFF)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(Char.MAX_VALUE)).toLocaleString()).assertEqual("\uFFFF");
    });

    /**
     * @tc.name    builtinsValueConversionTest0075
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0075
     * @tc.desc    Test instance toLocaleString method with uppercase alphabetical symbol 'B'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'B')).toLocaleString()).assertEqual("B");
    });

    /**
     * @tc.name    builtinsValueConversionTest0076
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0076
     * @tc.desc    Test instance toLocaleString method with lowercase alphabetical symbol 'm'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'm')).toLocaleString()).assertEqual("m");
    });

    /**
     * @tc.name    builtinsValueConversionTest0077
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0077
     * @tc.desc    Test instance toLocaleString method with decimal digit '9'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'9')).toLocaleString()).assertEqual("9");
    });

    /**
     * @tc.name    builtinsValueConversionTest0078
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0078
     * @tc.desc    Test instance toLocaleString method with middle high surrogate (0xDA88)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'\uDA88')).toLocaleString()).assertEqual("\uDA88");
    });

    /**
     * @tc.name    builtinsValueConversionTest0079
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0079
     * @tc.desc    Test instance toLocaleString method with middle low surrogate (0xDF01)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'\uDF01')).toLocaleString()).assertEqual("\uDF01");
    });

    /**
     * @tc.name    builtinsValueConversionTest0080
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0080
     * @tc.desc    Test instance toLocaleString method with currency symbol '¥'
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'\u00A5')).toLocaleString()).assertEqual("\u00A5");
    });

    /**
     * @tc.name    builtinsValueConversionTest0081
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0081
     * @tc.desc    Test instance toLocaleString method with tab whitespace
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect((new Char(c'\t')).toLocaleString()).assertEqual("\t");
    });

    /**
     * @tc.name    builtinsValueConversionTest0082
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0082
     * @tc.desc    Verify toLocaleString returns same result as toString
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charObj = new Char(c'X');
      expect(charObj.toLocaleString()).assertEqual(charObj.toString());
    });

    /**
     * @tc.name    builtinsValueConversionTest0083
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0083
     * @tc.desc    Test static toChar method with lowercase alphabetical
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toChar(c'q')).assertEqual(c'q');
    });

    /**
     * @tc.name    builtinsValueConversionTest0084
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0084
     * @tc.desc    Test static toChar method with uppercase alphabetical
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toChar(c'Z')).assertEqual(c'Z');
    });

    /**
     * @tc.name    builtinsValueConversionTest0085
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0085
     * @tc.desc    Test static toChar method with maximum possible value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toChar(c'\uFFFF')).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.name    builtinsValueConversionTest0086
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0086
     * @tc.desc    Test toByte method with basic ASCII symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toByte(c'A')).assertEqual(65);
      expect(Char.toByte(c'a')).assertEqual(97);
      expect(Char.toByte(c'0')).assertEqual(48);
      expect(Char.toByte(c'9')).assertEqual(57);
    });

    /**
     * @tc.name    builtinsValueConversionTest0087
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0087
     * @tc.desc    Test toByte method with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toByte(c'\u0000')).assertEqual(0);
      expect(Char.toByte(c'\u007F')).assertEqual(127);
      expect(Char.toByte(c'\u0080')).assertEqual(-128);
      expect(Char.toByte(c'\u00FF')).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsValueConversionTest0088
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0088
     * @tc.desc    Test toByte method with special symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toByte(c' ')).assertEqual(32);
      expect(Char.toByte(c'!')).assertEqual(33);
      expect(Char.toByte(c'~')).assertEqual(126);
      expect(Char.toByte(c'\n')).assertEqual(10);
    });

    /**
     * @tc.name    builtinsValueConversionTest0089
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0089
     * @tc.desc    Test toShort method with extended range symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toShort(c'\u0100')).assertEqual(256);
      expect(Char.toShort(c'\u07FF')).assertEqual(2047);
      expect(Char.toShort(c'\u0800')).assertEqual(2048);
      expect(Char.toShort(c'\uFFFF')).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsValueConversionTest0090
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0090
     * @tc.desc    Test toShort method with ASCII range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toShort(c'Z')).assertEqual(90);
      expect(Char.toShort(c'z')).assertEqual(122);
      expect(Char.toShort(c'!')).assertEqual(33);
      expect(Char.toShort(c'\u0000')).assertEqual(0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0091
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0091
     * @tc.desc    Test toInt method with complete conversion range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'A')).assertEqual(65);
      expect(Char.toInt(c'\u0041')).assertEqual(65);
      expect(Char.toInt(c'\u3042')).assertEqual(12354);
      expect(Char.toInt(c'\uFFFF')).assertEqual(65535);
    });

    /**
     * @tc.name    builtinsValueConversionTest0092
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0092
     * @tc.desc    Test toInt method with digit symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toInt(c'0')).assertEqual(48);
      expect(Char.toInt(c'5')).assertEqual(53);
      expect(Char.toInt(c'9')).assertEqual(57);
      expect(Char.toInt(c'\u0660')).assertEqual(1632);
    });

    /**
     * @tc.name    builtinsValueConversionTest0093
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0093
     * @tc.desc    Test toLong method with full precision
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLong(c'A')).assertEqual(65);
      expect(Char.toLong(c'\u0000')).assertEqual(0);
      expect(Char.toLong(c'\u7FFF')).assertEqual(32767);
      expect(Char.toLong(c'\uFFFF')).assertEqual(65535);
    });

    /**
     * @tc.name    builtinsValueConversionTest0094
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0094
     * @tc.desc    Test toLong method with Unicode range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toLong(c'\u4E00')).assertEqual(19968);
      expect(Char.toLong(c'\u9FA5')).assertEqual(40869);
      expect(Char.toLong(c'\uAC00')).assertEqual(44032);
      expect(Char.toLong(c'\uD7A3')).assertEqual(55203);
    });

    /**
     * @tc.name    builtinsValueConversionTest0095
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0095
     * @tc.desc    Test toFloat method with precision preservation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toFloat(c'A')).assertEqual(65.0);
      expect(Char.toFloat(c'\u007F')).assertEqual(127.0);
      expect(Char.toFloat(c'\u0080')).assertClose(128.0, 0.001);
      expect(Char.toFloat(c'\uFFFF')).assertClose(65535.0, 0.001);
    });

    /**
     * @tc.name    builtinsValueConversionTest0096
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0096
     * @tc.desc    Test toFloat method with zero and max values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toFloat(c'\u0000')).assertEqual(0.0);
      expect(Char.toFloat(c' ')).assertEqual(32.0);
      expect(Char.toFloat(c'~')).assertEqual(126.0);
      expect(Char.toFloat(c'\uFFFE')).assertClose(65534.0, 0.001);
    });

    /**
     * @tc.name    builtinsValueConversionTest0097
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0097
     * @tc.desc    Test toDouble method with double precision
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toDouble(c'A')).assertEqual(65.0);
      expect(Char.toDouble(c'\u0000')).assertEqual(0.0);
      expect(Char.toDouble(c'\u7FFF')).assertEqual(32767.0);
      expect(Char.toDouble(c'\uFFFF')).assertEqual(65535.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0098
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0098
     * @tc.desc    Test toDouble method with surrogate range boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toDouble(c'\uD800')).assertEqual(55296.0);
      expect(Char.toDouble(c'\uDBFF')).assertEqual(56319.0);
      expect(Char.toDouble(c'\uDC00')).assertEqual(56320.0);
      expect(Char.toDouble(c'\uDFFF')).assertEqual(57343.0);
    });

    /**
     * @tc.name    builtinsValueConversionTest0099
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0099
     * @tc.desc    Test toString method with ASCII symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toString(c'A')).assertEqual("A");
      expect(Char.toString(c'z')).assertEqual("z");
      expect(Char.toString(c'0')).assertEqual("0");
      expect(Char.toString(c'!')).assertEqual("!");
    });

    /**
     * @tc.name    builtinsValueConversionTest0100
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0100
     * @tc.desc    Test toString method with Unicode symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toString(c'\u3042')).assertEqual("あ");
      expect(Char.toString(c'\u4E00')).assertEqual("一");
      expect(Char.toString(c'\u0000')).assertEqual("\u0000");
      expect(Char.toString(c'\uFFFF')).assertEqual("\uFFFF");
    });

    /**
     * @tc.name    builtinsValueConversionTest0101
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0101
     * @tc.desc    Test toString method with whitespace symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toString(c' ')).assertEqual(" ");
      expect(Char.toString(c'\t')).assertEqual("\t");
      expect(Char.toString(c'\n')).assertEqual("\n");
      expect(Char.toString(c'\r')).assertEqual("\r");
    });

    /**
     * @tc.name    builtinsValueConversionTest0102
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0102
     * @tc.desc    Test toChar method with identity transformation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toChar(c'A')).assertEqual(c'A');
      expect(Char.toChar(c'z')).assertEqual(c'z');
      expect(Char.toChar(c'0')).assertEqual(c'0');
      expect(Char.toChar(c'!')).assertEqual(c'!');
    });

    /**
     * @tc.name    builtinsValueConversionTest0103
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0103
     * @tc.desc    Test toChar method with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toChar(c'\u0000')).assertEqual(c'\u0000');
      expect(Char.toChar(c'\u007F')).assertEqual(c'\u007F');
      expect(Char.toChar(c'\u0080')).assertEqual(c'\u0080');
      expect(Char.toChar(c'\uFFFF')).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.name    builtinsValueConversionTest0104
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0104
     * @tc.desc    Test toChar method with surrogate range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toChar(c'\uD800')).assertEqual(c'\uD800');
      expect(Char.toChar(c'\uDBFF')).assertEqual(c'\uDBFF');
      expect(Char.toChar(c'\uDC00')).assertEqual(c'\uDC00');
      expect(Char.toChar(c'\uDFFF')).assertEqual(c'\uDFFF');
    });

    /**
     * @tc.name    builtinsValueConversionTest0105
     * @tc.number  BUILTINS_VALUE_CONVERSION_TEST_0105
     * @tc.desc    Test toChar method with Unicode symbols
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsValueConversionTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(Char.toChar(c'\u3042')).assertEqual(c'\u3042');
      expect(Char.toChar(c'\u4E00')).assertEqual(c'\u4E00');
      expect(Char.toChar(c'\uAC00')).assertEqual(c'\uAC00');
      expect(Char.toChar(c'\uD7A3')).assertEqual(c'\uD7A3');
    });
  })
}