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

export default function BuiltinsArrayAtExtendedTest(): void {
  describe('BuiltinsArrayAtExtendedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name    BuiltinsArrayAtExtendedTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0100
     * @tc.desc    Verify at() is read-only operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0081();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0200
     * @tc.desc    Verify multiple at() calls have no effect
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0082();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0300
     * @tc.desc    Verify at() with number type elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0083();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0400
     * @tc.desc    Verify at() with string type elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0084();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0500
     * @tc.desc    Verify at() with boolean type elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0085();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0600
     * @tc.desc    Verify at() with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0086();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0700
     * @tc.desc    Verify at() with array elements (nested arrays)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0087();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0800
     * @tc.desc    Verify at() with function elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0088();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_0900
     * @tc.desc    Verify at() with null elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0089();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1000
     * @tc.desc    Verify at() with undefined elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0090();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1100
     * @tc.desc    Verify at() with Symbol elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0091();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1200
     * @tc.desc    Verify at() with BigInt elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0092();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1300
     * @tc.desc    Verify at() with mixed type arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0093();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1400
     * @tc.desc    Verify at() using call
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0094();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1500
     * @tc.desc    Verify at() using apply
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0095();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1600
     * @tc.desc    Verify at() using bind
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0096();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1700
     * @tc.desc    Verify at() on Array prototype
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0097();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1800
     * @tc.desc    Verify at() with inherited array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0098();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_1900
     * @tc.desc    Verify at() method length property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0099();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2000
     * @tc.desc    Verify at() method name property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2100
     * @tc.desc    Verify at() in strict mode
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0101();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2200
     * @tc.desc    Verify at() in non-strict mode
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0102();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2300
     * @tc.desc    Verify at() with frozen array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0103();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2400
     * @tc.desc    Verify at() with sealed array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0104();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2500
     * @tc.desc    Verify at() with this is null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0105();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2600
     * @tc.desc    Verify at() with this is undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0106();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2700
     * @tc.desc    Verify at() with this is primitive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0107();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2800
     * @tc.desc    Verify at() with length is negative
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0108();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_2900
     * @tc.desc    Verify at() with length is non-numeric
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0109();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3000
     * @tc.desc    Verify at() with length is Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0110();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3100
     * @tc.desc    Verify at() with length is NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0111();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3200
     * @tc.desc    Verify at() with getter throws exception
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0112();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3300
     * @tc.desc    Verify at() with Proxy interception
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0113();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3400
     * @tc.desc    Verify at() with object without length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0114();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3500
     * @tc.desc    Verify at() with circular reference object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0115();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3600
     * @tc.desc    Verify at() after modifying length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0116();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    BuiltinsArrayAtExtendedTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_EXTENDED_TEST_3700
     * @tc.desc    Verify at() after deleting element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayAtExtendedTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayAtTests.ArrayAtTest0117();
      expect(result).assertEqual(true);
    });
  });
}
