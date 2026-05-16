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

export default function builtinsStringBuilderTestAppend() {
  describe('BuiltinsStringBuilderTestAppend', () => {
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
     * @tc.name    builtinsStringBuilderTestAppend0001
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0001
     * @tc.desc    Test StringBuilder append(float) with normal float values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0.0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0002
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0002
     * @tc.desc    Test StringBuilder append(float) with negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-0.0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0003
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0003
     * @tc.desc    Test StringBuilder append(float) with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(NaN);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0004
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0004
     * @tc.desc    Test StringBuilder append(float) with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Infinity);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0005
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0005
     * @tc.desc    Test StringBuilder append(float) with -Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-Infinity);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-Infinity');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0006
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0006
     * @tc.desc    Test StringBuilder append(float) with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Number.MAX_VALUE);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(Number.MAX_VALUE.toString());
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0007
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0007
     * @tc.desc    Test StringBuilder append(float) with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Number.MIN_VALUE);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(Number.MIN_VALUE.toString());
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0008
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0008
     * @tc.desc    Test StringBuilder append(float) with Number.EPSILON
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(Number.EPSILON);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(Number.EPSILON.toString());
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0009
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0009
     * @tc.desc    Test StringBuilder append(float) with integer boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-2147483648.0)
        .append(2147483647.0)
        .append(-32768.0)
        .append(32767.0)
        .append(-128.0)
        .append(127.0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-21474836482147483647-3276832767-128127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0010
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0010
     * @tc.desc    Test StringBuilder append(float) with precision handling
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(3.141592653589793)
        .append(2.718281828459045)
        .append(1.4142135623730951);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('3.1415926535897932.7182818284590451.4142135623730951');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0011
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0011
     * @tc.desc    Test StringBuilder append(float) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
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
     * @tc.name    builtinsStringBuilderTestAppend0012
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0012
     * @tc.desc    Test StringBuilder append(float) mixed with string appends
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Value: ");
      const resultBuilder: StringBuilder = builder.append(123.456);
      builder.append(" units");
      const result: string = builder.toString();
      expect(result).assertEqual('Value: 123.456 units');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0013
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0013
     * @tc.desc    Test StringBuilder append(float) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(999.999);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('999.999');
      expect(builder.toString()).assertEqual('999.999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0014
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0014
     * @tc.desc    Test StringBuilder append(int) with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0015
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0015
     * @tc.desc    Test StringBuilder append(int) with positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(123456);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('123456');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0016
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0016
     * @tc.desc    Test StringBuilder append(int) with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-987654);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-987654');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0017
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0017
     * @tc.desc    Test StringBuilder append(int) with int max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(2147483647);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('2147483647');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0018
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0018
     * @tc.desc    Test StringBuilder append(int) with int min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-2147483648);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-2147483648');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0019
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0019
     * @tc.desc    Test StringBuilder append(int) with short max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(32767);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0020
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0020
     * @tc.desc    Test StringBuilder append(int) with short min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-32768);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-32768');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0021
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0021
     * @tc.desc    Test StringBuilder append(int) with byte max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(127);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0022
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0022
     * @tc.desc    Test StringBuilder append(int) with byte min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-128);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0023
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0023
     * @tc.desc    Test StringBuilder append(int) with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1)
        .append(0)
        .append(1)
        .append(2147483647)
        .append(-2147483648);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-1012147483647-2147483648');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0024
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0024
     * @tc.desc    Test StringBuilder append(int) with hex value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0xCAFEBABE);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('3405691582');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0025
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0025
     * @tc.desc    Test StringBuilder append(int) with octal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0o377);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0026
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0026
     * @tc.desc    Test StringBuilder append(int) with binary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0b11111111);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0027
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0027
     * @tc.desc    Test StringBuilder append(int) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1)
        .append(2)
        .append(3)
        .append(4)
        .append(5);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0028
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0028
     * @tc.desc    Test StringBuilder append(int) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Value: ");
      const resultBuilder: StringBuilder = builder.append(100);
      builder.append(" points");
      const result: string = builder.toString();
      expect(result).assertEqual('Value: 100 points');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0029
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0029
     * @tc.desc    Test StringBuilder append(int) with large values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(990000000)
        .append(2000000000)
        .append(-990000000)
        .append(-2000000000);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('9900000002000000000-990000000-2000000000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0030
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0030
     * @tc.desc    Test StringBuilder append(int) with middle range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(50000)
        .append(-50000)
        .append(99000)
        .append(-99000)
        .append(999999)
        .append(-999999);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('50000-5000099000-99000999999-999999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0031
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0031
     * @tc.desc    Test StringBuilder append(int) with negative chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10)
        .append(-20)
        .append(-30)
        .append(-40)
        .append(-50);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0032
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0032
     * @tc.desc    Test StringBuilder append(int) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(999999);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('999999');
      expect(builder.toString()).assertEqual('999999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0033
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0033
     * @tc.desc    Test StringBuilder append(int) with unit test values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(42)
        .append(0)
        .append(-42)
        .append(255)
        .append(-255);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('420-42255-255');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0034
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0034
     * @tc.desc    Test StringBuilder append(short) with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0035
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0035
     * @tc.desc    Test StringBuilder append(short) with positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(12345 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0036
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0036
     * @tc.desc    Test StringBuilder append(short) with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-9876 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-9876');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0037
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0037
     * @tc.desc    Test StringBuilder append(short) with short max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(32767 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0038
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0038
     * @tc.desc    Test StringBuilder append(short) with short min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-32768 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-32768');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0039
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0039
     * @tc.desc    Test StringBuilder append(short) with byte max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(127 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0040
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0040
     * @tc.desc    Test StringBuilder append(short) with byte min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-128 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0041
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0041
     * @tc.desc    Test StringBuilder append(short) with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1 as short)
        .append(0 as short)
        .append(1 as short)
        .append(32767 as short)
        .append(-32768 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10132767-32768');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0042
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0042
     * @tc.desc    Test StringBuilder append(short) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1 as short)
        .append(2 as short)
        .append(3 as short)
        .append(4 as short)
        .append(5 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0043
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0043
     * @tc.desc    Test StringBuilder append(short) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Score: ");
      const resultBuilder: StringBuilder = builder.append(100 as short);
      builder.append(" points");
      const result: string = builder.toString();
      expect(result).assertEqual('Score: 100 points');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0044
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0044
     * @tc.desc    Test StringBuilder append(short) with middle range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(500 as short)
        .append(-500 as short)
        .append(1000 as short)
        .append(-1000 as short)
        .append(9999 as short)
        .append(-9999 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('500-5001000-10009999-9999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0045
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0045
     * @tc.desc    Test StringBuilder append(short) with negative chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10 as short)
        .append(-20 as short)
        .append(-30 as short)
        .append(-40 as short)
        .append(-50 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0046
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0046
     * @tc.desc    Test StringBuilder append(short) with unit test values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(42 as short)
        .append(0 as short)
        .append(-42 as short)
        .append(255 as short)
        .append(-255 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('420-42255-255');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0047
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0047
     * @tc.desc    Test StringBuilder append(short) with hex value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0x7FFF as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('32767');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0048
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0048
     * @tc.desc    Test StringBuilder append(short) with octal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0o377 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0049
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0049
     * @tc.desc    Test StringBuilder append(short) with binary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0b11111111 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('255');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0050
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0050
     * @tc.desc    Test StringBuilder append(short) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(9999 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('9999');
      expect(builder.toString()).assertEqual('9999');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0051
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0051
     * @tc.desc    Test StringBuilder append(short) with positive range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1000 as short)
        .append(2000 as short)
        .append(3000 as short)
        .append(4000 as short)
        .append(5000 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('10002000300040005000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0052
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0052
     * @tc.desc    Test StringBuilder append(short) with negative range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1000 as short)
        .append(-2000 as short)
        .append(-3000 as short)
        .append(-4000 as short)
        .append(-5000 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-1000-2000-3000-4000-5000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0053
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0053
     * @tc.desc    Test StringBuilder append(short) with mixed positive and negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(10 as short)
        .append(-20 as short)
        .append(30 as short)
        .append(-40 as short)
        .append(50 as short);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('10-2030-4050');
    });
    /**
     * @tc.name    builtinsStringBuilderTestAppend0054
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0054
     * @tc.desc    Test StringBuilder append(char) with zero char
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0000');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0000');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0055
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0055
     * @tc.desc    Test StringBuilder append(char) with ASCII characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('A')
        .append('B')
        .append('C')
        .append('1')
        .append('2')
        .append('3');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ABC123');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0056
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0056
     * @tc.desc    Test StringBuilder append(char) with special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('!')
        .append('@')
        .append('#')
        .append('$')
        .append('%');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('!@#$%');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0057
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0057
     * @tc.desc    Test StringBuilder append(char) with escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\n')
        .append('\t')
        .append('\r')
        .append('\\')
        .append('\'')
        .append('\"');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\n\t\r\\\'\"');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0058
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0058
     * @tc.desc    Test StringBuilder append(char) with char max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\uFFFF');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\uFFFF');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0059
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0059
     * @tc.desc    Test StringBuilder append(char) with middle range characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0080')
        .append('\u00FF')
        .append('\u0100')
        .append('\u07FF')
        .append('\u0800')
        .append('\u0FFF');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0080\u00FF\u0100\u07FF\u0800\u0FFF');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0060
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0060
     * @tc.desc    Test StringBuilder append(char) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('H')
        .append('e')
        .append('l')
        .append('l')
        .append('o');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Hello');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0061
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0061
     * @tc.desc    Test StringBuilder append(char) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Prefix: ");
      const resultBuilder: StringBuilder = builder.append('X');
      builder.append(" Suffix");
      const result: string = builder.toString();
      expect(result).assertEqual('Prefix: X Suffix');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0062
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0062
     * @tc.desc    Test StringBuilder append(char) with emoji characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('😊')
        .append('🌟')
        .append('🎉')
        .append('🚀')
        .append('💡');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('😊🌟🎉🚀💡');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0063
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0063
     * @tc.desc    Test StringBuilder append(char) with space characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(' ')
        .append('\t')
        .append('\n')
        .append('\r')
        .append('\f');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual(' \t\n\r\f');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0064
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0064
     * @tc.desc    Test StringBuilder append(char) with digit characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('0')
        .append('1')
        .append('2')
        .append('3')
        .append('4')
        .append('5')
        .append('6')
        .append('7')
        .append('8')
        .append('9');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0123456789');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0065
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0065
     * @tc.desc    Test StringBuilder append(char) with letter characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('a')
        .append('b')
        .append('c')
        .append('d')
        .append('e')
        .append('f')
        .append('g')
        .append('h')
        .append('i')
        .append('j');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('abcdefghij');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0066
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0066
     * @tc.desc    Test StringBuilder append(char) with Unicode escape sequences
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0041')
        .append('\u0042')
        .append('\u0043')
        .append('\u0394')
        .append('\u03A9');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ABCΔΩ');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0067
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0067
     * @tc.desc    Test StringBuilder append(char) with hex escape characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\x41')
        .append('\x42')
        .append('\x43')
        .append('\x61')
        .append('\x62')
        .append('\x63');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ABCabc');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0068
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0068
     * @tc.desc    Test StringBuilder append(char) with boundary characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0000')
        .append('\u0020')
        .append('\u007F')
        .append('\u0080')
        .append('\u00FF')
        .append('\u0100')
        .append('\uFFFF');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0000\u0020\u007F\u0080\u00FF\u0100\uFFFF');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0069
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0069
     * @tc.desc    Test StringBuilder append(char) with symbol characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('+')
        .append('-')
        .append('*')
        .append('/')
        .append('=')
        .append('<')
        .append('>')
        .append('[')
        .append(']')
        .append('{')
        .append('}');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('+-*/=<>[]{}');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0070
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0070
     * @tc.desc    Test StringBuilder append(char) with control characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('\u0001')
        .append('\u0002')
        .append('\u0003')
        .append('\u0004')
        .append('\u0005');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('\u0001\u0002\u0003\u0004\u0005');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0071
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0071
     * @tc.desc    Test StringBuilder append(char) with Arabic characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('ا')
        .append('ب')
        .append('ت')
        .append('ث')
        .append('ج');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('ابتثج');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0072
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0072
     * @tc.desc    Test StringBuilder append(char) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('Z');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Z');
      expect(builder.toString()).assertEqual('Z');
    });
    /**
     * @tc.name    builtinsStringBuilderTestAppend0073
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0073
     * @tc.desc    Test StringBuilder append(byte) with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0074
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0074
     * @tc.desc    Test StringBuilder append(byte) with positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('100');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0075
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0075
     * @tc.desc    Test StringBuilder append(byte) with negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-50 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-50');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0076
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0076
     * @tc.desc    Test StringBuilder append(byte) with byte max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(127 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0077
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0077
     * @tc.desc    Test StringBuilder append(byte) with byte min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0078
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0078
     * @tc.desc    Test StringBuilder append(byte) with boundary values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-1 as byte)
        .append(0 as byte)
        .append(1 as byte)
        .append(127 as byte)
        .append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-101127-128');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0079
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0079
     * @tc.desc    Test StringBuilder append(byte) with chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(1 as byte)
        .append(2 as byte)
        .append(3 as byte)
        .append(4 as byte)
        .append(5 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('12345');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0080
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0080
     * @tc.desc    Test StringBuilder append(byte) mixed with other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      builder.append("Value: ");
      const resultBuilder: StringBuilder = builder.append(99 as byte);
      builder.append(" units");
      const result: string = builder.toString();
      expect(result).assertEqual('Value: 99 units');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0081
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0081
     * @tc.desc    Test StringBuilder append(byte) with middle range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(50 as byte)
        .append(-50 as byte)
        .append(100 as byte)
        .append(-100 as byte)
        .append(64 as byte)
        .append(-64 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('50-50100-10064-64');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0082
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0082
     * @tc.desc    Test StringBuilder append(byte) with negative chaining calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10 as byte)
        .append(-20 as byte)
        .append(-30 as byte)
        .append(-40 as byte)
        .append(-50 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50');
      expect(resultBuilder === builder).assertTrue();
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0083
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0083
     * @tc.desc    Test StringBuilder append(byte) with unit test values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(42 as byte)
        .append(0 as byte)
        .append(-42 as byte)
        .append(127 as byte)
        .append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('420-42127-128');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0084
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0084
     * @tc.desc    Test StringBuilder append(byte) with hex value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0x7F as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0085
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0085
     * @tc.desc    Test StringBuilder append(byte) with octal value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0o177 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0086
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0086
     * @tc.desc    Test StringBuilder append(byte) with binary value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0b01111111 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('127');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0087
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0087
     * @tc.desc    Test StringBuilder append(byte) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(99 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('99');
      expect(builder.toString()).assertEqual('99');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0088
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0088
     * @tc.desc    Test StringBuilder append(byte) with positive range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(10 as byte)
        .append(20 as byte)
        .append(30 as byte)
        .append(40 as byte)
        .append(50 as byte)
        .append(60 as byte)
        .append(70 as byte)
        .append(80 as byte)
        .append(90 as byte)
        .append(100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('102030405060708090100');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0089
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0089
     * @tc.desc    Test StringBuilder append(byte) with negative range values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-10 as byte)
        .append(-20 as byte)
        .append(-30 as byte)
        .append(-40 as byte)
        .append(-50 as byte)
        .append(-60 as byte)
        .append(-70 as byte)
        .append(-80 as byte)
        .append(-90 as byte)
        .append(-100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-10-20-30-40-50-60-70-80-90-100');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0090
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0090
     * @tc.desc    Test StringBuilder append(byte) with mixed positive and negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(10 as byte)
        .append(-20 as byte)
        .append(30 as byte)
        .append(-40 as byte)
        .append(50 as byte)
        .append(-60 as byte)
        .append(70 as byte)
        .append(-80 as byte)
        .append(90 as byte)
        .append(-100 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('10-2030-4050-6070-8090-100');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0091
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0091
     * @tc.desc    Test StringBuilder append(byte) with ASCII character values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(65 as byte)   // 'A'
        .append(66 as byte)
        .append(67 as byte)
        .append(97 as byte)
        .append(98 as byte)
        .append(99 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('656667979899');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0092
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0092
     * @tc.desc    Test StringBuilder append(byte) with edge case values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(0 as byte)
        .append(1 as byte)
        .append(-1 as byte)
        .append(126 as byte)
        .append(127 as byte)
        .append(-127 as byte)
        .append(-128 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('01-1126127-127-128');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0093
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0093
     * @tc.desc    Test StringBuilder append(byte) with small values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(-5 as byte)
        .append(-4 as byte)
        .append(-3 as byte)
        .append(-2 as byte)
        .append(-1 as byte)
        .append(0 as byte)
        .append(1 as byte)
        .append(2 as byte)
        .append(3 as byte)
        .append(4 as byte)
        .append(5 as byte);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('-5-4-3-2-1012345');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0094
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0094
     * @tc.desc    Test StringBuilder append(boolean) with true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('true');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0095
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0095
     * @tc.desc    Test StringBuilder append(boolean) with false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0096
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0096
     * @tc.desc    Test StringBuilder append(boolean) with mixed true/false values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(false)
        .append(true)
        .append(true)
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truefalsetruetruefalse');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0097
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0097
     * @tc.desc    Test StringBuilder append(boolean) with multiple chained calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(false)
        .append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truefalsetrue');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0098
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0098
     * @tc.desc    Test StringBuilder append(boolean) after appending other types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Result: ")
        .append(true)
        .append(", Status: ")
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Result: true, Status: false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0099
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0099
     * @tc.desc    Test StringBuilder append(boolean) on empty builder
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0100
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0100
     * @tc.desc    Test StringBuilder append(boolean) with repeated true values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(true)
        .append(true)
        .append(true)
        .append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truetruetruetruetrue');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0101
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0101
     * @tc.desc    Test StringBuilder append(boolean) with repeated false values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(false)
        .append(false)
        .append(false)
        .append(false)
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('falsefalsefalsefalsefalse');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0102
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0102
     * @tc.desc    Test StringBuilder append(boolean) with alternating true/false pattern
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true)
        .append(false)
        .append(true)
        .append(false)
        .append(true)
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('truefalsetruefalsetruefalse');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0103
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0103
     * @tc.desc    Test StringBuilder append(boolean) mixed with number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Flag1: ")
        .append(true)
        .append(", Count: ")
        .append(42 as byte)
        .append(", Flag2: ")
        .append(false);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Flag1: true, Count: 42, Flag2: false');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0104
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0104
     * @tc.desc    Test StringBuilder append(boolean) with complex pattern
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append("Start-")
        .append(true)
        .append("-Middle-")
        .append(false)
        .append("-End-")
        .append(true)
        .append("-Finish");
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('Start-true-Middle-false-End-true-Finish');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0105
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0105
     * @tc.desc    Test StringBuilder append(boolean) with single character before/after
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append('T')
        .append(true)
        .append('F')
        .append(false)
        .append('X');
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('TtrueFfalseX');
    });

    /**
     * @tc.name    builtinsStringBuilderTestAppend0106
     * @tc.number  BUILTINS_STRING_BUILDER_TEST_APPEND_0106
     * @tc.desc    Test StringBuilder append(boolean) only (no other content)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsStringBuilderTestAppend0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const builder: StringBuilder = new StringBuilder();
      const resultBuilder: StringBuilder = builder.append(true);
      const result: string = resultBuilder.toString();
      expect(result).assertEqual('true');

      const builder2: StringBuilder = new StringBuilder();
      const resultBuilder2: StringBuilder = builder2.append(false);
      const result2: string = resultBuilder2.toString();
      expect(result2).assertEqual('false');
    });

  })
}