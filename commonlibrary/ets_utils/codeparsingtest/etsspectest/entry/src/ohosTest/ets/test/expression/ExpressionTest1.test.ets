/*
* Copyright (C) 2024-2026 HiHope Open Source Organization.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

function getArrayElement<T>(array: T[] | null, index: number): T | undefined {
  if (array === null) {
    return undefined;
  }
  for (let i = 0; i < array.length; i++) {
    if (i === index) {
      return array[i];
    }
  }
  return undefined;
}

function inner(y: number): number {
  return y + 3;
}

export default function expressionTest1() {
  describe('ExpressionTest1', () => {
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
     * @tc.name   ExpressionTest0001
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0001
     * @tc.desc   Test addition operator with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = a + b;
      let expected: number = 8;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0002
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0002
     * @tc.desc   Test subtraction operator with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 4;
      let result: number = a - b;
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0003
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0003
     * @tc.desc   Test multiplication operator with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7;
      let b: number = 6;
      let result: number = a * b;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0004
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0004
     * @tc.desc   Test division operator with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 24;
      let b: number = 4;
      let result: number = a / b;
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0005
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0005
     * @tc.desc   Test modulus operator with positive numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 17;
      let b: number = 5;
      let result: number = a % b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0006
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0006
     * @tc.desc   Test exponentiation operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = 5;
      let result: number = a**b;
      let expected: number = 32;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0007
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0007
     * @tc.desc   Test prefix increment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = ++num;
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0008
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0008
     * @tc.desc   Test postfix increment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = num++;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0009
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0009
     * @tc.desc   Test prefix decrement operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = --num;
      let expected: number = 4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0010
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0010
     * @tc.desc   Test postfix decrement operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      let result: number = num--;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0011
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0011
     * @tc.desc   Test assignment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 0;
      num = 10;
      let expected: number = 10;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0012
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0012
     * @tc.desc   Test addition assignment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      num += 3;
      let expected: number = 8;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0013
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0013
     * @tc.desc   Test subtraction assignment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      num -= 4;
      let expected: number = 6;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0014
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0014
     * @tc.desc   Test multiplication assignment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 6;
      num *= 7;
      let expected: number = 42;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0015
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0015
     * @tc.desc   Test division assignment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 28;
      num /= 4;
      let expected: number = 7;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0016
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0016
     * @tc.desc   Test modulus assignment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 17;
      num %= 5;
      let expected: number = 2;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0017
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0017
     * @tc.desc   Test exponentiation assignment operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 3;
      num **= 3;
      let expected: number = 27;
      expect(num).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0018
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0018
     * @tc.desc   Test strict equality operator with same values and types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5;
      let result: boolean = a === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0019
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0019
     * @tc.desc   Test strict equality operator with different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: string = "5";
      let result: boolean = a === Number(b);
      let expected: boolean = true;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0020
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0020
     * @tc.desc   Test non-strict equality operator with different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: string = "5";
      let result: boolean = a == Number(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0021
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0021
     * @tc.desc   Test strict inequality operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: boolean = a !== b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0022
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0022
     * @tc.desc   Test greater than operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let result: boolean = a > b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0023
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0023
     * @tc.desc   Test less than operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3;
      let b: number = 7;
      let result: boolean = a < b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0024
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0024
     * @tc.desc   Test greater than or equal operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5;
      let result: boolean = a >= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0025
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0025
     * @tc.desc   Test less than or equal operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 4;
      let b: number = 5;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0026
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0026
     * @tc.desc   Test logical AND operator with true values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = true;
      let result: boolean = a && b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0027
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0027
     * @tc.desc   Test logical AND operator with false value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = false;
      let result: boolean = a && b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0028
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0028
     * @tc.desc   Test logical OR operator with true value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = false;
      let b: boolean = true;
      let result: boolean = a || b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0029
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0029
     * @tc.desc   Test logical NOT operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let result: boolean = !a;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0030
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0030
     * @tc.desc   Test bitwise AND operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      let b: number = 3; // 0011
      let result: number = a & b; // 0001 = 1
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0031
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0031
     * @tc.desc   Test bitwise OR operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      let b: number = 3; // 0011
      let result: number = a | b; // 0111 = 7
      let expected: number = 7;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0032
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0032
     * @tc.desc   Test bitwise XOR operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      let b: number = 3; // 0011
      let result: number = a ^ b; // 0110 = 6
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0033
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0033
     * @tc.desc   Test bitwise NOT operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 00000000000000000000000000000101
      let result: number = ~a; // 11111111111111111111111111111010 = -6
      let expected: number = -6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0034
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0034
     * @tc.desc   Test left shift operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      let result: number = a << 2; // 10100 = 20
      let expected: number = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0035
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0035
     * @tc.desc   Test right shift operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 20; // 10100
      let result: number = a >> 2; // 101 = 5
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0036
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0036
     * @tc.desc   Test unsigned right shift operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -20;
      let result: number = a >>> 2;
      let expected: number = 1073741819;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0037
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0037
     * @tc.desc   Test conditional operator with true condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let result: string = a > b ? "greater" : "less";
      let expected: string = "greater";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0038
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0038
     * @tc.desc   Test comma operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let b: number = 2;
      a++;
      b++;
      let result: number = a + b;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0039
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0039
     * @tc.desc   Test typeof operator with number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: string = typeof a;
      let expected: string = "number";
      expect(result).assertEqual(expected);
      expect(result).assertContain(expected);
    });

    /**
     * @tc.name   ExpressionTest0040
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0040
     * @tc.desc   Test typeof operator with string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string = "test";
      let result: string = typeof a;
      let expected: string = "string";
      expect(result).assertEqual(expected);
      expect(result).assertContain(expected);
    });

    /**
     * @tc.name   ExpressionTest0041
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0041
     * @tc.desc   Test typeof operator with boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let result: string = typeof a;
      let expected: string = "boolean";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0042
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0042
     * @tc.desc   Test typeof operator with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: undefined;
      let result: string = typeof a;
      let expected: string = "undefined";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0043
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0043
     * @tc.desc   Test unary plus operator with string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = +a;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0044
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0044
     * @tc.desc   Test unary minus operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = -a;
      let expected: number = -42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0045
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0045
     * @tc.desc   Test logical nullish assignment operator with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number | null = null;
      a ??= 42;
      let expected: number = 42;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0046
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0046
     * @tc.desc   Test logical nullish assignment operator with defined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      a ??= 42;
      let expected: number = 10;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0047
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0047
     * @tc.desc   Test logical OR assignment operator with falsy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      a ||= 42;
      let expected: number = 42;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0048
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0048
     * @tc.desc   Test logical AND assignment operator with truthy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      a &&= 42;
      let expected: number = 42;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0049
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0049
     * @tc.desc   Test array destructuring with multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3];
      let a: number = arr[0];
      let b: number = arr[1];
      let c: number = arr[2];
      let expectedA: number = 1;
      let expectedB: number = 2;
      let expectedC: number = 3;
      expect(a).assertEqual(expectedA);
      expect(b).assertEqual(expectedB);
      expect(c).assertEqual(expectedC);
    });

    /**
     * @tc.name   ExpressionTest0050
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0050
     * @tc.desc   Test operator precedence with multiplication and addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = 3;
      let c: number = 4;
      let result: number = a + b * c; // 2 + (3 * 4) = 14
      let expected: number = 14;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0051
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0051
     * @tc.desc   Test operator precedence with parentheses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = 3;
      let c: number = 4;
      let result: number = (a + b) * c;
      let expected: number = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0052
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0052
     * @tc.desc   Test string concatenation with + operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1: string = "Hello";
      let str2: string = "World";
      let result: string = str1 + " " + str2;
      let expected: string = "Hello World";
      expect(result).assertEqual(expected);
      expect(result).assertContain(str1);
    });

    /**
     * @tc.name   ExpressionTest0053
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0053
     * @tc.desc   Test string concatenation with number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Count: ";
      let num: number = 5;
      let result: string = str + num;
      let expected: string = "Count: 5";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0054
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0054
     * @tc.desc   Test addition assignment with strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Hello";
      str += " there";
      let expected: string = "Hello there";
      expect(str).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0055
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0055
     * @tc.desc   Test array index validation using string key conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c"];
      let key: string = "1";
      let result: boolean = parseInt(key, 10) >= 0 && parseInt(key, 10) < arr.length;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0057
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0057
     * @tc.desc   Test instanceof operator with array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3];
      let result: boolean = arr instanceof Array;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0058
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0058
     * @tc.desc   Test void operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: undefined = undefined;
      let expected: undefined = undefined;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0059
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0059
     * @tc.desc   Test comma operator in for loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let i: number = 0;
      let j: number = 0;
      for (; i < 3; i++, j += 2) {
      }
      let expectedI: number = 3;
      let expectedJ: number = 6;
      expect(i).assertEqual(expectedI);
      expect(j).assertEqual(expectedJ);
    });

    /**
     * @tc.name   ExpressionTest0060
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0060
     * @tc.desc   Test array destructuring with skip elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let a: number = 0;
      let b: number = 0;
      for (let i = 0, j = 3; i < 1; i++, j++) {
        a = arr[i];
        b = arr[j];
      }
      let expectedA: number = 1;
      let expectedB: number = 4;
      expect(a).assertEqual(expectedA);
      expect(b).assertEqual(expectedB);
    });

    /**
     * @tc.name   ExpressionTest0063
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0063
     * @tc.desc   Test logical AND short-circuit evaluation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = false;
      let b: string = "not evaluated";
      let result: boolean | string = a && b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0064
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0064
     * @tc.desc   Test logical OR short-circuit evaluation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: string = "not evaluated";
      let result: boolean | string = a || b;
      let expected: boolean = true;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0065
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0065
     * @tc.desc   Test nullish coalescing operator with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: null = null;
      let b: number = 42;
      let result: null | number = a ?? b;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0066
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0066
     * @tc.desc   Test nullish coalescing operator with 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 42;
      let result: number = a ?? b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0067
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0067
     * @tc.desc   Test optional chaining operator with existing property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class TestClass {
        prop: number = 42;
      }

      let obj: TestClass = new TestClass();
      let result: number | undefined = obj?.prop;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0069
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0069
     * @tc.desc   Test exponentiation with negative base
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = -2;
      let exponent: number = 3;
      let result: number = base**exponent;
      let expected: number = -8;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0070
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0070
     * @tc.desc   Test division by zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 0;
      let result: number = a / b;
      let expected: number = Infinity;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0071
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0071
     * @tc.desc   Test unary plus with boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let booleanToNumber: (value: boolean) => number = (value: boolean): number => {
        return value ? 1 : 0;
      };
      let result: number = booleanToNumber(a);
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0073
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0073
     * @tc.desc   Test prefix increment in expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: number = ++a * 2;
      let expected: number = 12;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0074
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0074
     * @tc.desc   Test postfix increment in expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: number = a++ * 2;
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0075
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0075
     * @tc.desc   Test multiple logical operators precedence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = false;
      let c: boolean = true;
      let result: boolean = a && b || c;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0076
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0076
     * @tc.desc   Test bitwise left shift with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -4;
      let result: number = a << 1;
      let expected: number = -8;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0077
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0077
     * @tc.desc   Test bitwise right shift with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -8;
      let result: number = a >> 1;
      let expected: number = -4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0078
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0078
     * @tc.desc   Test string comparison with > operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1: string = "apple";
      let str2: string = "banana";
      let result: boolean = str1 > str2;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0079
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0079
     * @tc.desc   Test string comparison with < operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str1: string = "apple";
      let str2: string = "banana";
      let result: boolean = str1 < str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0080
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0080
     * @tc.desc   Test conditional operator with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let score: number = 85;
      let result: string = score > 90 ? "A" : score > 80 ? "B" : "C";
      let expected: string = "B";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0081
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0081
     * @tc.desc   Test modulus with negative divisor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 17;
      let b: number = -5;
      let result: number = a % b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0082
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0082
     * @tc.desc   Test typeof null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: null = null;
      let result: string = typeof a;
      let expected: string = "object";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0083
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0083
     * @tc.desc   Test logical NOT with truthy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: boolean = !a;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0084
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0084
     * @tc.desc   Test logical NOT with falsy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: boolean = !a;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0085
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0085
     * @tc.desc   Test double logical NOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let result: boolean = !!a;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0086
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0086
     * @tc.desc   Test left shift assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      a <<= 2; // 10100 = 20
      let expected: number = 20;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0087
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0087
     * @tc.desc   Test right shift assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 20; // 10100
      a >>= 2; // 101 = 5
      let expected: number = 5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0088
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0088
     * @tc.desc   Test bitwise AND assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      a &= 3; // 0011
      let expected: number = 1; // 0001
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0089
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0089
     * @tc.desc   Test bitwise OR assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      a |= 3; // 0011
      let expected: number = 7; // 0111
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0090
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0090
     * @tc.desc   Test bitwise XOR assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 0101
      a ^= 3; // 0011
      let expected: number = 6; // 0110
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0091
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0091
     * @tc.desc   Test exponentiation assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      a **= 3;
      let expected: number = 8;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0092
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0092
     * @tc.desc   Test instanceof with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class MyClass {
      }

      let obj: MyClass = new MyClass();
      let result: boolean = obj instanceof MyClass;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0094
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0094
     * @tc.desc   Test multiple assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number;
      let b: number;
      a = b = 5;
      let expected: number = 5;
      expect(a).assertEqual(expected);
      expect(b).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0096
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0096
     * @tc.desc   Test boolean and number comparison with ==
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: number = 1;
      let result: boolean = (a ? 1 : 0) === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0097
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0097
     * @tc.desc   Test null and undefined comparison with ==
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: null = null;
      let b: undefined = undefined;
      let result: boolean = a == b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0098
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0098
     * @tc.desc   Test array and string comparison with ===
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string[] = ["1", "2", "3"];
      let b: string = "1,2,3";
      let result: boolean = a.join(",") === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0099
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0099
     * @tc.desc   Test operator precedence with logical and arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      let result: boolean = a > b + c;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0101
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0101
     * @tc.desc   Test addition with maximum safe numbereger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 9007199254740991;
      let result: number = maxInt + 1;
      let expected: number = 9007199254740992;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0102
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0102
     * @tc.desc   Test subtraction with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let b: number = -3;
      let result: number = a - b;
      let expected: number = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0103
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0103
     * @tc.desc   Test multiplication with decimal numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2.5;
      let b: number = 4.0;
      let result: number = a * b;
      let expected: number = 10.0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0104
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0104
     * @tc.desc   Test division with decimal result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7;
      let b: number = 2;
      let result: number = a / b;
      let expected: number = 3.5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0105
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0105
     * @tc.desc   Test modulus with decimal numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10.5;
      let b: number = 3;
      let result: number = a % b;
      let expected: number = 1.5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0106
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0106
     * @tc.desc   Test exponentiation with decimal exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 16;
      let b: number = 0.25;
      let result: number = a**b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0107
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0107
     * @tc.desc   Test prefix increment in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      let i: number = 0;
      while (++i < 5) {
        count++;
      }
      let expected: number = 4;
      expect(count).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0108
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0108
     * @tc.desc   Test postfix increment in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      let i: number = 0;
      while (i++ < 5) {
        count++;
      }
      let expected: number = 5;
      expect(count).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0109
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0109
     * @tc.desc   Test prefix decrement in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = --a - b;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0110
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0110
     * @tc.desc   Test postfix decrement in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = a-- - b;
      let expected: number = 2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0111
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0111
     * @tc.desc   Test assignment with calculation result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 4;
      let result: number = 0;
      result = a * 2 + b / 2;
      let expected: number = 22;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0112
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0112
     * @tc.desc   Test addition assignment with negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = -3;
      a += b;
      let expected: number = 2;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0113
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0113
     * @tc.desc   Test subtraction assignment with negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = -3;
      a -= b;
      let expected: number = 8;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0114
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0114
     * @tc.desc   Test multiplication assignment with decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 6;
      let b: number = 0.5;
      a *= b;
      let expected: number = 3;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0115
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0115
     * @tc.desc   Test division assignment with decimal result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 15;
      let b: number = 2;
      a /= b;
      let expected: number = 7.5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0116
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0116
     * @tc.desc   Test modulus assignment with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -17;
      let b: number = 5;
      a %= b;
      let expected: number = -2;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0117
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0117
     * @tc.desc   Test exponentiation assignment with negative exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = -3;
      a **= b;
      let expected: number = 0.125;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0118
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0118
     * @tc.desc   Test strict equality with decimal numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1.5;
      let b: number = 1.5;
      let result: boolean = a === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0119
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0119
     * @tc.desc   Test strict inequality with different decimal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1.5;
      let b: number = 2.5;
      let result: boolean = a !== b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0121
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0121
     * @tc.desc   Test greater than with decimal numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3.7;
      let b: number = 3.2;
      let result: boolean = a > b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0122
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0122
     * @tc.desc   Test less than with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let b: number = -3;
      let result: boolean = a < b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0123
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0123
     * @tc.desc   Test greater than or equal with same values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7.5;
      let b: number = 7.5;
      let result: boolean = a >= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0124
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0124
     * @tc.desc   Test less than or equal with negative decimals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -2.3;
      let b: number = -2.1;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0125
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0125
     * @tc.desc   Test logical AND with truthy numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 10;
      let result: number = a && b;
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0126
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0126
     * @tc.desc   Test logical AND with falsy number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 10;
      let result: number = a && b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0127
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0127
     * @tc.desc   Test logical OR with falsy number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 10;
      let result: number = a || b;
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0128
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0128
     * @tc.desc   Test logical NOT with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: boolean = !a;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0129
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0129
     * @tc.desc   Test bitwise AND with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let b: number = -3;
      let result: number = a & b;
      let expected: number = -7;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0130
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0130
     * @tc.desc   Test bitwise OR with large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0xffff;
      let b: number = 0xff00;
      let result: number = a | b;
      let expected: number = 0xffff;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0131
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0131
     * @tc.desc   Test bitwise XOR with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 255;
      let b: number = 0;
      let result: number = a ^ b;
      let expected: number = 255;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0132
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0132
     * @tc.desc   Test bitwise NOT with maximum numbereger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2147483647;
      let result: number = ~a;
      let expected: number = -2147483648;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0133
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0133
     * @tc.desc   Test left shift with maximum shift amount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let result: number = a << 31;
      let expected: number = -2147483648;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0134
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0134
     * @tc.desc   Test right shift with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -2147483648;
      let result: number = a >> 31;
      let expected: number = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0135
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0135
     * @tc.desc   Test unsigned right shift with large number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0xffffffff;
      let result: number = a >>> 1;
      let expected: number = 0x7fffffff;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0136
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0136
     * @tc.desc   Test conditional operator with numeric result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 15;
      let b: number = 20;
      let result: number = a > b ? a : b;
      let expected: number = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0137
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0137
     * @tc.desc   Test comma operator in for loop initialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = 0, j = 10; i < 5; i++, j--) {
        result += i + j;
      }
      let expected: number = 50;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0138
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0138
     * @tc.desc   Test typeof with bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: bigint = BigInt(9007199254740991);
      let result: string = typeof a;
      let expected: string = "bigint";
      expect(result).assertEqual(expected);
      expect(result).assertContain(expected);
    });

    /**
     * @tc.name   ExpressionTest0139
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0139
     * @tc.desc   Test typeof with function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testFunc: () => void = (): void => {
      };
      let result: string = typeof testFunc;
      let expected: string = "function";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0140
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0140
     * @tc.desc   Test unary plus with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let result: number = +a;
      let expected: number = -5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0141
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0141
     * @tc.desc   Test unary minus with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let result: number = -a;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0142
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0142
     * @tc.desc   Test logical nullish assignment with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number | undefined = undefined;
      a ??= 42;
      let expected: number = 42;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0143
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0143
     * @tc.desc   Test logical nullish assignment with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      a ??= 42;
      let expected: number = 0;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0144
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0144
     * @tc.desc   Test logical OR assignment with truthy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      a ||= 42;
      let expected: number = 5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0145
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0145
     * @tc.desc   Test logical AND assignment with falsy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      a &&= 42;
      let expected: number = 0;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0146
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0146
     * @tc.desc   Test array destructuring with default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1];
      let a: number = arr.length > 0 ? arr[0] : 0;
      let b: number = arr.length > 1 ? arr[1] : 0;
      let expectedA: number = 1;
      let expectedB: number = 0;
      expect(a).assertEqual(expectedA);
      expect(b).assertEqual(expectedB);
    });

    /**
     * @tc.name   ExpressionTest0147
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0147
     * @tc.desc   Test rest operator in array destructuring with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [];
      let a: number = arr.length > 0 ? arr[0] : 0;
      let rest: number[] = arr.length > 1 ? arr.slice(1) : [];
      let expectedA: number = 0;
      let expectedRestLength: number = 0;
      expect(a).assertEqual(expectedA);
      expect(rest.length).assertEqual(expectedRestLength);
    });

    /**
     * @tc.name   ExpressionTest0148
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0148
     * @tc.desc   Test operator precedence with unary and multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = -a * b;
      let expected: number = -15;
      expect(result).assertEqual(expected);
    });


    /**
     * @tc.name   ExpressionTest0149
     * @tc.number ExpressionTest0149
     * @tc.desc   ExpressionTest0149
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class TestClass {
        getValue(): number {
          return 42;
        }
      }

      let obj: TestClass | null = new TestClass();
      let result1 = obj?.getValue();
      obj = null;
      let expected1 = 42;
      expect(result1).assertEqual(expected1);
    });


    /**
     * @tc.name   ExpressionTest0150
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0150
     * @tc.desc   Test comma operator in for loop update with multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 0;
      let y: number = 100;
      for (let i = 0; i < 5; i++, x += 5, y -= 10) {
      }
      let expectedX: number = 25;
      let expectedY: number = 50;
      expect(x).assertEqual(expectedX);
      expect(y).assertEqual(expectedY);
    });

    /**
     * @tc.name   ExpressionTest0151
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0151
     * @tc.desc   Test addition with minimum safe numbereger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minInt: number = -9007199254740991;
      let result: number = minInt + (-1);
      let expected: number = -9007199254740992;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0152
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0152
     * @tc.desc   Test subtraction resulting in positive overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 9007199254740991;
      let b: number = -2;
      let result: number = a - b;
      let expected: number = 9007199254740993;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0153
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0153
     * @tc.desc   Test multiplication with very small decimals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0.0000001;
      let b: number = 0.0000002;
      let result: number = a * b;
      let expected: number = 2e-14;
      let tolerance: number = 1e-20;
      expect(Math.abs(result - expected) < tolerance).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0154
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0154
     * @tc.desc   Test division of small number by large number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let b: number = 1000000;
      let result: number = a / b;
      let expected: number = 0.000001;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0155
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0155
     * @tc.desc   Test modulus with zero dividend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 5;
      let result: number = a % b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0156
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0156
     * @tc.desc   Test exponentiation with large exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let b: number = 30;
      let result: number = a**b;
      let expected: number = 1073741824;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0157
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0157
     * @tc.desc   Test prefix increment in nested expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3;
      let result: number = 2 * ++a + 5;
      let expected: number = 13;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0158
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0158
     * @tc.desc   Test postfix increment in nested expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3;
      let result: number = 2 * a++ + 5;
      let expected: number = 11;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0159
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0159
     * @tc.desc   Test prefix decrement in complex calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 4;
      let result: number = (--a * 2) / b + 3;
      let expected: number = 7.5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0160
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0160
     * @tc.desc   Test postfix decrement in complex calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 4;
      let result: number = (a-- * 2) / b + 3;
      let expected: number = 8;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0161
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0161
     * @tc.desc   Test assignment with multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      let result: number = 0;
      result = (a + b) * (c / a) + b;
      let expected: number = 6.2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0162
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0162
     * @tc.desc   Test addition assignment with large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 9007199254740990;
      let b: number = 3;
      a += b;
      let expected: number = 9007199254740993;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0163
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0163
     * @tc.desc   Test subtraction assignment with very small numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0.0000001;
      let b: number = 0.00000005;
      a -= b;
      let expected: number = 0.00000005;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0164
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0164
     * @tc.desc   Test multiplication assignment with negative decimals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -2.5;
      let b: number = 0.5;
      a *= b;
      let expected: number = -1.25;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0165
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0165
     * @tc.desc   Test division assignment with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -15;
      let b: number = -3;
      a /= b;
      let expected: number = 5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0166
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0166
     * @tc.desc   Test modulus assignment with decimal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7.2;
      let b: number = 2.5;
      a %= b;
      let expected: number = 2.2;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0167
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0167
     * @tc.desc   Test exponentiation assignment with fractional exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 81;
      let b: number = 0.25;
      a **= b;
      let expected: number = 3;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0168
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0168
     * @tc.desc   Test strict equality with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Infinity;
      let b: number = Infinity;
      let result: boolean = a === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0169
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0169
     * @tc.desc   Test strict inequality between Infinity and -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Infinity;
      let b: number = -Infinity;
      let result: boolean = a !== b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0170
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0170
     * @tc.desc   Test non-strict equality with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = NaN;
      let b: number = NaN;
      let result: boolean = a == b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0171
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0171
     * @tc.desc   Test greater than with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Infinity;
      let b: number = 1000000000;
      let result: boolean = a > b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0172
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0172
     * @tc.desc   Test less than with -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -Infinity;
      let b: number = -1000000000;
      let result: boolean = a < b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0173
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0173
     * @tc.desc   Test greater than or equal with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = NaN;
      let b: number = 5;
      let result: boolean = a >= b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0174
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0174
     * @tc.desc   Test less than or equal with mixed signs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -3;
      let b: number = 2;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0175
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0175
     * @tc.desc   Test logical AND with zero and negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = -5;
      let result: number = a && b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0176
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0176
     * @tc.desc   Test logical AND with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -3;
      let b: number = -5;
      let result: number = a && b;
      let expected: number = -5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0177
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0177
     * @tc.desc   Test logical OR with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -3;
      let b: number = -5;
      let result: number = a || b;
      let expected: number = -3;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0178
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0178
     * @tc.desc   Test logical NOT with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let result: boolean = !a;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0179
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0179
     * @tc.desc   Test bitwise AND with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 255;
      let b: number = 0;
      let result: number = a & b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0180
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0180
     * @tc.desc   Test bitwise OR with all ones
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 123;
      let b: number = 0xff;
      let result: number = a | b;
      let expected: number = 255;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0181
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0181
     * @tc.desc   Test bitwise XOR with same number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = a ^ a;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0182
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0182
     * @tc.desc   Test bitwise NOT with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: number = ~a;
      let expected: number = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0183
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0183
     * @tc.desc   Test left shift with shift amount larger than 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let result: number = a << 32;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0184
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0184
     * @tc.desc   Test right shift with large shift amount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 255;
      let result: number = a >> 10;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0185
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0185
     * @tc.desc   Test unsigned right shift with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -1;
      let result: number = a >>> 0;
      let expected: number = 4294967295;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0186
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0186
     * @tc.desc   Test conditional operator with NaN condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = NaN;
      let result: string = a ? "truthy" : "falsy";
      let expected: string = "falsy";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0187
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0187
     * @tc.desc   Test comma operator in for loop with multiple variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum: number = 0;
      let product: number = 1;
      let i: number, j: number;
      for (i = 1, j = 5; i <= 5; i++, j--) {
        sum += i + j;
        product *= i;
      }
      let expectedSum: number = 30;
      let expectedProduct: number = 120;
      expect(sum).assertEqual(expectedSum);
      expect(product).assertEqual(expectedProduct);
    });

    /**
     * @tc.name   ExpressionTest0188
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0188
     * @tc.desc   Test typeof with symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let symbolCounter = 0;
      let createSymbol: (description: string) => string = (description: string): string => {
        return `Symbol(${description})_${symbolCounter++}`;
      };
      let sym: string = createSymbol("test");
      let result: string = typeof sym;
      let expected: string = "string";
      expect(result).assertEqual(expected);
      expect(sym).assertContain("test");
    });

    /**
     * @tc.name   ExpressionTest0189
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0189
     * @tc.desc   Test typeof with number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: string = typeof a;
      let expected: string = "number";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0190
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0190
     * @tc.desc   Test unary plus with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: number = +a;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0191
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0191
     * @tc.desc   Test unary minus with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let result: number = -a;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0192
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0192
     * @tc.desc   Test logical nullish assignment with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      a ??= 42;
      let expected: number = -5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0193
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0193
     * @tc.desc   Test logical nullish assignment with decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number | undefined = undefined;
      a ??= 3.14;
      let expected: number = 3.14;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0194
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0194
     * @tc.desc   Test logical OR assignment with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      a ||= 42;
      let expected: number = -5;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0195
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0195
     * @tc.desc   Test logical AND assignment with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      a &&= 42;
      let expected: number = 42;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0196
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0196
     * @tc.desc   Test operator precedence with bitwise and logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 7;
      let bitwiseResult: number = a & b;
      let comparisonResult: boolean = c > 5;
      let result: boolean = (bitwiseResult !== 0) || comparisonResult;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0197
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0197
     * @tc.desc   Test optional chaining with nested properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class InnerClass {
        value: number = 10;
      }

      class OuterClass {
        inner: InnerClass = new InnerClass();
      }

      let obj: OuterClass | null = new OuterClass();
      let result1: number | undefined = obj?.inner?.value;
      obj = null;
      let expected1: number = 10;
      expect(result1).assertEqual(expected1);
    });

    /**
     * @tc.name   ExpressionTest0198
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0198
     * @tc.desc   Test comma operator in for loop with complex updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 1;
      for (let i = 0; i < 5; i++, a += b, b *= 2) {
      }
      let expectedA: number = 31;
      let expectedB: number = 32;
      expect(a).assertEqual(expectedA);
      expect(b).assertEqual(expectedB);
    });

    /**
     * @tc.name   ExpressionTest0199
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0199
     * @tc.desc   Test operator precedence with arithmetic and comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let c: number = 3;
      let result: boolean = a / b > c;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0200
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0200
     * @tc.desc   Test comma operator in for loop initialization with complex expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = (5 - 2), j = (3 * 4); i < j; i++, j--) {
        result += i + j;
      }
      let expected: number = 75;
      expect(result).assertEqual(expected);
    });

  })
}