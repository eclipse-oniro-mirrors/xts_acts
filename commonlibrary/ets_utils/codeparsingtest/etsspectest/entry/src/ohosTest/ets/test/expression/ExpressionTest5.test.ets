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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

interface GeneratedTypeLiteralInterface_6 {
  enabled?: boolean;
}

interface GeneratedTypeLiteralInterface_12 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_33 {
  value: number;
  shift: number;
}

interface GeneratedTypeLiteralInterface_43 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_40 {
  score: number;
}

interface GeneratedTypeLiteralInterface_45 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_46 {
  items: string[];
}

interface GeneratedTypeLiteralInterface_48 {
  value: number;
  shift: number;
}

interface GeneratedTypeLiteralInterface_50 {
  temp: number;
}

interface GeneratedTypeLiteralInterface_52 {
  list: number[];
}

interface GeneratedTypeLiteralInterface_54 {
  a: number;
  b: number;
  result: number;
}

interface GeneratedTypeLiteralInterface_55 {
  role: string;
  accessLevel: number;
}

interface GeneratedTypeLiteralInterface_57 {
  value: number;
  mask: number;
}

interface GeneratedTypeLiteralInterface_58 {
  value: number;
  log: string;
}

interface GeneratedTypeLiteralInterface_9 {
  price: string;
  quantity: string;
}

interface GeneratedTypeLiteralInterface_10 {
  loginCount: number;
  points: number;
}

interface GeneratedTypeLiteralInterface_25 {
  seconds: number;
  interval: number;
}

interface GeneratedTypeLiteralInterface_20 {
  value: number;
}

interface GeneratedTypeLiteralInterface_32 {
  x: number;
  y: number;
}

interface GeneratedTypeLiteralInterface_36 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_37 {
  values: number[];
  threshold: number;
}

interface GeneratedTypeLiteralInterface_38 {
  dividend: number;
  divisor: number;
}

interface GeneratedTypeLiteralInterface_39 {
  num: number;
}

interface GeneratedTypeLiteralInterface_41 {
  arr: string[];
  x: number;
  y: number;
}

interface GeneratedTypeLiteralInterface_42 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_44 {
  value: number;
  min: number;
  max: number;
}

interface GeneratedTypeLiteralInterface_49 {
  x: number;
  y: number;
}

interface GeneratedTypeLiteralInterface_53 {
  values: number[];
  sum: number;
  multiplier: number;
}

interface GeneratedTypeLiteralInterface_51 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_47 {
  grade: number;
}

interface GeneratedTypeLiteralInterface_35 {
  a: number;
  b: number;
}

interface GeneratedTypeLiteralInterface_5 {
  age?: number;
}

interface GeneratedTypeLiteralInterface_13 {
  title: string;
  pages: number;
  author: string;
}

interface GeneratedTypeLiteralInterface_7 {
  scores: number[];
}

interface GeneratedTypeLiteralInterface_14 {
  wins: number;
  losses: number;
}

interface GeneratedTypeLiteralInterface_11 {
  debug?: boolean;
}

interface GeneratedTypeLiteralInterface_16 {
  balance: number;
  isActive: boolean;
  type: string;
}

interface GeneratedTypeLiteralInterface_26 {
  theme?: string;
}

interface GeneratedTypeLiteralInterface_27 {
  user: number;
  admin: number;
}

interface GeneratedTypeLiteralInterface_30 {
  base: number;
  exponent: number;
}

interface GeneratedTypeLiteralInterface_34 {
  toCelsius: (f: number) => number;
}

interface GeneratedTypeLiteralInterface_19 {
  add: (a: number, b: number) => number;
  multiply: (a: number, b: number) => number;
}

interface GeneratedTypeLiteralInterface_21 {
  quantity: number;
}

interface GeneratedTypeLiteralInterface_8 {
  name: string;
  age: number;
}

interface GeneratedTypeLiteralInterface_22 {
  score: number;
  level: number;
}

interface GeneratedTypeLiteralInterface_23 {
  price: number;
}

interface GeneratedTypeLiteralInterface_24 {
  price: number;
}

interface GeneratedTypeLiteralInterface_18 {
  speed: number;
}

interface GeneratedTypeLiteralInterface_17 {
  isAdmin: boolean;
  hasPermission: boolean;
  role: string;
}

interface GeneratedTypeLiteralInterface_15 {
  values: number[];
}

interface GeneratedTypeLiteralInterface_28 {
  values: number[];
  offset: number;
}

interface GeneratedTypeLiteralInterface_31 {
  a: number;
  b: number;
  c: number;
}

interface GeneratedTypeLiteralInterface_29 {
  maxSize?: number;
}

