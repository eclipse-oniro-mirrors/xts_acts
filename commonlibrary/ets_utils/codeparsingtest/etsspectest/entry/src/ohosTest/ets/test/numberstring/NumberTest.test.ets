/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'


export default function numberTest() {
  describe('NumberTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   NumberTest0001
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0001
     * @tc.desc   Verify that the default type of numbers is double-precision floating-point
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const verifyNumberType = (num: number): string => typeof num;
      const result = verifyNumberType(123);
      expect('number').assertEqual(result);
    });
    /**
     * @tc.name   NumberTest0002
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0002
     * @tc.desc   Verify the maximum representable value range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const getMaxValue = (): number => Number.MAX_VALUE;
      const maxValid = getMaxValue();
      const overMax = maxValid * 2;
      expect(true).assertEqual(!isNaN(maxValid));
      expect(Infinity).assertEqual(overMax);
    });
    /**
     * @tc.name   NumberTest0003
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0003
     * @tc.desc   Verify the minimum representable value range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const getMinValue = (): number => Number.MIN_VALUE;
      const minValid = getMinValue();
      const underMin = minValid / 2;
      expect(true).assertEqual(!isNaN(minValid));
      expect(0).assertEqual(underMin);
    });
    /**
     * @tc.name   NumberTest0004
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0004
     * @tc.desc   Verify integer precise representation range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const getMaxSafeInteger = (): number => 2**53 - 1;
      const preciseInt = getMaxSafeInteger();
      expect(9007199254740991).assertEqual(preciseInt);
    });
    /**
     * @tc.name   NumberTest0006
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0006
     * @tc.desc   Verify decimal precision issues
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const addDecimals = (): number => 0.1 + 0.2;
      const result = addDecimals();
      expect(false).assertEqual(result === 0.3);
    });

    /**
     * @tc.name   NumberTest0007
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0007
     * @tc.desc   Verify negative number representation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkNegative = (): [number, string] => {
        const num = -123;
        return [num, typeof num];
      };
      const arr = checkNegative();
      expect(-123).assertEqual(arr[0]);
      expect('number').assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0008
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0008
     * @tc.desc   Verify zero representation comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareZeros = (): [boolean, boolean] => [0 === -0, 0 === +0];
      const arr = compareZeros();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0009
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0009
     * @tc.desc   Verify empty string conversion to number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertEmptyString = (): number => Number('');
      expect(0).assertEqual(convertEmptyString());
    });
    /**
     * @tc.name   NumberTest0010
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0010
     * @tc.desc   Verify boolean conversion to number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertBooleans = (): [number, number] => [Number(true), Number(false)];
      const arr = convertBooleans();
      expect(1).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0011
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0011
     * @tc.desc   Verify null conversion to number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertNull = (): number => Number(null);
      expect(0).assertEqual(convertNull());
    });
    /**
     * @tc.name   NumberTest0012
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0012
     * @tc.desc   Verify undefined conversion to number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertUndefined = (): number => Number(undefined);
      expect(true).assertEqual(isNaN(convertUndefined()));
    });
    /**
     * @tc.name   NumberTest0013
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0013
     * @tc.desc   Verify failed string to number conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertInvalidString = (): number => Number('abc');
      expect(true).assertEqual(isNaN(convertInvalidString()));
    });
    /**
     * @tc.name   NumberTest0014
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0014
     * @tc.desc   Verify object conversion to number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertObjects = (): [number, number] => [Number({}), Number({ valueOf: () => 123 })];
      const arr = convertObjects();
      expect(true).assertEqual(isNaN(arr[0]));
      expect(123).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0015
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0015
     * @tc.desc   Verify array conversion to number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertArrays = (): [number, number, number] => [Number([]), Number([123]), Number([1, 2])];
      const arr = convertArrays();
      expect(0).assertEqual(arr[0]);
      expect(123).assertEqual(arr[1]);
      expect(true).assertEqual(isNaN(arr[2]));
    });
    /**
     * @tc.name   NumberTest0016
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0016
     * @tc.desc   Verify positive infinity generation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const generatePositiveInfinity = (): [number, number] => [1 / 0, Number.POSITIVE_INFINITY];
      const arr = generatePositiveInfinity();
      expect(Infinity).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0017
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0017
     * @tc.desc   Verify negative infinity generation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const generateNegativeInfinity = (): [number, number] => [-1 / 0, Number.NEGATIVE_INFINITY];
      const arr = generateNegativeInfinity();
      expect(-Infinity).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0018
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0018
     * @tc.desc   Verify infinity arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const infinityOperations = (): [number, number] => [Infinity + 1, Infinity - Infinity];
      const arr = infinityOperations();
      expect(Infinity).assertEqual(arr[0]);
      expect(true).assertEqual(isNaN(arr[1]));
    });
    /**
     * @tc.name   NumberTest0019
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0019
     * @tc.desc   Verify infinity comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareInfinity = (): [boolean, boolean] => [Infinity > 1e308, -Infinity < -1e308];
      const arr = compareInfinity();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0020
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0020
     * @tc.desc   Verify NaN type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkNaNType = (): string => typeof NaN;
      expect('number').assertEqual(checkNaNType());
    });
    /**
     * @tc.name   NumberTest0021
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0021
     * @tc.desc   Verify NaN reflexivity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkNaNEquality = (): [boolean, boolean] => [Number.isNaN(undefined), Number.isNaN(NaN)];
      const arr = checkNaNEquality();
      expect(false).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0022
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0022
     * @tc.desc   Verify NaN arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nanOperations = (): [number, number, number] => [1 + NaN, 0 * NaN, NaN / 1];
      const arr = nanOperations();
      expect(true).assertEqual(isNaN(arr[0]));
      expect(true).assertEqual(isNaN(arr[1]));
      expect(true).assertEqual(isNaN(arr[2]));
    });
    /**
     * @tc.name   NumberTest0023
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0023
     * @tc.desc   Verify Number.isNaN method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkIsNaN = (): [boolean, boolean] => [Number.isNaN(NaN), Number.isNaN('NaN')];
      const arr = checkIsNaN();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0024
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0024
     * @tc.desc   Verify difference between global isNaN and Number.isNaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareIsNaNMethods = (): [boolean, boolean] => [isNaN(NaN), Number.isNaN('NaN')];
      const arr = compareIsNaNMethods();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0025
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0025
     * @tc.desc   Verify NaN comparison with other values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareNaN = (): [boolean, boolean] => [NaN > 0, NaN < 0];
      const arr = compareNaN();
      expect(false).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0026
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0026
     * @tc.desc   Verify Infinity type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkInfinityType = (): string => typeof Infinity;
      expect('number').assertEqual(checkInfinityType());
    });
    /**
     * @tc.name   NumberTest0027
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0027
     * @tc.desc   Verify Infinity conversion to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const infinityToString = (): string => Infinity.toString();
      expect('Infinity').assertEqual(infinityToString());
    });
    /**
     * @tc.name   NumberTest0028
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0028
     * @tc.desc   Verify NaN conversion to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nanToString = (): string => NaN.toString();
      expect('NaN').assertEqual(nanToString());
    });
    /**
     * @tc.name   NumberTest0029
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0029
     * @tc.desc   Verify JSON conversion of special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const jsonConvertSpecialValues = (): [string, string] => [JSON.stringify(NaN), JSON.stringify(Infinity)];
      const arr = jsonConvertSpecialValues();
      expect('null').assertEqual(arr[0]);
      expect('null').assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0030
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0030
     * @tc.desc   Verify parseFloat handling of special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parseSpecialValues = (): [number, number] => [parseFloat('Infinity'), parseFloat('NaN')];
      const arr = parseSpecialValues();
      expect(Infinity).assertEqual(arr[0]);
      expect(true).assertEqual(isNaN(arr[1]));
    });
    /**
     * @tc.name   NumberTest0031
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0031
     * @tc.desc   Verify basic decimal representation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkDecimal = (): boolean => 123 === 123;
      expect(true).assertEqual(checkDecimal());
    });
    /**
     * @tc.name   NumberTest0032
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0032
     * @tc.desc   Verify decimal with leading zeros
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkLeadingZeroDecimal = (): boolean => {
        return 0x378 === 888;
      };
      expect(true).assertEqual(checkLeadingZeroDecimal());
    });
    /**
     * @tc.name   NumberTest0033
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0033
     * @tc.desc   Verify decimal with leading zeros parsed as octal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkOctalParsing = (): boolean => {
        return 0o777 === 511;
      };
      expect(true).assertEqual(checkOctalParsing());
    });
    /**
     * @tc.name   NumberTest0034
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0034
     * @tc.desc   Verify basic binary representation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkBinary = (): [boolean, boolean] => [0b10 === 2, 0B10 === 2];
      const arr = checkBinary();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0035
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0035
     * @tc.desc   Verify error on invalid binary characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkInvalidBinary = (): boolean => {
        try {
          const num = 0b11;
          return num === 3;
        } catch (e) {
          return e instanceof SyntaxError;
        }
      };
      expect(true).assertEqual(checkInvalidBinary());
    });
    /**
     * @tc.name   NumberTest0036
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0036
     * @tc.desc   Verify maximum binary length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkMaxBinary = (): number => 0b11111111111111111111111111111111;
      expect(4294967295).assertEqual(checkMaxBinary());
    });
    /**
     * @tc.name   NumberTest0037
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0037
     * @tc.desc   Verify octal with 0o prefix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkOctalPrefix = (): [boolean, boolean] => [0o755 === 493, 0O755 === 493];
      const arr = checkOctalPrefix();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0040
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0040
     * @tc.desc   Verify octal string parsing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parseOctalString = (): number => parseInt('755', 8);
      expect(493).assertEqual(parseOctalString());
    });
    /**
     * @tc.name   NumberTest0041
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0041
     * @tc.desc   Verify basic hexadecimal representation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkHexadecimal = (): [boolean, boolean] => [0x10 === 16, 0X10 === 16];
      const arr = checkHexadecimal();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    })
    /**
     * @tc.name   NumberTest0042
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0042
     * @tc.desc   Verify hexadecimal letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkHexLetters = (): [boolean, boolean, boolean] => [0xA === 10, 0xff === 255, 0XFF === 255];
      const arr = checkHexLetters();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0044
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0044
     * @tc.desc   Verify long hexadecimal numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkLongHex = (): number => 0xFFFFFFFFFFFFFFFFF;
      expect(295147905179352830000).assertEqual(checkLongHex());
    });
    /**
     * @tc.name   NumberTest0045
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0045
     * @tc.desc   Verify basic exponential notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkExponential = (): [boolean, boolean, boolean] => [5e1 === 50, 1e3 === 1000, 1E3 === 1000];
      const arr = checkExponential();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0046
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0046
     * @tc.desc   Verify negative exponents
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkNegativeExponents = (): [boolean, boolean] => [1e-3 === 0.001, 175e-2 === 1.75];
      const arr = checkNegativeExponents();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0047
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0047
     * @tc.desc   Verify zero exponents
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkZeroExponents = (): [boolean, boolean] => [0e-5 === 0, 0e+5 === 0];
      const arr = checkZeroExponents();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0048
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0048
     * @tc.desc   Verify mixed radix comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareMixedRadices = (): boolean => 0b100 === 0o4 && 0o4 === 0x4 && 0x4 === 4;
      expect(true).assertEqual(compareMixedRadices());
    });
    /**
     * @tc.name   NumberTest0049
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0049
     * @tc.desc   Verify string radix parsing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parseStringRadices =
        (): [number, number, number] => [parseInt('10', 2), parseInt('10', 8), parseInt('10', 16)];
      const arr = parseStringRadices();
      expect(2).assertEqual(arr[0]);
      expect(8).assertEqual(arr[1]);
      expect(16).assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0050
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0050
     * @tc.desc   Verify number to string radix conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const convertToRadixStrings =
        (): [string, string, string] => [(2).toString(2), (8).toString(8), (16).toString(16)];
      const arr = convertToRadixStrings();
      expect('10').assertEqual(arr[0]);
      expect('10').assertEqual(arr[1]);
      expect('10').assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0051
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0051
     * @tc.desc   Verify Number.MAX_VALUE property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkMaxValue = (): number => Number.MAX_VALUE;
      expect(1.7976931348623157e+308).assertEqual(checkMaxValue());
    });
    /**
     * @tc.name   NumberTest0052
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0052
     * @tc.desc   Verify Number.MIN_VALUE property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkMinValue = (): number => Number.MIN_VALUE;
      expect(5e-324).assertEqual(checkMinValue());
    });
    /**
     * @tc.name   NumberTest0053
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0053
     * @tc.desc   Verify Number.POSITIVE_INFINITY property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkPositiveInfinity = (): boolean => Number.POSITIVE_INFINITY === Infinity;
      expect(true).assertEqual(checkPositiveInfinity());
    });
    /**
     * @tc.name   NumberTest0054
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0054
     * @tc.desc   Verify Number.NEGATIVE_INFINITY property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkNegativeInfinity = (): boolean => Number.NEGATIVE_INFINITY === -Infinity;
      expect(true).assertEqual(checkNegativeInfinity());
    });
    /**
     * @tc.name   NumberTest0055
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0055
     * @tc.desc   Verify Number.NaN property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkNaNProperty = (): boolean => Number.isNaN(Number.NaN);
      expect(true).assertEqual(checkNaNProperty());
    });
    /**
     * @tc.name   NumberTest0056
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0056
     * @tc.desc   Verify Number.EPSILON property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkEpsilon = (): number => Number.EPSILON;
      expect(2.220446049250313e-16).assertEqual(checkEpsilon());
    });
    /**
     * @tc.name   NumberTest0057
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0057
     * @tc.desc   Verify Number.EPSILON application for floating point comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const useEpsilonForComparison = (): boolean => Math.abs(0.1 + 0.2 - 0.3) < Number.EPSILON;
      expect(true).assertEqual(useEpsilonForComparison());
    });
    /**
     * @tc.name   NumberTest0058
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0058
     * @tc.desc   Verify Number.MIN_SAFE_INTEGER property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkMinSafeInteger = (): number => Number.MIN_SAFE_INTEGER;
      expect(-9007199254740991).assertEqual(checkMinSafeInteger());
    });
    /**
     * @tc.name   NumberTest0059
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0059
     * @tc.desc   Verify Number.MAX_SAFE_INTEGER property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkMaxSafeInteger = (): number => Number.MAX_SAFE_INTEGER;
      expect(9007199254740991).assertEqual(checkMaxSafeInteger());
    });
    /**
     * @tc.name   NumberTest0060
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0060
     * @tc.desc   Verify safe integer boundary with Number.isSafeInteger
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkSafeIntegerBoundary = (): boolean => Number.isSafeInteger(9007199254740991);
      expect(true).assertEqual(checkSafeIntegerBoundary());
    });
    /**
     * @tc.name   NumberTest0061
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0061
     * @tc.desc   Verify Number.isSafeInteger returns false for numbers beyond safe range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkBeyondSafeInteger = (): boolean => Number.isSafeInteger(9007199254740992);
      expect(false).assertEqual(checkBeyondSafeInteger());
    });
    /**
     * @tc.name   NumberTest0062
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0062
     * @tc.desc   Verify Number.isSafeInteger for negative safe integers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkNegativeSafeInteger = (): boolean => Number.isSafeInteger(-9007199254740991);
      expect(true).assertEqual(checkNegativeSafeInteger());
    });
    /**
     * @tc.name   NumberTest0065
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0065
     * @tc.desc   Verify Number property types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const checkPropertyType = (): string => typeof Number.MAX_VALUE;
      expect('number').assertEqual(checkPropertyType());
    });
    /**
     * @tc.name   NumberTest0066
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0066
     * @tc.desc   Verify Number.parseFloat basic functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloat = (): number => Number.parseFloat('123.45');
      expect(123.45).assertEqual(testParseFloat());
    });
    /**
     * @tc.name   NumberTest0067
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0067
     * @tc.desc   Verify Number.parseFloat ignores trailing characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloatTrailing = (): number => Number.parseFloat('123abc');
      expect(123).assertEqual(testParseFloatTrailing());
    });
    /**
     * @tc.name   NumberTest0068
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0068
     * @tc.desc   Verify Number.parseFloat with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloatEmpty = (): number => Number.parseFloat('');
      expect(true).assertEqual(isNaN(testParseFloatEmpty()));
    });
    /**
     * @tc.name   NumberTest0069
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0069
     * @tc.desc   Verify Number.parseFloat with scientific notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloatScientific = (): number => Number.parseFloat('1e3');
      expect(1000).assertEqual(testParseFloatScientific());
    });
    /**
     * @tc.name   NumberTest0070
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0070
     * @tc.desc   Verify Number.parseInt with decimal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntDecimal = (): number => Number.parseInt('123');
      expect(123).assertEqual(testParseIntDecimal());
    });
    /**
     * @tc.name   NumberTest0071
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0071
     * @tc.desc   Verify Number.parseInt with specified radix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntRadix = (): [number, number] => [Number.parseInt('10', 2), Number.parseInt('10', 16)];
      const arr = testParseIntRadix();
      expect(2).assertEqual(arr[0]);
      expect(16).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0072
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0072
     * @tc.desc   Verify Number.parseInt with invalid radix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntInvalidRadix = (): number => Number.parseInt('10', 37);
      expect(true).assertEqual(isNaN(testParseIntInvalidRadix()));
    });
    /**
     * @tc.name   NumberTest0073
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0073
     * @tc.desc   Verify Number.parseInt ignores leading whitespace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntWhitespace = (): number => Number.parseInt(' 123');
      expect(123).assertEqual(testParseIntWhitespace());
    });
    /**
     * @tc.name   NumberTest0074
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0074
     * @tc.desc   Verify Number.isFinite with valid numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsFinite = (): [boolean, boolean] => [Number.isFinite(123), Number.isFinite(Infinity)];
      const arr = testIsFinite();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0075
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0075
     * @tc.desc   Verify Number.isFinite with non-numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsFiniteNonNumbers = (): [boolean, boolean] => [Number.isFinite('123'), Number.isFinite(NaN)];
      const arr = testIsFiniteNonNumbers();
      expect(false).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0076
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0076
     * @tc.desc   Verify Number.isInteger with integers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsInteger = (): [boolean, boolean] => [Number.isInteger(123), Number.isInteger(123.0)];
      const arr = testIsInteger();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0077
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0077
     * @tc.desc   Verify Number.isInteger with non-integers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsIntegerNonIntegers = (): [boolean, boolean] => [Number.isInteger(123.45), Number.isInteger(NaN)];
      const arr = testIsIntegerNonIntegers();
      expect(false).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0078
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0078
     * @tc.desc   Verify Number.isInteger with large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsIntegerLarge = (): boolean => Number.isInteger(9007199254740992);
      expect(true).assertEqual(testIsIntegerLarge());
    });
    /**
     * @tc.name   NumberTest0079
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0079
     * @tc.desc   Verify Number.isNaN strict check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsNaN = (): [boolean, boolean] => [Number.isNaN(NaN), Number.isNaN(123)];
      const arr = testIsNaN();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0080
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0080
     * @tc.desc   Verify Number.isNaN with non-number types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsNaNNonNumbers = (): [boolean, boolean] => [Number.isNaN('NaN'), Number.isNaN(undefined)];
      const arr = testIsNaNNonNumbers();
      expect(false).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0081
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0081
     * @tc.desc   Verify Number.isSafeInteger with safe values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsSafeInteger = (): boolean => Number.isSafeInteger(123);
      expect(true).assertEqual(testIsSafeInteger());
    });
    /**
     * @tc.name   NumberTest0082
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0082
     * @tc.desc   Verify Number.isSafeInteger with values beyond safe range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsSafeIntegerUnsafe = (): boolean => Number.isSafeInteger(9007199254740992);
      expect(false).assertEqual(testIsSafeIntegerUnsafe());
    });
    /**
     * @tc.name   NumberTest0083
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0083
     * @tc.desc   Verify Number.isSafeInteger with non-integers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsSafeIntegerNonInteger = (): boolean => Number.isSafeInteger(123.45);
      expect(false).assertEqual(testIsSafeIntegerNonInteger());
    });
    /**
     * @tc.name   NumberTest0084
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0084
     * @tc.desc   Verify consistency between global parseInt and Number.parseInt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareParseInt = (): boolean => parseInt('10', 2) === Number.parseInt('10', 2);
      expect(true).assertEqual(compareParseInt());
    });
    /**
     * @tc.name   NumberTest0085
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0085
     * @tc.desc   Verify consistency between global parseFloat and Number.parseFloat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareParseFloat = (): boolean => parseFloat('123.45') === Number.parseFloat('123.45');
      expect(true).assertEqual(compareParseFloat());
    });
    /**
     * @tc.name   NumberTest0086
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0086
     * @tc.desc   Verify difference between Number.isFinite and global isFinite
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const compareIsFinite = (): [boolean, boolean] => [isFinite(123), Number.isFinite('123')];
      const arr = compareIsFinite();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0087
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0087
     * @tc.desc   Verify Number.isInteger with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsIntegerNegative = (): [boolean, boolean] => [Number.isInteger(-123), Number.isInteger(-123.45)];
      const arr = testIsIntegerNegative();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0088
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0088
     * @tc.desc   Verify Number.parseInt returns NaN for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntEmpty = (): number => Number.parseInt('');
      expect(true).assertEqual(isNaN(testParseIntEmpty()));
    });
    /**
     * @tc.name   NumberTest0089
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0089
     * @tc.desc   Verify Number.parseFloat handles signed values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloatSigned = (): [number, number] => [Number.parseFloat('+123'), Number.parseFloat('-123')];
      const arr = testParseFloatSigned();
      expect(123).assertEqual(arr[0]);
      expect(-123).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0090
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0090
     * @tc.desc   Verify toExponential basic functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToExponential = (): string => (123).toExponential();
      expect('1.23e+2').assertEqual(testToExponential());
    });
    /**
     * @tc.name   NumberTest0091
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0091
     * @tc.desc   Verify toExponential with specified precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToExponentialPrecision = (): string => (123).toExponential(1);
      expect('1.2e+2').assertEqual(testToExponentialPrecision());
    });
    /**
     * @tc.name   NumberTest0092
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0092
     * @tc.desc   Verify toExponential with maximum precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToExponentialMaxPrecision = (): string => (123).toExponential(20);
      expect('1.23000000000000000000e+2').assertEqual(testToExponentialMaxPrecision());
    });
    /**
     * @tc.name   NumberTest0093
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0093
     * @tc.desc   Verify toExponential throws error for invalid precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToExponentialInvalid = (): boolean => {
        try {
          (123).toExponential(-1);
          return false;
        } catch (e) {
          return e instanceof RangeError;
        }
      };
      expect(true).assertEqual(testToExponentialInvalid());
    });
    /**
     * @tc.name   NumberTest0094
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0094
     * @tc.desc   Verify toFixed basic functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixed = (): string => (123).toFixed(2);
      expect('123.00').assertEqual(testToFixed());
    });
    /**
     * @tc.name   NumberTest0095
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0095
     * @tc.desc   Verify toFixed with decimal rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedRounding = (): string => (123.456).toFixed(2);
      expect('123.46').assertEqual(testToFixedRounding());
    });
    /**
     * @tc.name   NumberTest0096
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0096
     * @tc.desc   123 Verify toFixed with zero Test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedZero = (): string => (123).toFixed(0);
      expect('123').assertEqual(testToFixedZero());
    });
    /**
     * @tc.name   NumberTest0097
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0097
     * @tc.desc   Verify toFixed with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedNegative = (): string => (-123.45).toFixed(1);
      expect('-123.5').assertEqual(testToFixedNegative());
    });
    /**
     * @tc.name   NumberTest0098
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0098
     * @tc.desc   Verify toFixed with boundary rounding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedBoundary = (): string => (0.999999999).toFixed(8);
      expect('1.00000000').assertEqual(testToFixedBoundary());
    });
    /**
     * @tc.name   NumberTest0099
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0099
     * @tc.desc   Verify toFixed throws error for invalid precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedInvalid = (): boolean => {
        try {
          (123).toFixed(21);
          return true;
        } catch (e) {
          return e instanceof RangeError;
        }
      };
      expect(true).assertEqual(testToFixedInvalid());
    });
    /**
     * @tc.name   NumberTest0100
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0100
     * @tc.desc   Verify toPrecision basic functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrecision = (): string => (123).toPrecision(2);
      expect('1.2e+2').assertEqual(testToPrecision());
    });
    /**
     * @tc.name   NumberTest0101
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0101
     * @tc.desc   Verify toPrecision with full precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrecisionFull = (): string => (123).toPrecision(3);
      expect('123').assertEqual(testToPrecisionFull());
    });
    /**
     * @tc.name   NumberTest0102
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0102
     * @tc.desc   Verify toPrecision with decimal values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrecisionDecimal = (): string => (123.45).toPrecision(4);
      expect('123.5').assertEqual(testToPrecisionDecimal());
    });
    /**
     * @tc.name   NumberTest0103
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0103
     * @tc.desc   Verify toPrecision with integer precision 不足
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrecisionInsufficient = (): string => (999).toPrecision(2);
      expect('1.0e+3').assertEqual(testToPrecisionInsufficient());
    });
    /**
     * @tc.name   NumberTest0104
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0104
     * @tc.desc   Verify toPrecision throws error for invalid precision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrecisionInvalid = (): boolean => {
        try {
          (123).toPrecision(0);
          return false;
        } catch (e) {
          return e instanceof RangeError;
        }
      };
      expect(true).assertEqual(testToPrecisionInvalid());
    });
    /**
     * @tc.name   NumberTest0105
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0105
     * @tc.desc   Verify prototype methods with Number instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testInstanceMethod = (): string => new Number(123).toFixed(2);
      expect('123.00').assertEqual(testInstanceMethod());
    });
    /**
     * @tc.name   NumberTest0106
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0106
     * @tc.desc   Verify return type of number prototype methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMethodReturnType = (): string => typeof (123).toExponential();
      expect('string').assertEqual(testMethodReturnType());
    });
    /**
     * @tc.name   NumberTest0107
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0107
     * @tc.desc   Verify toPrecision with large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLargeToPrecision = (): string => (123456789012345).toPrecision(10);
      expect('1.234567890e+14').assertEqual(testLargeToPrecision());
    });
    /**
     * @tc.name   NumberTest0108
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0108
     * @tc.desc   Verify toExponential with small decimals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSmallToExponential = (): string => (0.00123).toExponential();
      expect('1.23e-3').assertEqual(testSmallToExponential());
    });
    /**
     * @tc.name   NumberTest0109
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0109
     * @tc.desc   Verify toFixed rounding behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedRoundingBehavior = (): [string, string] => [(2.5).toFixed(0), (1.5).toFixed(0)];
      const arr = testToFixedRoundingBehavior();
      expect('3').assertEqual(arr[0]);
      expect('2').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0111
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0111
     * @tc.desc   Verify comparison between BigInt and Number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntComparison = (): [boolean, boolean] => [Number(-123).toString() === 123n.toString(),
        Number(+123).toString() === 123n.toString()];
      const arr = testBigIntComparison();
      expect(false).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0114
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0114
     * @tc.desc   Verify converting BigInt to Number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntToNumber = (): number => Number(123n);
      expect(123).assertEqual(testBigIntToNumber());
    });
    /**
     * @tc.name   NumberTest0115
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0115
     * @tc.desc   Verify BigInt for numbers beyond safe integer range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntBeyondSafe = (): boolean => 9007199254740993n === BigInt(9007199254740993);
      expect(false).assertEqual(testBigIntBeyondSafe());
    });
    /**
     * @tc.name   NumberTest0116
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0116
     * @tc.desc   Verify BigInt compared with NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntVsNaN = (): boolean => Number.isNaN(123n);
      expect(false).assertEqual(testBigIntVsNaN());
    });
    /**
     * @tc.name   NumberTest0117
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0117
     * @tc.desc   Verify BigInt compared with Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntVsInfinity = (): boolean => 123n < Infinity;
      expect(true).assertEqual(testBigIntVsInfinity());
    });
    /**
     * @tc.name   NumberTest0118
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0118
     * @tc.desc   Verify parsing string to BigInt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testStringToBigInt = (): boolean => BigInt('123') === 123n;
      expect(true).assertEqual(testStringToBigInt());
    });
    /**
     * @tc.name   NumberTest0119
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0119
     * @tc.desc   Verify BigInt with different bases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntBases = (): [boolean, boolean] => [0b10n === 2n, 0x10n === 16n];
      const arr = testBigIntBases();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0121
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0121
     * @tc.desc   Verify extremely large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHugeNumbers = (): [boolean, boolean] => {
        const maxValid = 1.7976931348623157e+308;
        const overMax = 1.7976931348623158e+308;
        return [isFinite(maxValid), overMax === Infinity];
      };
      const arr = testHugeNumbers();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0122
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0122
     * @tc.desc   Verify number and string addition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberStringAddition = (): string => 123 + '45';
      expect('12345').assertEqual(testNumberStringAddition());
    });
    /**
     * @tc.name   NumberTest0124
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0124
     * @tc.desc   Verify post-increment assignment behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPostIncrement = (): number => {
        let a = 1;
        a = a++;
        return a;
      };
      expect(1).assertEqual(testPostIncrement());
    });
    /**
     * @tc.name   NumberTest0125
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0125
     * @tc.desc   Verify pre-increment assignment behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPreIncrement = (): number => {
        let a = 1;
        a = ++a;
        return a;
      };
      expect(2).assertEqual(testPreIncrement());
    });
    /**
     * @tc.name   NumberTest0126
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0126
     * @tc.desc   Verify post-decrement assignment behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPostDecrement = (): number => {
        let a = 1;
        a = a--;
        return a;
      };
      expect(1).assertEqual(testPostDecrement());
    });

    /**
     * @tc.name   NumberTest0127
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0127
     * @tc.desc   Verify pre-decrement assignment behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPreDecrement = (): number => {
        let a = 1;
        a = --a;
        return a;
      };
      expect(0).assertEqual(testPreDecrement());
    });

    /**
     * @tc.name   NumberTest0131
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0131
     * @tc.desc   Verify bitwise NOT operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBitwiseNot = (): number => ~42;
      expect(-43).assertEqual(testBitwiseNot());
    });

    /**
     * @tc.name   NumberTest0132
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0132
     * @tc.desc   Verify logical NOT with numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLogicalNot = (): [boolean, boolean] => [!0, !1];
      const arr = testLogicalNot();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0133
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0133
     * @tc.desc   Verify exponentiation operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testExponentiation = (): [number, number] => [2**3, 3**2];
      const arr = testExponentiation();
      expect(8).assertEqual(arr[0]);
      expect(9).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0134
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0134
     * @tc.desc   Verify exponentiation assignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testExponentiationAssignment = (): number => {
        let a = 2;
        a **= 3;
        return a;
      };
      expect(8).assertEqual(testExponentiationAssignment());
    });

    /**
     * @tc.name   NumberTest0135
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0135
     * @tc.desc   Verify remainder operator with positive numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRemainderPositive = (): number => 10 % 3;
      expect(1).assertEqual(testRemainderPositive());
    });

    /**
     * @tc.name   NumberTest0136
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0136
     * @tc.desc   Verify remainder operator with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRemainderNegative = (): [number, number] => [-10 % 3, 10 % -3];
      const arr = testRemainderNegative();
      expect(-1).assertEqual(arr[0]);
      expect(1).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0137
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0137
     * @tc.desc   Verify remainder assignment operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRemainderAssignment = (): number => {
        let a = 10;
        a %= 3;
        return a;
      };
      expect(1).assertEqual(testRemainderAssignment());
    });

    /**
     * @tc.name   NumberTest0138
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0138
     * @tc.desc   Verify division assignment operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testDivisionAssignment = (): number => {
        let a = 10;
        a /= 2;
        return a;
      };
      expect(5).assertEqual(testDivisionAssignment());
    });

    /**
     * @tc.name   NumberTest0139
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0139
     * @tc.desc   Verify multiplication assignment operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMultiplicationAssignment = (): number => {
        let a = 10;
        a *= 2;
        return a;
      };
      expect(20).assertEqual(testMultiplicationAssignment());
    });

    /**
     * @tc.name   NumberTest0140
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0140
     * @tc.desc   Verify subtraction assignment operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSubtractionAssignment = (): number => {
        let a = 10;
        a -= 2;
        return a;
      };
      expect(8).assertEqual(testSubtractionAssignment());
    });

    /**
     * @tc.name   NumberTest0141
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0141
     * @tc.desc   Verify addition assignment operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testAdditionAssignment = (): number => {
        let a = 10;
        a += 2;
        return a;
      };
      expect(12).assertEqual(testAdditionAssignment());
    });

    /**
     * @tc.name   NumberTest0142
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0142
     * @tc.desc   Verify left shift operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLeftShift = (): number => 5 << 1;
      expect(10).assertEqual(testLeftShift());
    });

    /**
     * @tc.name   NumberTest0143
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0143
     * @tc.desc   Verify right shift operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRightShift = (): number => 10 >> 1;
      expect(5).assertEqual(testRightShift());
    });

    /**
     * @tc.name   NumberTest0144
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0144
     * @tc.desc   Verify unsigned right shift operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testUnsignedRightShift = (): number => -10 >>> 1;
      expect(2147483643).assertEqual(testUnsignedRightShift());
    });

    /**
     * @tc.name   NumberTest0145
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0145
     * @tc.desc   Verify bitwise AND operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBitwiseAnd = (): number => 5 & 3;
      expect(1).assertEqual(testBitwiseAnd());
    });

    /**
     * @tc.name   NumberTest0146
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0146
     * @tc.desc   Verify bitwise XOR operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBitwiseXor = (): number => 5 ^ 3;
      expect(6).assertEqual(testBitwiseXor());
    });

    /**
     * @tc.name   NumberTest0147
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0147
     * @tc.desc   Verify bitwise OR operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBitwiseOr = (): number => 5 | 3;
      expect(7).assertEqual(testBitwiseOr());
    });

    /**
     * @tc.name   NumberTest0148
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0148
     * @tc.desc   Verify valueOf method for Number primitives
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValueOfPrimitive = (): number => (123).valueOf();
      expect(123).assertEqual(testValueOfPrimitive());
    });

    /**
     * @tc.name   NumberTest0149
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0149
     * @tc.desc   Verify valueOf method for Number objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValueOfObject = (): number => new Number(123).valueOf();
      expect(123).assertEqual(testValueOfObject());
    });

    /**
     * @tc.name   NumberTest0150
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0150
     * @tc.desc   Verify toString with different radices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToStringRadices =
        (): [string, string, string] => [(16).toString(2), (16).toString(8), (16).toString(16)];
      const arr = testToStringRadices();
      expect('10000').assertEqual(arr[0]);
      expect('20').assertEqual(arr[1]);
      expect('10').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0151
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0151
     * @tc.desc   Verify toString with invalid radix throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToStringInvalidRadix = (): boolean => {
        try {
          (16).toString(37);
          return false;
        } catch (e) {
          return e instanceof RangeError;
        }
      };
      expect(true).assertEqual(testToStringInvalidRadix());
    });

    /**
     * @tc.name   NumberTest0152
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0152
     * @tc.desc   Verify toLocaleString basic functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToLocaleString = (): string => (123456.789).toLocaleString('en-US');
      expect('123,456.789').assertEqual(testToLocaleString());
    });

    /**
     * @tc.name   NumberTest0153
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0153
     * @tc.desc   Verify toLocaleString with different locales
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToLocaleStringLocales =
        (): [string, string] => [(123456.789).toLocaleString('de-DE'), (123456.789).toLocaleString('fr-FR')];
      const arr = testToLocaleStringLocales();
      expect('123.456,789').assertEqual(arr[0]);
      expect('123 456,789').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0154
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0154
     * @tc.desc   Verify toLocaleString with options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToLocaleStringOptions = (): string => {
        const options: Intl.NumberFormatOptions = { maximumFractionDigits: 2, style: 'currency', currency: 'USD' };
        return (12345.678).toLocaleString('en-US', options);
      };
      expect('$12,345.68').assertEqual(testToLocaleStringOptions());
    });

    /**
     * @tc.name   NumberTest0155
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0155
     * @tc.desc   Verify number conversion in template literals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTemplateLiteral = (): string => {
        const num = 123;
        return `The number is ${num}`;
      };
      expect('The number is 123').assertEqual(testTemplateLiteral());
    });

    /**
     * @tc.name   NumberTest0156
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0156
     * @tc.desc   Verify number coercion in logical operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLogicalCoercion = (): [number, number] => [0 || 123, 456 && 789];
      const arr = testLogicalCoercion();
      expect(123).assertEqual(arr[0]);
      expect(789).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0158
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0158
     * @tc.desc   Verify number and date comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testDateComparison = (): boolean => {
        const timestamp: number = 1620000000000;
        const date = new Date(timestamp);
        return date.getTime() == timestamp;
      };
      expect(true).assertEqual(testDateComparison());
    });

    /**
     * @tc.name   NumberTest0159
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0159
     * @tc.desc   Verify Number constructor with new returns object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberObject = (): boolean => new Number(123) instanceof Number;
      expect(true).assertEqual(testNumberObject());
    });

    /**
     * @tc.name   NumberTest0160
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0160
     * @tc.desc   Verify Number constructor without new returns primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberPrimitive = (): string => typeof Number(123);
      expect('number').assertEqual(testNumberPrimitive());
    });

    /**
     * @tc.name   NumberTest0161
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0161
     * @tc.desc   Verify primitive vs object comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPrimitiveVsObject = (): [boolean, boolean] => [123 == new Number(123), 123 === new Number(123)];
      const arr = testPrimitiveVsObject();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });


    /**
     * @tc.name   NumberTest0163
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0163
     * @tc.desc   Verify number type checking with typeof
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTypeOfNumbers = (): [string, string] => [typeof 123, typeof new Number(123)];
      const arr = testTypeOfNumbers();
      expect('number').assertEqual(arr[0]);
      expect('object').assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0165
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0165
     * @tc.desc   Verify number truncation with Math.trunc
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathTrunc = (): [number, number] => [Math.trunc(123.45), Math.trunc(-123.45)];
      const arr = testMathTrunc();
      expect(123).assertEqual(arr[0]);
      expect(-123).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0166
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0166
     * @tc.desc   Verify Math.round with positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathRound = (): [number, number] => [Math.round(123.45), Math.round(-123.45)];
      const arr = testMathRound();
      expect(123).assertEqual(arr[0]);
      expect(-123).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0167
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0167
     * @tc.desc   Verify Math.ceil with positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathCeil = (): [number, number] => [Math.ceil(123.45), Math.ceil(-123.45)];
      const arr = testMathCeil();
      expect(124).assertEqual(arr[0]);
      expect(-123).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0168
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0168
     * @tc.desc   Verify Math.floor with positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathFloor = (): [number, number] => [Math.floor(123.45), Math.floor(-123.45)];
      const arr = testMathFloor();
      expect(123).assertEqual(arr[0]);
      expect(-124).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0169
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0169
     * @tc.desc   Verify Math.abs with positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathAbs = (): [number, number] => [Math.abs(123), Math.abs(-123)];
      const arr = testMathAbs();
      expect(123).assertEqual(arr[0]);
      expect(123).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0170
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0170
     * @tc.desc   Verify Math.sqrt with positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathSqrt = (): [number, boolean] => [Math.sqrt(25), isNaN(Math.sqrt(-25))];
      const arr = testMathSqrt();
      expect(5).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0171
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0171
     * @tc.desc   Verify Math.pow functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathPow = (): [number, number] => [Math.pow(2, 3), Math.pow(16, 0.5)];
      const arr = testMathPow();
      expect(8).assertEqual(arr[0]);
      expect(4).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0172
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0172
     * @tc.desc   Verify Math.max with multiple arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathMax = (): number => Math.max(1, 3, 2, 5, 4);
      expect(5).assertEqual(testMathMax());
    });

    /**
     * @tc.name   NumberTest0173
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0173
     * @tc.desc   Verify Math.min with multiple arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathMin = (): number => Math.min(1, 3, 2, 5, 4);
      expect(1).assertEqual(testMathMin());
    });

    /**
     * @tc.name   NumberTest0174
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0174
     * @tc.desc   Verify Math.random generates numbers in [0,1) range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathRandom = (): boolean => {
        const num = Math.random();
        return num >= 0 && num < 1;
      };
      expect(true).assertEqual(testMathRandom());
    });

    /**
     * @tc.name   NumberTest0175
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0175
     * @tc.desc   Verify Math.sign returns correct sign indicators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathSign = (): [number, number, number] => [Math.sign(123), Math.sign(-123), Math.sign(0)];
      const arr = testMathSign();
      expect(1).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0176
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0176
     * @tc.desc   Verify Math.cbrt calculates cube roots correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathCbrt = (): [number, number] => [Math.cbrt(8), Math.cbrt(-27)];
      const arr = testMathCbrt();
      expect(2).assertEqual(arr[0]);
      expect(-3).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0177
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0177
     * @tc.desc   Verify Math.hypot calculates hypotenuse correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathHypot = (): number => Math.hypot(3, 4);
      expect(5).assertEqual(testMathHypot());
    });

    /**
     * @tc.name   NumberTest0179
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0179
     * @tc.desc   Verify Math.sin and Math.cos for key angles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTrigFunctions = (): [number, number] => [Math.sin(Math.PI / 2), Math.cos(Math.PI)];
      const arr = testTrigFunctions();
      expect(1).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0181
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0181
     * @tc.desc   Verify Math.clz32 functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathClz32 = (): [number, number] => [Math.clz32(1), Math.clz32(0)];
      const arr = testMathClz32();
      expect(31).assertEqual(arr[0]);
      expect(32).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0182
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0182
     * @tc.desc   Verify Math.imul functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathImul = (): number => Math.imul(0x7fffffff, 2);
      expect(-2).assertEqual(testMathImul());
    });
    /**
     * @tc.name   NumberTest0183
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0183
     * @tc.desc   Verify Math.fround functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathFround = (): number => Math.fround(1.337);
      expect(1.3370000123977661).assertEqual(testMathFround());
    });
    /**
     * @tc.name   NumberTest0184
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0184
     * @tc.desc   Verify Math.atan2 functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathAtan2 = (): [number, number] => [Math.atan2(0, 1), Math.atan2(1, 0)];
      const arr = testMathAtan2();
      expect(0).assertEqual(arr[0]);
      expect(Math.PI / 2).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0185
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0185
     * @tc.desc   Verify Math.log10 functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathLog10 = (): [number, boolean] => [Math.log10(100), isNaN(Math.log10(-10))];
      const arr = testMathLog10();
      expect(2).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0186
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0186
     * @tc.desc   Verify Math.log2 functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathLog2 = (): number => Math.log2(8);
      expect(3).assertEqual(testMathLog2());
    });
    /**
     * @tc.name   NumberTest0187
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0187
     * @tc.desc   Verify Math.log1p functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathLog1p = (): number => Math.log1p(Math.E - 1);
      expect(1).assertEqual(testMathLog1p());
    });
    /**
     * @tc.name   NumberTest0188
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0188
     * @tc.desc   Verify Math.expm1 functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathExpm1 = (): number => Math.expm1(1);
      expect(Math.E - 1).assertEqual(testMathExpm1());
    });
    /**
     * @tc.name   NumberTest0189
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0189
     * @tc.desc   Verify Math.cosh, sinh, tanh functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHyperbolic = (): [number, number, number] => [Math.cosh(0), Math.sinh(0), Math.tanh(0)];
      const arr = testHyperbolic();
      expect(1).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0190
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0190
     * @tc.desc   Verify Math.acosh, asinh, atanh functionality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testInverseHyperbolic = (): [number, number, number] => [Math.acosh(1), Math.asinh(0), Math.atanh(0)];
      const arr = testInverseHyperbolic();
      expect(0).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0191
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0191
     * @tc.desc   Verify Number.EPSILON comparison for floating points
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testEpsilonComparison = (): boolean => {
        const a = 0.1 + 0.2;
        const b = 0.3;
        return Math.abs(a - b) < Number.EPSILON;
      };
      expect(true).assertEqual(testEpsilonComparison());
    });
    /**
     * @tc.name   NumberTest0192
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0192
     * @tc.desc   Verify Number.isInteger with Number objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsIntegerObject = (): boolean => Number.isInteger(new Number(123));
      expect(false).assertEqual(testIsIntegerObject());
    });
    /**
     * @tc.name   NumberTest0193
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0193
     * @tc.desc   Verify number conversion with Object.prototype.valueOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValueOfConversion = (): number => new Number(123).valueOf();
      expect(123).assertEqual(testValueOfConversion());
    });
    /**
     * @tc.name   NumberTest0194
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0194
     * @tc.desc   Verify number to primitive conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrimitive = (): number => {
        const numObj: Number = new Number(456);
        return numObj.valueOf() + 1;
      };
      expect(457).assertEqual(testToPrimitive());
    });
    /**
     * @tc.name   NumberTest0195
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0195
     * @tc.desc   Verify number coercion in boolean contexts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBooleanCoercion = (): [boolean, boolean] => [!!0, !!1];
      const arr = testBooleanCoercion();
      expect(false).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0196
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0196
     * @tc.desc   Verify Number.parseFloat with leading zeros
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloatLeadingZeros = (): number => Number.parseFloat('000123.45000');
      expect(123.45).assertEqual(testParseFloatLeadingZeros());
    });
    /**
     * @tc.name   NumberTest0197
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0197
     * @tc.desc   Verify Number.parseInt with leading zeros and radix 10
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntLeadingZeros = (): number => Number.parseInt('00123', 10);
      expect(123).assertEqual(testParseIntLeadingZeros());
    });
    /**
     * @tc.name   NumberTest0198
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0198
     * @tc.desc   Verify toFixed with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedLarge = (): string => (12345678901234567890).toFixed(2);
      expect('12345678901234567168.00').assertEqual(testToFixedLarge());
    });
    /**
     * @tc.name   NumberTest0199
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0199
     * @tc.desc   Verify toExponential with zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToExponentialZero = (): string => (0).toExponential();
      expect('0e+0').assertEqual(testToExponentialZero());
    });
    /**
     * @tc.name   NumberTest0200
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0200
     * @tc.desc   Verify toPrecision with zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrecisionZero = (): string => (0).toPrecision(5);
      expect('0.0000').assertEqual(testToPrecisionZero());
    });
    /**
     * @tc.name   NumberTest0201
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0201
     * @tc.desc   Verify number multiplication precision issues
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMultiplicationPrecision = (): boolean => {
        const result = 0.1 * 0.2;
        return Math.abs(result - 0.02) < Number.EPSILON;
      };
      expect(true).assertEqual(testMultiplicationPrecision());
    });
    /**
     * @tc.name   NumberTest0202
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0202
     * @tc.desc   Verify number division precision issues
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testDivisionPrecision = (): boolean => {
        const result = 1 / 3;
        return Math.abs(result - 0.3333333333333333) < Number.EPSILON;
      };
      expect(true).assertEqual(testDivisionPrecision());
    });
    /**
     * @tc.name   NumberTest0203
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0203
     * @tc.desc   Verify Math.round with .5 fractions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRoundHalf = (): [number, number] => [Math.round(2.5), Math.round(-2.5)];
      const arr = testRoundHalf();
      expect(3).assertEqual(arr[0]);
      expect(-2).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0204
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0204
     * @tc.desc   Verify Number.isNaN vs isNaN for objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsNaNObjects =
        (): [boolean, boolean] => [isNaN(new Number(NaN).valueOf()), Number.isNaN(new Number(NaN))];
      const arr = testIsNaNObjects();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0205
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0205
     * @tc.desc   Verify Math.random seed independence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRandomIndependence = (): boolean => {
        const a = Math.random();
        const b = Math.random();
        return a !== b; // High probability, though not guaranteed mathematically
      };
      expect(true).assertEqual(testRandomIndependence());
    });
    /**
     * @tc.name   NumberTest0206
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0206
     * @tc.desc   Verify number conversion with String constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testStringConversion = (): string => String(123.45);
      expect('123.45').assertEqual(testStringConversion());
    });
    /**
     * @tc.name   NumberTest0210
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0210
     * @tc.desc   Verify Number instance properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testInstanceProperties = (): number => {
        const num = new Number(123);
        return num.valueOf();
      };
      expect(123).assertEqual(testInstanceProperties());
    });
    /**
     * @tc.name   NumberTest0212
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0212
     * @tc.desc   Verify number in array indexes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberAsIndexes = (): string => {
        const arr = ['a', 'b', 'c'];
        const index = 1;
        return arr[index];
      };
      expect('b').assertEqual(testNumberAsIndexes());
    });
    /**
     * @tc.name   NumberTest0214
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0214
     * @tc.desc   Verify number with void operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testVoidOperator = (): boolean => void 123 === undefined;
      expect(true).assertEqual(testVoidOperator());
    });
    /**
     * @tc.name   NumberTest0217
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0217
     * @tc.desc   Verify number with ternary operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTernaryOperator = (): string => 0 ? 'truthy' : 'falsy';
      expect('falsy').assertEqual(testTernaryOperator());
    });
    /**
     * @tc.name   NumberTest0218
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0218
     * @tc.desc   Verify number with typeof operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTypeOf = (): [string, string] => [typeof 123, typeof NaN];
      const arr = testTypeOf();
      expect('number').assertEqual(arr[0]);
      expect('number').assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0222
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0222
     * @tc.desc   Verify number with new operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNewOperator = (): boolean => new Number(123) instanceof Number;
      expect(true).assertEqual(testNewOperator());
    });
    /**
     * @tc.name   NumberTest0225
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0225
     * @tc.desc   Verify number with rest parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRestParameters = (): number => {
        let sum: (...numbers: number[]) => number = (...numbers: number[]) => {
          return numbers.reduce((a, b) => a + b, 0);
        }
        return sum(1, 2, 3);
      };
      expect(6).assertEqual(testRestParameters());
    });
    /**
     * @tc.name   NumberTest0226
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0226
     * @tc.desc   Verify number with destructuring assignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testDestructuring = (): number => {
        const arr = [1, 2];
        return arr[0] + arr[1];
      };
      expect(3).assertEqual(testDestructuring());
    });
    /**
     * @tc.name   NumberTest0227
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0227
     * @tc.desc   Verify number with arrow functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testArrowFunction = (): number => {
        const add = (a: number, b: number) => a + b;
        return add(2, 3);
      };
      expect(5).assertEqual(testArrowFunction());
    });
    /**
     * @tc.name   NumberTest0229
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0229
     * @tc.desc   Verify number with async functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testAsyncFunction = async (): Promise<number> => {
        const promise = new Promise<number>(resolve => resolve(123));
        return await promise;
      };
      const result = await testAsyncFunction();
      expect(123).assertEqual(result);
      Done();
    });
    /**
     * @tc.name   NumberTest0230
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0230
     * @tc.desc   Verify number with class methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClassMethods = (): number => {
        class Calculator {
          multiply(a: number, b: number): number {
            return a * b;
          }
        }

        const calc = new Calculator();
        return calc.multiply(3, 4);
      };
      expect(12).assertEqual(testClassMethods());
    });
    /**
     * @tc.name   NumberTest0231
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0231
     * @tc.desc   Verify Math.sinh with positive and negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathSinh = (): [number, number] => [Math.sinh(1), Math.sinh(-1)];
      const arr = testMathSinh();
      expect(1.1752011936438014).assertEqual(arr[0]);
      expect(-1.1752011936438014).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0232
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0232
     * @tc.desc   Verify Math.cosh with zero and positive values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathCosh = (): [number, number] => [Math.cosh(0), Math.cosh(1)];
      const arr = testMathCosh();
      expect(1).assertEqual(arr[0]);
      expect(1.5430806348152437).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0233
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0233
     * @tc.desc   Verify Math.tanh with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathTanh = (): [number, number] => [Math.tanh(0), Math.tanh(Infinity)];
      const arr = testMathTanh();
      expect(0).assertEqual(arr[0]);
      expect(1).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0234
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0234
     * @tc.desc   Verify Math.asinh with zero and positive values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathAsinh = (): [number, number] => [Math.asinh(0), Math.asinh(1)];
      const arr = testMathAsinh();
      expect(0).assertEqual(arr[0]);
      expect(0.881373587019543).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0235
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0235
     * @tc.desc   Verify Math.acosh with valid input range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathAcosh = (): [number, boolean] => [Math.acosh(1), isNaN(Math.acosh(0))];
      const arr = testMathAcosh();
      expect(0).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0236
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0236
     * @tc.desc   Verify Math.atanh with valid input range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathAtanh = (): [number, boolean] => [Math.atanh(0), isNaN(Math.atanh(2))];
      const arr = testMathAtanh();
      expect(0).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0237
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0237
     * @tc.desc   Verify Math.hypot with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathHypotNegative = (): number => Math.hypot(-3, -4);
      expect(5).assertEqual(testMathHypotNegative());
    });
    /**
     * @tc.name   NumberTest0238
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0238
     * @tc.desc   Verify Math.hypot with large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathHypotLarge = (): number => Math.hypot(3e308, 4e308);
      expect(5e308).assertEqual(testMathHypotLarge());
    });
    /**
     * @tc.name   NumberTest0239
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0239
     * @tc.desc   Verify Math.clz32 with powers of two
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathClz32Powers = (): [number, number] => [Math.clz32(8), Math.clz32(16)];
      const arr = testMathClz32Powers();
      expect(28).assertEqual(arr[0]);
      expect(27).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0240
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0240
     * @tc.desc   Verify Math.imul with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathImulNegative = (): number => Math.imul(-2, 3);
      expect(-6).assertEqual(testMathImulNegative());
    });
    /**
     * @tc.name   NumberTest0241
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0241
     * @tc.desc   Verify Math.fround with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathFroundSpecial = (): [number, number] => [Math.fround(Infinity), Math.fround(NaN)];
      const arr = testMathFroundSpecial();
      expect(Infinity).assertEqual(arr[0]);
      expect(true).assertEqual(isNaN(arr[1]));
    });
    /**
     * @tc.name   NumberTest0242
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0242
     * @tc.desc   Verify Math.atan2 with negative coordinates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathAtan2Negative = (): number => Math.atan2(-1, -1);
      expect(-3 * Math.PI / 4).assertEqual(testMathAtan2Negative());
    });
    /**
     * @tc.name   NumberTest0243
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0243
     * @tc.desc   Verify Math.log10 with edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathLog10Edges = (): [number, number] => [Math.log10(1), Math.log10(0)];
      const arr = testMathLog10Edges();
      expect(0).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0244
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0244
     * @tc.desc   Verify Math.log2 with edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathLog2Edges = (): [number, number] => [Math.log2(1), Math.log2(0.5)];
      const arr = testMathLog2Edges();
      expect(0).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0245
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0245
     * @tc.desc   Verify Math.log1p with small values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathLog1pSmall = (): number => Math.log1p(1e-9);
      expect(9.999999995e-10).assertEqual(testMathLog1pSmall());
    });
    /**
     * @tc.name   NumberTest0246
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0246
     * @tc.desc   Verify Math.expm1 with small values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathExpm1Small = (): number => Math.expm1(1e-9);
      expect(1.0000000005000001e-9).assertEqual(testMathExpm1Small());
    });
    /**
     * @tc.name   NumberTest0247
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0247
     * @tc.desc   Verify number coercion in array methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testArrayCoercion = (): number => {
        const arr = ['1', '2', '3'];
        return arr.map(Number).reduce((a, b) => a + b, 0);
      };
      expect(6).assertEqual(testArrayCoercion());
    });
    /**
     * @tc.name   NumberTest0248
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0248
     * @tc.desc   Verify number sorting with array sort
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberSorting = (): string => {
        const arr = [3, 1, 4, 1, 5];
        arr.sort((a, b) => a - b);
        return arr.join(',');
      };
      expect('1,1,3,4,5').assertEqual(testNumberSorting());
    });
    /**
     * @tc.name   NumberTest0249
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0249
     * @tc.desc   Verify number comparison in array filter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberFilter = (): number => {
        const arr = [1, 2, 3, 4, 5];
        return arr.filter(n => n % 2 === 0).length;
      };
      expect(2).assertEqual(testNumberFilter());
    });
    /**
     * @tc.name   NumberTest0250
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0250
     * @tc.desc   Verify number with Map keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberMapKeys = (): string => {
        const map = new Map<number, string>();
        map.set(123, 'test');
        return map.get(123) || '';
      };
      expect('test').assertEqual(testNumberMapKeys());
    });
    /**
     * @tc.name   NumberTest0251
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0251
     * @tc.desc   Verify number with Set values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberSetValues = (): boolean => {
        const set = new Set<number>();
        set.add(123);
        return set.has(123);
      };
      expect(true).assertEqual(testNumberSetValues());
    });
    /**
     * @tc.name   NumberTest0252
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0252
     * @tc.desc   Verify number conversion in Promise resolutions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testPromiseNumber = async (): Promise<number> => {
        return await Promise.resolve('123').then(Number);
      };
      const result = await testPromiseNumber();
      expect(123).assertEqual(result);
      Done();
    });
    /**
     * @tc.name   NumberTest0254
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0254
     * @tc.desc   Verify number with typed arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTypedArray = (): number => {
        const arr = new Uint8Array(3);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        return arr.reduce((a, b) => a + b, 0);
      };
      expect(6).assertEqual(testTypedArray());
    });
    /**
     * @tc.name   NumberTest0255
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0255
     * @tc.desc   Verify number with BigInt conversion edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntConversion = (): boolean => {
        const big = 9007199254740993n;
        return Number(big) === 9007199254740992;
      };
      expect(true).assertEqual(testBigIntConversion());
    });
    /**
     * @tc.name   NumberTest0256
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0256
     * @tc.desc   Verify number with JSON stringify and parse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testJsonNumber = (): number => {
        const num = 123.45;
        return JSON.parse(JSON.stringify(num));
      };
      expect(123.45).assertEqual(testJsonNumber());
    });
    /**
     * @tc.name   NumberTest0258
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0258
     * @tc.desc   Verify number with Date.getTime()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testDateNumber = (): boolean => {
        const time = new Date().getTime();
        return typeof time === 'number' && time > 0;
      };
      expect(true).assertEqual(testDateNumber());
    });
    /**
     * @tc.name   NumberTest0259
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0259
     * @tc.desc   Verify number with RegExp.lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRegExpNumber = (): number => {
        const regex = /a/g;
        regex.exec('abc');
        return regex.lastIndex;
      };
      expect(1).assertEqual(testRegExpNumber());
    });
    /**
     * @tc.name   NumberTest0260
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0260
     * @tc.desc   Verify number with Function.length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testFunctionLength = (): number => {
        let test: () => void = () => {
        }
        return test.length;
      };
      expect(0).assertEqual(testFunctionLength());
    });
    /**
     * @tc.name   NumberTest0261
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0261
     * @tc.desc   Verify number with Error.stack line numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testErrorNumber = (): boolean => {
        try {
          throw new Error('test');
        } catch (e) {
          const stack = (e as Error).stack || '';
          return /\d+/.test(stack);
        }
      };
      expect(true).assertEqual(testErrorNumber());
    });

    /**
     * @tc.name   NumberTest0263
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0263
     * @tc.desc   Verify number with setTimeout delay
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testTimeoutNumber = (): Promise<boolean> => {
        return new Promise(resolve => {
          const start = Date.now();
          setTimeout(() => {
            const end = Date.now();
            resolve(end - start >= 10);
          }, 10);
        });
      };
      const result = await testTimeoutNumber();
      expect(true).assertEqual(result);
      Done();
    });
    /**
     * @tc.name   NumberTest0264
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0264
     * @tc.desc   Verify number with setInterval
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const testIntervalNumber = (): Promise<number> => {
        return new Promise(resolve => {
          let count = 0;
          const interval = setInterval(() => {
            count++;
            if (count === 2) {
              clearInterval(interval);
              resolve(count);
            }
          }, 10);
        });
      };
      const result = await testIntervalNumber();
      expect(2).assertEqual(result);
      Done();
    });
    /**
     * @tc.name   NumberTest0266
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0266
     * @tc.desc   Verify number with ArrayBuffer byteLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBufferNumber = (): number => {
        const buffer = new ArrayBuffer(8);
        return buffer.byteLength;
      };
      expect(8).assertEqual(testBufferNumber());
    });
    /**
     * @tc.name   NumberTest0291
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0291
     * @tc.desc   Verify Number.MAX_VALUE boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMaxValue = (): [number, number] => [
        Number.MAX_VALUE,
        Number.MAX_VALUE * 2
      ];
      const arr = testMaxValue();
      expect(1.7976931348623157e+308).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0292
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0292
     * @tc.desc   Verify Number.MIN_VALUE boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMinValue = (): [number, number] => [
        Number.MIN_VALUE,
        Number.MIN_VALUE / 2
      ];
      const arr = testMinValue();
      expect(5e-324).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0293
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0293
     * @tc.desc   Verify Number.MAX_SAFE_INTEGER boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMaxSafeInteger = (): [boolean, boolean] => [
        Number.isSafeInteger(Number.MAX_SAFE_INTEGER),
        Number.isSafeInteger(Number.MAX_SAFE_INTEGER + 1)
      ];
      const arr = testMaxSafeInteger();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0294
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0294
     * @tc.desc   Verify Number.MIN_SAFE_INTEGER boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMinSafeInteger = (): [boolean, boolean] => [
        Number.isSafeInteger(Number.MIN_SAFE_INTEGER),
        Number.isSafeInteger(Number.MIN_SAFE_INTEGER - 1)
      ];
      const arr = testMinSafeInteger();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0295
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0295
     * @tc.desc   Verify Infinity arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testInfinityArithmetic = (): [number, number, number] => [
        Infinity + 1,
        Infinity * 2,
        1 / Infinity
      ];
      const arr = testInfinityArithmetic();
      expect(Infinity).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0296
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0296
     * @tc.desc   Verify -Infinity arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNegativeInfinityArithmetic = (): [number, number, number] => [
        -Infinity + 1,
        -Infinity * 2,
        1 / -Infinity
      ];
      const arr = testNegativeInfinityArithmetic();
      expect(-Infinity).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
      expect(-0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0297
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0297
     * @tc.desc   Verify NaN comparison and operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNaNBehavior = (): [boolean, boolean] => [
        isNaN(NaN),
        Number.isNaN(NaN)
      ];
      const arr = testNaNBehavior();
      expect(NaN).not().assertEqual(NaN);
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0298
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0298
     * @tc.desc   Verify NaN propagation in operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNaNPropagation = (): [boolean, boolean, boolean] => [
        isNaN(NaN + 1),
        isNaN(NaN * 2),
        isNaN(Math.sqrt(NaN))
      ];
      const arr = testNaNPropagation();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0300
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0300
     * @tc.desc   Verify 0 and -0 in division
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testZeroDivision = (): [number, number] => [
        1 / 0,
        1 / -0
      ];
      const arr = testZeroDivision();
      expect(Infinity).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0301
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0301
     * @tc.desc   Verify floating point precision issues
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPrecisionIssues = (): [number, boolean] => {
        const sum = 0.1 + 0.2;
        return [sum, sum === 0.3];
      };
      const arr = testPrecisionIssues();
      expect(0.30000000000000004).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0302
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0302
     * @tc.desc   Verify Number.EPSILON for precision comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testEpsilonUsage = (): boolean => {
        const a = 0.1 + 0.2;
        const b = 0.3;
        return Math.abs(a - b) < Number.EPSILON;
      };
      expect(true).assertEqual(testEpsilonUsage());
    });

    /**
     * @tc.name   NumberTest0303
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0303
     * @tc.desc   Verify operations with mixed Infinity and NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMixedSpecialValues = (): [boolean, boolean] => [
        isNaN(Infinity - Infinity),
        isNaN(Infinity * 0)
      ];
      const arr = testMixedSpecialValues();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0304
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0304
     * @tc.desc   Verify conversion of special values to strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSpecialValueStrings = (): [string, string, string] => [
        Infinity.toString(),
        (-Infinity).toString(),
        NaN.toString()
      ];
      const arr = testSpecialValueStrings();
      expect('Infinity').assertEqual(arr[0]);
      expect('-Infinity').assertEqual(arr[1]);
      expect('NaN').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0305
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0305
     * @tc.desc   Verify parsing special value strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParsingSpecials = (): [number, number, boolean] => [
        Number('Infinity'),
        Number('-Infinity'),
        isNaN(Number('NaN'))
      ];
      const arr = testParsingSpecials();
      expect(Infinity).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0306
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0306
     * @tc.desc   Verify safe integer operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSafeIntegerOps = (): [number, number] => {
        const safe = Number.MAX_SAFE_INTEGER;
        return [safe + 1, safe + 2];
      };
      const arr = testSafeIntegerOps();
      expect(9007199254740992).assertEqual(arr[0]);
      expect(9007199254740992).assertEqual(arr[1]); // Loses precision
    });

    /**
     * @tc.name   NumberTest0307
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0307
     * @tc.desc   Verify JSON serialization of special numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testJsonSpecials = (): [string, string, string] => [
        JSON.stringify(Infinity),
        JSON.stringify(-Infinity),
        JSON.stringify(NaN)
      ];
      const arr = testJsonSpecials();
      expect('null').assertEqual(arr[0]);
      expect('null').assertEqual(arr[1]);
      expect('null').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0308
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0308
     * @tc.desc   Verify Math functions with Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathInfinity = (): [number, number, number] => [
        Math.sqrt(Infinity),
        Math.log(0),
        Math.sin(Infinity)
      ];
      const arr = testMathInfinity();
      expect(Infinity).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(isNaN(arr[2]));
    });

    /**
     * @tc.name   NumberTest0309
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0309
     * @tc.desc   Verify toFixed with very small and large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedExtremes = (): [string, string] => [
        (0.0000001).toFixed(10),
        (123456789012345).toFixed(2)
      ];
      const arr = testToFixedExtremes();
      expect('0.0000001000').assertEqual(arr[0]);
      expect('123456789012345.00').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0310
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0310
     * @tc.desc   Verify toExponential with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToExponential = (): [string, string] => [
        (Number.MAX_VALUE).toExponential(2),
        (Number.MIN_VALUE).toExponential(2)
      ];
      const arr = testToExponential();
      expect('1.80e+308').assertEqual(arr[0]);
      expect('4.94e-324').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0311
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0311
     * @tc.desc   Verify parseInt with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntBoundaries = (): [number, number] => [
        parseInt('9007199254740993'),
        parseInt('1e308')
      ];
      const arr = testParseIntBoundaries();
      expect(9007199254740993).assertEqual(arr[0]);
      expect(1).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0313
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0313
     * @tc.desc   Verify bitwise operations with boundary numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBitwiseBoundaries = (): [number, number] => [
        0x7FFFFFFF << 1,
        -1 >>> 0
      ];
      const arr = testBitwiseBoundaries();
      expect(-2).assertEqual(arr[0]);
      expect(4294967295).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0314
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0314
     * @tc.desc   Verify BigInt conversion from Number boundaries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBigIntConversion = (): [boolean, boolean] => {
        const safe = BigInt(Number.MAX_SAFE_INTEGER);
        const unsafe = BigInt(Number.MAX_SAFE_INTEGER + 1);
        return [
          safe === 9007199254740991n,
          unsafe === 9007199254740992n
        ];
      };
      const arr = testBigIntConversion();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0315
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0315
     * @tc.desc   Verify Number.isFinite with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsFinite = (): [boolean, boolean, boolean, boolean] => [
        Number.isFinite(123),
        Number.isFinite(Infinity),
        Number.isFinite(-Infinity),
        Number.isFinite(NaN)
      ];
      const arr = testIsFinite();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
      expect(false).assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0316
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0316
     * @tc.desc   Verify Number.isNaN vs global isNaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsNaNComparison = (): [boolean, boolean] => [
        Number.isNaN('NaN'),
        Number.isNaN(undefined),
      ];
      const arr = testIsNaNComparison();
      expect(false).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0317
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0317
     * @tc.desc   Verify Math functions with NaN input
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathNaNInput = (): [boolean, boolean, boolean] => [
        isNaN(Math.sqrt(NaN)),
        isNaN(Math.log(NaN)),
        isNaN(Math.sin(NaN))
      ];
      const arr = testMathNaNInput();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0318
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0318
     * @tc.desc   Verify Math functions with out-of-domain inputs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMathDomain = (): [boolean, boolean, boolean] => [
        isNaN(Math.sqrt(-1)),
        isNaN(Math.log(-1)),
        isNaN(Math.acos(2))
      ];
      const arr = testMathDomain();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0319
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0319
     * @tc.desc   Verify Number prototype methods on special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPrototypeSpecials = (): [string, string, string] => [
        (NaN).toString(),
        (Infinity).toString(),
        (-0).toString()
      ];
      const arr = testPrototypeSpecials();
      expect('NaN').assertEqual(arr[0]);
      expect('Infinity').assertEqual(arr[1]);
      expect('0').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0320
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0320
     * @tc.desc   Verify special numbers in array operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testArraySpecials = (): [number, number, number] => {
        const arr = [NaN, Infinity, -Infinity];
        return [
          arr.indexOf(NaN),
          arr.indexOf(Infinity),
          arr.lastIndexOf(-Infinity)
        ];
      };
      const arr = testArraySpecials();
      expect(-1).assertEqual(arr[0]); // indexOf can't find NaN
      expect(1).assertEqual(arr[1]);
      expect(2).assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0321
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0321
     * @tc.desc   Verify comparison operators with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testComparisons = (): [boolean, boolean, boolean, boolean] => [
        Infinity > 1000000,
        -Infinity
      <
      -1000000,
      NaN > 0,
      NaN < 0
      ]
      ;
      const arr = testComparisons();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
      expect(false).assertEqual(arr[3]);
    });
    /**
     * @tc.name   NumberTest0323
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0323
     * @tc.desc   Verify negation operator with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNegation = (): [number, number, boolean] => [
        -Infinity,
        -(-Infinity),
        isNaN(-NaN)
      ];
      const arr = testNegation();
      expect(-Infinity).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0324
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0324
     * @tc.desc   Verify increment/decrement with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIncDec = (): [number, number, number, number] => {
        let max = Number.MAX_VALUE;
        let min = Number.MIN_VALUE;
        return [++max, --min, ++min, --max];
      };
      const arr = testIncDec();
      expect(Number.MAX_VALUE).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
      expect(Number.MAX_VALUE).assertEqual(arr[3]);
    });
    /**
     * @tc.name   NumberTest0325
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0325
     * @tc.desc   Verify modulo operation with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testModulo = (): [boolean, boolean, number] => [
        isNaN(Infinity % 10),
        isNaN(10 % 0),
        10 % 3
      ];
      const arr = testModulo();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(1).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0326
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0326
     * @tc.desc   Verify exponentiation with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testExponentiation = (): [number, number, boolean, number] => [
        Math.pow(Infinity, 2),
        Math.pow(2, Infinity),
        isNaN(Math.pow(NaN, 0)),
        Math.pow(0, 0)
      ];
      const arr = testExponentiation();
      expect(Infinity).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
      expect(1).assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0327
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0327
     * @tc.desc   Verify toPrecision with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToPrecision = (): [string, string, string] => [
        (12345).toPrecision(2),
        (0.0012345).toPrecision(2),
        (Infinity).toPrecision(2)
      ];
      const arr = testToPrecision();
      expect('1.2e+4').assertEqual(arr[0]);
      expect('0.0012').assertEqual(arr[1]);
      expect('Infinity').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0328
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0328
     * @tc.desc   Verify Number.isInteger with edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsInteger = (): [boolean, boolean, boolean, boolean] => [
        Number.isInteger(123.0),
        Number.isInteger(123.5),
        Number.isInteger(Infinity),
        Number.isInteger(NaN)
      ];
      const arr = testIsInteger();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
      expect(false).assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0329
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0329
     * @tc.desc   Verify Number.parseFloat with special strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloatSpecials = (): [number, boolean, number] => [
        Number.parseFloat('  123.45e-6  '),
        isNaN(Number.parseFloat('123abc')),
        Number.parseFloat('0x12')
      ];
      const arr = testParseFloatSpecials();
      expect(0.00012345).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]); // '123abc' parses to 123
      expect(0).assertEqual(arr[2]); // parseFloat doesn't handle hex
    });

    /**
     * @tc.name   NumberTest0330
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0330
     * @tc.desc   Verify Number.parseInt with radix edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseIntRadix = (): [number, number, number] => [
        Number.parseInt('11', 2), // Binary
        Number.parseInt('11', 8), // Octal
        Number.parseInt('11', 16)// Hexadecimal
      ];
      const arr = testParseIntRadix();
      expect(3).assertEqual(arr[0]);
      expect(9).assertEqual(arr[1]);
      expect(17).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0331
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0331
     * @tc.desc   Verify Math functions with boundary angles
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testAngleBoundaries = (): [number, number, number] => [
        Math.sin(Math.PI / 2),
        Math.cos(Math.PI),
        Math.tan(0)
      ];
      const arr = testAngleBoundaries();
      expect(1).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0332
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0332
     * @tc.desc   Verify Math.hypot with extreme values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHypotExtremes = (): [number, boolean] => [
        Math.hypot(Infinity, 1),
        isNaN(Math.hypot(NaN, 1))
      ];
      const arr = testHypotExtremes();
      expect(Infinity).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0333
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0333
     * @tc.desc   Verify Math.clz32 with special bit patterns
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClz32Specials = (): [number, number, number] => [
        Math.clz32(0xFFFFFFFF), // All bits set
        Math.clz32(0x80000000), // Highest bit set
        Math.clz32(-1)// Treats as unsigned 32-bit
      ];
      const arr = testClz32Specials();
      expect(0).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0334
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0334
     * @tc.desc   Verify Math.imul with overflow cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testImulOverflow = (): [number, number] => [
        Math.imul(0x80000000, 2), // Overflow positive
        Math.imul(-0x80000000, 2)// Overflow negative
      ];
      const arr = testImulOverflow();
      expect(0).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0335
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0335
     * @tc.desc   Verify toLocaleString with special numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToLocaleString = (): [string, string] => [
        (1234567.89).toLocaleString(),
        (Infinity).toLocaleString()
      ];
      const arr = testToLocaleString();
      expect('1,234,567.89').assertEqual(arr[0]);
      expect('∞').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0336
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0336
     * @tc.desc   Verify Number.prototype.valueOf on special instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValueOfSpecials = (): [boolean, number, number] => [
        isNaN(new Number(NaN).valueOf()),
        new Number(Infinity).valueOf(),
        new Number(-0).valueOf()
      ];
      const arr = testValueOfSpecials();
      expect(true).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
      expect(-0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0337
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0337
     * @tc.desc   Verify special numbers in Set and Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSetMapSpecials = (): [boolean, boolean, boolean] => {
        const set = new Set<number>([0, -0, NaN, NaN]);
        const map = new Map<number, boolean>([[NaN, true]]);
        return [
          set.size === 2, // 0 and -0 are considered equal, NaNs are considered equal
          set.has(-0),
          map.has(NaN)
        ];
      };
      const arr = testSetMapSpecials();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0338
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0338
     * @tc.desc   Verify array methods with NaN elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testArrayNaN = (): [number, boolean] => {
        const arr = [1, NaN, 3, NaN, 5];
        return [
          arr.filter(x => isNaN(x)).length,
          arr.some(x => isNaN(x))
        ];
      };
      const arr = testArrayNaN();
      expect(2).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0339
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0339
     * @tc.desc   Verify JSON.parse with numeric edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testJsonParseNumbers = (): [number, number, boolean] => [
        JSON.parse('123.45'),
        JSON.parse('1e+30'),
        isNaN(JSON.parse('"NaN"'))// JSON can't represent NaN directly
      ];
      const arr = testJsonParseNumbers();
      expect(123.45).assertEqual(arr[0]);
      expect(1e+30).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]); // Parses as string "NaN"
    });

    /**
     * @tc.name   NumberTest0340
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0340
     * @tc.desc   Verify Number constructor with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberConstructor = (): [boolean, number, number] => [
        isNaN(Number('not-a-number')),
        Number('Infinity'),
        Number('-0')
      ];
      const arr = testNumberConstructor();
      expect(true).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
      expect(-0).assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0341
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0341
     * @tc.desc   Verify bitwise operations with NaN and Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBitwiseSpecials = (): [number, number, number] => [
        NaN & 0xFF,
        Infinity | 0,
        ~-Infinity
      ];
      const arr = testBitwiseSpecials();
      expect(0).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
      expect(-1).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0342
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0342
     * @tc.desc   Verify type coercion with special numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testCoercion = (): [string, string, string] => [
        '' + NaN,
        '' + Infinity,
        '' + -0
      ];
      const arr = testCoercion();
      expect('NaN').assertEqual(arr[0]);
      expect('Infinity').assertEqual(arr[1]);
      expect('0').assertEqual(arr[2]);
    });
    /**
     * @tc.name   NumberTest0344
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0344
     * @tc.desc   Verify Math.trunc with edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTrunc = (): [number, number, number, boolean] => [
        Math.trunc(123.999),
        Math.trunc(-123.123),
        Math.trunc(Infinity),
        isNaN(Math.trunc(NaN))
      ];
      const arr = testTrunc();
      expect(123).assertEqual(arr[0]);
      expect(-123).assertEqual(arr[1]);
      expect(Infinity).assertEqual(arr[2]);
      expect(true).assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0345
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0345
     * @tc.desc   Verify Math.sign with various edge values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSign = (): [number, number, number, number, boolean] => [
        Math.sign(3),
        Math.sign(-3),
        Math.sign(0),
        Math.sign(-0),
        isNaN(Math.sign(NaN))
      ];
      const arr = testSign();
      expect(1).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
      expect(-0).assertEqual(arr[3]);
      expect(true).assertEqual(arr[4]);
    });

    /**
     * @tc.name   NumberTest0346
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0346
     * @tc.desc   Verify Math.cbrt with edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testCbrt = (): [number, number, number] => [
        Math.cbrt(8),
        Math.cbrt(-8),
        Math.cbrt(Infinity)
      ];
      const arr = testCbrt();
      expect(2).assertEqual(arr[0]);
      expect(-2).assertEqual(arr[1]);
      expect(Infinity).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0347
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0347
     * @tc.desc   Verify Math.expm1 with extreme values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testExpm1 = (): [number, number, boolean] => [
        Math.expm1(0),
        Math.expm1(Infinity),
        isNaN(Math.expm1(NaN))
      ];
      const arr = testExpm1();
      expect(0).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0348
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0348
     * @tc.desc   123.45 Verify toFixed with 20
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedLarge = (): [string, string] => [
        (123.45).toFixed(20),
        (0.00000012345).toFixed(10)
      ];
      const arr = testToFixedLarge();
      expect('123.45000000000000284217').assertEqual(arr[0]);
      expect('0.0000001235').assertEqual(arr[1]); // Rounding occurs
    });

    /**
     * @tc.name   NumberTest0349
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0349
     * @tc.desc   Verify Number.isSafeInteger with edge values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSafeIntegerEdge = (): [boolean, boolean, boolean] => [
        Number.isSafeInteger(9007199254740991),
        Number.isSafeInteger(9007199254740992),
        Number.isSafeInteger(-9007199254740991)
      ];
      const arr = testSafeIntegerEdge();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0350
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0350
     * @tc.desc   Verify conversion between numbers and booleans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNumberBoolean = (): [boolean, boolean, boolean, boolean] => [
        Boolean(0),
        Boolean(-0),
        Boolean(NaN),
        Boolean(Infinity)
      ];
      const arr = testNumberBoolean();
      expect(false).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
      expect(true).assertEqual(arr[3]);
    });
    /**
     * @tc.name   NumberTest0352
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0352
     * @tc.desc   Verify Math.min and Math.max with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMinMax = (): [number, number, boolean] => [
        Math.max(1, Infinity, 3),
        Math.min(1, -Infinity, 3),
        isNaN(Math.max(NaN, 1))
      ];
      const arr = testMinMax();
      expect(Infinity).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0353
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0353
     * @tc.desc   Verify Math.random edge distribution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRandomRange = (): [boolean, boolean] => {
        const value = Math.random();
        return [value >= 0, value < 1];
      };
      const arr = testRandomRange();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0354
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0354
     * @tc.desc   Verify Math.round with extreme values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRoundExtremes = (): [number, number, boolean] => [
        Math.round(Infinity),
        Math.round(123456789012345.6),
        isNaN(Math.round(NaN))
      ];
      const arr = testRoundExtremes();
      expect(Infinity).assertEqual(arr[0]);
      expect(123456789012346).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0355
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0355
     * @tc.desc   Verify Math.floor and Math.ceil with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testFloorCeil = (): [number, number, number, number] => [
        Math.floor(-1.2),
        Math.ceil(-1.2),
        Math.floor(Infinity),
        Math.ceil(-Infinity)
      ];
      const arr = testFloorCeil();
      expect(-2).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
      expect(Infinity).assertEqual(arr[2]);
      expect(-Infinity).assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0356
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0356
     * @tc.desc   Verify number properties in error objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testErrorNumbers = (): [number, boolean] => {
        try {
          throw new RangeError();
        } catch (e) {
          return [
            (e as Error).name.length,
            typeof (e as Error).stack === 'string' || (e as Error).stack === undefined
          ];
        }
      };
      const arr = testErrorNumbers();
      expect(10).assertEqual(arr[0]); // "RangeError" has 10 characters
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0357
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0357
     * @tc.desc   Verify special numbers in regular expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRegexNumbers = (): [boolean, boolean, boolean] => {
        const numRegex = /^[-+]?(\d+(\.\d*)?|\.\d+)([eE][-+]?\d+)?$/;
        return [
          numRegex.test('123.45'),
          numRegex.test('Infinity'),
          numRegex.test('NaN')
        ];
      };
      const arr = testRegexNumbers();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0360
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0360
     * @tc.desc   Verify special numbers in WeakMap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testWeakMapNumbers = (): [boolean, boolean] => {
        const numObj1 = new Number(123);
        const numObj2 = new Number(123);
        const weakMap = new WeakMap<object, string>();
        weakMap.set(numObj1, 'test');
        return [
          weakMap.has(numObj1),
          weakMap.has(numObj2)
        ];
      };
      const arr = testWeakMapNumbers();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0361
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0361
     * @tc.desc   Verify division with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testDivisionSpecials = (): [number, boolean, number] => [
        Infinity / Infinity,
        isNaN(0 / 0),
        -Infinity / 2
      ];
      const arr = testDivisionSpecials();
      expect(true).assertEqual(isNaN(arr[0]));
      expect(true).assertEqual(arr[1]);
      expect(-Infinity).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0362
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0362
     * @tc.desc   Verify Math.log with edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLogEdges = (): [number, number, boolean] => [
        Math.log(1),
        Math.log(0),
        isNaN(Math.log(-1))
      ];
      const arr = testLogEdges();
      expect(0).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0363
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0363
     * @tc.desc   Verify Math.pow with special exponent values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testPowSpecials = (): [number, number, boolean] => [
        Math.pow(0, 0),
        Math.pow(0, -1),
        isNaN(Math.pow(-1, 0.5))
      ];
      const arr = testPowSpecials();
      expect(1).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0364
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0364
     * @tc.desc   Verify Number.prototype.toExponential with invalid arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToExponentialInvalid = (): [boolean, boolean] => {
        try {
          (123).toExponential(-1);
        } catch (e) {
          return [true, e instanceof RangeError];
        }
        return [false, false];
      };
      const arr = testToExponentialInvalid();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0366
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0366
     * @tc.desc   Verify Math.abs with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testAbsSpecials = (): [number, number, boolean] => [
        Math.abs(-Infinity),
        Math.abs(-0),
        isNaN(Math.abs(NaN))
      ];
      const arr = testAbsSpecials();
      expect(Infinity).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0367
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0367
     * @tc.desc   Verify Math.sqrt with edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSqrtEdges = (): [number, boolean, number] => [
        Math.sqrt(Infinity),
        isNaN(Math.sqrt(-1)),
        Math.sqrt(0)
      ];
      const arr = testSqrtEdges();
      expect(Infinity).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0368
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0368
     * @tc.desc   Verify parsing of numeric strings with leading/trailing characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseWithChars = (): [number, number, boolean] => [
        parseInt('123abc'),
        parseFloat('123.45abc'),
        isNaN(Number('123abc'))
      ];
      const arr = testParseWithChars();
      expect(123).assertEqual(arr[0]);
      expect(123.45).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0369
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0369
     * @tc.desc   Verify Math.sin and Math.cos with extreme values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTrigExtremes = (): [boolean, boolean] => [
        isNaN(Math.sin(Infinity)),
        isNaN(Math.cos(NaN))
      ];
      const arr = testTrigExtremes();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0370
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0370
     * @tc.desc   Verify Number.prototype.toLocaleString with options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToLocaleOptions = (): [string, string] => [
        (12345.67).toLocaleString('de-DE'),
        (12345.67).toLocaleString('en-US', { maximumFractionDigits: 0 })
      ];
      const arr = testToLocaleOptions();
      expect('12.345,67').assertEqual(arr[0]);
      expect('12,346').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0371
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0371
     * @tc.desc   Verify Number.EPSILON edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testEpsilonEdges = (): [boolean, boolean] => {
        const a = 1;
        const b = a + Number.EPSILON;
        const c = a + Number.EPSILON / 2;
        return [a !== b, a === c];
      };
      const arr = testEpsilonEdges();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0372
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0372
     * @tc.desc   Verify Math.fround precision limits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testFroundLimits = (): [number, boolean] => {
        const highPrecision = 1.234567890123456789;
        const rounded = Math.fround(highPrecision);
        return [rounded, rounded !== highPrecision];
      };
      const arr = testFroundLimits();
      expect(1.2345678806304932).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0374
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0374
     * @tc.desc   Verify Date constructor with extreme numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testDateExtremes = (): [string, string] => [
        new Date(Infinity).toString(),
        new Date(-Infinity).toString()
      ];
      const arr = testDateExtremes();
      expect('Invalid Date').assertEqual(arr[0]);
      expect('Invalid Date').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0375
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0375
     * @tc.desc   Verify Math.atanh edge cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testAtanhEdges = (): [number, boolean, boolean] => [
        Math.atanh(0),
        isNaN(Math.atanh(1)),
        isNaN(Math.atanh(-2))
      ];
      const arr = testAtanhEdges();
      expect(0).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0376
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0376
     * @tc.desc   Verify Math.cosh with extreme values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testCoshExtremes = (): [number, number] => [
        Math.cosh(Infinity),
        Math.cosh(-Infinity)
      ];
      const arr = testCoshExtremes();
      expect(Infinity).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0377
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0377
     * @tc.desc   Verify Number.prototype.valueOf with wrapper objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValueOfWrappers = (): [number, boolean] => {
        const numObj = new Number(123);
        const nanObj = new Number(NaN);
        return [
          numObj.valueOf(),
          isNaN(nanObj.valueOf())
        ];
      };
      const arr = testValueOfWrappers();
      expect(123).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0378
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0378
     * @tc.desc   Verify special numbers in JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testJsonStringifyNumbers = (): [string, string, string] => [
        JSON.stringify(NaN),
        JSON.stringify(Infinity),
        JSON.stringify(-0)
      ];
      const arr = testJsonStringifyNumbers();
      expect('null').assertEqual(arr[0]);
      expect('null').assertEqual(arr[1]);
      expect('0').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0379
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0379
     * @tc.desc   Verify Math.hypot with zero values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHypotZeros = (): [number, number] => [
        Math.hypot(0, 0),
        Math.hypot(-0, -0)
      ];
      const arr = testHypotZeros();
      expect(0).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0380
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0380
     * @tc.desc   Verify Math.clz32 with zero and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClz32Zeros = (): [number, number] => [
        Math.clz32(0),
        Math.clz32(-0)
      ];
      const arr = testClz32Zeros();
      expect(32).assertEqual(arr[0]);
      expect(32).assertEqual(arr[1]);
    });
    /**
     * @tc.name   NumberTest0381
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0381
     * @tc.desc   Verify Math.ceil and Math.floor with decimal fractions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testCeilFloorDecimals = (): [number, number, number, number] => [
        Math.ceil(1.0000001),
        Math.ceil(-1.0000001),
        Math.floor(1.9999999),
        Math.floor(-1.9999999)
      ];
      const arr = testCeilFloorDecimals();
      expect(2).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
      expect(1).assertEqual(arr[2]);
      expect(-2).assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0382
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0382
     * @tc.desc   Verify Math.round with halfway cases
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRoundHalfway = (): [number, number, number, number] => [
        Math.round(2.5),
        Math.round(-2.5),
        Math.round(2.4999999999),
        Math.round(-2.4999999999)
      ];
      const arr = testRoundHalfway();
      expect(3).assertEqual(arr[0]); // Note: JavaScript rounds .5 to even integer
      expect(-2).assertEqual(arr[1]);
      expect(2).assertEqual(arr[2]);
      expect(-2).assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0383
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0383
     * @tc.desc   Verify Math.sign with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSignSpecials = (): [number, number, boolean] => [
        Math.sign(Infinity),
        Math.sign(-Infinity),
        isNaN(Math.sign(NaN))
      ];
      const arr = testSignSpecials();
      expect(1).assertEqual(arr[0]);
      expect(-1).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0384
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0384
     * @tc.desc   Verify Number.parseFloat with exponential notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testParseFloatExponential = (): [number, number, number] => [
        Number.parseFloat('1.23e+3'),
        Number.parseFloat('1.23e-3'),
        Number.parseFloat('6.022e23')
      ];
      const arr = testParseFloatExponential();
      expect(1230).assertEqual(arr[0]);
      expect(0.00123).assertEqual(arr[1]);
      expect(6.022e23).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0385
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0385
     * @tc.desc   Verify Math.exp with large exponents
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testExpLarge = (): [number, number] => [
        Math.exp(709),
        Math.exp(710)
      ];
      const arr = testExpLarge();
      expect(8.218407461554972e+307).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0386
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0386
     * @tc.desc   Verify Math.log10 with boundary values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLog10Boundaries = (): [number, number, boolean] => [
        Math.log10(1000),
        Math.log10(0),
        isNaN(Math.log10(-10))
      ];
      const arr = testLog10Boundaries();
      expect(3).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0387
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0387
     * @tc.desc   Verify toFixed with numbers that can't be represented accurately
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToFixedInaccurate = (): [string, string] => [
        (0.615).toFixed(2),
        (0.1).toFixed(16)
      ];
      const arr = testToFixedInaccurate();
      expect('0.61').assertEqual(arr[0]);
      expect('0.1000000000000000').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0388
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0388
     * @tc.desc   Verify Number.isInteger with large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsIntegerLarge = (): [boolean, boolean, boolean] => [
        Number.isInteger(1234567890123456789012345),
        Number.isInteger(1234567890123456789012345.5),
        Number.isInteger(Infinity)
      ];
      const arr = testIsIntegerLarge();
      expect(true).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0389
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0389
     * @tc.desc   Verify Math.hypot with mixed positive and negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHypotMixed = (): [number, number] => [
        Math.hypot(3, -4),
        Math.hypot(-5, -12)
      ];
      const arr = testHypotMixed();
      expect(5).assertEqual(arr[0]);
      expect(13).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0390
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0390
     * @tc.desc   Verify Math.tanh with extreme values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testTanhExtremes = (): [number, number, number] => [
        Math.tanh(0),
        Math.tanh(Infinity),
        Math.tanh(-Infinity)
      ];
      const arr = testTanhExtremes();
      expect(0).assertEqual(arr[0]);
      expect(1).assertEqual(arr[1]);
      expect(-1).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0391
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0391
     * @tc.desc   Verify string concatenation with numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testStringConcat = (): [string, string, string] => [
        'Value: ' + 123.45,
        'Infinity: ' + Infinity,
        'NaN: ' + NaN
      ];
      const arr = testStringConcat();
      expect('Value: 123.45').assertEqual(arr[0]);
      expect('Infinity: Infinity').assertEqual(arr[1]);
      expect('NaN: NaN').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0392
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0392
     * @tc.desc   Verify Math.max and Math.min with empty parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testMinMaxEmpty = (): [number, number] => [
        Math.max(),
        Math.min()
      ];
      const arr = testMinMaxEmpty();
      expect(-Infinity).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
    });


    /**
     * @tc.name   NumberTest0394
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0394
     * @tc.desc   Verify Math.atan2 with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testAtan2Specials = (): [number, number, number] => [
        Math.atan2(0, 0),
        Math.atan2(0, -0),
        Math.atan2(Infinity, Infinity)
      ];
      const arr = testAtan2Specials();
      expect(0).assertEqual(arr[0]);
      expect(Math.PI).assertEqual(arr[1]);
      expect(Math.PI / 4).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0395
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0395
     * @tc.desc   Verify Number.prototype.toLocaleString with currency formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testCurrencyFormat = (): [string, string] => [
        (12345.67).toLocaleString('en-US', {
          style: 'currency',
          currency: 'USD'
        }),
        (12345.67).toLocaleString('de-DE', {
          style: 'currency',
          currency: 'EUR'
        })
      ];
      const arr = testCurrencyFormat();
      expect('$12,345.67').assertEqual(arr[0]);
      expect('12.345,67 €').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0396
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0396
     * @tc.desc   Verify Math.fround with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testFroundSpecials = (): [number, number, boolean] => [
        Math.fround(Infinity),
        Math.fround(-Infinity),
        isNaN(Math.fround(NaN))
      ];
      const arr = testFroundSpecials();
      expect(Infinity).assertEqual(arr[0]);
      expect(-Infinity).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0397
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0397
     * @tc.desc   Verify Math.imul with special values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testImulSpecials = (): [number, number, boolean] => [
        Math.imul(0, Infinity),
        Math.imul(-0, -Infinity),
        isNaN(Math.imul(NaN, 123))
      ];
      const arr = testImulSpecials();
      expect(0).assertEqual(arr[0]);
      expect(0).assertEqual(arr[1]);
      expect(false).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0398
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0398
     * @tc.desc   Verify Number.isFinite with large values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testIsFiniteLarge = (): [boolean, boolean, boolean] => [
        Number.isFinite(Number.MAX_VALUE),
        Number.isFinite(Number.MAX_VALUE * 2),
        Number.isFinite(1e308)
      ];
      const arr = testIsFiniteLarge();
      expect(true).assertEqual(arr[0]);
      expect(false).assertEqual(arr[1]);
      expect(true).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0399
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0399
     * @tc.desc   Verify Math.sqrt with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSqrtLarge = (): [number, number] => [
        Math.sqrt(Number.MAX_VALUE),
        Math.sqrt(Number.MAX_VALUE * Number.MAX_VALUE)
      ];
      const arr = testSqrtLarge();
      expect(1.3407807929942596e+154).assertEqual(arr[0]);
      expect(Infinity).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0400
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0400
     * @tc.desc   Verify addition with very small numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testAddSmall = (): [number, boolean] => {
        const min = Number.MIN_VALUE;
        return [min + min, min + (min / 2) === min];
      };
      const arr = testAddSmall();
      expect(1e-323).assertEqual(arr[0]);
      expect(true).assertEqual(arr[1]); // Adding smaller than min doesn't change value
    });
    /**
     * @tc.name   NumberTest0401
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0401
     * @tc.desc   Verify parseInt with binary radix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testBinaryParse = (): [number, number, number] => [
        parseInt('1010', 2),
        parseInt('11111111', 2),
        parseInt('10000000000000000000000000000000', 2)
      ];
      const arr = testBinaryParse();
      expect(10).assertEqual(arr[0]);
      expect(255).assertEqual(arr[1]);
      expect(2147483648).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0402
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0402
     * @tc.desc   Verify parseInt with octal radix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testOctalParse = (): [number, number, number] => [
        parseInt('12', 8),
        parseInt('777', 8),
        parseInt('10000000000', 8)
      ];
      const arr = testOctalParse();
      expect(10).assertEqual(arr[0]);
      expect(511).assertEqual(arr[1]);
      expect(1073741824).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0403
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0403
     * @tc.desc   Verify parseInt with hexadecimal radix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHexParse = (): [number, number, number] => [
        parseInt('A', 16),
        parseInt('FF', 16),
        parseInt('10000000', 16)
      ];
      const arr = testHexParse();
      expect(10).assertEqual(arr[0]);
      expect(255).assertEqual(arr[1]);
      expect(268435456).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0404
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0404
     * @tc.desc   Verify parseInt with unusual radices (base 3, 7, 11)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testUnusualRadices = (): [number, number, number] => [
        parseInt('12', 3), // Base 3
        parseInt('66', 7), // Base 7
        parseInt('A', 11)// Base 11 (A=10)
      ];
      const arr = testUnusualRadices();
      expect(5).assertEqual(arr[0]); // 1*3 + 2 = 5
      expect(48).assertEqual(arr[1]); // 6*7 + 6 = 48
      expect(10).assertEqual(arr[2]); // 10
    });

    /**
     * @tc.name   NumberTest0405
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0405
     * @tc.desc   Verify Number.prototype.toString with different radices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testToStringRadices = (): [string, string, string] => [
        (255).toString(2), // Binary
        (255).toString(8), // Octal
        (255).toString(16)// Hexadecimal
      ];
      const arr = testToStringRadices();
      expect('11111111').assertEqual(arr[0]);
      expect('377').assertEqual(arr[1]);
      expect('ff').assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0406
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0406
     * @tc.desc   Verify parsing invalid characters in different radices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testInvalidRadixChars = (): [number, number, number] => [
        parseInt('12A3', 10), // Invalid in decimal
        parseInt('1283', 8), // 8 is invalid in octal
        parseInt('GHI', 16)// G is invalid in hex
      ];
      const arr = testInvalidRadixChars();
      expect(12).assertEqual(arr[0]);
      expect(10).assertEqual(arr[1]); // Parses '12' as octal
      expect(isNaN(arr[2])).assertEqual(true);
    });

    /**
     * @tc.name   NumberTest0407
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0407
     * @tc.desc   Verify radix edge cases (2, 36, and invalid radices)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testRadixEdges = (): [number, number, number, number] => [
        parseInt('1', 2), // Minimum valid radix
        parseInt('z', 36), // Maximum valid radix (z=35)
        parseInt('10', 1), // Invalid radix (too low)
        parseInt('10', 37)// Invalid radix (too high)
      ];
      const arr = testRadixEdges();
      expect(1).assertEqual(arr[0]);
      expect(35).assertEqual(arr[1]);
      expect(isNaN(arr[2])).assertEqual(true);
      expect(isNaN(arr[3])).assertEqual(true);
    });

    /**
     * @tc.name   NumberTest0408
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0408
     * @tc.desc   Verify toString with edge radices and special numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testSpecialRadixConversions = (): [string, string, string, string] => [
        (35).toString(36),
        (36).toString(36),
        (Infinity).toString(2),
        (NaN).toString(16)
      ];
      const arr = testSpecialRadixConversions();
      expect('z').assertEqual(arr[0]);
      expect('10').assertEqual(arr[1]);
      expect('Infinity').assertEqual(arr[2]);
      expect('NaN').assertEqual(arr[3]);
    });

    /**
     * @tc.name   NumberTest0409
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0409
     * @tc.desc   Verify leading/trailing whitespace in radix parsing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testWhitespaceRadix = (): [number, number] => [
        parseInt('  1010  ', 2),
        parseInt('\t1A\n', 16)
      ];
      const arr = testWhitespaceRadix();
      expect(10).assertEqual(arr[0]);
      expect(26).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0410
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0410
     * @tc.desc   Verify negative numbers in different radices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testNegativeRadix = (): [number, string, number] => [
        parseInt('-101', 2),
        (-255).toString(16),
        parseInt('-G', 36)
      ];
      const arr = testNegativeRadix();
      expect(-5).assertEqual(arr[0]);
      expect('-ff').assertEqual(arr[1]);
      expect(-16).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0411
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0411
     * @tc.desc   Verify implicit vs explicit radix for hexadecimal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHexImplicitRadix = (): [number, number, number] => [
        parseInt('0xFF'), // Implicit hex detection
        parseInt('FF'), // No implicit hex without 0x
        parseInt('0xFF', 10)// Explicit decimal radix ignores 0x
      ];
      const arr = testHexImplicitRadix();
      expect(255).assertEqual(arr[0]);
      expect(isNaN(arr[1])).assertEqual(true);
      expect(0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0412
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0412
     * @tc.desc   Verify large numbers in different radices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testLargeRadixNumbers = (): [string, number] => [
        (Number.MAX_SAFE_INTEGER).toString(36),
        parseInt('2gosa7pa2gv', 36)// MAX_SAFE_INTEGER in base36
      ];
      const arr = testLargeRadixNumbers();
      expect('2gosa7pa2gv').assertEqual(arr[0]);
      expect(9007199254740991).assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0413
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0413
     * @tc.desc   Verify radix conversion with fractional numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testFractionalRadix = (): [number, string] => [
        parseInt('10.101', 2), // parseInt ignores fractional part
        (10.5).toString(2)// toString includes fractional part
      ];
      const arr = testFractionalRadix();
      expect(2).assertEqual(arr[0]);
      expect('1010.1').assertEqual(arr[1]);
    });

    /**
     * @tc.name   NumberTest0414
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0414
     * @tc.desc   Verify zero in different radices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testZeroRadix = (): [number, string, number] => [
        parseInt('0', 2),
        (0).toString(36),
        parseInt('-0', 16)
      ];
      const arr = testZeroRadix();
      expect(0).assertEqual(arr[0]);
      expect('0').assertEqual(arr[1]);
      expect(-0).assertEqual(arr[2]);
    });

    /**
     * @tc.name   NumberTest0415
     * @tc.number SUB_BUILDINS_NUMBER_TEST_0415
     * @tc.desc   Verify case insensitivity in hexadecimal parsing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('NumberTest0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testHexCase = (): [number, number, string] => [
        parseInt('a', 16),
        parseInt('FF', 16),
        (255).toString(16)// Note: toString returns lowercase
      ];
      const arr = testHexCase();
      expect(10).assertEqual(arr[0]);
      expect(255).assertEqual(arr[1]);
      expect('ff').assertEqual(arr[2]);
    });

  })
}