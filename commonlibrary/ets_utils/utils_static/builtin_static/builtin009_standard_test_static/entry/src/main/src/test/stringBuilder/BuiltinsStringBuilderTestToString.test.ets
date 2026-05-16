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

export default function builtinsStringBuilderTestToString() {
  describe('builtinsStringBuilderTestToString', () => {
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
     * @tc.name    builtinsStringBuilderTestToString0001
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0001
     * @tc.desc    Test toString with integer 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(0);
      expect(result).assertEqual('0');

      const result2 = StringBuilder.toString(-0);
      expect(result2).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0002
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0002
     * @tc.desc    Test toString with undefined (should convert to NaN)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const undefinedValue: string | number = NaN as number;
      const result = StringBuilder.toString(undefinedValue);
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0003
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0003
     * @tc.desc    Test toString with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(NaN);
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0004
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0004
     * @tc.desc    Test toString with positive infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(Infinity);
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0005
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0005
     * @tc.desc    Test toString with negative infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = StringBuilder.toString(-Infinity);
      expect(result).assertEqual('-Infinity');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0006
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0006
     * @tc.desc    Test toString with double type values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1 = StringBuilder.toString(1.5);
      expect(result1).assertEqual('1.5');

      const result2 = StringBuilder.toString(Math.floor(1.5));
      expect(result2).assertEqual('1');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0007
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0007
     * @tc.desc    Test toString with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.MAX_VALUE);
      expect(result).assertEqual('1.7976931348623157e+308');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0008
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0008
     * @tc.desc    Test toString with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.MIN_VALUE);
      expect(result).assertEqual('5e-324');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0009
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0009
     * @tc.desc    Test toString with Number.EPSILON
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.EPSILON);
      expect(result).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0010
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0010
     * @tc.desc    Test toString with Number.MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = StringBuilder.toString(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual('9007199254740991');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0011
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0011
     * @tc.desc    Test toString with byte range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-128);
      expect(result1).assertEqual('-128');

      const result2 = StringBuilder.toString(127);
      expect(result2).assertEqual('127');

      const result3 = StringBuilder.toString(-129);
      expect(result3).assertEqual('-129');

      const result4 = StringBuilder.toString(128);
      expect(result4).assertEqual('128');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0012
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0012
     * @tc.desc    Test toString with short range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-32768);
      expect(result1).assertEqual('-32768');

      const result2 = StringBuilder.toString(32767);
      expect(result2).assertEqual('32767');

      const result3 = StringBuilder.toString(-32769);
      expect(result3).assertEqual('-32769');

      const result4 = StringBuilder.toString(32768);
      expect(result4).assertEqual('32768');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0013
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0013
     * @tc.desc    Test toString with int range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-2147483648);
      expect(result1).assertEqual('-2147483648');

      const result2 = StringBuilder.toString(2147483647);
      expect(result2).assertEqual('2147483647');

      const result3 = StringBuilder.toString(-2147483649);
      expect(result3).assertEqual('-2147483649');

      const result4 = StringBuilder.toString(2147483648);
      expect(result4).assertEqual('2147483648');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0014
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0014
     * @tc.desc    Test toString with long range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(-9.223372036854775e+17);
      expect(result1).assertEqual('-922337203685477500');

      const result2 = StringBuilder.toString(9.223372036854775e+17);
      expect(result2).assertEqual('922337203685477500');

    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0015
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0015
     * @tc.desc    Test toString with float range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minFloat = 1.40129846432481707e-45;
      const result1 = StringBuilder.toString(minFloat);
      expect(result1).assertEqual('1.401298464324817e-45');

      const maxFloat = 3.40282346638528860e+38;
      const result2 = StringBuilder.toString(maxFloat);
      expect(result2).assertEqual('3.4028234663852886e+38');

      const result3 = StringBuilder.toString(-minFloat);
      expect(result3).assertEqual('-1.401298464324817e-45');

      const result4 = StringBuilder.toString(-maxFloat);
      expect(result4).assertEqual('-3.4028234663852886e+38');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0016
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0016
     * @tc.desc    Test toString with double range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minDouble = 4.94065645841246544e-324;
      const result1 = StringBuilder.toString(minDouble);
      expect(result1).assertEqual('5e-324');

      const maxDouble = 1.79769313486231570e+308;
      const result2 = StringBuilder.toString(maxDouble);
      expect(result2).assertEqual('1.7976931348623157e+308');

      const result3 = StringBuilder.toString(-minDouble);
      expect(result3).assertEqual('-5e-324');

      const result4 = StringBuilder.toString(-maxDouble);
      expect(result4).assertEqual('-1.7976931348623157e+308');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0017
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0017
     * @tc.desc    Test toString with char range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result1 = StringBuilder.toString(0);
      expect(result1).assertEqual('0');

      const result2 = StringBuilder.toString(65535);
      expect(result2).assertEqual('65535');

      const result3 = StringBuilder.toString(-1);
      expect(result3).assertEqual('-1');

      const result4 = StringBuilder.toString(65536);
      expect(result4).assertEqual('65536');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0018
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0018
     * @tc.desc    Test toString with hex values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const hexValue1 = 0x0102;
      const result1 = StringBuilder.toString(hexValue1);
      expect(result1).assertEqual('258');

      const hexValue2 = 0x01020304;
      const result2 = StringBuilder.toString(hexValue2);
      expect(result2).assertEqual('16909060');

      const hexValue3 = 0xCAFEBABE;
      const result3 = StringBuilder.toString(hexValue3);
      expect(result3).assertEqual('3405691582');

    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0019
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0019
     * @tc.desc    Test toString with octal values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const octalValue = 0o3;
      const result = StringBuilder.toString(octalValue);
      expect(result).assertEqual('3');

      const octalValue2 = 0o777;
      const result2 = StringBuilder.toString(octalValue2);
      expect(result2).assertEqual('511');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0020
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0020
     * @tc.desc    Test toString with exponentiation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const powResult = 2 ** 3;
      const result = StringBuilder.toString(powResult);
      expect(result).assertEqual('8');

      const powResult2 = 10 ** 6;
      const result2 = StringBuilder.toString(powResult2);
      expect(result2).assertEqual('1000000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0021
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0021
     * @tc.desc    Test toString with scientific notation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sciValue1 = 1e3;
      const result1 = StringBuilder.toString(sciValue1);
      expect(result1).assertEqual('1000');

      const sciValue2 = 2.5e-2;
      const result2 = StringBuilder.toString(sciValue2);
      expect(result2).assertEqual('0.025');

      const sciValue3 = 1.23e6;
      const result3 = StringBuilder.toString(sciValue3);
      expect(result3).assertEqual('1230000');

      const sciValue4 = 9.87654321e-10;
      const result4 = StringBuilder.toString(sciValue4);
      expect(result4).assertEqual('9.87654321e-10');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0022
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0022
     * @tc.desc    Test toString with bigint values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsStringBuilderTestToString0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bigIntValue1 = 9007199254740991;
      const result1 = StringBuilder.toString(bigIntValue1);
      expect(result1).assertEqual('9007199254740991');

      const bigIntValue2 = 9007199254740992;
      const result2 = StringBuilder.toString(bigIntValue2);
      expect(result2).assertEqual('9007199254740992');

      const bigIntValue3 = Number(BigInt('9007199254740991'));
      const result3 = StringBuilder.toString(bigIntValue3);
      expect(result3).assertEqual('9007199254740991');
    });
    /**
     * @tc.name    builtinsStringBuilderTestToString0023
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0023
     * @tc.desc    Test toString for float with typical float range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatMax: number = 3.4028234663852886e38;
      const floatMin: number = 1.401298464324817e-45;
      const floatSmall: number = 1.1754943508222875e-38;

      const result1: string = floatMax.toString();
      const result2: string = floatMin.toString();
      const result3: string = floatSmall.toString();

      expect(result1).assertEqual('3.4028234663852886e+38');
      expect(result2).assertEqual('1.401298464324817e-45');
      expect(result3).assertEqual('1.1754943508222875e-38');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0024
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0024
     * @tc.desc    Test toString for float with hex representation values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexFloat: number = 0xcafebabe;
      const result: string = hexFloat.toString();

      expect(result).assertEqual('3405691582');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0025
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0025
     * @tc.desc    Test toString for float with scientific notation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sci1: number = 1.23e-4;
      const sci2: number = -5.67e+8;
      const sci3: number = 9.87654321e12;

      const result1: string = sci1.toString();
      const result2: string = sci2.toString();
      const result3: string = sci3.toString();

      expect(result1).assertEqual('0.000123');
      expect(result2).assertEqual('-567000000');
      expect(result3).assertEqual('9876543210000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0026
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0026
     * @tc.desc    Test toString for float with precision edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const pi: number = 3.141592653589793;
      const e: number = 2.718281828459045;
      const precise: number = 0.1 + 0.2;

      const result1: string = pi.toString();
      const result2: string = e.toString();
      const result3: string = precise.toString();

      expect(result1).assertEqual('3.141592653589793');
      expect(result2).assertEqual('2.718281828459045');
      expect(result3).assertEqual('0.30000000000000004');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0027
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0027
     * @tc.desc    Test toString for float with negative float range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const negFloatMax: number = -3.4028234663852886e38;
      const negFloatMin: number = -1.401298464324817e-45;

      const result1: string = negFloatMax.toString();
      const result2: string = negFloatMin.toString();

      expect(result1).assertEqual('-3.4028234663852886e+38');
      expect(result2).assertEqual('-1.401298464324817e-45');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0028
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0028
     * @tc.desc    Test toString for float with overflow simulation (Value outside float range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowFloat: number = 3.5e38;
      const underflowFloat: number = 1e-50;

      const result1: string = overflowFloat.toString();
      const result2: string = underflowFloat.toString();

      expect(result1).assertEqual('3.5e+38');
      expect(result2).assertEqual('1e-50');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0029
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0029
     * @tc.desc    Test toString for float with integer types that fit in float
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: number = 127;
      const shortMax: number = 32767;
      const intValue: number = 2147483647;
      const longValue: number = 9223372036854775807;

      const result1: string = byteMax.toString();
      const result2: string = shortMax.toString();
      const result3: string = intValue.toString();
      const result4: string = longValue.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('32767');
      expect(result3).assertEqual('2147483647');
      expect(result4).assertEqual('9223372036854776000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0030
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0030
     * @tc.desc    Test toString for float with different radix/format values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hex: number = 0x0102;
      const octal: number = 0o777;
      const binary: number = 0b1101;
      const decimal: number = 1234.5678;

      const result1: string = hex.toString();
      const result2: string = octal.toString();
      const result3: string = binary.toString();
      const result4: string = decimal.toString();

      expect(result1).assertEqual('258');
      expect(result2).assertEqual('511');
      expect(result3).assertEqual('13');
      expect(result4).assertEqual('1234.5678');
    });
    /**
     * @tc.name    builtinsStringBuilderTestToString0031
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0031
     * @tc.desc    Test toString for long with basic integer values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0n).toString();
      const result2: string = (42n).toString();
      const result3: string = (-123n).toString();
      const result4: string = (9999999999n).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('42');
      expect(result3).assertEqual('-123');
      expect(result4).assertEqual('9999999999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0032
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0032
     * @tc.desc    Test toString for long with long range boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longMax: bigint = 9223372036854775807n;
      const longMin: bigint = -9223372036854775808n;

      const result1: string = longMax.toString();
      const result2: string = longMin.toString();

      expect(result1).assertEqual('9223372036854775807');
      expect(result2).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0033
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0033
     * @tc.desc    Test toString for long with overflow values (beyond long range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowMax: bigint = 9223372036854775808n;
      const overflowMin: bigint = -9223372036854775809n;

      const result1: string = overflowMax.toString();
      const result2: string = overflowMin.toString();

      expect(result1).assertEqual('9223372036854775808');
      expect(result2).assertEqual('-9223372036854775809');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0034
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0034
     * @tc.desc    Test toString for long with different radix representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexDecimal: bigint = 16069380444329996000n;
      const octalDecimal: bigint = 9223372036854775807n;
      const binaryDecimal: bigint = 9223372036854775807n;

      const result1: string = hexDecimal.toString();
      const result2: string = octalDecimal.toString();
      const result3: string = binaryDecimal.toString();

      expect(result1).assertEqual('16069380444329996000');
      expect(result2).assertEqual('9223372036854775807');
      expect(result3).assertEqual('9223372036854775807');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0035
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0035
     * @tc.desc    Test toString for long with large bigint values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bigInt1: bigint = BigInt(0xDEADBEEF);
      const bigInt2: bigint = 9007199254740991n;
      const bigInt3: bigint = 10000000000000000000n;

      const result1: string = bigInt1.toString();
      const result2: string = bigInt2.toString();
      const result3: string = bigInt3.toString();

      expect(result1).assertEqual('3735928559');
      expect(result2).assertEqual('9007199254740991');
      expect(result3).assertEqual('10000000000000000000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0036
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0036
     * @tc.desc    Test toString for long with integer types that fit in long
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: bigint = 127n;
      const shortMax: bigint = 32767n;
      const intMax: bigint = 2147483647n;
      const uintMax: bigint = 4294967295n;

      const result1: string = byteMax.toString();
      const result2: string = shortMax.toString();
      const result3: string = intMax.toString();
      const result4: string = uintMax.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('32767');
      expect(result3).assertEqual('2147483647');
      expect(result4).assertEqual('4294967295');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0037
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0037
     * @tc.desc    Test toString for long with scientific notation like values (as number)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sciLong1: bigint = BigInt(1e18);
      const sciLong2: bigint = BigInt(2.5e12);

      const result1: string = sciLong1.toString();
      const result2: string = sciLong2.toString();

      expect(result1).assertEqual('1000000000000000000');
      expect(result2).assertEqual('2500000000000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0038
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0038
     * @tc.desc    Test toString for long with zero and negative zero edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: bigint = 0n;
      const negativeZero: bigint = -0n;

      const result1: string = zero.toString();
      const result2: string = negativeZero.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0039
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0039
     * @tc.desc    Test toString for long with very large numbers (beyond 64-bit)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const huge1: bigint = 1234567890123456789012345678901234567890n;
      const huge2: bigint = -999999999999999999999999999999999999999n;

      const result1: string = huge1.toString();
      const result2: string = huge2.toString();

      expect(result1).assertEqual('1234567890123456789012345678901234567890');
      expect(result2).assertEqual('-999999999999999999999999999999999999999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0040
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0040
     * @tc.desc    Test toString for long with mixed operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addResult: bigint = 1000n + 2000n;
      const subResult: bigint = 5000n - 3000n;
      const mulResult: bigint = 100n * 50n;
      const powResult: bigint = 2n ** 10n;

      const result1: string = addResult.toString();
      const result2: string = subResult.toString();
      const result3: string = mulResult.toString();
      const result4: string = powResult.toString();

      expect(result1).assertEqual('3000');
      expect(result2).assertEqual('2000');
      expect(result3).assertEqual('5000');
      expect(result4).assertEqual('1024');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0041
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0041
     * @tc.desc    Test toString for int with basic integer values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0).toString();
      const result2: string = (42).toString();
      const result3: string = (-123).toString();
      const result4: string = (1000).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('42');
      expect(result3).assertEqual('-123');
      expect(result4).assertEqual('1000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0042
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0042
     * @tc.desc    Test toString for int with int range boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intMax: number = 2147483647;
      const intMin: number = -2147483648;

      const result1: string = intMax.toString();
      const result2: string = intMin.toString();

      expect(result1).assertEqual('2147483647');
      expect(result2).assertEqual('-2147483648');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0043
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0043
     * @tc.desc    Test toString for int with overflow values (beyond int range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowMax: number = 2147483648;
      const overflowMin: number = -2147483649;

      const result1: string = overflowMax.toString();
      const result2: string = overflowMin.toString();

      expect(result1).assertEqual('2147483648');
      expect(result2).assertEqual('-2147483649');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0044
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0044
     * @tc.desc    Test toString for int with different radix representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexInt: number = 0x0102;
      const hexInt2: number = 0x01020304;
      const octalInt: number = 0o777;
      const binaryInt: number = 0b11111111;

      const result1: string = hexInt.toString();
      const result2: string = hexInt2.toString();
      const result3: string = octalInt.toString();
      const result4: string = binaryInt.toString();

      expect(result1).assertEqual('258');
      expect(result2).assertEqual('16909060');
      expect(result3).assertEqual('511');
      expect(result4).assertEqual('255');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0045
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0045
     * @tc.desc    Test toString for int with byte and short range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: number = 127;
      const byteMin: number = -128;
      const shortMax: number = 32767;
      const shortMin: number = -32768;

      const result1: string = byteMax.toString();
      const result2: string = byteMin.toString();
      const result3: string = shortMax.toString();
      const result4: string = shortMin.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('-128');
      expect(result3).assertEqual('32767');
      expect(result4).assertEqual('-32768');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0046
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0046
     * @tc.desc    Test toString for int with zero and negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const zero: number = 0;
      const negativeZero: number = -0;

      const result1: string = zero.toString();
      const result2: string = negativeZero.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0047
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0047
     * @tc.desc    Test toString for int with scientific notation input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sci1: number = 1e3;
      const sci2: number = 2.5e4;
      const sci3: number = -3.7e2;

      const result1: string = sci1.toString();
      const result2: string = sci2.toString();
      const result3: string = sci3.toString();

      expect(result1).assertEqual('1000');
      expect(result2).assertEqual('25000');
      expect(result3).assertEqual('-370');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0048
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0048
     * @tc.desc    Test toString for int with exponent operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const exp1: number = 2 ** 3;
      const exp2: number = 10 ** 6;
      const exp3: number = (-5) ** 2;

      const result1: string = exp1.toString();
      const result2: string = exp2.toString();
      const result3: string = exp3.toString();

      expect(result1).assertEqual('8');
      expect(result2).assertEqual('1000000');
      expect(result3).assertEqual('25');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0049
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0049
     * @tc.desc    Test toString for int with char range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charMin: number = 0;
      const charMax: number = 65535;
      const asciiA: number = 65;
      const asciiZ: number = 90;
      const ascii_a: number = 97;
      const ascii_z: number = 122;

      const result1: string = charMin.toString();
      const result2: string = charMax.toString();
      const result3: string = asciiA.toString();
      const result4: string = asciiZ.toString();
      const result5: string = ascii_a.toString();
      const result6: string = ascii_z.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('65535');
      expect(result3).assertEqual('65');
      expect(result4).assertEqual('90');
      expect(result5).assertEqual('97');
      expect(result6).assertEqual('122');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0050
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0050
     * @tc.desc    Test toString for int with large number that fits in int
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const large1: number = 1000000000;
      const large2: number = -999999999;
      const large3: number = 1234567890;

      const result1: string = large1.toString();
      const result2: string = large2.toString();
      const result3: string = large3.toString();

      expect(result1).assertEqual('1000000000');
      expect(result2).assertEqual('-999999999');
      expect(result3).assertEqual('1234567890');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0051
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0051
     * @tc.desc    Test toString for int with mixed arithmetic operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addResult: number = 100 + 200;
      const subResult: number = 500 - 300;
      const mulResult: number = 50 * 30;
      const divResult: number = 1000 / 10;
      const modResult: number = 27 % 5;

      const result1: string = addResult.toString();
      const result2: string = subResult.toString();
      const result3: string = mulResult.toString();
      const result4: string = divResult.toString();
      const result5: string = modResult.toString();

      expect(result1).assertEqual('300');
      expect(result2).assertEqual('200');
      expect(result3).assertEqual('1500');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('2');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0052
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0052
     * @tc.desc    Test toString for int with Math function results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floorResult: number = Math.floor(10.9);
      const ceilResult: number = Math.ceil(10.1);
      const roundResult: number = Math.round(10.5);
      const absResult: number = Math.abs(-123);
      const maxResult: number = Math.max(10, 20, 30);
      const minResult: number = Math.min(10, 20, 30);

      const result1: string = floorResult.toString();
      const result2: string = ceilResult.toString();
      const result3: string = roundResult.toString();
      const result4: string = absResult.toString();
      const result5: string = maxResult.toString();
      const result6: string = minResult.toString();

      expect(result1).assertEqual('10');
      expect(result2).assertEqual('11');
      expect(result3).assertEqual('11');
      expect(result4).assertEqual('123');
      expect(result5).assertEqual('30');
      expect(result6).assertEqual('10');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0053
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0053
     * @tc.desc    Test toString for int with special numeric values (should handle gracefully)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const nanValue: number = NaN;
      const infinityValue: number = Infinity;
      const negInfinityValue: number = -Infinity;

      const result1: string = nanValue.toString();
      const result2: string = infinityValue.toString();
      const result3: string = negInfinityValue.toString();

      expect(result1).assertEqual('NaN');
      expect(result2).assertEqual('Infinity');
      expect(result3).assertEqual('-Infinity');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0054
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0054
     * @tc.desc    Test toString for short with basic short range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0).toString();
      const result2: string = (42).toString();
      const result3: string = (-123).toString();
      const result4: string = (1000).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('42');
      expect(result3).assertEqual('-123');
      expect(result4).assertEqual('1000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0055
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0055
     * @tc.desc    Test toString for short with short range boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortMax: number = 32767;
      const shortMin: number = -32768;

      const result1: string = shortMax.toString();
      const result2: string = shortMin.toString();

      expect(result1).assertEqual('32767');
      expect(result2).assertEqual('-32768');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0056
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0056
     * @tc.desc    Test toString for short with overflow values (beyond short range)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const overflowMax: number = 32768;
      const overflowMin: number = -32769;

      const result1: string = overflowMax.toString();
      const result2: string = overflowMin.toString();

      expect(result1).assertEqual('32768');
      expect(result2).assertEqual('-32769');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0057
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0057
     * @tc.desc    Test toString for short with byte range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteMax: number = 127;
      const byteMin: number = -128;
      const byteZero: number = 0;

      const result1: string = byteMax.toString();
      const result2: string = byteMin.toString();
      const result3: string = byteZero.toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('-128');
      expect(result3).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0058
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0058
     * @tc.desc    Test toString for short with different radix representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hexShort: number = 0x00FF;
      const hexShort2: number = 0x7FFF;
      const octalShort: number = 0o777;
      const binaryShort: number = 0b111111111111111;

      const result1: string = hexShort.toString();
      const result2: string = hexShort2.toString();
      const result3: string = octalShort.toString();
      const result4: string = binaryShort.toString();

      expect(result1).assertEqual('255');
      expect(result2).assertEqual('32767');
      expect(result3).assertEqual('511');
      expect(result4).assertEqual('32767');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0059
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0059
     * @tc.desc    Test toString for short with positive and negative edge values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const pos1: number = 1;
      const pos2: number = 100;
      const pos3: number = 10000;
      const neg1: number = -1;
      const neg2: number = -100;
      const neg3: number = -10000;

      const result1: string = pos1.toString();
      const result2: string = pos2.toString();
      const result3: string = pos3.toString();
      const result4: string = neg1.toString();
      const result5: string = neg2.toString();
      const result6: string = neg3.toString();

      expect(result1).assertEqual('1');
      expect(result2).assertEqual('100');
      expect(result3).assertEqual('10000');
      expect(result4).assertEqual('-1');
      expect(result5).assertEqual('-100');
      expect(result6).assertEqual('-10000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0060
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0060
     * @tc.desc    Test toString for short with arithmetic operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const addResult: number = 100 + 200;
      const subResult: number = 1000 - 500;
      const mulResult: number = 50 * 60;
      const divResult: number = 1000 / 10;
      const modResult: number = 32767 % 1000;

      const result1: string = addResult.toString();
      const result2: string = subResult.toString();
      const result3: string = mulResult.toString();
      const result4: string = divResult.toString();
      const result5: string = modResult.toString();

      expect(result1).assertEqual('300');
      expect(result2).assertEqual('500');
      expect(result3).assertEqual('3000');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('767');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0061
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0061
     * @tc.desc    Test toString for short with Math function results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const absResult: number = Math.abs(-12345);
      const maxResult: number = Math.max(10, 100, 1000);
      const minResult: number = Math.min(-100, -500, -1000);
      const floorResult: number = Math.floor(32767.9);
      const ceilResult: number = Math.ceil(-32768.1);

      const result1: string = absResult.toString();
      const result2: string = maxResult.toString();
      const result3: string = minResult.toString();
      const result4: string = floorResult.toString();
      const result5: string = ceilResult.toString();

      expect(result1).assertEqual('12345');
      expect(result2).assertEqual('1000');
      expect(result3).assertEqual('-1000');
      expect(result4).assertEqual('32767');
      expect(result5).assertEqual('-32768');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0062
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0062
     * @tc.desc    Test toString for short with char range values that fit in short
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charMin: number = 0;
      const charMax: number = 65535;
      const asciiValues: number[] = [65, 66, 67, 97, 98, 99];

      const result1: string = charMin.toString();
      const result2: string = charMax.toString();
      const result3: string = asciiValues[0].toString();
      const result4: string = asciiValues[3].toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('65535');
      expect(result3).assertEqual('65');
      expect(result4).assertEqual('97');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0063
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0063
     * @tc.desc    Test toString for short with typical usage values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const portNumber: number = 8080;
      const year: number = 2023;
      const temperature: number = -20;
      const score: number = 100;
      const index: number = -1;

      const result1: string = portNumber.toString();
      const result2: string = year.toString();
      const result3: string = temperature.toString();
      const result4: string = score.toString();
      const result5: string = index.toString();

      expect(result1).assertEqual('8080');
      expect(result2).assertEqual('2023');
      expect(result3).assertEqual('-20');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('-1');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0064
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0064
     * @tc.desc    Test toString for short with boundary adjacent values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const justBelowMax: number = 32766;
      const justAboveMin: number = -32767;
      const zero: number = 0;
      const negativeOne: number = -1;
      const positiveOne: number = 1;

      const result1: string = justBelowMax.toString();
      const result2: string = justAboveMin.toString();
      const result3: string = zero.toString();
      const result4: string = negativeOne.toString();
      const result5: string = positiveOne.toString();

      expect(result1).assertEqual('32766');
      expect(result2).assertEqual('-32767');
      expect(result3).assertEqual('0');
      expect(result4).assertEqual('-1');
      expect(result5).assertEqual('1');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0065
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0065
     * @tc.desc    Test toString for short with scientific notation (should convert to integer)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sci1: number = 1e3;
      const sci2: number = 2.5e3;
      const sci3: number = -3.7e2;
      const sci4: number = 1.23e4;

      const result1: string = sci1.toString();
      const result2: string = sci2.toString();
      const result3: string = sci3.toString();
      const result4: string = sci4.toString();

      expect(result1).assertEqual('1000');
      expect(result2).assertEqual('2500');
      expect(result3).assertEqual('-370');
      expect(result4).assertEqual('12300');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0066
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0066
     * @tc.desc    Test toString for char with basic ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const char1: string = 'A';
      const char2: string = 'a';
      const char3: string = '0';
      const char4: string = ' ';

      const result1: string = char1.toString();
      const result2: string = char2.toString();
      const result3: string = char3.toString();
      const result4: string = char4.toString();

      expect(result1).assertEqual('A');
      expect(result2).assertEqual('a');
      expect(result3).assertEqual('0');
      expect(result4).assertEqual(' ');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0067
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0067
     * @tc.desc    Test toString for char with char range boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charMin: string = '\u0000';
      const charMax: string = '\uFFFF';
      const charMid: string = '\u8000';

      const result1: string = charMin.toString();
      const result2: string = charMax.toString();
      const result3: string = charMid.toString();

      expect(result1).assertEqual('\u0000');
      expect(result2).assertEqual('\uFFFF');
      expect(result3).assertEqual('\u8000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0068
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0068
     * @tc.desc    Test toString for char with special control characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bell: string = '\u0007';
      const backspace: string = '\b';
      const tab: string = '\t';
      const newline: string = '\n';
      const carriage: string = '\r';
      const formfeed: string = '\f';
      const vertical: string = '\v';

      const result1: string = bell.toString();
      const result2: string = backspace.toString();
      const result3: string = tab.toString();
      const result4: string = newline.toString();
      const result5: string = carriage.toString();
      const result6: string = formfeed.toString();
      const result7: string = vertical.toString();

      expect(result1).assertEqual('\u0007');
      expect(result2).assertEqual('\b');
      expect(result3).assertEqual('\t');
      expect(result4).assertEqual('\n');
      expect(result5).assertEqual('\r');
      expect(result6).assertEqual('\f');
      expect(result7).assertEqual('\v');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0069
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0069
     * @tc.desc    Test toString for char with escape sequence characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const backslash: string = '\\';
      const singleQuote: string = '\'';
      const doubleQuote: string = '\"';
      const question: string = '\?';
      const nullChar: string = '\0';

      const result1: string = backslash.toString();
      const result2: string = singleQuote.toString();
      const result3: string = doubleQuote.toString();
      const result4: string = question.toString();
      const result5: string = nullChar.toString();

      expect(result1).assertEqual('\\');
      expect(result2).assertEqual('\'');
      expect(result3).assertEqual('\"');
      expect(result4).assertEqual('?');
      expect(result5).assertEqual('\u0000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0070
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0070
     * @tc.desc    Test toString for char with full special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';

      const result1: string = '!'.toString();
      const result2: string = '@'.toString();
      const result3: string = '['.toString();
      const result4: string = '\\'.toString();
      const result5: string = ']'.toString();
      const result6: string = '^'.toString();
      const result7: string = '_'.toString();
      const result8: string = '`'.toString();
      const result9: string = '{'.toString();
      const result10: string = '|'.toString();
      const result11: string = '}'.toString();
      const result12: string = '~'.toString();

      expect(result1).assertEqual('!');
      expect(result2).assertEqual('@');
      expect(result3).assertEqual('[');
      expect(result4).assertEqual('\\');
      expect(result5).assertEqual(']');
      expect(result6).assertEqual('^');
      expect(result7).assertEqual('_');
      expect(result8).assertEqual('`');
      expect(result9).assertEqual('{');
      expect(result10).assertEqual('|');
      expect(result11).assertEqual('}');
      expect(result12).assertEqual('~');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0071
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0071
     * @tc.desc    Test toString for char with number characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const digits: string = '0123456789';

      const result1: string = '0'.toString();
      const result2: string = '5'.toString();
      const result3: string = '9'.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('5');
      expect(result3).assertEqual('9');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0072
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0072
     * @tc.desc    Test toString for char with uppercase letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const uppercase: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

      const result1: string = 'A'.toString();
      const result2: string = 'M'.toString();
      const result3: string = 'Z'.toString();

      expect(result1).assertEqual('A');
      expect(result2).assertEqual('M');
      expect(result3).assertEqual('Z');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0073
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0073
     * @tc.desc    Test toString for char with lowercase letters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const lowercase: string = 'abcdefghijklmnopqrstuvwxyz';

      const result1: string = 'a'.toString();
      const result2: string = 'm'.toString();
      const result3: string = 'z'.toString();

      expect(result1).assertEqual('a');
      expect(result2).assertEqual('m');
      expect(result3).assertEqual('z');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0074
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0074
     * @tc.desc    Test toString for char with Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const euro: string = '€';
      const yen: string = '¥';
      const copyright: string = '©';
      const registered: string = '®';
      const alpha: string = 'α';
      const beta: string = 'β';

      const result1: string = euro.toString();
      const result2: string = yen.toString();
      const result3: string = copyright.toString();
      const result4: string = registered.toString();
      const result5: string = alpha.toString();
      const result6: string = beta.toString();

      expect(result1).assertEqual('€');
      expect(result2).assertEqual('¥');
      expect(result3).assertEqual('©');
      expect(result4).assertEqual('®');
      expect(result5).assertEqual('α');
      expect(result6).assertEqual('β');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0075
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0075
     * @tc.desc    Test toString for char with Unicode escape sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unicode1: string = '\u0041';
      const unicode2: string = '\u0061';
      const unicode3: string = '\u0030';
      const unicode4: string = '\u03B1';
      const unicode5: string = '\u20AC';

      const result1: string = unicode1.toString();
      const result2: string = unicode2.toString();
      const result3: string = unicode3.toString();
      const result4: string = unicode4.toString();
      const result5: string = unicode5.toString();

      expect(result1).assertEqual('A');
      expect(result2).assertEqual('a');
      expect(result3).assertEqual('0');
      expect(result4).assertEqual('α');
      expect(result5).assertEqual('€');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0076
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0076
     * @tc.desc    Test toString for char with mixed character types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testCases: string[] = ['A', 'a', '0', ' ', '!', '\t', '€', 'α', '☺',];

      const results: string[] = [];
      for (let i = 0; i < testCases.length; i++) {
        results.push(testCases[i].toString());
      }

      expect(results[0]).assertEqual('A');
      expect(results[1]).assertEqual('a');
      expect(results[2]).assertEqual('0');
      expect(results[3]).assertEqual(' ');
      expect(results[4]).assertEqual('!');
      expect(results[5]).assertEqual('\t');
      expect(results[6]).assertEqual('€');
      expect(results[7]).assertEqual('α');
      expect(results[8]).assertEqual('☺');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0077
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0077
     * @tc.desc    Test toString for char with repeated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const repeatedChars: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';

      const result1: string = '!!'.charAt(0).toString();
      const result2: string = '""'.charAt(0).toString();
      const result3: string = '##'.charAt(0).toString();
      const result4: string = '$$'.charAt(0).toString();
      const result5: string = '&&'.charAt(0).toString();

      expect(result1).assertEqual('!');
      expect(result2).assertEqual('"');
      expect(result3).assertEqual('#');
      expect(result4).assertEqual('$');
      expect(result5).assertEqual('&');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0078
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0078
     * @tc.desc    Test toString for byte with basic values within range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0).toString();
      const result2: string = (1).toString();
      const result3: string = (-1).toString();
      const result4: string = (100).toString();
      const result5: string = (-100).toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('1');
      expect(result3).assertEqual('-1');
      expect(result4).assertEqual('100');
      expect(result5).assertEqual('-100');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0079
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0079
     * @tc.desc    Test toString for byte with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (127).toString();
      const result2: string = (-128).toString();
      const result3: string = (0).toString();

      expect(result1).assertEqual('127');
      expect(result2).assertEqual('-128');
      expect(result3).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0080
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0080
     * @tc.desc    Test toString for byte with overflow values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (128).toString();
      const result2: string = (-129).toString();
      const result3: string = (255).toString();
      const result4: string = (256).toString();

      expect(result1).assertEqual('128');
      expect(result2).assertEqual('-129');
      expect(result3).assertEqual('255');
      expect(result4).assertEqual('256');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0081
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0081
     * @tc.desc    Test toString for special number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num1: number = 0;
      const num2: number = -0;
      const num3: number = NaN;
      const num4: number = Infinity;
      const num5: number = -Infinity;

      const result1: string = num1.toString();
      const result2: string = num2.toString();
      const result3: string = num3.toString();
      const result4: string = num4.toString();
      const result5: string = num5.toString();

      expect(result1).assertEqual('0');
      expect(result2).assertEqual('0');
      expect(result3).assertEqual('NaN');
      expect(result4).assertEqual('Infinity');
      expect(result5).assertEqual('-Infinity');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0082
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0082
     * @tc.desc    Test toString for floating point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (1.5).toString();
      const result2: string = (2.99).toString();
      const result3: string = (-1.5).toString();
      const result4: string = (-2.99).toString();
      const result5: string = (0.999).toString();

      expect(result1).assertEqual('1.5');
      expect(result2).assertEqual('2.99');
      expect(result3).assertEqual('-1.5');
      expect(result4).assertEqual('-2.99');
      expect(result5).assertEqual('0.999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0083
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0083
     * @tc.desc    Test toString for hex, octal and scientific notation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (0x10).toString();
      const result2: string = (0xFF).toString();
      const result3: string = (0o10).toString();
      const result4: string = (0b1010).toString();
      const result5: string = (1e2).toString();

      expect(result1).assertEqual('16');
      expect(result2).assertEqual('255');
      expect(result3).assertEqual('8');
      expect(result4).assertEqual('10');
      expect(result5).assertEqual('100');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0084
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0084
     * @tc.desc    Test toString for typical byte values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (72).toString();
      const result2: string = (101).toString();
      const result3: string = (108).toString();
      const result4: string = (111).toString();
      const result5: string = (87).toString();

      expect(result1).assertEqual('72');
      expect(result2).assertEqual('101');
      expect(result3).assertEqual('108');
      expect(result4).assertEqual('111');
      expect(result5).assertEqual('87');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0085
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0085
     * @tc.desc    Test toString for negative byte values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (-72).toString();
      const result2: string = (-101).toString();
      const result3: string = (-108).toString();
      const result4: string = (-111).toString();
      const result5: string = (-87).toString();

      expect(result1).assertEqual('-72');
      expect(result2).assertEqual('-101');
      expect(result3).assertEqual('-108');
      expect(result4).assertEqual('-111');
      expect(result5).assertEqual('-87');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0086
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0086
     * @tc.desc    Test toString for extreme values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const maxSafeInt: number = Number.MAX_SAFE_INTEGER;
      const minSafeInt: number = Number.MIN_SAFE_INTEGER;
      const maxValue: number = Number.MAX_VALUE;
      const minValue: number = Number.MIN_VALUE;
      const epsilon: number = Number.EPSILON;

      const result1: string = maxSafeInt.toString();
      const result2: string = minSafeInt.toString();
      const result3: string = maxValue.toString();
      const result4: string = minValue.toString();
      const result5: string = epsilon.toString();

      expect(typeof result1).assertEqual('string');
      expect(typeof result2).assertEqual('string');
      expect(typeof result3).assertEqual('string');
      expect(typeof result4).assertEqual('string');
      expect(typeof result5).assertEqual('string');

      expect(result1).assertEqual('9007199254740991');
      expect(result2).assertEqual('-9007199254740991');
      expect(result3).assertEqual('1.7976931348623157e+308');
      expect(result5).assertEqual('2.220446049250313e-16');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0087
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0087
     * @tc.desc    Test toString for sequence of values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const testValues: number[] = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
      const results: string[] = testValues.map(value => value.toString());

      expect(results[0]).assertEqual('-5');
      expect(results[1]).assertEqual('-4');
      expect(results[2]).assertEqual('-3');
      expect(results[3]).assertEqual('-2');
      expect(results[4]).assertEqual('-1');
      expect(results[5]).assertEqual('0');
      expect(results[6]).assertEqual('1');
      expect(results[7]).assertEqual('2');
      expect(results[8]).assertEqual('3');
      expect(results[9]).assertEqual('4');
      expect(results[10]).assertEqual('5');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0088
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0088
     * @tc.desc    Test toString with different radix
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num: number = 255;

      const result1: string = num.toString();
      const result2: string = num.toString(10);
      const result3: string = num.toString(2);
      const result4: string = num.toString(8);
      const result5: string = num.toString(16);

      expect(result1).assertEqual('255');
      expect(result2).assertEqual('255');
      expect(result3).assertEqual('11111111');
      expect(result4).assertEqual('377');
      expect(result5).assertEqual('ff');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0089
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0089
     * @tc.desc    Test toString for Number object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = Number(123).toString();
      const result2: string = Number(-123).toString();
      const result3: string = Number(0).toString();
      const result4: string = Number(12.34).toString();

      expect(result1).assertEqual('123');
      expect(result2).assertEqual('-123');
      expect(result3).assertEqual('0');
      expect(result4).assertEqual('12.34');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0090
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0090
     * @tc.desc    Test toString for mathematical operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (10 + 20).toString();
      const result2: string = (100 - 50).toString();
      const result3: string = (25 * 4).toString();
      const result4: string = (100 / 4).toString();
      const result5: string = (2 ** 8).toString();

      expect(result1).assertEqual('30');
      expect(result2).assertEqual('50');
      expect(result3).assertEqual('100');
      expect(result4).assertEqual('25');
      expect(result5).assertEqual('256');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0091
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0091
     * @tc.desc    Test toString for boolean with true and false values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = Boolean(true).toString();
      const result2: string = Boolean(false).toString();
      const result3: string = true.toString();
      const result4: string = false.toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('true');
      expect(result4).assertEqual('false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0092
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0092
     * @tc.desc    Test toString for boolean with Boolean object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolObj1: Boolean = new Boolean(true);
      const boolObj2: Boolean = new Boolean(false);
      const boolObj3: Boolean = new Boolean(1);
      const boolObj4: Boolean = new Boolean(0);

      const result1: string = boolObj1.toString();
      const result2: string = boolObj2.toString();
      const result3: string = boolObj3.toString();
      const result4: string = boolObj4.toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('true');
      expect(result4).assertEqual('false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0093
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0093
     * @tc.desc    Test toString for boolean with values that convert to false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = Boolean(0).toString();
      const result2: string = Boolean(NaN).toString();
      const result3: string = Boolean("").toString();
      const result4: string = Boolean(null).toString();
      const result5: string = Boolean(undefined).toString();

      expect(result1).assertEqual('false');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('false');
      expect(result4).assertEqual('false');
      expect(result5).assertEqual('false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0094
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0094
     * @tc.desc    Test toString for boolean with values that convert to true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = Boolean(1).toString();
      const result2: string = Boolean(-1).toString();
      const result3: string = Boolean("hello").toString();
      const result4: string = Boolean(Infinity).toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('true');
      expect(result3).assertEqual('true');
      expect(result4).assertEqual('true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0095
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0095
     * @tc.desc    Test toString for boolean with logical NOT operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = Boolean(!"s").toString();
      const result2: string = Boolean(!0).toString();

      const result3: string = (!"s").toString();
      const result4: string = (!0).toString();

      expect(result1).assertEqual('false');
      expect(result2).assertEqual('true');
      expect(result3).assertEqual('false');
      expect(result4).assertEqual('true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0096
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0096
     * @tc.desc    Test toString for boolean with comparison operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (10 > 5).toString();
      const result2: string = (10 < 5).toString();
      const result3: string = (10 === 10).toString();
      const result4: string = (10 !== 10).toString();
      const result5: string = ("abc" === "abc").toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('true');
      expect(result4).assertEqual('false');
      expect(result5).assertEqual('true');

    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0097
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0097
     * @tc.desc    Test toString for boolean with logical operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (true && true).toString();
      const result2: string = (true && false).toString();
      const result3: string = (false && true).toString();
      const result4: string = (false && false).toString();

      const result5: string = (true || true).toString();
      const result6: string = (true || false).toString();
      const result7: string = (false || true).toString();
      const result8: string = (false || false).toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('false');
      expect(result4).assertEqual('false');
      expect(result5).assertEqual('true');
      expect(result6).assertEqual('true');
      expect(result7).assertEqual('true');
      expect(result8).assertEqual('false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0098
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0098
     * @tc.desc    Test toString for boolean with double logical NOT
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (!!true).toString();
      const result2: string = (!!false).toString();
      const result3: string = (!!0).toString();
      const result4: string = (!!1).toString();
      const result5: string = (!!"").toString();
      const result6: string = (!!"hello").toString();
      const result7: string = (!!null).toString();
      const result8: string = (!!undefined).toString();
      const result9: string = (!!NaN).toString();
      const result10: string = (!!Infinity).toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('false');
      expect(result4).assertEqual('true');
      expect(result5).assertEqual('false');
      expect(result6).assertEqual('true');
      expect(result7).assertEqual('false');
      expect(result8).assertEqual('false');
      expect(result9).assertEqual('false');
      expect(result10).assertEqual('true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0099
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0099
     * @tc.desc    Test toString for boolean with conditional (ternary) operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (true ? "yes" : "no").toString();
      const result2: string = (false ? "yes" : "no").toString();
      const result3: string = (10 > 5 ? "greater" : "less").toString();
      const result4: string = (10 < 5 ? "greater" : "less").toString();

      expect(result1).assertEqual('yes');
      expect(result2).assertEqual('no');
      expect(result3).assertEqual('greater');
      expect(result4).assertEqual('less');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0100
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0100
     * @tc.desc    Test toString for boolean with equality operators
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const result1: string = (true == true).toString();
      const result3: string = (false == false).toString();

      expect(result1).assertEqual('true');
      expect(result3).assertEqual('true');

    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0101
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0101
     * @tc.desc    Test toString for boolean with strict equality operators
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = (true === true).toString();
      const result3: string = (false === false).toString();

      expect(result1).assertEqual('true');
      expect(result3).assertEqual('true');

    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0102
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0102
     * @tc.desc    Test toString for boolean with Boolean() function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1: string = Boolean(true).toString();
      const result2: string = Boolean(false).toString();
      const result3: string = Boolean(Boolean(true)).toString();
      const result4: string = Boolean(Boolean(false)).toString();

      const bool1: boolean = Boolean("hello");
      const bool2: boolean = Boolean("");
      const bool3: boolean = Boolean(0);
      const bool4: boolean = Boolean(1);

      const result5: string = bool1.toString();
      const result6: string = bool2.toString();
      const result7: string = bool3.toString();
      const result8: string = bool4.toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('true');
      expect(result4).assertEqual('false');
      expect(result5).assertEqual('true');
      expect(result6).assertEqual('false');
      expect(result7).assertEqual('false');
      expect(result8).assertEqual('true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0103
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0103
     * @tc.desc    Test toString for boolean with complex expressions
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const a: number = 10;
      const b: number = 20;
      const c: string = "hello";
      const d: string = "world";

      const result1: string = (a < b && c !== d).toString();
      const result2: string = (a > b || c === d).toString();
      const result3: string = (!(a > b) && !(c === d)).toString();
      const result4: string = ((a + b) > 25 && (c + d).length > 5).toString();

      expect(result1).assertEqual('true');
      expect(result2).assertEqual('false');
      expect(result3).assertEqual('true');
      expect(result4).assertEqual('true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0104
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0104
     * @tc.desc    Test toString for boolean in conditional statements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {

      const testBoolean = (condition: boolean): string => {
        if (condition) {
          return "true branch";
        } else {
          return "false branch";
        }
      };

      const result1: string = testBoolean(true);
      const result2: string = testBoolean(false);
      const result3: string = testBoolean(!!"hello");
      const result4: string = testBoolean(!!"");

      expect(result1).assertEqual('true branch');
      expect(result2).assertEqual('false branch');
      expect(result3).assertEqual('true branch');
      expect(result4).assertEqual('false branch');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0105
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0105
     * @tc.desc    Test StringBuilder toString with empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const result: string = builder.toString();

      expect(result).assertEqual('');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0106
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0106
     * @tc.desc    Test StringBuilder toString with basic strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append('Hello');
      builder.append(' ');
      builder.append('World');

      const result: string = builder.toString();
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0107
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0107
     * @tc.desc    Test StringBuilder toString with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const specialChars: string = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      builder.append(specialChars);

      const result: string = builder.toString();
      expect(result).assertEqual(specialChars);
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0108
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0108
     * @tc.desc    Test StringBuilder toString with ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const asciiChars: string = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';

      for (let i = 0; i < asciiChars.length; i++) {
        builder.append(asciiChars.charAt(i));
      }

      const result: string = builder.toString();
      expect(result).assertEqual(asciiChars);
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0109
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0109
     * @tc.desc    Test StringBuilder toString with repeated special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const repeatedChars: string = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~';
      builder.append(repeatedChars);

      const result: string = builder.toString();
      expect(result).assertEqual(repeatedChars);
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0110
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0110
     * @tc.desc    Test StringBuilder toString with escape sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append('\\a');
      builder.append('\\b');
      builder.append('\\f');
      builder.append('\\n');
      builder.append('\\r');
      builder.append('\\t');
      builder.append('\\v');
      builder.append('\\\\');
      builder.append('\\\'');
      builder.append('\\"');
      builder.append('\\?');
      builder.append('\\0');

      const result: string = builder.toString();
      expect(result).assertEqual('\\a\\b\\f\\n\\r\\t\\v\\\\\\\'\\"\\?\\0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0111
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0111
     * @tc.desc    Test StringBuilder toString with emoji and Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append('👆');
      builder.append('👿');
      builder.append('👀');
      builder.append('💯');
      builder.append('🎅');
      builder.append('😼');
      builder.append('🔧');
      builder.append('💇');
      builder.append('🤼‍♂️');
      builder.append('🛢');
      builder.append('🀄');
      builder.append('🏴');

      const result: string = builder.toString();
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0112
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0112
     * @tc.desc    Test StringBuilder toString with Unicode escape sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append('\ud83d\udc46');
      builder.append('\ud83d\udc7f');
      builder.append('\ud83d\udc40');
      builder.append('\ud83d\udcaf');
      builder.append('\ud83c\udf85');
      builder.append('\ud83d\ude3c');
      builder.append('\ud83d\udd27');
      builder.append('\ud83d\udc87');
      builder.append('\ud83e\udd3c\u200d\u2642\ufe0f');
      builder.append('\ud83d\udee2');
      builder.append('\ud83c\udc04');
      builder.append('\ud83c\udff4');

      const result: string = builder.toString();
      expect(result.length).assertLarger(0);
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0113
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0113
     * @tc.desc    Test StringBuilder toString with number conversions
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(0);
      builder.append(' ');
      builder.append(NaN);
      builder.append(' ');
      builder.append(-0);
      builder.append(' ');
      builder.append(Infinity);
      builder.append(' ');
      builder.append(-Infinity);
      builder.append(' ');
      builder.append(1.7976931348623157e+308);
      builder.append(' ');
      builder.append(5e-324);

      const result: string = builder.toString();
      expect(result).assertEqual('0 NaN 0 Infinity -Infinity 1.7976931348623157e+308 5e-324');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0114
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0114
     * @tc.desc    Test StringBuilder toString with large string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const count: number = 1000;
      const text: string = 'Hello World! ';

      for (let i = 0; i < count; i++) {
        builder.append(text);
      }

      const result: string = builder.toString();
      expect(result.length).assertEqual(text.length * count);
      expect(result.startsWith('Hello')).assertTrue();
      expect(result.endsWith('World! ')).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0115
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0115
     * @tc.desc    Test StringBuilder toString with clear and reuse
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append('First string');
      const result1: string = builder.toString();
      expect(result1).assertEqual('First string');

      const builder2: StringBuilder = new StringBuilder();
      builder2.append('Second string');
      const result2: string = builder2.toString();
      expect(result2).assertEqual('Second string');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0116
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0116
     * @tc.desc    Test StringBuilder toString with chaining append calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append('Hello')
        .append(' ')
        .append('World')
        .append('!')
        .append(123)
        .append(' ')
        .append(true);

      const result: string = builder.toString();
      expect(result).assertEqual('Hello World!123 true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0117
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0117
     * @tc.desc    Test StringBuilder toString with edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder();
      builder1.append('');
      const result1: string = builder1.toString();
      expect(result1).assertEqual('');

      const builder2: StringBuilder = new StringBuilder();
      builder2.append(' ');
      const result2: string = builder2.toString();
      expect(result2).assertEqual(' ');

      const builder3: StringBuilder = new StringBuilder();
      builder3.append('\n');
      const result3: string = builder3.toString();
      expect(result3).assertEqual('\n');

      const builder4: StringBuilder = new StringBuilder();
      builder4.append('\t');
      const result4: string = builder4.toString();
      expect(result4).assertEqual('\t');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0118
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0118
     * @tc.desc    Test StringBuilder append with basic double values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append(0.0);
      builder.append(1.0);
      builder.append(-1.0);
      builder.append(123.456);
      builder.append(-123.456);

      const result: string = builder.toString();
      expect(result).assertEqual('01-1123.456-123.456');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0119
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0119
     * @tc.desc    Test StringBuilder append with integer double values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append(0);
      builder.append(1);
      builder.append(-1);
      builder.append(100);
      builder.append(-100);

      const result: string = builder.toString();
      expect(result).assertEqual('01-1100-100');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0120
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0120
     * @tc.desc    Test StringBuilder append with special double values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(0);
      builder.append(' ');
      builder.append(NaN);
      builder.append(' ');
      builder.append(-0);
      builder.append(' ');
      builder.append(Infinity);
      builder.append(' ');
      builder.append(-Infinity);

      const result: string = builder.toString();
      expect(result).assertEqual('0 NaN 0 Infinity -Infinity');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0121
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0121
     * @tc.desc    Test StringBuilder append with extreme double values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(Number.MAX_VALUE);
      builder.append(' ');
      builder.append(Number.MIN_VALUE);
      builder.append(' ');
      builder.append(Number.EPSILON);
      builder.append(' ');
      builder.append(Number.MAX_SAFE_INTEGER);

      const result: string = builder.toString();
      expect(result.includes('1.7976931348623157e+308')).assertTrue();
      expect(result.includes('5e-324')).assertTrue();
      expect(result.includes('2.220446049250313e-16')).assertTrue();
      expect(result.includes('9007199254740991')).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0122
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0122
     * @tc.desc    Test StringBuilder append with byte range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(-128);
      builder.append(' ');
      builder.append(-127);
      builder.append(' ');
      builder.append(0);
      builder.append(' ');
      builder.append(126);
      builder.append(' ');
      builder.append(127);

      const result: string = builder.toString();
      expect(result).assertEqual('-128 -127 0 126 127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0123
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0123
     * @tc.desc    Test StringBuilder append with short range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(-32768);
      builder.append(' ');
      builder.append(-32767);
      builder.append(' ');
      builder.append(32766);
      builder.append(' ');
      builder.append(32767);

      const result: string = builder.toString();
      expect(result).assertEqual('-32768 -32767 32766 32767');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0124
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0124
     * @tc.desc    Test StringBuilder append with int range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(-2147483648);
      builder.append(' ');
      builder.append(-2147483647);
      builder.append(' ');
      builder.append(2147483646);
      builder.append(' ');
      builder.append(2147483647);

      const result: string = builder.toString();
      expect(result).assertEqual('-2147483648 -2147483647 2147483646 2147483647');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0125
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0125
     * @tc.desc    Test StringBuilder append with long range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(-9223372036854775808);
      builder.append(' ');
      builder.append(9223372036854775807);

      const result: string = builder.toString();
      expect(result).assertEqual('-9223372036854775808 9223372036854775807');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0126
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0126
     * @tc.desc    Test StringBuilder append with different number representations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(0x0102);
      builder.append(' ');

      builder.append(0x01020304);
      builder.append(' ');

      builder.append(0o3);
      builder.append(' ');

      builder.append(2 ** 3);
      builder.append(' ');

      builder.append(1e3);
      builder.append(' ');
      builder.append(2.5e-2);

      const result: string = builder.toString();
      expect(result).assertEqual('258 16909060 3 8 1000 0.025');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0127
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0127
     * @tc.desc    Test StringBuilder append with precision and rounding
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(1.23456789);
      builder.append(' ');
      builder.append(0.000000001);
      builder.append(' ');
      builder.append(999.999999);
      builder.append(' ');
      builder.append(0.3333333333333333);
      builder.append(' ');
      builder.append(0.6666666666666666);

      const result: string = builder.toString();
      expect(result.includes('1.23456789')).assertTrue();
      expect(result.includes('1e-9')).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0128
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0128
     * @tc.desc    Test StringBuilder append with mathematical operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(10.5 + 20.5);
      builder.append(' ');
      builder.append(100.5 - 50.25);
      builder.append(' ');
      builder.append(25.5 * 4.0);
      builder.append(' ');
      builder.append(100.0 / 4.0);
      builder.append(' ');
      builder.append(Math.PI);
      builder.append(' ');
      builder.append(Math.E);

      const result: string = builder.toString();
      expect(result.includes('31')).assertTrue();
      expect(result.includes('50.25')).assertTrue();
      expect(result.includes('102')).assertTrue();
      expect(result.includes('25')).assertTrue();
      expect(result.includes('3.141592653589793')).assertTrue();
      expect(result.includes('2.718281828459045')).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0129
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0129
     * @tc.desc    Test StringBuilder append with overflow values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append(128);
      builder.append(' ');
      builder.append(-129);

      builder.append(' ');

      builder.append(32768);
      builder.append(' ');
      builder.append(-32769);

      builder.append(' ');

      builder.append(2147483648);
      builder.append(' ');
      builder.append(-2147483649);

      const result: string = builder.toString();
      expect(result).assertEqual('128 -129 32768 -32769 2147483648 -2147483649');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0130
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0130
     * @tc.desc    Test StringBuilder append with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      const resultBuilder: StringBuilder = builder.append(1.0)
        .append(2.0)
        .append(3.0)
        .append(4.0)
        .append(5.0);

      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');

      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0131
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0131
     * @tc.desc    Test StringBuilder append with mixed types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append('Value: ');
      builder.append(123.456);
      builder.append(', Count: ');
      builder.append(100);
      builder.append(', Result: ');
      builder.append(-99.99);

      const result: string = builder.toString();
      expect(result).assertEqual('Value: 123.456, Count: 100, Result: -99.99');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0132
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0132
     * @tc.desc    Test StringBuilder append with boundary edge cases
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder1: StringBuilder = new StringBuilder();
      builder1.append(0.0);
      expect(builder1.toString()).assertEqual('0');

      const builder2: StringBuilder = new StringBuilder();
      builder2.append(-0.0);
      expect(builder2.toString()).assertEqual('0');

      const builder3: StringBuilder = new StringBuilder();
      builder3.append(0.0000000000000001);
      expect(builder3.toString().includes('1e-16')).assertTrue();

      const builder4: StringBuilder = new StringBuilder();
      builder4.append(999999999999999.0);
      expect(builder4.toString()).assertEqual('999999999999999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0133
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0133
     * @tc.desc    Test StringBuilder append with array of double values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const values: number[] = [1.1, 2.2, 3.3, 4.4, 5.5];

      for (const value of values) {
        builder.append(value).append(' ');
      }

      const result: string = builder.toString().trim();
      expect(result).assertEqual('1.1 2.2 3.3 4.4 5.5');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0134
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0134
     * @tc.desc    Test StringBuilder append with special array objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      builder.append([72, 101, NaN, Infinity, 108, 111]);
      builder.append(' ');

      builder.append([72, "abc", true, null, undefined, 108]);
      builder.append(' ');
      builder.append([256, 65536, 32768]);

      const result: string = builder.toString();
      expect(result.includes('NaN')).assertTrue();
      expect(result.includes('Infinity')).assertTrue();
      expect(result.includes('256')).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0135
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0135
     * @tc.desc    Test StringBuilder append with primitive wrappers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      const strObj = new String("Hello");
      const numObj = new Number(123.456);
      const boolObj = new Boolean(true);

      builder.append(strObj).append(' ');
      builder.append(numObj).append(' ');
      builder.append(boolObj);

      const result: string = builder.toString();
      expect(result).assertEqual('Hello 123.456 true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestToString0136
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_TO_STRING_0136
     * @tc.desc    Test StringBuilder append with array objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestToString0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();

      const arr1 = [72, 101, 108, 108, 111];
      const arr2 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr3 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      const arr4 = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];

      builder.append(arr1).append(' ');
      builder.append(arr2).append(' ');
      builder.append(arr3).append(' ');
      builder.append(arr4);

      const result: string = builder.toString();
      expect(result.includes('72,101,108,108,111')).assertTrue();
    });

  })
}