export default function expressionTest5() {
  describe('ExpressionTest5', () => {
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
     * @tc.name   ExpressionTest0741
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0741
     * @tc.desc   Test range check with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0741', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const percentage: number = 75;
      const result: boolean = percentage >= 70 && percentage < 80;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0742
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0742
     * @tc.desc   Test string length with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0742', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const result: number = (str.length / 2) | 0x0F;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0743
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0743
     * @tc.desc   Test nested ternary with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0743', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const weight: number = 75;
      const height: number = 1.8;
      const bmi: number = weight / (height * height);
      const result: string = bmi > 30 ? "Obese" :
        bmi > 25 ? "Overweight" :
          bmi > 18.5 ? "Normal" : "Underweight";
      expect(result).assertEqual("Normal");
    });

    /**
     * @tc.name   ExpressionTest0744
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0744
     * @tc.desc   Test comma operator in for loop with multiple variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0744', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = 5, j = 1; i >= 1; i--, j *= 2) {
        result += i * j;
      }
      expect(result).assertEqual(5 * 1 + 4 * 2 + 3 * 4 + 2 * 8 + 1 * 16);
    });

    /**
     * @tc.name   ExpressionTest0745
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0745
     * @tc.desc   Test string comparison with substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0745', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello TypeScript";
      const substr: string = "Type";
      const result: boolean = str.substring(6, 10) === substr;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0746
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0746
     * @tc.desc   Test unary operators with arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0746', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 6;
      const result: number = ~num * 2 + (-num);
      expect(result).assertEqual(-20);
    });

    /**
     * @tc.name   ExpressionTest0747
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0747
     * @tc.desc   Test bitwise operations in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0747', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0b101101;
      const mask: number = 0b001000;
      const result: boolean = (value & mask) === 0;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0748
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0748
     * @tc.desc   Test string concatenation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0748', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 0;
      do {
        result += count % 2 === 0 ? "even" : "odd";
        result += count + " ";
        count++;
      } while (count < 4);
      expect(result).assertEqual("even0 odd1 even2 odd3 ");
    });

    /**
     * @tc.name   ExpressionTest0749
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0749
     * @tc.desc   Test comparison with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0749', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 30;
      const b: number = 17;
      const result: boolean = (a | b) < (a ^ b);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0750
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0750
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      let result: string = "";
      let i: number, step: number;
      for (i = 0, step = 1; i < str.length; i += step, step = step < 5 ? step + 1 : 1) {
        result += str[i];
      }
      expect(result).assertEqual("abdgkpqsvz");
    });

    /**
     * @tc.name   ExpressionTest0751
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0751
     * @tc.desc   Test string concatenation with multiple arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0751', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 3;
      const result: string = "Result: " + (a + b) + ", " + (a - b) + ", " + (a * b) + ", " + (a / b);
      expect(result).assertEqual("Result: 18, 12, 45, 5");
    });

    /**
     * @tc.name   ExpressionTest0752
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0752
     * @tc.desc   Test unary minus with logical operations in ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0752', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 7;
      const result: number = -num > -10 ? 1 : 0;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest0753
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0753
     * @tc.desc   Test comma operator in for loop with array indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0753', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30, 40, 50, 60, 70];
      let result: number = 0;
      let i: number, step: number;
      for (i = 0, step = 2; i < arr.length; i += step, step = Math.min(step + 1, 3)) {
        result += arr[i];
      }
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   ExpressionTest0754
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0754
     * @tc.desc   Test logical NOT with object property check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0754', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const user: GeneratedTypeLiteralInterface_5 = { age: 25 };
      const result: boolean = !(user.age === undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0755
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0755
     * @tc.desc   Test bitwise OR with range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0755', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0b1010;
      const b: number = 0b0111;
      const result: boolean = (a | b) >= 0b1111 && (a | b) <= 0b1111;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0756
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0756
     * @tc.desc   Test string template with conditional expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0756', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temperature: number = 32;
      const result: string = `${temperature}°C is ${temperature > 30 ? 'hot' : temperature > 20 ? 'warm' : 'cool'}`;
      expect(result).assertEqual("32°C is hot");
    });

    /**
     * @tc.name   ExpressionTest0757
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0757
     * @tc.desc   Test unary plus with string to number conversion in arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0757', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "123";
      const str2: string = "45";
      const result: number = +Number(str1) - +Number(str2);
      expect(result).assertEqual(78);
    });

    /**
     * @tc.name   ExpressionTest0758
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0758
     * @tc.desc   Test array length with arithmetic in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0758', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      let result: number = 0;
      for (let i = 0; i < arr.length / 2; i++) {
        result += arr[i];
      }
      expect(result).assertEqual(1 + 2 + 3 + 4 + 5);
    });

    /**
     * @tc.name   ExpressionTest0759
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0759
     * @tc.desc   Test logical AND with mixed conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0759', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 17;
      const str: string = "test";
      const result: boolean = num > 10 && str.length === 4 && num % 2 === 1;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0760
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0760
     * @tc.desc   Test logical OR with mixed conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flag: boolean = false;
      const value: number = 5;
      const result: boolean = flag || value < 3 || value > 4;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0761
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0761
     * @tc.desc   Test compound assignment with modulus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0761', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 100;
      const divisor: number = 13;
      value %= divisor;
      value += 5;
      value %= divisor;
      expect(value).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest0762
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0762
     * @tc.desc   Test string template with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0762', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0b1010;
      const b: number = 0b0110;
      const result: string = `${a} & ${b} = ${a & b}, ${a} | ${b} = ${a | b}, ${a} ^ ${b} = ${a ^ b}`;
      expect(result).assertEqual("10 & 6 = 2, 10 | 6 = 14, 10 ^ 6 = 12");
    });

    /**
     * @tc.name   ExpressionTest0763
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0763
     * @tc.desc   Test prefix decrement in arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0763', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      const result: number = --num * 2 + --num;
      expect(result).assertEqual(26);
      expect(num).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest0764
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0764
     * @tc.desc   Test postfix increment in expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0764', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 3;
      const result: number = num++ * 5 + num++;
      expect(result).assertEqual(19);
      expect(num).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0765
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0765
     * @tc.desc   Test comma operator in for loop with multiple counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0765', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = 1, j = 10; i <= 5; i++, j -= 2) {
        result += i * j;
      }
      expect(result).assertEqual(1 * 10 + 2 * 8 + 3 * 6 + 4 * 4 + 5 * 2);
    });

    /**
     * @tc.name   ExpressionTest0766
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0766
     * @tc.desc   Test string comparison with case transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0766', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "HELLO";
      const result: boolean = str1.toLowerCase() === str2.toLowerCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0767
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0767
     * @tc.desc   Test modulus with array indices in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0767', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let result: number = 0;
      for (let i = 0; i < arr.length; i++) {
        if (i % 3 === 0) {
          result += arr[i];
        }
      }
      expect(result).assertEqual(10 + 40 + 70 + 100);
    });

    /**
     * @tc.name   ExpressionTest0768
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0768
     * @tc.desc   Test nullish coalescing with boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0768', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const config: GeneratedTypeLiteralInterface_6 = { enabled: false };
      const defaultValue: boolean = true;
      const result: boolean = config.enabled ?? defaultValue;
      expect (result).assertEqual (false);
    });

    /**
     * @tc.name   ExpressionTest0769
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0769
     * @tc.desc   Test bitwise operations with positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0769', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = -7;
      const result: number = a & b;
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ExpressionTest0770
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0770
     * @tc.desc   Test array index with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
      let index: number = 2;
      index = index * 2 + 1;
      const result: string = arr[index];
      expect(result).assertEqual("f");
    });

    /**
     * @tc.name   ExpressionTest0771
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0771
     * @tc.desc   Test logical OR assignment with boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0771', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flag: boolean = false;
      const override: boolean = true;
      flag ||= override;
      expect(flag).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0773
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0773
     * @tc.desc   Test comparison with right shift results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0773', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 64;
      const b: number = 3;
      const result: boolean = (a >> b) === 8;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0774
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0774
     * @tc.desc   Test string concatenation with modulus operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0774', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dividend: number = 25;
      const divisor: number = 7;
      const result: string = dividend + " divided by " + divisor +
        " is " + Math.floor(dividend / divisor) +
        " with remainder " + (dividend % divisor);
      expect(result).assertEqual("25 divided by 7 is 3 with remainder 4");
    });

    /**
     * @tc.name   ExpressionTest0775
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0775
     * @tc.desc   Test operator precedence with mixed operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0775', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a % b + c;
      const result2: number = a % (b + c);
      expect(result1).assertEqual(1 + 2);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest0776
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0776
     * @tc.desc   Test grouped expressions in template with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0776', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [5, 8, 3, 12, 6];
      const index1: number = 1;
      const index2: number = 3;
      const result: string = `arr[${index1}] + arr[${index2}] = ${arr[index1] + arr[index2]}, ` +
        `arr[${index1}] * arr[${index2}] = ${arr[index1] * arr[index2]}`;
      expect(result).assertEqual("arr[1] + arr[3] = 20, arr[1] * arr[3] = 96");
    });

    /**
     * @tc.name   ExpressionTest0777
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0777
     * @tc.desc   Test array method with arithmetic parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0777', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30, 40, 50, 60, 70, 80];
      const start: number = 2;
      const count: number = 2;
      const result: number[] = arr.slice(start, start + count * 2);
      expect(result).assertDeepEquals([30, 40, 50, 60]);
    });

    /**
     * @tc.name   ExpressionTest0778
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0778
     * @tc.desc   Test unary plus with arithmetic in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0778', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "15";
      const str2: string = "7";
      const result: string = `+${str1} + +${str2} = ${+Number(str1) + +Number(str2)}`;
      expect(result).assertEqual("+15 + +7 = 22");
    });

    /**
     * @tc.name   ExpressionTest0779
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0779
     * @tc.desc   Test comparison with bitwise complement results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0779', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: boolean = ~a < ~b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0780
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0780
     * @tc.desc   Test compound assignment with division
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 100;
      num /= 4;
      num += 5;
      num /= 3;
      expect(num).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0781
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0781
     * @tc.desc   Test array manipulation with loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0781', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number[] = [];
      for (let i = 0; i < arr.length; i++) {
        if (arr[i] % 2 === 0 && arr[i] > 5) {
          result.push(arr[i]);
        }
      }
      expect(result).assertDeepEquals([6, 8, 10]);
    });

    /**
     * @tc.name   ExpressionTest0782
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0782
     * @tc.desc   Test modulus with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0782', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 37;
      const result: boolean = num % 3 === 1 && num % 4 === 1 && num % 5 === 2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0783
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0783
     * @tc.desc   Test string concatenation with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0783', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fruits: string[] = ["apple", "banana", "cherry"];
      const index: number = 1;
      const result: string = "I like " + fruits[index] + "s, they have " + fruits[index].length + " letters";
      expect(result).assertEqual("I like bananas, they have 6 letters");
    });

    /**
     * @tc.name   ExpressionTest0784
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0784
     * @tc.desc   Test comparison with exponentiation results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0784', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 3;
      const exp: number = 4;
      const result: boolean = base**exp === 81;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0785
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0785
     * @tc.desc   Test template string with array expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0785', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numbers: number[] = [4, 7, 2, 9, 5];
      const result: string = `Max: ${Math.max(...numbers)}, Sum: ${numbers[0] + numbers[1] + numbers[2]}`;
      expect(result).assertEqual("Max: 9, Sum: 13");
    });

    /**
     * @tc.name   ExpressionTest0786
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0786
     * @tc.desc   Test array length with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0786', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number = arr.length << 1;
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   ExpressionTest0787
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0787
     * @tc.desc   Test array index with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0787', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
      const a: number = 5;
      const b: number = 2;
      const result: string = arr[a ^ b];
      expect(result).assertEqual("seven");
    });

    /**
     * @tc.name   ExpressionTest0788
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0788
     * @tc.desc   Test template string with array manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0788', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: number[] = [10, 20, 30, 40, 50];
      const index: number = 2;
      const result: string = `values[${index}] = ${values[index]}, values[${index}] * 2 = ${values[index] * 2}`;
      expect(result).assertEqual("values[2] = 30, values[2] * 2 = 60");
    });

    /**
     * @tc.name   ExpressionTest0789
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0789
     * @tc.desc   Test comparison with array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0789', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const threshold: number = 4;
      const result: boolean = arr.length > threshold;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0790
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0790
     * @tc.desc   Test array concatenation with conditional results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numbers: number[] = [1, 2, 3, 4, 5];
      const filter: number = 3;
      let result: string = "Numbers ";
      result += numbers.filter(n => n > filter).join(", ") + " are greater than " + filter;
      expect(result).assertEqual("Numbers 4, 5 are greater than 3");
    });

    /**
     * @tc.name   ExpressionTest0791
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0791
     * @tc.desc   Test range check with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0791', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 17;
      const min: number = 10;
      const max: number = 20;
      const result: boolean = value >= min && value <= max;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0792
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0792
     * @tc.desc   Test array length with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0792', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
      const result: number = (arr.length * 2) & 0x0F;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest0793
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0793
     * @tc.desc   Test nested ternary with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0793', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stats: GeneratedTypeLiteralInterface_7 = { scores: [85, 92, 78, 90, 88] };
      const avg: number = stats.scores.reduce((sum, score) => sum + score, 0) / stats.scores.length;
      const result: string = avg >= 90 ? "A" :
        avg >= 80 ? "B" :
          avg >= 70 ? "C" : "D";
      expect(result).assertEqual("B");
    });

    /**
     * @tc.name   ExpressionTest0794
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0794
     * @tc.desc   Test comma operator in for loop with array manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0794', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number[] = [];
      let i: number, multiplier: number;
      for (i = 0, multiplier = 1; i < arr.length; i += 2, multiplier *= 2) {
        result.push(arr[i] * multiplier);
      }
      expect(result).assertDeepEquals([1 * 1, 3 * 2, 5 * 4, 7 * 8, 9 * 16]);
    });

    /**
     * @tc.name   ExpressionTest0795
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0795
     * @tc.desc   Test string comparison with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0795', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const words: string[] = ["apple", "banana", "cherry", "date"];
      const target: string = "cherry";
      let result: boolean = false;
      for (let i = 0; i < words.length; i++) {
        if (words[i] === target) {
          result = true;
          break;
        }
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0796
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0796
     * @tc.desc   Test unary operators with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0796', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [5, 3, 8, 2];
      let num: number = arr[0];
      const result: number = ~num + (-arr[1]) * arr[2];
      expect(result).assertEqual(-30);
    });

    /**
     * @tc.name   ExpressionTest0797
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0797
     * @tc.desc   Test bitwise operations with array values in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0797', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: number[] = [0b1010, 0b0110, 0b1100];
      const mask: number = 0b1000;
      let result: number = 0;
      for (let i = 0; i < flags.length; i++) {
        if ((flags[i] & mask) !== 0) {
          result++;
        }
      }
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0798
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0798
     * @tc.desc   Test array manipulation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0798', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      let count: number = 1;
      while (count <= 5) {
        arr.push(count * 3);
        count++;
      }
      expect(arr).assertDeepEquals([3, 6, 9, 12, 15]);
    });

    /**
     * @tc.name   ExpressionTest0799
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0799
     * @tc.desc   Test comparison with array value transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0799', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number[] = [12, 5];
      const b: number[] = [3, 8];
      const result: boolean = (a[0] / a[1]) > (b[0] * b[1]);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0800
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0800
     * @tc.desc   Test comma operator in for loop with array filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      const result: number[] = [];
      let i: number, threshold: number;
      for (i = 0, threshold = 4; i < arr.length; i++, threshold = 4) {
        if (arr[i] > threshold) {
          result.push(arr[i]);
        }
      }
      expect(result).assertDeepEquals([5, 6, 7, 8, 9, 10, 11, 12]);
    });

    /**
     * @tc.name   ExpressionTest0801
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0801
     * @tc.desc   Test string concatenation with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const person: GeneratedTypeLiteralInterface_8 = { name: "Alice", age: 30 };
      const result: string = person.name + " is " + person.age + " years old";
      expect(result).assertEqual("Alice is 30 years old");
    });

    /**
     * @tc.name   ExpressionTest0802
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0802
     * @tc.desc   Test unary plus with object properties in arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0802', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const product: GeneratedTypeLiteralInterface_9 = { price: "19.99", quantity: "3" };
      const total: number = +Number(product.price) * +Number(product.quantity);
      expect(total).assertClose(59.97, 0.001);
    });

    /**
     * @tc.name   ExpressionTest0803
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0803
     * @tc.desc   Test comma operator in for loop with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0803', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const user: GeneratedTypeLiteralInterface_10 = { loginCount: 0, points: 100 };
      let result: string = "";
      let i: number, multiplier: number;
      for (i = 0, multiplier = 1; i < 5; i++, user.loginCount++, multiplier *= 2) {
        user.points += 5 * multiplier;
        result += `Login ${user.loginCount}: ${user.points}, `;
      }
      expect(result).assertEqual("Login 0: 105, Login 1: 115, Login 2: 135, Login 3: 175, Login 4: 255, ");
    });

    /**
     * @tc.name   ExpressionTest0804
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0804
     * @tc.desc   Test logical NOT with object property check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0804', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const config: GeneratedTypeLiteralInterface_11 = { debug: false };
      const result: boolean = !config.debug;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0805
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0805
     * @tc.desc   Test bitwise XOR with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0805', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: GeneratedTypeLiteralInterface_12 = { a: 0b1010, b: 0b0111 };
      const result: number = flags.a ^ flags.b;
      expect(result).assertEqual(0b1101);
    });

    /**
     * @tc.name   ExpressionTest0806
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0806
     * @tc.desc   Test string template with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0806', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const book: GeneratedTypeLiteralInterface_13 = {
        title: "The Hobbit",
        pages: 310,
        author: "J.R.R. Tolkien"
      };
      const result: string = `${book.title} by ${book.author} has ${book.pages} pages`;
      expect(result).assertEqual("The Hobbit by J.R.R. Tolkien has 310 pages");
    });

    /**
     * @tc.name   ExpressionTest0807
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0807
     * @tc.desc   Test unary minus with object properties in arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0807', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stats: GeneratedTypeLiteralInterface_14 = { wins: 15, losses: 5 };
      const result: number = -(stats.wins - stats.losses) / 2;
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.name   ExpressionTest0808
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0808
     * @tc.desc   Test object property access with arithmetic in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_15 = { values: [10, 20, 30, 40, 50] };
      let result: number = 0;
      for (let i = 0; i < data.values.length; i++) {
        result += data.values[i] * (i + 1);
      }
      expect(result).assertEqual(10 * 1 + 20 * 2 + 30 * 3 + 40 * 4 + 50 * 5);
    });

    /**
     * @tc.name   ExpressionTest0809
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0809
     * @tc.desc   Test logical AND with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const account: GeneratedTypeLiteralInterface_16 = {
        balance: 500,
        isActive: true,
        type: "premium"
      };
      const result: boolean = account.isActive && account.balance > 100 && account.type === "premium";
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0810
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0810
     * @tc.desc   Test logical OR with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const user: GeneratedTypeLiteralInterface_17 = {
        isAdmin: false,
        hasPermission: false,
        role: "editor"
      };
      const result: boolean = user.isAdmin || user.hasPermission || user.role === "editor";
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0811
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0811
     * @tc.desc   Test compound assignment with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0811', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const car: GeneratedTypeLiteralInterface_18 = { speed: 50 };
      car.speed += 20;
      car.speed *= 1.1;
      car.speed -= 5;
      expect(car.speed).assertEqual(72);
    });

    /**
     * @tc.name   ExpressionTest0812
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0812
     * @tc.desc   Test string template with object methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0812', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const calculator: GeneratedTypeLiteralInterface_19 = {
        add: (a, b) => a + b,
        multiply: (a, b) => a * b
      };
      const a: number = 5;
      const b: number = 3;
      const result: string = `${a} + ${b} = ${calculator.add(a, b)}, ${a} * ${b} = ${calculator.multiply(a, b)}`;
      expect(result).assertEqual("5 + 3 = 8, 5 * 3 = 15");
    });

    /**
     * @tc.name   ExpressionTest0813
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0813
     * @tc.desc   Test prefix increment with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0813', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter: GeneratedTypeLiteralInterface_20 = { value: 4 };
      const result: number = ++counter.value * 2 + ++counter.value;
      expect(result).assertEqual(16);
      expect(counter.value).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest0814
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0814
     * @tc.desc   Test postfix decrement with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0814', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stock: GeneratedTypeLiteralInterface_21 = { quantity: 10 };
      const result: number = stock.quantity-- * 2 + stock.quantity--;
      expect(result).assertEqual(29);
      expect(stock.quantity).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest0815
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0815
     * @tc.desc   Test comma operator in for loop with object updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0815', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const stats: GeneratedTypeLiteralInterface_22 = { score: 0, level: 1 };
      let i: number, multiplier: number;
      for (i = 0, multiplier = 10; i < 5; i++, stats.level++, multiplier += 5) {
        stats.score += stats.level * multiplier;
      }
      expect(stats.score).assertEqual(1 * 10 + 2 * 15 + 3 * 20 + 4 * 25 + 5 * 30);
    });

    /**
     * @tc.name   ExpressionTest0816
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0816
     * @tc.desc   Test object property comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0816', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const productA: GeneratedTypeLiteralInterface_23 = { price: 19.99 };
      const productB: GeneratedTypeLiteralInterface_24 = { price: 24.99 };
      const result: boolean = productA.price < productB.price;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0817
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0817
     * @tc.desc   Test modulus with object properties in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0817', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const timer: GeneratedTypeLiteralInterface_25 = { seconds: 0, interval: 3 };
      let result: string = "";
      while (timer.seconds < 15) {
        timer.seconds++;
        if (timer.seconds % timer.interval === 0) {
          result += timer.seconds + " ";
        }
      }
      expect(result).assertEqual("3 6 9 12 15 ");
    });

    /**
     * @tc.name   ExpressionTest0818
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0818
     * @tc.desc   Test nullish coalescing with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0818', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const settings: GeneratedTypeLiteralInterface_26 = {};
      const defaultTheme: string = "light";
      const result: string = settings.theme ?? defaultTheme;
      expect(result).assertEqual("light");
    });

    /**
     * @tc.name   ExpressionTest0819
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0819
     * @tc.desc   Test bitwise operations with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0819', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const permissions: GeneratedTypeLiteralInterface_27 = { user: 0b0011, admin: 0b1100 };
      const result: number = permissions.user | permissions.admin;
      expect(result).assertEqual(0b1111);
    });

    /**
     * @tc.name   ExpressionTest0820
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0820
     * @tc.desc   Test object property access with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_28 = { values: [10, 20, 30, 40, 50], offset: 1 };
      const index: number = 2;
      const result: number = data.values[index + data.offset];
      expect(result).assertEqual(40);
    });

    /**
     * @tc.name   ExpressionTest0821
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0821
     * @tc.desc   Test logical AND assignment with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0821', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const config: GeneratedTypeLiteralInterface_29 = { maxSize: 100 };
      const limit: number = 50;
      config.maxSize &&= limit;
      expect(config.maxSize).assertEqual(50);
    });

    /**
     * @tc.name   ExpressionTest0823
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0823
     * @tc.desc   Test comparison with object properties and bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0823', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const metrics: GeneratedTypeLiteralInterface_33 = { value: 16, shift: 3 };
      const result: boolean = (metrics.value >> metrics.shift) === 2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0824
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0824
     * @tc.desc   Test string concatenation with object properties and exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0824', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const math: GeneratedTypeLiteralInterface_30 = { base: 2, exponent: 10 };
      const result: string = math.base + " to the power of " + math.exponent + " is " + (math.base**math.exponent);
      expect(result).assertEqual("2 to the power of 10 is 1024");
    });

    /**
     * @tc.name   ExpressionTest0825
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0825
     * @tc.desc   Test operator precedence with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0825', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const calc: GeneratedTypeLiteralInterface_31 = { a: 20, b: 4, c: 2 };
      const result1: number = calc.a / calc.b + calc.c;
      const result2: number = calc.a / (calc.b + calc.c);
      expect(result1).assertEqual(5 + 2);
      expect(result2).assertEqual(3.3333333333333335);
    });

    /**
     * @tc.name   ExpressionTest0826
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0826
     * @tc.desc   Test grouped expressions in template with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0826', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_32 = { x: 6, y: 4 };
      const result: string =
        `${obj.x} + ${obj.y} * 2 = ${obj.x + obj.y * 2}, (${obj.x} + ${obj.y}) * 2 = ${(obj.x + obj.y) * 2}`;
      expect(result).assertEqual("6 + 4 * 2 = 14, (6 + 4) * 2 = 20");
    });

    /**
     * @tc.name   ExpressionTest0827
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0827
     * @tc.desc   Test object method with arithmetic parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0827', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const converter: GeneratedTypeLiteralInterface_34 = {
        toCelsius: (f) => (f - 32) * 5 / 9
      };
      const fahrenheit: number = 98.6;
      const result: number = converter.toCelsius(fahrenheit);
      expect(result).assertClose(37, 0.1);
    });

    /**
     * @tc.name   ExpressionTest0828
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0828
     * @tc.desc   Test unary minus with object properties in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0828', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const values: GeneratedTypeLiteralInterface_35 = { a: 15, b: 7 };
      const result: string = `-${values.a} + ${values.b} = ${-values.a + values.b}`;
      expect(result).assertEqual("-15 + 7 = -8");
    });

    /**
     * @tc.name   ExpressionTest0829
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0829
     * @tc.desc   Test comparison with unary operators on object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0829', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nums: GeneratedTypeLiteralInterface_36 = { a: 8, b: 5 };
      const result: boolean = ~nums.a < -nums.b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0830
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0830
     * @tc.desc   Test compound assignment with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const game: GeneratedTypeLiteralInterface_40 = { score: 50 };
      game.score += 25;
      game.score *= 2;
      game.score -= 30;
      expect(game.score).assertEqual(120);
    });

    /**
     * @tc.name   ExpressionTest0831
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0831
     * @tc.desc   Test object property manipulation with loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0831', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_37 = {
        values: [10, 25, 15, 30, 5, 35, 20],
        threshold: 20
      };
      let count: number = 0;
      for (let i = 0; i < data.values.length; i++) {
        if (data.values[i] > data.threshold) {
          count++;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0832
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0832
     * @tc.desc   Test modulus with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0832', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numbers: GeneratedTypeLiteralInterface_38 = { dividend: 47, divisor: 11 };
      const remainder: number = numbers.dividend % numbers.divisor;
      const result: boolean = remainder > 2 && remainder < 6;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0833
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0833
     * @tc.desc   Test string concatenation with object properties and bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0833', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bits: GeneratedTypeLiteralInterface_43 = { a: 23, b: 12 };
      const result: string = bits.a + " & " + bits.b + " = " + (bits.a & bits.b);
      expect(result).assertEqual("23 & 12 = 4");
    });

    /**
     * @tc.name   ExpressionTest0834
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0834
     * @tc.desc   Test comparison with bitwise complement on object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0834', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_39 = { num: 7 };
      const result: boolean = ~obj.num === -8;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0835
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0835
     * @tc.desc   Test template string with object properties and logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0835', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_45 = { a: 10, b: 3 };
      const result: string = `${obj.a} > ${obj.b}: ${obj.a > obj.b}, ${obj.a} % ${obj.b} = ${obj.a % obj.b}`;
      expect(result).assertEqual("10 > 3: true, 10 % 3 = 1");
    });

    /**
     * @tc.name   ExpressionTest0836
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0836
     * @tc.desc   Test array length from object with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0836', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const container: GeneratedTypeLiteralInterface_46 = { items: ["a", "b", "c", "d", "e", "f", "g"] };
      const result: number = container.items.length | 0x08;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0837
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0837
     * @tc.desc   Test array index from object with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0837', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_41 = {
        arr: ["zero", "one", "two", "three", "four", "five", "six"],
        x: 5,
        y: 3
      };
      const result: string = data.arr[data.x & data.y];
      expect(result).assertEqual("one");
    });

    /**
     * @tc.name   ExpressionTest0838
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0838
     * @tc.desc   Test template string with object properties and bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0838', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bits: GeneratedTypeLiteralInterface_48 = { value: 48, shift: 4 };
      const result: string = `${bits.value} >> ${bits.shift} = ${bits.value >> bits.shift}`;
      expect(result).assertEqual("48 >> 4 = 3");
    });

    /**
     * @tc.name   ExpressionTest0839
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0839
     * @tc.desc   Test comparison with bitwise shift on object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0839', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_42 = { a: 32, b: 5 };
      const result: boolean = (obj.a >> obj.b) === 0;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0840
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0840
     * @tc.desc   Test string concatenation with object properties and multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const weather: GeneratedTypeLiteralInterface_50 = { temp: 22 };
      const result: string = "Temperature " + weather.temp + "°C is " +
        (weather.temp > 25 ? "hot" :
          weather.temp > 18 ? "warm" :
            weather.temp > 10 ? "cool" : "cold");
      expect(result).assertEqual("Temperature 22°C is warm");
    });

    /**
     * @tc.name   ExpressionTest0841
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0841
     * @tc.desc   Test range check with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0841', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const test: GeneratedTypeLiteralInterface_44 = { value: 45, min: 40, max: 50 };
      const result: boolean = test.value >= test.min && test.value <= test.max;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0842
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0842
     * @tc.desc   Test array length from object with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0842', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const wrapper: GeneratedTypeLiteralInterface_52 = { list: [1, 2, 3, 4, 5, 6] };
      const result: number = (wrapper.list.length * 3) ^ 0x0F;
      expect(result).assertEqual(29);
    });

    /**
     * @tc.name   ExpressionTest0843
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0843
     * @tc.desc   Test nested ternary with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0843', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const student: GeneratedTypeLiteralInterface_47 = { grade: 82 };
      const result: string = student.grade >= 90 ? "A" :
        student.grade >= 80 ? "B" :
          student.grade >= 70 ? "C" :
            student.grade >= 60 ? "D" : "F";
      expect(result).assertEqual("B");
    });

    /**
     * @tc.name   ExpressionTest0844
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0844
     * @tc.desc   Test comma operator in for loop with multiple object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0844', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_54 = { a: 1, b: 10, result: 0 };
      let i: number, step: number;
      for (i = 0, step = 1; i < 5; i++, obj.a += step, obj.b -= step, step++) {
        obj.result += obj.a * obj.b;
      }
      expect(obj.result).assertEqual(1 * 10 + 2 * 9 + 4 * 7 + 7 * 4 + 11 * 0);
    });

    /**
     * @tc.name   ExpressionTest0845
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0845
     * @tc.desc   Test object property comparison with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0845', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const user: GeneratedTypeLiteralInterface_55 = { role: "moderator", accessLevel: 5 };
      const adminRole: string = "admin";
      const result: boolean = user.role === adminRole || user.accessLevel > 4;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0846
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0846
     * @tc.desc   Test unary operators with object properties in arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0846', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_49 = { x: 5, y: 3 };
      const result: number = ~data.x + (-data.y) * 2;
      expect(result).assertEqual(-12);
    });

    /**
     * @tc.name   ExpressionTest0847
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0847
     * @tc.desc   Test bitwise operations with object properties in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0847', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: GeneratedTypeLiteralInterface_57 = { value: 0b101101, mask: 0b001000 };
      const result: boolean = (flags.value & flags.mask) !== 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0848
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0848
     * @tc.desc   Test object property manipulation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0848', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const counter: GeneratedTypeLiteralInterface_58 = { value: 0, log: "" };
      do {
        counter.value++;
        counter.log += `Count: ${counter.value}, `;
      } while (counter.value < 3);
      expect(counter.log).assertEqual("Count: 1, Count: 2, Count: 3, ");
    });

    /**
     * @tc.name   ExpressionTest0849
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0849
     * @tc.desc   Test comparison with bitwise results from object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0849', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_51 = { a: 28, b: 15 };
      const result: boolean = (obj.a | obj.b) > (obj.a ^ obj.b);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0850
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0850
     * @tc.desc   Test comma operator in for loop with object manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: GeneratedTypeLiteralInterface_53 = {
        values: [1, 2, 3, 4, 5],
        sum: 0,
        multiplier: 1
      };
      let i: number, step: number;
      for (i = 0, step = 1; i < obj.values.length; i++, step++, obj.multiplier *= step) {
        obj.sum += obj.values[i] * obj.multiplier;
      }
      expect(obj.sum).assertEqual(719);
    });

    /**
     * @tc.name   ExpressionTest0851
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0851
     * @tc.desc   Test unary plus with string to number conversion in array operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0851', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number;
      let strArray: string[] = [];
      strArray = ["42", "15", "7"];
      numVar = 0;
      for (let i = 0; i < strArray.length; i++) {
        numVar += +Number(strArray[i]);
      }
      expect(numVar).assertEqual(64);
    });

    /**
     * @tc.name   ExpressionTest0852
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0852
     * @tc.desc   Test comma operator in for loop with array index manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0852', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number;
      let numArray: number[] = [];
      numArray = [10, 20, 30, 40, 50, 60, 70];
      numVar = 0;
      let i: number, step: number;
      for (i = 0, step = 2; i < numArray.length; i += step, step = step < 4 ? step + 1 : 1) {
        numVar += numArray[i];
      }
      expect(numVar).assertEqual(100);
    });

    /**
     * @tc.name   ExpressionTest0853
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0853
     * @tc.desc   Test logical NOT with array length check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0853', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boolVar: boolean;
      let numArray: number[] = [];
      numArray = [];
      boolVar = !numArray.length;
      expect(boolVar).assertTrue();
      numArray.push(1);
      boolVar = !numArray.length;
      expect(boolVar).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0854
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0854
     * @tc.desc   Test bitwise AND with range calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0854', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 0;
      for (let i = 0; i < 16; i++) {
        if ((i & 0x0F) === i) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(16);
    });

    /**
     * @tc.name   ExpressionTest0855
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0855
     * @tc.desc   Test string concatenation with array index and arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0855', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number;
      let strVar: string;
      let strArray: string[] = [];
      strArray = ["first", "second", "third", "fourth"];
      numVar = 1;
      strVar = strArray[numVar] + " item is at index " + numVar +
        ", length: " + strArray[numVar].length;
      expect(strVar).assertEqual("second item is at index 1, length: 6");
    });

    /**
     * @tc.name   ExpressionTest0856
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0856
     * @tc.desc   Test unary minus with arithmetic in ternary expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0856', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strVar: string = "";
      ;
      let numArray: number[] = [5, -3, 8, -2, 1];
      for (let i = 0; i < numArray.length; i++) {
        strVar += -numArray[i] > 0 ? "positive " : "non-positive ";
      }
      expect(strVar).assertEqual("non-positive positive non-positive positive non-positive ");
    });

    /**
     * @tc.name   ExpressionTest0857
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0857
     * @tc.desc   Test array length with division in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0857', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number;
      let numArray: number[] = [];
      numArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      numVar = 0;
      for (let i = 0; i < numArray.length / 3; i++) {
        numVar += numArray[i * 3];
      }
      expect(numVar).assertEqual(1 + 4 + 7 + 10);
    });

    /**
     * @tc.name   ExpressionTest0858
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0858
     * @tc.desc   Test logical AND with multiple array conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0858', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 0;
      let numArray: number[] = [12, 5, 18, 7, 21];
      for (let i = 0; i < numArray.length; i++) {
        if (numArray[i] > 10 && numArray[i] % 3 === 0) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0859
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0859
     * @tc.desc   Test logical OR with mixed array checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0859', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boolVar: boolean;
      let numArray: number[] = [];
      numArray = [3, 14, 7, 22, 5];
      boolVar = false;
      for (let i = 0; i < numArray.length; i++) {
        boolVar = boolVar || numArray[i] < 5 || numArray[i] > 20;
      }
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0860
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0860
     * @tc.desc   Test compound assignment with modulus in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 100;
      for (let i = 2; i <= 5; i++) {
        numVar %= i;
      }
      expect(numVar).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest0861
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0861
     * @tc.desc   Test string template with bitwise operations on array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0861', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strVar: string;
      let numArray: number[] = [0b1100, 0b0110];
      strVar = `${numArray[0]} | ${numArray[1]} = ${numArray[0] |
      numArray[1]}, ${numArray[0]} ^ ${numArray[1]} = ${numArray[0] ^ numArray[1]}`;
      expect(strVar).assertEqual("12 | 6 = 14, 12 ^ 6 = 10");
    });

    /**
     * @tc.name   ExpressionTest0862
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0862
     * @tc.desc   Test prefix decrement in array index calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0862', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 3;
      let numArray: number[] = [10, 20, 30, 40, 50];
      const result: number = numArray[--numVar] + numArray[--numVar];
      expect(result).assertEqual(50);
    });

    /**
     * @tc.name   ExpressionTest0863
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0863
     * @tc.desc   Test postfix increment with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0863', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 1;
      let numArray: number[] = [2, 4, 6, 8];
      const result: number = numArray[numVar++] * 2 + numArray[numVar++];
      expect(result).assertEqual(14);
      expect(numVar).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0864
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0864
     * @tc.desc   Test comma operator in for loop with dual counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0864', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 0;
      let numArray: number[] = [1, 2, 3, 4, 5, 6, 7, 8];
      let i: number, j: number;
      for (i = 0, j = numArray.length - 1; i < j; i++, j--) {
        numVar += numArray[i] * numArray[j];
      }
      expect(numVar).assertEqual(1 * 8 + 2 * 7 + 3 * 6 + 4 * 5);
    });

    /**
     * @tc.name   ExpressionTest0865
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0865
     * @tc.desc   Test string comparison with transformed array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0865', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boolVar: boolean = false;
      let strArray: string[] = ["Apple", "Banana", "apple", "Cherry"];
      const target: string = "apple";
      for (let i = 0; i < strArray.length; i++) {
        if (strArray[i].toLowerCase() === target) {
          boolVar = true;
          break;
        }
      }
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0866
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0866
     * @tc.desc   Test modulus with array indices in nested loops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0866', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 0;
      let numArray: number[] = [10, 20, 30, 40, 50, 60, 70, 80];
      for (let i = 0; i < 2; i++) {
        for (let j = 0; j < numArray.length; j++) {
          if (j % (i + 2) === 0) {
            numVar += numArray[j];
          }
        }
      }
      expect(numVar).assertEqual((10 + 30 + 50 + 70) + (10 + 40 + 70));
    });

    /**
     * @tc.name   ExpressionTest0867
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0867
     * @tc.desc   Test nullish coalescing with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0867', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 0;
      let mixedArray: (number | string | boolean)[] = [0, "", 5];
      const defaultValue: number = 10;
      for (let i = 0; i < mixedArray.length; i++) {
        numVar += (mixedArray[i] as number) ?? defaultValue;
      }
      expect(numVar).assertEqual("05");
    });

    /**
     * @tc.name   ExpressionTest0868
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0868
     * @tc.desc   Test bitwise operations with positive and negative array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0868', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 0;
      let numArray: number[] = [25, -10, 15, -5];
      for (let i = 0; i < numArray.length; i += 2) {
        numVar += numArray[i] & numArray[i + 1];
      }
      expect(numVar).assertEqual((25 & -10) + (15 & -5));
    });

    /**
     * @tc.name   ExpressionTest0869
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0869
     * @tc.desc   Test array index calculation with arithmetic expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0869', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 3;
      let strVar: string;
      let strArray: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];
      const index: number = (numVar * 2) - 1;
      strVar = strArray[index];
      expect(strVar).assertEqual("f");
    });

    /**
     * @tc.name   ExpressionTest0870
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0870
     * @tc.desc   Test logical OR assignment with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boolVar: boolean = false;
      boolVar ||= false;
      boolVar ||= true;
      boolVar ||= false;
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0871
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0871
     * @tc.desc   Test array index with right shift operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0871', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 32;
      let numArray: number[] = [10, 20, 30, 40, 50, 60, 70, 80];
      const result: number = numArray[numVar >> 3];
      expect(result).assertEqual(50);
    });

    /**
     * @tc.name   ExpressionTest0872
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0872
     * @tc.desc   Test string concatenation with modulus operation results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0872', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strVar: string = "";
      let numArray: number[] = [17, 5, 23, 7, 31, 3];
      for (let i = 0; i < numArray.length; i += 2) {
        strVar += numArray[i] + " mod " + numArray[i + 1] + " = " + (numArray[i] % numArray[i + 1]) + ", ";
      }
      expect(strVar).assertEqual("17 mod 5 = 2, 23 mod 7 = 2, 31 mod 3 = 1, ");
    });

    /**
     * @tc.name   ExpressionTest0873
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0873
     * @tc.desc   Test operator precedence with mixed operations on array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0873', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [15, 4, 3];
      const result1: number = numArray[0] / numArray[1] + numArray[2];
      const result2: number = numArray[0] / (numArray[1] + numArray[2]);
      expect(result1).assertEqual(3.75 + 3);
      expect(result2).assertEqual(15 / 7);
    });

    /**
     * @tc.name   ExpressionTest0874
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0874
     * @tc.desc   Test grouped expressions in template with array indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0874', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strVar: string;
      let numArray: number[] = [8, 3, 5, 2];
      const i: number = 0;
      const j: number = 2;
      strVar =
        `arr[${i}] + arr[${j}] = ${numArray[i] + numArray[j]}, (arr[${i}] - arr[1]) * arr[${j}] = ${(numArray[i] -
        numArray[1]) * numArray[j]}`;
      expect(strVar).assertEqual("arr[0] + arr[2] = 13, (arr[0] - arr[1]) * arr[2] = 25");
    });

    /**
     * @tc.name   ExpressionTest0875
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0875
     * @tc.desc   Test array method with arithmetic parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0875', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number;
      let numArray: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const start: number = 1;
      const count: number = 2;
      const subArray: number[] = numArray.slice(start, start + count * 2);
      numVar = 0;
      for (let i = 0; i < subArray.length; i++) {
        numVar += subArray[i];
      }
      expect(numVar).assertEqual(2 + 3 + 4 + 5);
    });

    /**
     * @tc.name   ExpressionTest0876
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0876
     * @tc.desc   Test unary plus with string array values in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0876', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strVar: string;
      let strArray: string[] = ["23", "17"];
      strVar = `+${strArray[0]} - +${strArray[1]} = ${+Number(strArray[0]) - +Number(strArray[1])}`;
      expect(strVar).assertEqual("+23 - +17 = 6");
    });

    /**
     * @tc.name   ExpressionTest0877
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0877
     * @tc.desc   Test comparison with bitwise complement results on array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0877', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boolVar: boolean;
      let numArray: number[] = [9, 4];
      boolVar = ~numArray[0] < ~numArray[1];
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0878
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0878
     * @tc.desc   Test compound assignment with division in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0878', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number;
      numVar = 240;
      numVar /= 2;
      numVar += 30;
      numVar /= 5;
      numVar *= 3;
      expect(numVar).assertEqual(90);
    });

    /**
     * @tc.name   ExpressionTest0879
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0879
     * @tc.desc   Test array manipulation with complex loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0879', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
      let filtered: number[] = [];
      for (let i: number = 0; i < numArray.length; i++) {
        if ((numArray[i] % 2 === 0 || numArray[i] > 10) && numArray[i] % 3 !== 0) {
          filtered.push(numArray[i]);
        }
      }
      expect(filtered).assertDeepEquals([2, 4, 8, 10, 11, 13, 14]);
    });

    /**
     * @tc.name   ExpressionTest0880
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0880
     * @tc.desc   Test modulus with multiple conditions on array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [29, 37, 43, 53];
      let numVar: number = 0;
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] % 4 === 1 && numArray[i] % 5 === 2) {
          numVar = numArray[i];
          break;
        }
      }
      expect(numVar).assertEqual(37);
    });

    /**
     * @tc.name   ExpressionTest0881
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0881
     * @tc.desc   Test string concatenation with array values and lengths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0881', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["elephant", "cat", "giraffe", "dog"];
      let numVar: number = 0;
      let strVar: string = "";
      while (numVar < strArray.length) {
        strVar += strArray[numVar] + " has " + strArray[numVar].length + " letters, ";
        numVar++;
      }
      expect(strVar)
        .assertEqual("elephant has 8 letters, cat has 3 letters, giraffe has 7 letters, dog has 3 letters, ");
    });

    /**
     * @tc.name   ExpressionTest0882
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0882
     * @tc.desc   Test comparison with exponentiation results on array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0882', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, 3, 125];
      let boolVar: boolean = numArray[0]**numArray[1] === numArray[2];
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0883
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0883
     * @tc.desc   Test template string with array expressions and Math functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0883', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [3.14, 2.71, 1.618, 0.577];
      let strVar: string = `Max: ${Math.max(...numArray)}, Floor of first: ${Math.floor(numArray[0])}`;
      expect(strVar).assertEqual("Max: 3.14, Floor of first: 3");
    });

    /**
     * @tc.name   ExpressionTest0884
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0884
     * @tc.desc   Test array length with bitwise operations in condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0884', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5];
      let boolVar: boolean = (numArray.length & 1) === 1;
      expect(boolVar).assertTrue();

      numArray.push(6);
      boolVar = (numArray.length & 1) === 1;
      expect(boolVar).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0885
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0885
     * @tc.desc   Test array index calculation with bitwise XOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0885', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
      let numVar: number = 6 ^ 3;
      let strVar: string = strArray[numVar];
      expect(strVar).assertEqual("five");
    });

    /**
     * @tc.name   ExpressionTest0886
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0886
     * @tc.desc   Test template string with array manipulation expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0886', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [4, 8, 12, 16, 20];
      let numVar: number = 2;
      let strVar: string = `arr[${numVar}] = ${numArray[numVar]}, arr[${numVar}] / 2 = ${numArray[numVar] / 2}`;
      expect(strVar).assertEqual("arr[2] = 12, arr[2] / 2 = 6");
    });

    /**
     * @tc.name   ExpressionTest0887
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0887
     * @tc.desc   Test comparison with array length and arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0887', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [10, 20, 30, 40];
      let numVar: number = 3;
      let boolVar: boolean = numArray.length > numVar * 2;
      expect(boolVar).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0888
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0888
     * @tc.desc   Test array concatenation with conditional results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0888', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, 15, 25, 35, 45, 55];
      let numVar: number = 30;
      let strVar: string = "Numbers greater than " + numVar + ": ";
      let first: boolean = true;
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] > numVar) {
          strVar += (first ? "" : ", ") + numArray[i];
          first = false;
        }
      }
      expect(strVar).assertEqual("Numbers greater than 30: 35, 45, 55");
    });

    /**
     * @tc.name   ExpressionTest0889
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0889
     * @tc.desc   Test range check with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0889', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [12, 22, 32, 42];
      let numVar: number = 0;
      const min: number = 15;
      const max: number = 40;
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] >= min && numArray[i] <= max) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0890
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0890
     * @tc.desc   Test array length with arithmetic and bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5, 6];
      let numVar: number = (numArray.length + 2) | 0x0F;
      expect(numVar).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0891
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0891
     * @tc.desc   Test nested ternary with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0891', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [75, 85, 95, 65, 55];
      let strVar: string = "";
      for (let i: number = 0; i < numArray.length; i++) {
        strVar += numArray[i] >= 90 ? "A " :
          numArray[i] >= 80 ? "B " :
            numArray[i] >= 70 ? "C " :
              numArray[i] >= 60 ? "D " : "F ";
      }
      expect(strVar).assertEqual("C B A D F ");
    });

    /**
     * @tc.name   ExpressionTest0892
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0892
     * @tc.desc   Test comma operator in for loop with array transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0892', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5];
      let transformed: number[] = [];
      let i: number, factor: number;
      for (i = 0, factor = 1; i < numArray.length; i++, factor *= 2) {
        transformed.push(numArray[i] * factor);
      }
      expect(transformed).assertDeepEquals([1 * 1, 2 * 2, 3 * 4, 4 * 8, 5 * 16]);
    });

    /**
     * @tc.name   ExpressionTest0893
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0893
     * @tc.desc   Test string comparison with array values and lengths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0893', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["apple", "banana", "cherry", "date"];
      let strVar: string = "cherry";
      let boolVar: boolean = false;
      for (let i: number = 0; i < strArray.length; i++) {
        if (strArray[i] === strVar && strArray[i].length === strVar.length) {
          boolVar = true;
          break;
        }
      }
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0894
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0894
     * @tc.desc   Test unary operators with array values in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0894', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [6, 4, 9, 3];
      let numVar: number = ~numArray[0] + (-numArray[1]) * numArray[2] - +numArray[3];
      expect(numVar).assertEqual(-46);
    });

    /**
     * @tc.name   ExpressionTest0895
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0895
     * @tc.desc   Test bitwise operations with array values in conditional chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0895', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [0b1010, 0b0110, 0b1100, 0b0011];
      let mask: number = 0b1000;
      let numVar: number = 0;
      for (let i: number = 0; i < numArray.length; i++) {
        if ((numArray[i] & mask) !== 0) {
          numVar += numArray[i] >> 3;
        }
      }
      expect(numVar).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0896
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0896
     * @tc.desc   Test array manipulation with increment in while loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0896', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [];
      let numVar: number = 1;
      while (numVar <= 5) {
        numArray.push(numVar * numVar);
        numVar++;
      }
      expect(numArray).assertDeepEquals([1, 4, 9, 16, 25]);
    });

    /**
     * @tc.name   ExpressionTest0897
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0897
     * @tc.desc   Test comparison with transformed array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0897', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [18, 4, 6, 12];
      let boolVar: boolean = (numArray[0] / numArray[1]) > (numArray[2] * 2);
      expect(boolVar).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0898
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0898
     * @tc.desc   Test comma operator in for loop with filtered array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0898', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [3, 6, 9, 12, 15, 18, 21, 24];
      let filtered: number[] = [];
      let i: number, divisor: number;
      for (i = 0, divisor = 2; i < numArray.length; i++, divisor++) {
        if (numArray[i] % divisor === 0) {
          filtered.push(numArray[i]);
        }
      }
      expect(filtered).assertDeepEquals([6]);
    });

    /**
     * @tc.name   ExpressionTest0899
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0899
     * @tc.desc   Test string concatenation with array index arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0899', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
      let numVar: number = 2;
      let strVar: string = strArray[numVar] + " comes after " + strArray[numVar - 1] +
        " and before " + strArray[numVar + 1];
      expect(strVar).assertEqual("Mar comes after Feb and before Apr");
    });

    /**
     * @tc.name   ExpressionTest0900
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0900
     * @tc.desc   Test unary plus with array string values in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["12.5", "3.2", "4.7"];
      let numVar: number = +Number(strArray[0]) * +Number(strArray[1]) - +Number(strArray[2]);
      expect(numVar).assertClose(12.5 * 3.2 - 4.7, 0.001);
    });

    /**
     * @tc.name   ExpressionTest0901
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0901
     * @tc.desc   Test comma operator in for loop with array index and value manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [10, 20, 30, 40, 50];
      let numVar: number = 0;
      let i: number, addend: number;
      for (i = 0, addend = 1; i < numArray.length; i++, addend *= 2) {
        numVar += numArray[i] + addend;
      }
      expect(numVar).assertEqual((10 + 1) + (20 + 2) + (30 + 4) + (40 + 8) + (50 + 16));
    });

    /**
     * @tc.name   ExpressionTest0902
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0902
     * @tc.desc   Test logical NOT with array value check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0902', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [0, 1, -1, 0, 5];
      let numVar: number = 0;
      for (let i: number = 0; i < numArray.length; i++) {
        if (!numArray[i]) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0903
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0903
     * @tc.desc   Test bitwise OR with range calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0903', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [0b0011, 0b0101, 0b1001];
      let numVar: number = 0;
      for (let i: number = 0; i < numArray.length; i++) {
        numVar |= numArray[i];
      }
      expect(numVar).assertEqual(0b1111);
    });

    /**
     * @tc.name   ExpressionTest0904
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0904
     * @tc.desc   Test string concatenation with array values and bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0904', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [21, 13];
      let strVar: string = numArray[0] + " in binary is " + numArray[0].toString(2) +
        ", after XOR with " + numArray[1] + ": " + (numArray[0] ^ numArray[1]).toString(2);
      expect(strVar).assertEqual("21 in binary is 10101, after XOR with 13: 11000");
    });

    /**
     * @tc.name   ExpressionTest0905
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0905
     * @tc.desc   Test unary minus with array values in ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0905', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, -3, 0, 8, -2];
      let strVar: string = "";
      for (let i: number = 0; i < numArray.length; i++) {
        strVar += -numArray[i] > 0 ? "positive " : "non-positive ";
      }
      expect(strVar).assertEqual("non-positive positive non-positive non-positive positive ");
    });
  })
}