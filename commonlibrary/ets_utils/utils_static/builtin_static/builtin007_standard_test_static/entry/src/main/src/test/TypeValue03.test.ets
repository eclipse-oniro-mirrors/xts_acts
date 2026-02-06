/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function TypeValue03Test() {
  describe("TypeValue03Test", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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

    console.log(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number   SUB_INT_VALUE_OF_0101
     * @tc.name     test_int_value_of_0101
     * @tc.desc     IntValue creation with zero value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_int_value_of_0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_int_value_of_0101 start');
        const testValue = IntValue.of(0);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_int_value_of_0101 end');
      });

    /**
     * @tc.number   SUB_INT_VALUE_OF_0102
     * @tc.name     test_int_value_of_0102
     * @tc.desc     IntValue creation with negative value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_int_value_of_0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_int_value_of_0102 start');
        const testValue = IntValue.of(-5);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_int_value_of_0102 end');
      });

    /**
     * @tc.number   SUB_LONG_VALUE_OF_0110
     * @tc.name     test_long_value_of_0110
     * @tc.desc     Basic LongValue creation with positive value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_long_value_of_0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0110 start');
        const testValue = LongValue.of(123456789);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0110 end');
      });

    /**
     * @tc.number   SUB_LONG_VALUE_OF_0111
     * @tc.name     test_long_value_of_0111
     * @tc.desc     LongValue creation with negative value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_long_value_of_0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0111 start');
        const testValue = LongValue.of(-987654321);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0111 end');
      });

    /**
     * @tc.number   SUB_LONG_VALUE_OF_0112
     * @tc.name     test_long_value_of_0112
     * @tc.desc     LongValue creation with zero value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_long_value_of_0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0112 start');
        const testValue = LongValue.of(0);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0112 end');
      });

    /**
     * @tc.number   SUB_LONG_VALUE_OF_0113
     * @tc.name     test_long_value_of_0113
     * @tc.desc     LongValue creation with maximum long value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_long_value_of_0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0113 start');
        const testValue = LongValue.of(Number.MAX_SAFE_INTEGER);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0113 end');
      });

    /**
     * @tc.number   SUB_LONG_VALUE_OF_0114
     * @tc.name     test_long_value_of_0114
     * @tc.desc     LongValue creation with minimum long value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_long_value_of_0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0114 start');
        const testValue = LongValue.of(Number.MIN_SAFE_INTEGER);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_long_value_of_0114 end');
      });

    /**
     * @tc.number   SUB_ARRAY_VALUE_OF_0115
     * @tc.name     test_array_value_of_0115
     * @tc.desc     Basic ArrayValue creation test
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_array_value_of_0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_array_value_of_0115 start');
        const testArray: string[] = ['a', 'b', 'c'];
        const testValue = ArrayValue.of(testArray);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_array_value_of_0115 end');
      });

    /**
     * @tc.number   ARRAY_VALUE_OF_116
     * @tc.name     test_ARRAY_VALUE_OF_116
     * @tc.desc     Test with empty array
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_ARRAY_VALUE_OF_116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_116 start');
        const testArray: string[] = [];
        const testValue = ArrayValue.of(testArray);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_116 end');
      });

    /**
     * @tc.number   ARRAY_VALUE_OF_117
     * @tc.name     test_ARRAY_VALUE_OF_117
     * @tc.desc     Test with single element
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_ARRAY_VALUE_OF_117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_117 start');
        const testArray: string[] = ['z'];
        const testValue = ArrayValue.of(testArray);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_117 end');
      });

    /**
     * @tc.number   ARRAY_VALUE_OF_118
     * @tc.name     test_ARRAY_VALUE_OF_118
     * @tc.desc     Test with mixed content
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_ARRAY_VALUE_OF_118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_118 start');
        const testArray: string[] = ['A', '1', 'B', '2'];
        const testValue = ArrayValue.of(testArray);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_118 end');
      });

    /**
     * @tc.number   ARRAY_VALUE_OF_119
     * @tc.name     test_ARRAY_VALUE_OF_119
     * @tc.desc     Test with repeated elements
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_ARRAY_VALUE_OF_119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_119 start');
        const testArray: string[] = [];
        for (let i = 0; i < 100; i++) {
          testArray.push('x');
        }
        const testValue = ArrayValue.of(testArray);
        expect(testValue).not().assertNull();
        expect(testValue).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_ARRAY_VALUE_OF_119 end');
      });

    /**
     * @tc.number   NULL_VALUE_EXISTENCE_120
     * @tc.name     test_NULL_VALUE_EXISTENCE_120
     * @tc.desc     Verify NullValue instance exists
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_NULL_VALUE_EXISTENCE_120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_NULL_VALUE_EXISTENCE_120 start');
        expect(NullValue.INSTANCE).not().assertUndefined();
        done();
        console.log(domain, tag, '%{public}s', 'test_NULL_VALUE_EXISTENCE_120 end');
      });

    /**
     * @tc.number   NULL_VALUE_TYPE_CHECK_122
     * @tc.name     test_NULL_VALUE_TYPE_CHECK_122
     * @tc.desc     Verify NullValue type
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_NULL_VALUE_TYPE_CHECK_122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_NULL_VALUE_TYPE_CHECK_122 start');
        expect(typeof NullValue.INSTANCE).assertEqual('object');
        done();
        console.log(domain, tag, '%{public}s', 'test_NULL_VALUE_TYPE_CHECK_122 end');
      });

    /**
     * @tc.number   NULL_VALUE_COMPARE_NULL_123
     * @tc.name     test_NULL_VALUE_COMPARE_NULL_123
     * @tc.desc     Compare with null
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_NULL_VALUE_COMPARE_NULL_123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_NULL_VALUE_COMPARE_NULL_123 start');
        expect(NullValue.INSTANCE === null).assertFalse();
        done();
        console.log(domain, tag, '%{public}s', 'test_NULL_VALUE_COMPARE_NULL_123 end');
      });

    /**
     * @tc.number   COSH_SYMMETRY_126
     * @tc.name     test_COSH_SYMMETRY_126
     * @tc.desc     Verify cosh(-x) equals cosh(x)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COSH_SYMMETRY_126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COSH_SYMMETRY_126 start');
        const positive = cosh(1);
        const negative = cosh(-1);
        expect(positive).assertEqual(negative);
        done();
        console.log(domain, tag, '%{public}s', 'test_COSH_SYMMETRY_126 end');
      });

    /**
     * @tc.number   COSH_ORDER_127
     * @tc.name     test_COSH_ORDER_127
     * @tc.desc     Verify cosh(x) increases when x > 0
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COSH_ORDER_127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COSH_ORDER_127 start');
        const small = cosh(1);
        const large = cosh(2);
        expect(large > small).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'test_COSH_ORDER_127 end');
      });

    /**
     * @tc.number   COSH_EDGE_129
     * @tc.name     test_COSH_EDGE_129
     * @tc.desc     Test edge case with very large input
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COSH_EDGE_129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COSH_EDGE_129 start');
        const result = cosh(100);
        expect(result > 1e43).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'test_COSH_EDGE_129 end');
      });

    /**
     * @tc.number   COS_BASIC_130
     * @tc.name     test_COS_BASIC_130
     * @tc.desc     Test cos(0) returns 1 (basic functionality)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COS_BASIC_130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COS_BASIC_130 start');
        const result = cos(0);
        expect(result).assertEqual(1);
        done();
        console.log(domain, tag, '%{public}s', 'test_COS_BASIC_130 end');
      });

    /**
     * @tc.number   COS_PI_OVER_2_131
     * @tc.name     test_COS_PI_OVER_2_131
     * @tc.desc     Test cos(Math.PI/2) returns approximately 0
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COS_PI_OVER_2_131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COS_PI_OVER_2_131 start');
        const result = cos(Math.PI / 2);
        expect(result).assertLessOrEqual(1e-15);
        done();
        console.log(domain, tag, '%{public}s', 'test_COS_PI_OVER_2_131 end');
      });

    /**
     * @tc.number   COS_NEGATIVE_INPUT_132
     * @tc.name     test_COS_NEGATIVE_INPUT_132
     * @tc.desc     Test cos(-Math.PI) returns -1 (cosine is even function)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COS_NEGATIVE_INPUT_132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COS_NEGATIVE_INPUT_132 start');
        const result = cos(-Math.PI);
        expect(result).assertEqual(-1);
        done();
        console.log(domain, tag, '%{public}s', 'test_COS_NEGATIVE_INPUT_132 end');
      });

    /**
     * @tc.number   COS_LARGE_INPUT_133
     * @tc.name     test_COS_LARGE_INPUT_133
     * @tc.desc     Test cos(1000 * Math.PI) returns 1 (periodicity test)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COS_LARGE_INPUT_133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COS_LARGE_INPUT_133 start');
        const result = cos(1000 * Math.PI);
        expect(result).assertEqual(1);
        done();
        console.log(domain, tag, '%{public}s', 'test_COS_LARGE_INPUT_133 end');
      });

    /**
     * @tc.number   COS_NAN_INPUT_134
     * @tc.name     test_COS_NAN_INPUT_134
     * @tc.desc     Test cos(NaN) returns NaN
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_COS_NAN_INPUT_134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_COS_NAN_INPUT_134 start');
        const result = cos(NaN);
        expect(isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'test_COS_NAN_INPUT_134 end');
      });

    /**
     * @tc.number   SUB_CLZ64_135
     * @tc.name     test_clz64_135
     * @tc.desc     Basic test for clz64 with zero input
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_clz64_135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_clz64_135 start');
        const result = clz64(0);
        expect(result).assertEqual(64);
        done();
        console.log(domain, tag, '%{public}s', 'test_clz64_135 end');
      });

    /**
     * @tc.number   SUB_CLZ64_136
     * @tc.name     test_clz64_136
     * @tc.desc     Test clz64 with maximum 16-bit unsigned value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_clz64_136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_clz64_136 start');
        const result = clz64(65535);
        expect(result).assertEqual(48);
        done();
        console.log(domain, tag, '%{public}s', 'test_clz64_136 end');
      });

    /**
     * @tc.number   SUB_CLZ64_137
     * @tc.name     test_clz64_137
     * @tc.desc     Test clz64 with single bit set (LSB)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_clz64_137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_clz64_137 start');
        const result = clz64(1);
        expect(result).assertEqual(63);
        done();
        console.log(domain, tag, '%{public}s', 'test_clz64_137 end');
      });

    /**
     * @tc.number   SUB_CLZ64_138
     * @tc.name     test_clz64_138
     * @tc.desc     Test clz64 with random 16-bit value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("test_clz64_138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'test_clz64_138 start');
        const testValue = 0x0F0F;
        const result = clz64(testValue);
        expect(result).assertEqual(52);
        done();
        console.log(domain, tag, '%{public}s', 'test_clz64_138 end');
      });

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_TYPE_OF_0100
     * @tc.name     testTypeOf0001
     * @tc.desc     Testing Type.of with null.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('testTypeOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testTypeOf0001";
      try {
        let a = Type.of(null);
        expect(String(a)).assertEqual(String(null));
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}