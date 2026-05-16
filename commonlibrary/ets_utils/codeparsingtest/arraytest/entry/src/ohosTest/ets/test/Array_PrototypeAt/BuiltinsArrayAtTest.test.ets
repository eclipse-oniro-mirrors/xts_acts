/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';
import * as ArrayAtTests from './ArrayPrototypeAtMissingTest';

export default function BuiltinsArrayAtTest(): void {
  describe('BuiltinsArrayAtTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async() => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name    BuiltinsArrayAtTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0100
     * @tc.desc    Verify Array.prototype.at() with positive index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0200
     * @tc.desc    Verify Array.prototype.at() with middle positive index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0300
     * @tc.desc    Verify Array.prototype.at() with last positive index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0400
     * @tc.desc    Verify equivalence of at() and bracket notation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0004();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0500
     * @tc.desc    Verify consistency of multiple at() calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0005();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0600
     * @tc.desc    Verify at() with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0006();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0700
     * @tc.desc    Verify Array.prototype.at() with negative index -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0007();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0800
     * @tc.desc    Verify Array.prototype.at() with negative index -2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0008();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0900
     * @tc.desc    Verify Array.prototype.at() with negative index -3
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0009();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1000
     * @tc.desc    Verify Array.prototype.at() with negative index equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0010();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1100
     * @tc.desc    Verify equivalence of negative index and length calculation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0011();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1200
     * @tc.desc    Verify negative index vs traditional method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0012();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1300
     * @tc.desc    Verify at() with two element array and index -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0013();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1400
     * @tc.desc    Verify at() with two element array and index -2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0014();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1500
     * @tc.desc    Verify at() with index equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0015();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1600
     * @tc.desc    Verify at() with index greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0016();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1700
     * @tc.desc    Verify at() with very large positive index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0017();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1800
     * @tc.desc    Verify at() with negative index absolute value greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0018();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_1900
     * @tc.desc    Verify at() with negative index absolute value equals array length plus one
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0019();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2000
     * @tc.desc    Verify at() with very large negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0020();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2100
     * @tc.desc    Verify at() with last valid positive index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0021();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2200
     * @tc.desc    Verify at() with first valid negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0022();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2300
     * @tc.desc    Verify at() with just out of bounds positive index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0023();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2400
     * @tc.desc    Verify at() with just out of bounds negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0024();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2500
     * @tc.desc    Verify at() with positive float parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0025();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2600
     * @tc.desc    Verify at() with negative float parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0026();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2700
     * @tc.desc    Verify at() with floats near integers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0027();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2800
     * @tc.desc    Verify at() with numeric string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0028();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_2900
     * @tc.desc    Verify at() with negative numeric string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0029();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3000
     * @tc.desc    Verify at() with invalid string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0030();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3100
     * @tc.desc    Verify at() with boolean true parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0031();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3200
     * @tc.desc    Verify at() with boolean false parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0032();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3300
     * @tc.desc    Verify at() with object with valueOf parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0033();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3400
     * @tc.desc    Verify at() with plain object parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0034();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3500
     * @tc.desc    Verify at() with null parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0035();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3600
     * @tc.desc    Verify at() with undefined parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0036();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3700
     * @tc.desc    Verify at() with no parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0037();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3800
     * @tc.desc    Verify at() with NaN parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0038();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_3900
     * @tc.desc    Verify at() with expression result is NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0039();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4000
     * @tc.desc    Verify at() with positive Infinity parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0040();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4100
     * @tc.desc    Verify at() with negative Infinity parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0041();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4200
     * @tc.desc    Verify at() with positive zero parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0042();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4300
     * @tc.desc    Verify at() with negative zero parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0043();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4400
     * @tc.desc    Verify at() with parameter beyond safe integer range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0044();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4500
     * @tc.desc    Verify at() with BigInt parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0045();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4600
     * @tc.desc    Verify at() with empty array and index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0046();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4700
     * @tc.desc    Verify at() with empty array and negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0047();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4800
     * @tc.desc    Verify at() with empty array and various indices
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0048();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_4900
     * @tc.desc    Verify at() with sparse array holes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0049();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5000
     * @tc.desc    Verify at() with sparse array end holes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0050();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5100
     * @tc.desc    Verify at() with sparse array valid elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0051();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5200
     * @tc.desc    Verify at() with sparse array created by delete
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0052();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5300
     * @tc.desc    Verify at() after modifying array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0053();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5400
     * @tc.desc    Verify at() with array length 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0054();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5500
     * @tc.desc    Verify at() with simple array-like object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0055();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5600
     * @tc.desc    Verify at() with array-like object and negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0056();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5700
     * @tc.desc    Verify at() with string as array-like
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0057();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5800
     * @tc.desc    Verify at() with string and negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0058();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_5900
     * @tc.desc    Verify at() with arguments object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0059();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6000
     * @tc.desc    Verify at() with arguments object and negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0060();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6100
     * @tc.desc    Verify at() with TypedArray
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0061();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6200
     * @tc.desc    Verify at() with array-like object with length 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0062();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6300
     * @tc.desc    Verify at() with array-like object with length mismatch
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0063();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6400
     * @tc.desc    Verify at(-1) vs arr[length-1]
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0064();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6500
     * @tc.desc    Verify readability comparison
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0065();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6600
     * @tc.desc    Verify at(-1) vs slice(-1)[0]
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0066();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6700
     * @tc.desc    Verify return value type difference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0067();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6800
     * @tc.desc    Verify direct access with known index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0068();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_6900
     * @tc.desc    Verify at() does not modify array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0069();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7000
     * @tc.desc    Verify at() in chained calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0070();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7100
     * @tc.desc    Verify multiple method calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0071();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7200
     * @tc.desc    Verify at() returns element itself
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0072();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7300
     * @tc.desc    Verify at() returns object reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0073();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7400
     * @tc.desc    Verify at() returns array reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0074();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7500
     * @tc.desc    Verify at() returns undefined for out of bounds
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0075();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7600
     * @tc.desc    Verify at() returns undefined for holes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0076();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7700
     * @tc.desc    Verify at() returns explicit undefined element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0077();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7800
     * @tc.desc    Verify at() returns null element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0078();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest7900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_7900
     * @tc.desc    Verify at() preserves primitive types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0079();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtTest8000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_8000
     * @tc.desc    Verify at() with Symbol type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0080();
      expect(result).assertEqual(true);
    });
  });
}