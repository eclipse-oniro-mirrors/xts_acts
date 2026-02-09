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
import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

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

class TestObject1 {
}

class Data1 {
  value: number;

  constructor(val: number) {
    this.value = val;
  }
}

class Data2 {
  value: number;

  constructor(val: number) {
    this.value = val;
  }
}

class Config5 {
  value: number | null = null;
}

class Config6 {
  value: number = 10;
}

class Settings7 {
  threshold: number = 0;
}

class Calculator9 {
  add(a: number, b: number): number {
    return a + b;
  }
}

export default function expressionTest2() {
  describe('ExpressionTest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0201
     * @tc.name ExpressionTest0201
     * @tc.desc Test addition with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let result: number = maxVal + 1;
      let expected: number = Number.MAX_VALUE;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0202
     * @tc.name ExpressionTest0202
     * @tc.desc Test subtraction with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minVal: number = Number.MIN_VALUE;
      let result: number = minVal - 1;
      let expected: number = -1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0203
     * @tc.name ExpressionTest0203
     * @tc.desc Test multiplication with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let result: number = maxVal * 2;
      let expected: number = Infinity;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0204
     * @tc.name ExpressionTest0204
     * @tc.desc Test division of Infinity by number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Infinity;
      let b: number = 100;
      let result: number = a / b;
      let expected: number = Infinity;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0205
     * @tc.name ExpressionTest0205
     * @tc.desc Test modulus with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = Infinity;
      let result: number = a % b;
      let expected: number = 5;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0206
     * @tc.name ExpressionTest0206
     * @tc.desc Test exponentiation with base 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let b: number = 1000;
      let result: number = a**b;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0207
     * @tc.name ExpressionTest0207
     * @tc.desc Test prefix increment in function arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let testFunc: (x: number) => number = (x: number): number => {
        return x * 2;
      };
      let result: number = testFunc(++a);
      let expected: number = 12;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0208
     * @tc.name ExpressionTest0208
     * @tc.desc Test postfix increment in function arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let testFunc: (x: number) => number = (x: number): number => {
        return x * 2;
      };
      let result: number = testFunc(a++);
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0209
     * @tc.name ExpressionTest0209
     * @tc.desc Test prefix decrement in array access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30];
      let index: int = 2;
      let result: number = arr[--index];
      let expected: number = 20;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0210
     * @tc.name ExpressionTest0210
     * @tc.desc Test postfix decrement in array access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30];
      let index: int = 2;
      let result: number = arr[index--];
      let expected: number = 30;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0211
     * @tc.name ExpressionTest0211
     * @tc.desc Test assignment with function return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getValue: () => number = (): number => {
        return 42;
      };
      let result: number = 0;
      result = getValue() + 8;
      let expected: number = 50;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0212
     * @tc.name ExpressionTest0212
     * @tc.desc Test addition assignment with function result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getIncrement: () => number = (): number => {
        return 5;
      };
      let a: number = 10;
      a += getIncrement();
      let expected: number = 15;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0213
     * @tc.name ExpressionTest0213
     * @tc.desc Test subtraction assignment with function result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getDecrement: () => number = (): number => {
        return 3;
      };
      let a: number = 10;
      a -= getDecrement();
      let expected: number = 7;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0214
     * @tc.name ExpressionTest0214
     * @tc.desc Test multiplication assignment with ternary result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: boolean = true;
      let a: number = 4;
      a *= flag ? 3 : 5;
      let expected: number = 12;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0215
     * @tc.name ExpressionTest0215
     * @tc.desc Test division assignment with logical result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 5;
      let result: number = 20;
      result /= a > b ? 2 : 4;
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0216
     * @tc.name ExpressionTest0216
     * @tc.desc Test modulus assignment with arithmetic result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 25;
      let b: number = 3 + 2;
      a %= b;
      let expected: number = 0;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0217
     * @tc.name ExpressionTest0217
     * @tc.desc Test exponentiation assignment with variable exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = 3;
      let exponent: number = 3;
      base **= exponent;
      let expected: number = 27;
      expect(base).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0218
     * @tc.name ExpressionTest0218
     * @tc.desc Test strict equality with -0 and 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -0;
      let b: number = 0;
      let result: boolean = a === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0219
     * @tc.name ExpressionTest0219
     * @tc.desc Test strict inequality with different number types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5.0;
      let result: boolean = a !== b;
      let expected: boolean = false;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0220
     * @tc.name ExpressionTest0220
     * @tc.desc Test non-strict equality with empty string and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string = "";
      let b: number = 0;
      let aAsNumber: number = Number(a);
      let result: boolean = aAsNumber === b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0221
     * @tc.name ExpressionTest0221
     * @tc.desc Test greater than with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MAX_VALUE;
      let b: number = 1000000000;
      let result: boolean = a > b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0222
     * @tc.name ExpressionTest0222
     * @tc.desc Test less than with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MIN_VALUE;
      let b: number = 0.1;
      let result: boolean = a < b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0223
     * @tc.name ExpressionTest0223
     * @tc.desc Test greater than or equal with same large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 999999999999999;
      let b: number = 999999999999999;
      let result: boolean = a >= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0224
     * @tc.name ExpressionTest0224
     * @tc.desc Test less than or equal with very small decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0.0000000001;
      let b: number = 0.0000000002;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0225
     * @tc.name ExpressionTest0225
     * @tc.desc Test logical AND with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isPositive: (x: number) => boolean = (x: number): boolean => {
        return x > 0;
      };
      let a: number = 5;
      let b: number = 10;
      let result: boolean = isPositive(a) && isPositive(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0226
     * @tc.name ExpressionTest0226
     * @tc.desc Test logical AND short-circuit with function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let called: boolean = false;
      let testFunc: () => boolean = (): boolean => {
        called = true;
        return true;
      };
      let a: boolean = false;
      let result: boolean = a && testFunc();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0227
     * @tc.name ExpressionTest0227
     * @tc.desc Test logical OR with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let isEven: (x: number) => boolean = (x: number): boolean => {
        return x % 2 === 0;
      };
      let a: number = 3;
      let b: number = 4;
      let result: boolean = isEven(a) || isEven(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0228
     * @tc.name ExpressionTest0228
     * @tc.desc Test logical OR short-circuit with function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let called: boolean = false;
      let testFunc: () => boolean = (): boolean => {
        called = true;
        return false;
      };
      let a: boolean = true;
      let result: boolean = a || testFunc();
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0229
     * @tc.name ExpressionTest0229
     * @tc.desc Test bitwise AND with all bits set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b1111;
      let b: number = 0b1010;
      let result: number = a & b;
      let expected: number = 0b1010;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0230
     * @tc.name ExpressionTest0230
     * @tc.desc Test bitwise OR with no overlapping bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b1000;
      let b: number = 0b0011;
      let result: number = a | b;
      let expected: number = 0b1011;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0231
     * @tc.name ExpressionTest0231
     * @tc.desc Test bitwise XOR with alternating bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b1010;
      let b: number = 0b0101;
      let result: number = a ^ b;
      let expected: number = 0b1111;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0232
     * @tc.name ExpressionTest0232
     * @tc.desc Test bitwise NOT with one bit set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b10000000;
      let result: number = ~a;
      let expected: number = -0b10000001;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0233
     * @tc.name ExpressionTest0233
     * @tc.desc Test left shift with shift amount 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 42;
      let result: number = a << 0;
      let expected: number = 42;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0234
     * @tc.name ExpressionTest0234
     * @tc.desc Test right shift with shift amount larger than bit length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0b111;
      let result: number = a >> 5;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0235
     * @tc.name ExpressionTest0235
     * @tc.desc Test unsigned right shift with shift amount 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: int = -2147483648;
      let result: int = a >>> 31;
      let expected: int = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0236
     * @tc.name ExpressionTest0236
     * @tc.desc Test conditional operator with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let add: (a: number, b: number) => number = (a: number, b: number): number => {
        return a + b;
      };
      let multiply: (a: number, b: number) => number = (a: number, b: number): number => {
        return a * b;
      };
      let flag: boolean = false;
      let result: number = flag ? add(2, 3) : multiply(2, 3);
      let expected: number = 6;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0237
     * @tc.name ExpressionTest0237
     * @tc.desc Test comma operator in for loop with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getStart: () => number = (): number => {
        return 1;
      };
      let getEnd: () => number = (): number => {
        return 4;
      };
      let getStep: () => number = (): number => {
        return 1;
      };
      let sum: number = 0;
      let i: number, j: number;
      for (i = getStart(), j = getEnd(); i <= j; i += getStep(), j -= getStep()) {
        sum += i + j;
      }
      let expected: number = 10;
      expect(sum).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0238
     * @tc.name ExpressionTest0238
     * @tc.desc Test typeof with object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: TestObject1 = new TestObject1();
      let result: string = typeof obj;
      let expected: string = "object";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0239
     * @tc.name ExpressionTest0239
     * @tc.desc Test typeof with string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "hello";
      let result: string = typeof str;
      let expected: string = "string";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0240
     * @tc.name ExpressionTest0240
     * @tc.desc Test unary plus with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3.14;
      let result: number = +a;
      let expected: number = 3.14;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0241
     * @tc.name ExpressionTest0241
     * @tc.desc Test unary minus with decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3.14;
      let result: number = -a;
      let expected: number = -3.14;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0246
     * @tc.name ExpressionTest0246
     * @tc.desc Test operator precedence with multiple logical operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = false;
      let c: boolean = true;
      let d: boolean = false;
      let result: boolean = a || b && c || d;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0247
     * @tc.name ExpressionTest0247
     * @tc.desc Test optional chaining with array access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] | null = [10, 20, 30];
      let result1: number | undefined = getArrayElement(arr, 1);
      let nullArr: number[] | null = null;
      let result2 = getArrayElement(nullArr, 1);
      let expected1: number = 20;
      let expected2: undefined = undefined;
      expect(result1).assertEqual(expected1);
      expect(result2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0248
     * @tc.name ExpressionTest0248
     * @tc.desc Test comma operator in for loop with conditional updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 0;
      let y: number = 10;
      for (let i = 0; i < 3; i++, x += i % 2 === 0 ? 1 : 2, y -= 2) {
      }
      let expectedX: number = 5;
      let expectedY: number = 4;
      expect(x).assertEqual(expectedX);
      expect(y).assertEqual(expectedY);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0249
     * @tc.name ExpressionTest0249
     * @tc.desc Test operator precedence with assignment and comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 10;
      let result: boolean = (a = b) > 7;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0250
     * @tc.name ExpressionTest0250
     * @tc.desc Test comma operator in for loop with multiple conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      let i: number, j: number;
      for (i = 0, j = 0; i < 5 && j < 10; i++, j += 2) {
        count++;
      }
      let expected: number = 5;
      expect(count).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0251
     * @tc.name ExpressionTest0251
     * @tc.desc Test addition with Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let result: number = a + Number.EPSILON;
      let expected: boolean = result > a;
      expect(expected).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0252
     * @tc.name ExpressionTest0252
     * @tc.desc Test subtraction with Number.EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 1;
      let result: number = a - Number.EPSILON;
      let expected: boolean = result < a;
      expect(expected).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0253
     * @tc.name ExpressionTest0253
     * @tc.desc Test multiplication with -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -0.0;
      let b: number = 5;
      let result: number = a * b;
      let expected: number = -0.0;
      expect(1 / result).assertEqual(-Infinity); // Check for -0 specifically
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0254
     * @tc.name ExpressionTest0254
     * @tc.desc Test division of zero by negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = -5;
      let result: number = a / b;
      let expected: number = -0;
      expect(1 / result).assertEqual(-Infinity); // Check for -0 specifically
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0255
     * @tc.name ExpressionTest0255
     * @tc.desc Test modulus with negative divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = -3;
      let result: number = a % b;
      let expected: number = 1;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0256
     * @tc.name ExpressionTest0256
     * @tc.desc Test exponentiation with base 0 and positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: number = 3;
      let result: number = a**b;
      let expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0258
     * @tc.name ExpressionTest0258
     * @tc.desc Test postfix increment in nested function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let outer: (x: number) => number = (x: number): number => {
        return inner(x) * 2;
      };
      let result: number = outer(a++);
      let expected: number = 10;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0261
     * @tc.name ExpressionTest0261
     * @tc.desc Test assignment with nested function results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getBase: () => number = (): number => {
        return 10;
      };
      let getMultiplier: () => number = (): number => {
        return 3;
      };
      let getOffset: () => number = (): number => {
        return 5;
      };
      let result: number = 0;
      result = getBase() * getMultiplier() + getOffset();
      let expected: number = 35;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0262
     * @tc.name ExpressionTest0262
     * @tc.desc Test addition assignment with nested expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      a += b * c + (b + c);
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0263
     * @tc.name ExpressionTest0263
     * @tc.desc Test subtraction assignment with nested expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 20;
      let b: number = 4;
      let c: number = 2;
      a -= b / c + (b - c);
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0264
     * @tc.name ExpressionTest0264
     * @tc.desc Test multiplication assignment with logical result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let result: number = 2;
      result *= a > b ? a - b : a + b;
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0265
     * @tc.name ExpressionTest0265
     * @tc.desc Test division assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 15; // 0b1111
      let b: number = 5; // 0b0101
      let result: number = 10;
      result /= a & b;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0266
     * @tc.name ExpressionTest0266
     * @tc.desc Test modulus assignment with exponentiation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = 3;
      let exponent: number = 3;
      let a: number = 30;
      a %= base**exponent;
      expect(a).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0267
     * @tc.name ExpressionTest0267
     * @tc.desc Test exponentiation assignment with shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2;
      let shift: number = 3;
      let base: number = 2;
      base **= a << shift;
      expect(base).assertEqual(65536);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0268
     * @tc.name ExpressionTest0268
     * @tc.desc Test strict equality with different numeric representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 5.000000000000001;
      let result: boolean = a === b;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0269
     * @tc.name ExpressionTest0269
     * @tc.desc Test strict inequality with same numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 10.0;
      let result: boolean = a !== b;
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0271
     * @tc.name ExpressionTest0271
     * @tc.desc Test greater than with Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MAX_SAFE_INTEGER;
      let b: number = Number.MAX_SAFE_INTEGER + 1;
      let result: boolean = a > b;
      expect(result).assertFalse(); // Because beyond safe integer, precision is lost
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0272
     * @tc.name ExpressionTest0272
     * @tc.desc Test less than with Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = Number.MIN_SAFE_INTEGER;
      let b: number = Number.MIN_SAFE_INTEGER - 1;
      let result: boolean = a < b;
      expect(result).assertFalse(); // Because beyond safe integer, precision is lost
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0273
     * @tc.name ExpressionTest0273
     * @tc.desc Test greater than or equal with non-integer comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 3.1415926535;
      let b: number = 3.1415926534;
      let result: boolean = a >= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0274
     * @tc.name ExpressionTest0274
     * @tc.desc Test less than or equal with non-integer comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 2.7182818284;
      let b: number = 2.7182818285;
      let result: boolean = a <= b;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0275
     * @tc.name ExpressionTest0275
     * @tc.desc Test logical AND with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj1: Data1 = new Data1(5);
      let obj2: Data1 = new Data1(10);
      let result: boolean = obj1.value > 0 && obj2.value > 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0276
     * @tc.name ExpressionTest0276
     * @tc.desc Test logical AND with mixed number and boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: boolean = true;
      let result: boolean = Boolean(a && b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0277
     * @tc.name ExpressionTest0277
     * @tc.desc Test logical OR with object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj1: Data2 = new Data2(0);
      let obj2: Data2 = new Data2(10);
      let result: boolean = obj1.value > 0 || obj2.value > 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0278
     * @tc.name ExpressionTest0278
     * @tc.desc Test logical OR with mixed number and boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      let b: boolean = true;
      let result: boolean = Boolean(a || b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0279
     * @tc.name ExpressionTest0279
     * @tc.desc Test bitwise AND with sign extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000.toInt(); // Negative in 32-bit
      let b: number = 0xFFFFFF00.toInt();
      let result: number = a & b;
      let expected: number = -2147483648;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0280
     * @tc.name ExpressionTest0280
     * @tc.desc Test bitwise OR with sign extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000.toInt(); // -2147483648
      let b: number = 0x000000FF; // 255
      let result: number = a | b;
      let expected: number = -2147483393;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0281
     * @tc.name ExpressionTest0281
     * @tc.desc Test bitwise XOR with sign bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000.toInt(); // Negative in 32-bit
      let b: number = 0xFFFFFFFF.toInt();
      let result: number = a ^ b;
      let expected: number = 0x7FFFFFFF;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0282
     * @tc.name ExpressionTest0282
     * @tc.desc Test bitwise NOT with sign bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x40000000;
      let result: number = ~a;
      let expected: number = -0x40000001;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0283
     * @tc.name ExpressionTest0283
     * @tc.desc Test left shift with sign bit set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: int = 0x40000000;
      let result: int = (a << 1) >>> 0;
      let expected: int = 0x80000000.toInt();
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0284
     * @tc.name ExpressionTest0284
     * @tc.desc Test right shift with sign preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0x80000000.toInt();
      let result: number = a >> 1;
      let expected: number = -1073741824;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0285
     * @tc.name ExpressionTest0285
     * @tc.desc Test unsigned right shift with large number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: int = 0x80000000.toInt();
      let result: int = a >>> 2;
      let expected: int = 0x20000000;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0286
     * @tc.name ExpressionTest0286
     * @tc.desc Test conditional operator with nested conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 10;
      let c: number = 15;
      let result: number = a > b ? a : (b > c ? b : c);
      let expected: number = 15;
      expect(result).assertEqual(expected);
    });


    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0288
     * @tc.name ExpressionTest0288
     * @tc.desc Test typeof with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: boolean = true;
      let result: string = typeof flag;
      let expected: string = "boolean";
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0289
     * @tc.name ExpressionTest0289
     * @tc.desc Test typeof with null (special case)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val: null = null;
      let result: string = typeof val;
      let expected: string = "object"; // Known JavaScript quirk
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0290
     * @tc.name ExpressionTest0290
     * @tc.desc Test unary plus with large integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 9876543210;
      let result: number = +a;
      let expected: number = 9876543210;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0291
     * @tc.name ExpressionTest0291
     * @tc.desc Test unary minus with large integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 9876543210;
      let result: number = -a;
      let expected: number = -9876543210;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0296
     * @tc.name ExpressionTest0296
     * @tc.desc Test operator precedence with parentheses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      let result1: number = a + b * c;
      let result2: number = (a + b) * c;
      expect(result1).assertEqual(11);
      expect(result2).assertEqual(16);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0297
     * @tc.name ExpressionTest0297
     * @tc.desc Test optional chaining with function calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let calc: Calculator9 | null = new Calculator9();
      let result1: number | undefined = calc?.add(2, 3);
      expect(result1).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0298
     * @tc.name ExpressionTest0298
     * @tc.desc Test comma operator in for loop with multiple counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum1: number = 0;
      let sum2: number = 0;
      let sum3: number = 0;
      let i: number, j: number, k: number;
      for (i = 1, j = 2, k = 3; i <= 3; i++, j += 2, k *= 2) {
        sum1 += i;
        sum2 += j;
        sum3 += k;
      }
      expect(sum1).assertEqual(6); // 1+2+3
      expect(sum2).assertEqual(12); // 2+4+6
      expect(sum3).assertEqual(21); // 3+6+12
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0299
     * @tc.name ExpressionTest0299
     * @tc.desc Test operator precedence with logical and arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;
      let result: boolean = a > b + c;
      expect(result).assertFalse(); // 5 > 5 is false
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0300
     * @tc.name ExpressionTest0300
     * @tc.desc Test comma operator in for loop with complex condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let product: number = 1;
      let i: number, j: number;
      for (i = 1, j = 1; i <= 5 && j <= 120; i++, j *= i) {
        product *= j;
      }
      expect(product).assertEqual(34560);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0301
     * @tc.name ExpressionTest0301
     * @tc.desc Test bitwise AND with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const b: number = -3; // 0b11111111111111111111111111111101
      const result: number = a & b;
      const expected: number = -7; // 0b11111111111111111111111111111001
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0302
     * @tc.name ExpressionTest0302
     * @tc.desc Test bitwise AND with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10; // 0b00000000000000000000000000001010
      const b: number = -10; // 0b11111111111111111111111111110110
      const result: number = a & b;
      const expected: number = 2; // 0b00000000000000000000000000000010
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0303
     * @tc.name ExpressionTest0303
     * @tc.desc Test bitwise OR with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const b: number = -3; // 0b11111111111111111111111111111101
      const result: number = a | b;
      const expected: number = -1; // 0b11111111111111111111111111111111
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0304
     * @tc.name ExpressionTest0304
     * @tc.desc Test bitwise OR with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10; // 0b00000000000000000000000000001010
      const b: number = -10; // 0b11111111111111111111111111110110
      const result: number = a | b;
      const expected: number = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0305
     * @tc.name ExpressionTest0305
     * @tc.desc Test bitwise XOR with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const b: number = -3; // 0b11111111111111111111111111111101
      const result: number = a ^ b;
      const expected: number = 6; // 0b00000000000000000000000000000110
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0306
     * @tc.name ExpressionTest0306
     * @tc.desc Test bitwise XOR with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = -10;
      const result: number = a ^ b;
      const expected: number = -4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0307
     * @tc.name ExpressionTest0307
     * @tc.desc Test bitwise NOT with maximum 32-bit signed integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 2147483647; // 0b01111111111111111111111111111111
      const result: number = ~a;
      const expected: number = -2147483648; // 0b10000000000000000000000000000000
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0308
     * @tc.name ExpressionTest0308
     * @tc.desc Test bitwise NOT with minimum 32-bit signed integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -2147483648; // 0b10000000000000000000000000000000
      const result: number = ~a;
      const expected: number = 2147483647; // 0b01111111111111111111111111111111
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0309
     * @tc.name ExpressionTest0309
     * @tc.desc Test left shift with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5; // 0b11111111111111111111111111111011
      const result: number = a << 2;
      const expected: number = -20; // 0b11111111111111111111111111101100
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0310
     * @tc.name ExpressionTest0310
     * @tc.desc Test left shift overflow with positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: int = 1073741824; // 0b01000000000000000000000000000000
      const result: int = a << 1;
      const expected: int = -2147483648; // Overflow becomes negative
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0311
     * @tc.name ExpressionTest0311
     * @tc.desc Test right shift with negative numbers (sign preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -20; // 0b11111111111111111111111111101100
      const result: number = a >> 2;
      const expected: number = -5; // 0b11111111111111111111111111111011
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0312
     * @tc.name ExpressionTest0312
     * @tc.desc Test right shift with positive number to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const result: number = a >> 4;
      const expected: number = 0;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0313
     * @tc.name ExpressionTest0313
     * @tc.desc Test arithmetic operations with bitwise results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: number = (a & b) + (a | b);
      const expected: number = a + b;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0314
     * @tc.name ExpressionTest0314
     * @tc.desc Test multiplication with bitwise AND result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 9;
      const c: number = 4;
      const result: number = (a & b) * c;
      const expected: number = 36;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0315
     * @tc.name ExpressionTest0315
     * @tc.desc Test division with bitwise OR result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 3;
      const c: number = 4;
      const result: number = (a | b) / c;
      const expected: number = 1.75;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0316
     * @tc.name ExpressionTest0316
     * @tc.desc Test modulus with bitwise XOR result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 5;
      const result: number = (a ^ b) % c;
      const expected: number = 4;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0317
     * @tc.name ExpressionTest0317
     * @tc.desc Test exponentiation with bitwise NOT result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: int = 3;
      const b: int = 2;
      const result: number = (~a)**b;
      const expected: int = 16;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0318
     * @tc.name ExpressionTest0318
     * @tc.desc Test addition assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      const b: number = 5;
      const c: number = 3;
      a += b & c;
      const expected: number = 11;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0319
     * @tc.name ExpressionTest0319
     * @tc.desc Test subtraction assignment with bitwise result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      const b: number = 5;
      const c: number = 3;
      a -= b | c;
      const expected: number = 3;
      expect(a).assertEqual(expected);
    });

    /**
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0320
     * @tc.name ExpressionTest0320
     * @tc.desc Test multiplication assignment with shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExpressionTest0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 4;
      const b: number = 3;
      a *= b << 1;
      const expected: number = 24;
      expect(a).assertEqual(expected);
    });
  })
}