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

interface GeneratedTypeLiteralInterface_4 {
  timeout?: number;
}

export default function expressionTest4() {
  describe('ExpressionTest4', () => {
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
     * @tc.name   ExpressionTest0481
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0481
     * @tc.desc   Test string concatenation with loop index and conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 1; i <= 5; i++) {
        result += i + (i % 2 === 0 ? " even " : " odd ");
      }
      expect(result).assertEqual("1 odd 2 even 3 odd 4 even 5 odd ");
    });

    /**
     * @tc.name   ExpressionTest0482
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0482
     * @tc.desc   Test numeric conditions with modulus results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 23;
      const result: string = num % 3 === 0 ? "Divisible by 3" :
        num % 3 === 1 ? "Remainder 1" : "Remainder 2";
      expect(result).assertEqual("Remainder 2");
    });

    /**
     * @tc.name   ExpressionTest0483
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0483
     * @tc.desc   Test string concatenation with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: string = a + " & " + b + " = " + (a & b);
      expect(result).assertEqual("12 & 5 = 4");
    });

    /**
     * @tc.name   ExpressionTest0484
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0484
     * @tc.desc   Test numeric comparison with bitwise NOT results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 4;
      const result: boolean = ~num < -5;
      // ~4 = -5, so -5 < -5 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0485
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0485
     * @tc.desc   Test string template with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 7;
      const b: number = 3;
      const c: number = 10;
      const result: string = `${a} > ${b}: ${a > b}, ${b} > ${c}: ${b > c}, both: ${a > b && b > c}`;
      expect(result).assertEqual("7 > 3: true, 3 > 10: false, both: false");
    });

    /**
     * @tc.name   ExpressionTest0486
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0486
     * @tc.desc   Test string length with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello World";
      const result: number = str.length | 0x0F;
      // 11 | 15 = 15
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0487
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0487
     * @tc.desc   Test string index with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      const a: number = 2;
      const b: number = 4;
      const result: string = str[a + b];
      expect(result).assertEqual("g");
    });

    /**
     * @tc.name   ExpressionTest0488
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0488
     * @tc.desc   Test string template with XOR result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 6;
      const result: string = `${a} XOR ${b} = ${a ^ b}`;
      expect(result).assertEqual("10 XOR 6 = 12");
    });

    /**
     * @tc.name   ExpressionTest0489
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0489
     * @tc.desc   Test numeric comparison with shifted values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8;
      const result: boolean = (a >> 1) === (a / 2);
      // 4 === 4 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0490
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0490
     * @tc.desc   Test string concatenation with multiple logical checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "TypeScript";
      const result: string = "Checks: " +
        "Length>5=" + (str.length > 5) + ", " +
        "Starts='Type'=" + str.startsWith("Type") + ", " +
        "Ends='Script'=" + str.endsWith("Script");
      expect(result).assertEqual("Checks: Length>5=true, Starts='Type'=true, Ends='Script'=true");
    });

    /**
     * @tc.name   ExpressionTest0491
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0491
     * @tc.desc   Test numeric range check with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 75;
      const result: boolean = score >= 60 && score < 80;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0492
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0492
     * @tc.desc   Test string length with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0492', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      const result: number = (str.length * 2) & 0x0F;
      // 12 & 15 = 12
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   ExpressionTest0493
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0493
     * @tc.desc   Test ternary operator with nested conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0493', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temp: number = 25;
      const result: string = temp > 30 ? "Hot" :
        temp > 20 ? "Warm" :
          temp > 10 ? "Cool" : "Cold";
      expect(result).assertEqual("Warm");
    });

    /**
     * @tc.name   ExpressionTest0494
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0494
     * @tc.desc   Test comma operator in for loop with multiple counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0494', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sumEven: number = 0;
      let sumOdd: number = 0;
      let i: number, isEven: boolean;
      for (i = 1, isEven = false; i <= 5; i++, isEven = !isEven) {
        if (isEven) {
          sumEven += i;
        } else {
          sumOdd += i;
        }
      }
      expect(sumEven).assertEqual(6); // 2 + 4
      expect(sumOdd).assertEqual(9); // 1 + 3 + 5
    });

    /**
     * @tc.name   ExpressionTest0495
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0495
     * @tc.desc   Test string comparison with case conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0495', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "HELLO";
      const result: boolean = str1.toLowerCase() === str2.toLowerCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0496
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0496
     * @tc.desc   Test numeric operations with unary operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0496', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      const result: number = -num + +num * 2;
      // -5 + 5 * 2 = -5 + 10 = 5
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0497
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0497
     * @tc.desc   Test bitwise operations in conditional expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0497', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: number = 0b1010;
      const result: string = (flags & 0b1000) ? "Flag A set" : "Flag A not set";
      expect(result).assertEqual("Flag A set");
    });

    /**
     * @tc.name   ExpressionTest0498
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0498
     * @tc.desc   Test string concatenation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0498', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 0;
      while (count < 3) {
        result += "Iteration " + ++count + " ";
      }
      expect(result).assertEqual("Iteration 1 Iteration 2 Iteration 3 ");
    });

    /**
     * @tc.name   ExpressionTest0499
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0499
     * @tc.desc   Test numeric comparison with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0499', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 8;
      const result: boolean = (a ^ b) > (a & b);
      // 7 > 8 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0500
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0500
     * @tc.desc   Test comma operator in for loop with string and number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let i: number, prefix: string;
      for (i = 1, prefix = "step-"; i <= 3; i++, prefix = "step-") {
        result += prefix + i + " ";
      }
      expect(result).assertEqual("step-1 step-2 step-3 ");
    });

    /**
     * @tc.name   ExpressionTest0501
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0501
     * @tc.desc   Test string concatenation with ternary and logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "typescript";
      const result: string = str + (str.length > 5 && str.includes("type") ? " is valid" : " is invalid");
      expect(result).assertEqual("typescript is valid");
    });

    /**
     * @tc.name   ExpressionTest0502
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0502
     * @tc.desc   Test unary plus with arithmetic in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum: number = 0;
      let value: string = "2";
      let numericValue: number = Number(value);
      for (let i = 0; i < 3; i++) {
        sum += numericValue;
        numericValue++; //
      }
      expect(sum).assertEqual(9); // 2 + 3 + 4 = 9
    });

    /**
     * @tc.name   ExpressionTest0503
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0503
     * @tc.desc   Test comma operator in for loop with bitwise counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 0, mask = 1; i < 5; i++, mask = mask << 1) {
        result |= mask;
      }
      expect(result).assertEqual(31); // 1 | 2 | 4 | 8 | 16 = 31
    });

    /**
     * @tc.name   ExpressionTest0504
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0504
     * @tc.desc   Test logical NOT with string length check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0504', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "";
      const result: boolean = !!(str.length === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0505
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0505
     * @tc.desc   Test bitwise XOR with equality check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0505', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 10;
      const result: boolean = (a ^ b) === 6;
      expect(result).assertTrue(); // 12 ^ 10 = 6
    });

    /**
     * @tc.name   ExpressionTest0506
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0506
     * @tc.desc   Test string concatenation with nested ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0506', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 3;
      let result: string = "Number " + num + " is ";
      result += num > 5 ? "large" : num > 2 ? "medium" : "small";
      expect(result).assertEqual("Number 3 is medium");
    });

    /**
     * @tc.name   ExpressionTest0507
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0507
     * @tc.desc   Test unary minus with bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0507', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: number = -(a >> 1);
      expect(result).assertEqual(-2); // -(5 >> 1) = -2
    });

    /**
     * @tc.name   ExpressionTest0508
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0508
     * @tc.desc   Test string length with arithmetic in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0508', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      let result: string = "";
      for (let i = 0; i < str.length; i += 2) {
        result += str[i];
      }
      expect(result).assertEqual("aceg");
    });

    /**
     * @tc.name   ExpressionTest0509
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0509
     * @tc.desc   Test logical AND with string and number checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0509', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      const num: number = 5;
      const result: boolean = str.length === num && num > 3;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0510
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0510
     * @tc.desc   Test logical OR with mixed conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const num: number = 2;
      const result: boolean = str.length > 5 || num * 3 > 5;
      expect(result).assertTrue(); // 2*3=6>5
    });

    /**
     * @tc.name   ExpressionTest0511
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0511
     * @tc.desc   Test compound assignment with bitwise OR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0511', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let flags: number = 0b0010;
      flags |= 0b1000; // Set bit 3
      flags |= 0b0100; // Set bit 2
      expect(flags).assertEqual(0b1110);
    });

    /**
     * @tc.name   ExpressionTest0512
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0512
     * @tc.desc   Test string template with arithmetic expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0512', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 10;
      const y: number = 4;
      const result: string = `${x} / ${y} = ${x / y}, remainder ${x % y}`;
      expect(result).assertEqual("10 / 4 = 2.5, remainder 2");
    });

    /**
     * @tc.name   ExpressionTest0513
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0513
     * @tc.desc   Test prefix increment in string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0513', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 3;
      const result: string = "Count: " + ++count + ", Next: " + ++count;
      expect(result).assertEqual("Count: 4, Next: 5");
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0514
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0514
     * @tc.desc   Test postfix decrement in numeric expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0514', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 8;
      const result: number = num-- - 2 + num--;
      // 8 - 2 + 7 = 13
      expect(result).assertEqual(13);
      expect(num).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest0515
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0515
     * @tc.desc   Test comma operator in for loop with string index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0515', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      let result: string = "";
      let i: number, char: string;
      for (i = 0, char = str[i]; i < str.length; i += 2, char = str[i]) {
        result += char;
      }
      expect(result).assertEqual("aceg");
    });

    /**
     * @tc.name   ExpressionTest0516
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0516
     * @tc.desc   Test string comparison with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0516', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "apricot";
      const result: boolean = str1 < str2 && str1.length < str2.length;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0517
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0517
     * @tc.desc   Test modulus in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0517', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      for (let i = 1; i <= 10; i++) {
        if (i % 3 === 0) {
          result += i;
        }
      }
      expect(result).assertEqual(3 + 6 + 9);
    });

    /**
     * @tc.name   ExpressionTest0518
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0518
     * @tc.desc   Test nullish coalescing in string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0518', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: string | undefined = undefined;
      const fallback: string = "default";
      const result: string = "Value: " + (value ?? fallback);
      expect(result).assertEqual("Value: default");
    });

    /**
     * @tc.name   ExpressionTest0519
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0519
     * @tc.desc   Test bitwise operations with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0519', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -10;
      const b: number = -5;
      const result: boolean = (a | b) === -11;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0520
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0520
     * @tc.desc   Test string index with compound arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789";
      let index: number = 2;
      index *= 2; // 4
      const result: string = str[index] + str[index + 3];
      expect(result).assertEqual("47");
    });

    /**
     * @tc.name   ExpressionTest0521
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0521
     * @tc.desc   Test logical AND assignment with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0521', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 15;
      const mask: number = 10;
      value &&= mask; // 15 is truthy, so value = 10
      expect(value).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0523
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0523
     * @tc.desc   Test comparison with left shift results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0523', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 7;
      const result: boolean = (a << 2) === a * 4;
      // 28 === 28 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0524
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0524
     * @tc.desc   Test string concatenation with exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0524', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 5;
      const exp: number = 3;
      const result: string = base + " to the power of " + exp + " equals " + (base**exp);
      expect(result).assertEqual("5 to the power of 3 equals 125");
    });

    /**
     * @tc.name   ExpressionTest0525
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0525
     * @tc.desc   Test operator precedence with bitwise and arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0525', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a / b * c;
      const result2: number = a / (b * c);
      expect(result1).assertClose(5.3333333, 0.0000001);
      expect(result2).assertClose(1.3333333, 0.0000001);
    });

    /**
     * @tc.name   ExpressionTest0526
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0526
     * @tc.desc   Test grouped expressions in template string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0526', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 4;
      const b: number = 6;
      const result: string = `${a} + ${b} * 2 = ${a + b * 2}, (${a} + ${b}) * 2 = ${(a + b) * 2}`;
      expect(result).assertEqual("4 + 6 * 2 = 16, (4 + 6) * 2 = 20");
    });

    /**
     * @tc.name   ExpressionTest0527
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0527
     * @tc.desc   Test string method with arithmetic parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0527', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      const start: number = 3;
      const length: number = 5;
      const result: string = str.substring(start, start + length);
      expect(result).assertEqual("defgh");
    });

    /**
     * @tc.name   ExpressionTest0528
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0528
     * @tc.desc   Test unary minus with arithmetic in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0528', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 4;
      const result: string = `-${a} + ${b} = ${-a + b}`;
      expect(result).assertEqual("-10 + 4 = -6");
    });

    /**
     * @tc.name   ExpressionTest0529
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0529
     * @tc.desc   Test comparison with unary results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0529', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 6;
      const b: number = 3;
      const result: boolean = -a <= -b;
      // -6 <= -3 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0530
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0530
     * @tc.desc   Test compound assignment with modulus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 25;
      num %= 7; // 25 % 7 = 4
      num += 3; // 7
      num %= 5; // 2
      expect(num).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0531
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0531
     * @tc.desc   Test string concatenation with loop index conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0531', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 0; i < 5; i++) {
        result += (i % 2 === 0 ? "even" : "odd") + i + " ";
      }
      expect(result).assertEqual("even0 odd1 even2 odd3 even4 ");
    });

    /**
     * @tc.name   ExpressionTest0532
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0532
     * @tc.desc   Test modulus with conditional results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0532', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 37;
      const mod: number = 10;
      const result: string = num % mod === 0 ? "Multiple of 10" :
        "Last digit: " + (num % mod);
      expect(result).assertEqual("Last digit: 7");
    });

    /**
     * @tc.name   ExpressionTest0533
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0533
     * @tc.desc   Test string concatenation with bitwise OR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0533', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 3;
      const result: string = a + " | " + b + " = " + (a | b);
      expect(result).assertEqual("5 | 3 = 7");
    });

    /**
     * @tc.name   ExpressionTest0534
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0534
     * @tc.desc   Test comparison with bitwise NOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0534', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 7;
      const result: boolean = ~num < -7;
      // ~7 = -8 < -7 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0535
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0535
     * @tc.desc   Test template string with multiple logical checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0535', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 5;
      const y: number = 10;
      const result: string = `${x} < ${y}: ${x < y}, ${x} * 2 >= ${y}: ${x * 2 >= y}, ${x} == ${y}: ${x === y}`;
      expect(result).assertEqual("5 < 10: true, 5 * 2 >= 10: true, 5 == 10: false");
    });

    /**
     * @tc.name   ExpressionTest0536
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0536
     * @tc.desc   Test string length with bitwise XOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0536', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      const mask: number = 0x0F;
      const result: number = str.length ^ mask;
      // 5 ^ 15 = 10
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0537
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0537
     * @tc.desc   Test string index with bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0537', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789abcdef";
      const shift: number = 2;
      const result: string = str[1 << shift];
      // 1 << 2 = 4, str[4] = "4"
      expect(result).assertEqual("4");
    });

    /**
     * @tc.name   ExpressionTest0538
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0538
     * @tc.desc   Test template string with bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0538', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 3;
      const b: number = 2;
      const result: string = `${a} << ${b} = ${a << b}, ${a} >> ${b} = ${a >> b}`;
      expect(result).assertEqual("3 << 2 = 12, 3 >> 2 = 0");
    });

    /**
     * @tc.name   ExpressionTest0539
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0539
     * @tc.desc   Test comparison with right shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0539', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 16;
      const b: number = 4;
      const result: boolean = (a >> 2) === b;
      // 16 >> 2 = 4
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0540
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0540
     * @tc.desc   Test string concatenation with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temp: number = 22;
      const result: string = "Temperature " + temp + ": " +
        (temp > 30 ? "Hot" :
          temp > 20 ? "Warm" : "Cool");
      expect(result).assertEqual("Temperature 22: Warm");
    });

    /**
     * @tc.name   ExpressionTest0541
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0541
     * @tc.desc   Test range check with logical AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0541', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const age: number = 25;
      const result: boolean = age >= 18 && age <= 30;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0542
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0542
     * @tc.desc   Test string length with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0542', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const result: number = (str.length + 2) & 0x0F;
      // 12 & 15 = 12
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   ExpressionTest0543
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0543
     * @tc.desc   Test nested ternary with arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0543', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 85;
      const result: string = score >= 90 ? "A" :
        score >= 80 ? "B" :
          score >= 70 ? "C" :
            score >= 60 ? "D" : "F";
      expect(result).assertEqual("B");
    });

    /**
     * @tc.name   ExpressionTest0544
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0544
     * @tc.desc   Test comma operator in for loop with multiple variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0544', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sum: number = 0;
      let product: number = 1;
      let i: number, count: number;
      for (i = 1, count = 0; count < 4; i++, count++) {
        sum += i;
        product *= i;
      }
      expect(sum).assertEqual(1 + 2 + 3 + 4);
      expect(product).assertEqual(1 * 2 * 3 * 4);
    });

    /**
     * @tc.name   ExpressionTest0545
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0545
     * @tc.desc   Test string comparison with case conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0545', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "HelloWorld";
      const str2: string = "helloworld";
      const result: boolean = str1.toUpperCase() === str2.toUpperCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0546
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0546
     * @tc.desc   Test unary operators with arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0546', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      const result: number = -num + (+num / 2);
      // -10 + 5 = -5
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.name   ExpressionTest0547
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0547
     * @tc.desc   Test bitwise operations in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0547', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const flags: number = 0b1100;
      const result: string = (flags & 0b1000) ? "Flag 3 set" : "Flag 3 not set";
      expect(result).assertEqual("Flag 3 set");
    });

    /**
     * @tc.name   ExpressionTest0548
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0548
     * @tc.desc   Test string concatenation with increment in while loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0548', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 1;
      while (count <= 3) {
        result += count++ + ". item ";
      }
      expect(result).assertEqual("1. item 2. item 3. item ");
    });

    /**
     * @tc.name   ExpressionTest0549
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0549
     * @tc.desc   Test comparison with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0549', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 20;
      const b: number = 12;
      const result: boolean = (a & b) < (a ^ b);
      // 4 < 16 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0550
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0550
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: string = "character_";
      let result: string = "";
      let i: number, current: string;
      for (i = 65, current = base + String.fromCharCode(i); i <= 67; i++, current = base + String.fromCharCode(i)) {
        result += current + " ";
      }
      expect(result).assertEqual("character_A character_B character_C ");
    });

    /**
     * @tc.name   ExpressionTest0551
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0551
     * @tc.desc   Test string concatenation with logical AND in ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0551', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello";
      const num: number = 5;
      const result: string = str + (str.length === num && num > 3 ? " World" : "");
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.name   ExpressionTest0553
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0553
     * @tc.desc   Test comma operator in for loop with bitwise and arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0553', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, value: number;
      for (i = 0, value = 1; i < 4; i++, value = value << 1 | 1) {
        result += value;
      }
      expect(result).assertEqual(1 + 3 + 7 + 15);
    });

    /**
     * @tc.name   ExpressionTest0554
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0554
     * @tc.desc   Test logical NOT with numeric comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0554', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 10;
      const result: boolean = !(a > b);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0555
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0555
     * @tc.desc   Test bitwise AND with equality check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0555', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 14;
      const b: number = 7;
      const result: boolean = (a & b) === 6;
      expect(result).assertTrue(); // 14 & 7 = 6
    });

    /**
     * @tc.name   ExpressionTest0556
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0556
     * @tc.desc   Test string concatenation with ternary and modulus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0556', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 17;
      let result: string = "Number " + num + " is ";
      result += num % 2 === 0 ? "even" : "odd";
      expect(result).assertEqual("Number 17 is odd");
    });

    /**
     * @tc.name   ExpressionTest0557
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0557
     * @tc.desc   Test unary minus with bitwise NOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0557', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: number = -~a;
      expect(result).assertEqual(6); // -~5 = 6
    });

    /**
     * @tc.name   ExpressionTest0558
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0558
     * @tc.desc   Test string length with modulus in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0558', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      let result: string = "";
      for (let i = 0; i < str.length; i++) {
        if (i % 3 === 0) {
          result += str[i];
        }
      }
      expect(result).assertEqual("adgjm");
    });

    /**
     * @tc.name   ExpressionTest0559
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0559
     * @tc.desc   Test logical AND with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0559', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 20;
      const result: boolean = a > 10 && b > a && b < 25;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0560
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0560
     * @tc.desc   Test logical OR with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example";
      const num: number = 3;
      const result: boolean = str.length > 10 || num > 5 || str.startsWith("ex");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0561
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0561
     * @tc.desc   Test compound assignment with bitwise XOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0561', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 0b1010;
      value ^= 0b1100; // 0110
      value ^= 0b0101; // 0011
      expect(value).assertEqual(0b0011);
    });

    /**
     * @tc.name   ExpressionTest0562
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0562
     * @tc.desc   Test string template with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0562', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: string = `${a} & ${b} = ${a & b}, ${a} | ${b} = ${a | b}`;
      expect(result).assertEqual("10 & 3 = 2, 10 | 3 = 11");
    });

    /**
     * @tc.name   ExpressionTest0563
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0563
     * @tc.desc   Test prefix decrement in string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0563', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 5;
      const result: string = "Count: " + --count + ", Previous: " + --count;
      expect(result).assertEqual("Count: 4, Previous: 3");
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0564
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0564
     * @tc.desc   Test postfix increment in numeric expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0564', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 3;
      const result: number = num++ * 2 + num++;
      // 3 * 2 + 4 = 6 + 4 = 10
      expect(result).assertEqual(10);
      expect(num).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0565
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0565
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0565', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      let result: string = "";
      let i: number, j: number;
      for (i = 0, j = str.length - 1; i < j; i++, j--) {
        result += str[i] + str[j];
      }
      expect(result).assertEqual("afbecd");
    });

    /**
     * @tc.name   ExpressionTest0566
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0566
     * @tc.desc   Test string comparison with length and content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0566', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "longer string";
      const str2: string = "short";
      const result: boolean = str1.length > str2.length && str1 > str2;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0567
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0567
     * @tc.desc   Test modulus with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0567', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 37;
      const divisor: number = 5;
      const quotient: number = Math.floor(num / divisor);
      const remainder: number = num % divisor;
      const result: boolean = num === quotient * divisor + remainder;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0568
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0568
     * @tc.desc   Test nullish coalescing with numeric values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0568', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number | null = null;
      const defaultValue: number = 42;
      const result: number = value ?? defaultValue;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   ExpressionTest0569
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0569
     * @tc.desc   Test bitwise operations with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0569', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -12;
      const b: number = -5;
      const result: number = a ^ b;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0570
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0570
     * @tc.desc   Test string index with arithmetic and comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789";
      let index: number = 5;
      index -= 2; // 3
      const result: string = str[index] + str[index * 2];
      expect(result).assertEqual("36");
    });

    /**
     * @tc.name   ExpressionTest0571
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0571
     * @tc.desc   Test logical OR assignment with strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0571', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "Hello";
      const suffix: string = " World";
      message ||= suffix; // Message is truthy, remains "Hello"
      message += suffix;
      expect(message).assertEqual("Hello World");
    });

    /**
     * @tc.name   ExpressionTest0572
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0572
     * @tc.desc   Test optional chaining with array indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0572', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const items: string[] | null = ["first", "second", "third"];
      const result1: string | undefined = items?.[1];
      const result2: string | undefined = items?.[5];
      expect(result1).assertEqual("second");
      expect(result2).assertUndefined();
    });

    /**
     * @tc.name   ExpressionTest0573
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0573
     * @tc.desc   Test comparison with unsigned right shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0573', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -16;
      const result: boolean = (a >>> 2) === 1073741820;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0574
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0574
     * @tc.desc   Test string concatenation with exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0574', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 10;
      const exp: number = 3;
      const result: string = base + " raised to " + exp + " is " + (base**exp);
      expect(result).assertEqual("10 raised to 3 is 1000");
    });

    /**
     * @tc.name   ExpressionTest0575
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0575
     * @tc.desc   Test operator precedence with logical and comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0575', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 10;
      const c: number = 15;
      const result1: boolean = a < b && b < c;
      const result2: boolean = a < b && b > c;
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0576
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0576
     * @tc.desc   Test grouped expressions in template with logical ops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0576', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 8;
      const y: number = 3;
      const result: string = `${x} > ${y}: ${x > y}, (${x} + ${y}) > 10: ${(x + y) > 10}`;
      expect(result).assertEqual("8 > 3: true, (8 + 3) > 10: true");
    });

    /**
     * @tc.name   ExpressionTest0577
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0577
     * @tc.desc   Test string method with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0577', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      const start: number = 2;
      const offset: number = 4;
      const result: string = str.slice(start, start + offset * 2);
      expect(result).assertEqual("cdefghij");
    });

    /**
     * @tc.name   ExpressionTest0578
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0578
     * @tc.desc   Test unary minus with modulus in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0578', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 4;
      const result: string = `-${a} % ${b} = ${-a % b}`;
      expect(result).assertEqual("-15 % 4 = -3");
    });

    /**
     * @tc.name   ExpressionTest0579
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0579
     * @tc.desc   Test comparison with unary operator results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0579', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8;
      const b: number = 3;
      const result: boolean = +a >= -b * 3;
      // 8 >= -9 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0580
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0580
     * @tc.desc   Test compound assignment with division
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 100;
      num /= 2; // 50
      num += 25; // 75
      num /= 3; // 25
      expect(num).assertEqual(25);
    });

    /**
     * @tc.name   ExpressionTest0581
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0581
     * @tc.desc   Test string concatenation with loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0581', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 1; i <= 10; i++) {
        if (i % 2 === 0 && i % 3 === 0) {
          result += i + " ";
        }
      }
      expect(result).assertEqual("6 ");
    });

    /**
     * @tc.name   ExpressionTest0582
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0582
     * @tc.desc   Test modulus with range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0582', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 47;
      const mod: number = 10;
      const remainder: number = num % mod;
      const result: boolean = remainder >= 5;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0583
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0583
     * @tc.desc   Test string concatenation with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0583', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 9;
      const b: number = 5;
      const result: string = a + " ^ " + b + " = " + (a ^ b);
      expect(result).assertEqual("9 ^ 5 = 12");
    });

    /**
     * @tc.name   ExpressionTest0584
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0584
     * @tc.desc   Test comparison with bitwise complement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0584', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 10;
      const result: boolean = ~num <= -10;
      // ~10 = -11 <= -10 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0585
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0585
     * @tc.desc   Test template string with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0585', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 8;
      const result: string = `${a} > ${b}: ${a > b}, ${a} % 5 = ${a % 5}, ${b} * 2 = ${b * 2}`;
      expect(result).assertEqual("12 > 8: true, 12 % 5 = 2, 8 * 2 = 16");
    });

    /**
     * @tc.name   ExpressionTest0586
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0586
     * @tc.desc   Test string length with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0586', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      const result: number = str.length << 1;
      // 8 << 1 = 16
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   ExpressionTest0587
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0587
     * @tc.desc   Test string index with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0587', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789abcdef";
      const a: number = 3;
      const b: number = 1;
      const result: string = str[a << b];
      // 3 << 1 = 6, str[6] = "6"
      expect(result).assertEqual("6");
    });

    /**
     * @tc.name   ExpressionTest0588
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0588
     * @tc.desc   Test template string with unsigned right shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0588', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 255;
      const b: number = 4;
      const result: string = `${a} >>> ${b} = ${a >>> b}`;
      expect(result).assertEqual("255 >>> 4 = 15");
    });

    /**
     * @tc.name   ExpressionTest0589
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0589
     * @tc.desc   Test comparison with bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0589', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 24;
      const b: number = 3;
      const result: boolean = (a >> b) === 3;
      // 24 >> 3 = 3
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0590
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0590
     * @tc.desc   Test string concatenation with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 72;
      const result: string = "Score " + score + ": " +
        (score >= 90 ? "A" :
          score >= 80 ? "B" :
            score >= 70 ? "C" : "F");
      expect(result).assertEqual("Score 72: C");
    });

    /**
     * @tc.name   ExpressionTest0591
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0591
     * @tc.desc   Test range check with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0591', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 35;
      const result: boolean = value > 20 && value < 40;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0592
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0592
     * @tc.desc   Test string length with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0592', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijkl";
      const result: number = (str.length - 2) | 0x0F;
      // 10 | 15 = 15
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0593
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0593
     * @tc.desc   Test nested ternary with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0593', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temperature: number = 15;
      const result: string = temperature > 25 ? "Hot" :
        temperature > 18 ? "Warm" :
          temperature > 10 ? "Cool" : "Cold";
      expect(result).assertEqual("Cool");
    });

    /**
     * @tc.name   ExpressionTest0594
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0594
     * @tc.desc   Test comma operator in for loop with counters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0594', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let evenSum: number = 0;
      let oddSum: number = 0;
      let i: number, isOdd: boolean;
      for (i = 1, isOdd = true; i <= 10; i++, isOdd = !isOdd) {
        if (isOdd) {
          oddSum += i;
        } else {
          evenSum += i;
        }
      }
      expect(oddSum).assertEqual(1 + 3 + 5 + 7 + 9);
      expect(evenSum).assertEqual(2 + 4 + 6 + 8 + 10);
    });

    /**
     * @tc.name   ExpressionTest0595
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0595
     * @tc.desc   Test string comparison with substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0595', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello World";
      const substr: string = "World";
      const result: boolean = str.substring(6) === substr;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0596
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0596
     * @tc.desc   Test unary operators with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0596', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 7;
      const result: number = ~num + (-num);
      // -8 + (-7) = -15
      expect(result).assertEqual(-15);
    });

    /**
     * @tc.name   ExpressionTest0597
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0597
     * @tc.desc   Test bitwise operations in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0597', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0b10110;
      const mask: number = 0b10000;
      const result: boolean = (value & mask) !== 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0598
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0598
     * @tc.desc   Test string concatenation with decrement in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0598', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 5;
      while (count > 2) {
        result += count-- + " ";
      }
      expect(result).assertEqual("5 4 3 ");
    });

    /**
     * @tc.name   ExpressionTest0599
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0599
     * @tc.desc   Test comparison with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0599', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 18;
      const b: number = 7;
      const result: boolean = (a | b) > (a ^ b);
      // 23 > 13 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0600
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0600
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "HelloWorld";
      let result: string = "";
      for (let i = 0; i < str.length; i++) {
        let char: string = str[i].toUpperCase();
        result += char;
      }
      expect(result).assertEqual("HELLOWORLD");
    });

    /**
     * @tc.name   ExpressionTest0601
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0601
     * @tc.desc   Test string concatenation with logical OR in ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: string = str + (str.startsWith("t") || str.length > 5 ? " found" : " not found");
      expect(result).assertEqual("test found");
    });

    /**
     * @tc.name   ExpressionTest0602
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0602
     * @tc.desc   Test unary plus with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0602', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: string = "5";
      const b: string = "3";
      const result: number = +parseInt(a, 10) * 2 - +parseInt(b);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   ExpressionTest0603
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0603
     * @tc.desc   Test comma operator in for loop with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0603', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 0, mask = 0b1000; i < 4; i++, mask = mask >> 1) {
        result += mask;
      }
      expect(result).assertEqual(8 + 4 + 2 + 1);
    });

    /**
     * @tc.name   ExpressionTest0604
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0604
     * @tc.desc   Test logical NOT with string method result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0604', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example";
      const result: boolean = !str.includes("xyz");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0605
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0605
     * @tc.desc   Test bitwise OR with equality check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0605', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 3;
      const result: boolean = (a | b) === 7;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0606
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0606
     * @tc.desc   Test string concatenation with nested ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0606', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 45;
      let result: string = "Value " + value + " is ";
      result += value > 100 ? "large" :
        value > 50 ? "medium" :
          value > 20 ? "small" : "tiny";
      expect(result).assertEqual("Value 45 is small");
    });

    /**
     * @tc.name   ExpressionTest0607
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0607
     * @tc.desc   Test unary minus with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: number = -(a % b);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   ExpressionTest0608
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0608
     * @tc.desc   Test string length with arithmetic in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0608', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnop";
      let count: number = 0;
      for (let i = 0; i < str.length; i += 4) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name   ExpressionTest0609
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0609
     * @tc.desc   Test logical AND with string and number conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0609', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello";
      const num: number = 5;
      const result: boolean = str.length === num && num % 2 === 1;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0610
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0610
     * @tc.desc   Test logical OR with string methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example.com";
      const result: boolean = str.endsWith(".org") || str.includes(".com");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0611
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0611
     * @tc.desc   Test compound assignment with bitwise AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0611', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 0b1111;
      value &= 0b1010; // 0b1010
      value &= 0b1100; // 0b1000
      expect(value).assertEqual(0b1000);
    });

    /**
     * @tc.name   ExpressionTest0612
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0612
     * @tc.desc   Test string template with modulus operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0612', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 17;
      const b: number = 5;
      const result: string = `${a} divided by ${b} is ${Math.floor(a / b)} with remainder ${a % b}`;
      expect(result).assertEqual("17 divided by 5 is 3 with remainder 2");
    });

    /**
     * @tc.name   ExpressionTest0613
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0613
     * @tc.desc   Test prefix increment in arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0613', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 4;
      const result: number = ++num * 2 + ++num;
      // 5 * 2 + 6 = 10 + 6 = 16
      expect(result).assertEqual(16);
      expect(num).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest0614
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0614
     * @tc.desc   Test postfix decrement in expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0614', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 9;
      const result: number = num-- - 3 + num--;
      // 9 - 3 + 8 = 14
      expect(result).assertEqual(14);
      expect(num).assertEqual(7);
    });

    /**
     * @tc.name   ExpressionTest0615
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0615
     * @tc.desc   Test comma operator in for loop with string indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0615', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      let result: string = "";
      let i: number, step: number;
      for (i = 0, step = 1; i < str.length; i += step, step++) {
        result += str[i];
      }
      expect(result).assertEqual("abdg");
    });

    /**
     * @tc.name   ExpressionTest0616
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0616
     * @tc.desc   Test string comparison with case check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0616', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Apple";
      const str2: string = "apple";
      const result: boolean = str1 === str2;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0617
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0617
     * @tc.desc   Test modulus with loop counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0617', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 1; i <= 7; i++) {
        result += i % 3 === 0 ? "Fizz" : i + " ";
      }
      expect(result).assertEqual("1 2 Fizz4 5 Fizz7 ");
    });

    /**
     * @tc.name   ExpressionTest0618
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0618
     * @tc.desc   Test nullish coalescing with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0618', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: string | undefined = undefined;
      const defaultName: string = "Guest";
      const result: string = name ?? defaultName;
      expect(result).assertEqual("Guest");
    });

    /**
     * @tc.name   ExpressionTest0619
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0619
     * @tc.desc   Test bitwise operations with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0619', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -7;
      const b: number = -3;
      const result: number = a & b;
      expect(result).assertEqual(-7 & -3);
    });

    /**
     * @tc.name   ExpressionTest0620
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0620
     * @tc.desc   Test string index with compound arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789abcdef";
      let index: number = 2;
      index = index * 2 + 1; // 5
      const result: string = str[index];
      expect(result).assertEqual("5");
    });

    /**
     * @tc.name   ExpressionTest0621
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0621
     * @tc.desc   Test logical AND assignment with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0621', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 15;
      const filter: number = 10;
      value &&= filter; // 15 is truthy, so value = 10
      expect(value).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0622
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0622
     * @tc.desc   Test optional chaining with string methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0622', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string | null = "Hello";
      const result1: number | undefined = str?.length;
      const result2: string | undefined = str?.toUpperCase();
      expect(result1).assertEqual(5);
      expect(result2).assertEqual("HELLO");
    });

    /**
     * @tc.name   ExpressionTest0623
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0623
     * @tc.desc   Test comparison with left shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0623', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: boolean = (a << 2) === 20;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0624
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0624
     * @tc.desc   Test string concatenation with exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0624', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 2;
      const exp: number = 10;
      const result: string = base + "^" + exp + " = " + (base**exp);
      expect(result).assertEqual("2^10 = 1024");
    });

    /**
     * @tc.name   ExpressionTest0625
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0625
     * @tc.desc   Test operator precedence with multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0625', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 2;
      const c: number = 3;
      const result1: number = a / b + c;
      const result2: number = a / (b + c);
      expect(result1).assertEqual(8);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0626
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0626
     * @tc.desc   Test grouped expressions in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0626', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 6;
      const y: number = 4;
      const result: string = `${x} - ${y} = ${x - y}, ${x} - ${y / 2} = ${x - y / 2}`;
      expect(result).assertEqual("6 - 4 = 2, 6 - 2 = 4");
    });

    /**
     * @tc.name   ExpressionTest0627
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0627
     * @tc.desc   Test string method with arithmetic parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0627', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const position: number = 3;
      const result: string = str.charAt(position + 5);
      expect(result).assertEqual("i");
    });

    /**
     * @tc.name   ExpressionTest0628
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0628
     * @tc.desc   Test unary minus with exponentiation in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0628', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 3;
      const b: number = 2;
      const result: string = `-${a}^${b} = ${-(a**b)}`;
      expect(result).assertEqual("-3^2 = -9");
    });

    /**
     * @tc.name   ExpressionTest0629
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0629
     * @tc.desc   Test comparison with unary results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0629', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 10;
      const result: boolean = -a > -b;
      // -5 > -10 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0630
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0630
     * @tc.desc   Test compound assignment with multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 3;
      num *= 2; // 6
      num += 4; // 10
      num *= 3; // 30
      expect(num).assertEqual(30);
    });

    /**
     * @tc.name   ExpressionTest0631
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0631
     * @tc.desc   Test string concatenation with loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0631', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      const str: string = "abcdefghij";
      for (let i = 0; i < str.length; i++) {
        if (i % 2 === 0 || i > 7) {
          result += str[i];
        }
      }
      expect(result).assertEqual("acegij");
    });

    /**
     * @tc.name   ExpressionTest0632
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0632
     * @tc.desc   Test modulus with conditional assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0632', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 27;
      const mod: number = 4;
      let result: string = "";
      if (num % mod === 0) {
        result = "Divisible";
      } else {
        result = "Remainder: " + (num % mod);
      }
      expect(result).assertEqual("Remainder: 3");
    });

    /**
     * @tc.name   ExpressionTest0633
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0633
     * @tc.desc   Test string concatenation with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0633', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 14;
      const b: number = 5;
      const result: string = a + " | " + b + " = " + (a | b);
      expect(result).assertEqual("14 | 5 = 15");
    });

    /**
     * @tc.name   ExpressionTest0634
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0634
     * @tc.desc   Test comparison with bitwise complement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0634', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 3;
      const result: boolean = ~num === -4;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0635
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0635
     * @tc.desc   Test template string with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0635', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 7;
      const b: number = 9;
      const result: string = `${a} < ${b}: ${a < b}, ${a} * 2 > ${b}: ${a * 2 > b}, ${a} + ${b} = ${a + b}`;
      expect(result).assertEqual("7 < 9: true, 7 * 2 > 9: true, 7 + 9 = 16");
    });

    /**
     * @tc.name   ExpressionTest0636
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0636
     * @tc.desc   Test string length with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0636', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      const result: number = str.length ^ 0x0F;
      // 6 ^ 15 = 9
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ExpressionTest0637
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0637
     * @tc.desc   Test string index with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0637', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789";
      const a: number = 5;
      const b: number = 3;
      const result: string = str[a & b];
      // 5 & 3 = 1, str[1] = "1"
      expect(result).assertEqual("1");
    });

    /**
     * @tc.name   ExpressionTest0638
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0638
     * @tc.desc   Test template string with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0638', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: string = `${a} & ${b} = ${a & b}, ${a} ^ ${b} = ${a ^ b}`;
      expect(result).assertEqual("12 & 5 = 4, 12 ^ 5 = 9");
    });

    /**
     * @tc.name   ExpressionTest0639
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0639
     * @tc.desc   Test comparison with bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0639', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 18;
      const b: number = 2;
      const result: boolean = (a >> b) === 4;
      // 18 >> 2 = 4
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0640
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0640
     * @tc.desc   Test string concatenation with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0;
      const result: string = "Value " + value + ": " +
        (value > 0 ? "Positive" :
          value < 0 ? "Negative" : "Zero");
      expect(result).assertEqual("Value 0: Zero");
    });

    /**
     * @tc.name   ExpressionTest0641
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0641
     * @tc.desc   Test range check with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0641', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 55;
      const result: boolean = score >= 50 && score < 60;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0642
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0642
     * @tc.desc   Test string length with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0642', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnop";
      const result: number = (str.length / 2) << 1;
      // 8 << 1 = 16
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name   ExpressionTest0643
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0643
     * @tc.desc   Test nested ternary with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0643', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const hour: number = 14;
      const result: string = hour < 12 ? "Morning" :
        hour < 18 ? "Afternoon" :
          hour < 22 ? "Evening" : "Night";
      expect(result).assertEqual("Afternoon");
    });

    /**
     * @tc.name   ExpressionTest0644
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0644
     * @tc.desc   Test comma operator in for loop with multiple variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0644', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let i: number, j: number;
      for (i = 1, j = 10; i <= 3; i++, j -= 3) {
        result += i * j + " ";
      }
      expect(result).assertEqual("10 14 12 ");
    });

    /**
     * @tc.name   ExpressionTest0645
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0645
     * @tc.desc   Test string comparison with substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0645', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello World";
      const result: boolean = str.substring(0, 5) === "Hello";
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0646
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0646
     * @tc.desc   Test unary operators with arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0646', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 6;
      const result: number = ~num + (-num);
      // -7 + (-6) = -13
      expect(result).assertEqual(-13);
    });

    /**
     * @tc.name   ExpressionTest0647
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0647
     * @tc.desc   Test bitwise operations in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0647', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0b1010;
      const mask: number = 0b0101;
      const result: boolean = (value & mask) === 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0648
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0648
     * @tc.desc   Test string concatenation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0648', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 0;
      do {
        result += count++ + " ";
      } while (count < 4);
      expect(result).assertEqual("0 1 2 3 ");
    });

    /**
     * @tc.name   ExpressionTest0649
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0649
     * @tc.desc   Test comparison with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0649', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 9;
      const b: number = 12;
      const result: boolean = (a & b) < (a | b);
      // 8 < 13 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0650
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0650
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      let result: string = "";
      let i: number, chunk: string;
      for (i = 0, chunk = str.substring(i, i + 2); i < str.length; i += 2, chunk = str.substring(i, i + 2)) {
        result += chunk + "|";
      }
      expect(result).assertEqual("ab|cd|ef|gh|");
    });

    /**
     * @tc.name   ExpressionTest0651
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0651
     * @tc.desc   Test string concatenation with logical operators in ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0651', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "TypeScript";
      const result: string = str + (str.startsWith("Type") && str.length > 5 ? " is valid" : " is invalid");
      expect(result).assertEqual("TypeScript is valid");
    });

    /**
     * @tc.name   ExpressionTest0652
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0652
     * @tc.desc   Test unary plus with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0652', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: string = "15";
      const b: string = "7";
      const result: number = +Number(a) - +Number(b) * 2;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest0653
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0653
     * @tc.desc   Test comma operator in for loop with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0653', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, value: number;
      for (i = 0, value = 1; i < 5; i++, value = value << 1) {
        result += value;
      }
      expect(result).assertEqual(1 + 2 + 4 + 8 + 16);
    });

    /**
     * @tc.name   ExpressionTest0654
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0654
     * @tc.desc   Test logical NOT with string length check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0654', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: boolean = !(str.length > 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0655
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0655
     * @tc.desc   Test bitwise XOR with equality check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0655', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 13;
      const b: number = 7;
      const result: boolean = (a ^ b) === 10;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0656
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0656
     * @tc.desc   Test string concatenation with nested ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0656', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 23;
      let result: string = "Value " + value + " is ";
      result += value > 50 ? "large" : value > 20 ? "medium" : "small";
      expect(result).assertEqual("Value 23 is medium");
    });

    /**
     * @tc.name   ExpressionTest0657
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0657
     * @tc.desc   Test unary minus with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0657', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8;
      const result: number = -(a >> 1);
      expect(result).assertEqual(-4);
    });

    /**
     * @tc.name   ExpressionTest0658
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0658
     * @tc.desc   Test string length with arithmetic in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0658', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      let count: number = 0;
      for (let i = 0; i < str.length; i++) {
        if (i % 4 === 0) {
          count++;
        }
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name   ExpressionTest0659
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0659
     * @tc.desc   Test logical AND with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0659', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 8;
      const result: boolean = a > 10 && b < 10 && a > b;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0660
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0660
     * @tc.desc   Test logical OR with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example";
      const num: number = 4;
      const result: boolean = str.length > 8 || num > 5 || str.endsWith("ple");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0661
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0661
     * @tc.desc   Test compound assignment with bitwise OR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0661', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 0b0010;
      value |= 0b0100; // 0b0110
      value |= 0b1000; // 0b1110
      expect(value).assertEqual(0b1110);
    });

    /**
     * @tc.name   ExpressionTest0662
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0662
     * @tc.desc   Test string template with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0662', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 25;
      const b: number = 4;
      const result: string = `${a} / ${b} = ${a / b}, floor = ${Math.floor(a / b)}`;
      expect(result).assertEqual("25 / 4 = 6.25, floor = 6");
    });

    /**
     * @tc.name   ExpressionTest0663
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0663
     * @tc.desc   Test prefix increment in arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0663', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 3;
      const result: number = ++num * 3 - ++num;
      // 4 * 3 - 5 = 12 - 5 = 7
      expect(result).assertEqual(7);
      expect(num).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0664
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0664
     * @tc.desc   Test postfix decrement in expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0664', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      const firstPart: number = (num--) / 2;
      const secondPart: number = num--;
      const result: number = firstPart + secondPart;
      expect(result).assertEqual(14);
      expect(num).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest0665
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0665
     * @tc.desc   Test comma operator in for loop with string indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0665', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789";
      let result: string = "";
      let i: number, step: number;
      for (i = 0, step = 2; i < str.length; i += step, step = step < 4 ? step + 1 : 2) {
        result += str[i];
      }
      expect(result).assertEqual("0259");
    });

    /**
     * @tc.name   ExpressionTest0666
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0666
     * @tc.desc   Test string comparison with transformed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0666', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "HELLO";
      const result: boolean = str1.toLowerCase() === str2.toLowerCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0667
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0667
     * @tc.desc   Test modulus with conditional in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0667', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      for (let i = 1; i <= 15; i++) {
        if (i % 3 === 0 && i % 5 === 0) {
          result += i;
        }
      }
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0668
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0668
     * @tc.desc   Test nullish coalescing with default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0668', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const configValue: number | null = null;
      const defaultValue: number = 100;
      const result: number = configValue ?? defaultValue;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   ExpressionTest0669
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0669
     * @tc.desc   Test bitwise operations with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0669', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -15;
      const b: number = -7;
      const result: number = a | b;
      expect(result).assertEqual(-7);
    });

    /**
     * @tc.name   ExpressionTest0670
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0670
     * @tc.desc   Test string index with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      let index: number = 2;
      index = index * 3 + 1; // 7
      const result: string = str[index];
      expect(result).assertEqual("h");
    });

    /**
     * @tc.name   ExpressionTest0671
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0671
     * @tc.desc   Test logical OR assignment with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0671', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 0;
      const fallback: number = 5;
      value ||= fallback; // 0 is falsy, so value = 5
      expect(value).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0673
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0673
     * @tc.desc   Test comparison with left shift results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0673', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 7;
      const result: boolean = (a << 3) === 56;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0674
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0674
     * @tc.desc   Test string concatenation with exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0674', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 5;
      const exp: number = 3;
      const result: string = base + " to the power of " + exp + " is " + (base**exp);
      expect(result).assertEqual("5 to the power of 3 is 125");
    });

    /**
     * @tc.name   ExpressionTest0675
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0675
     * @tc.desc   Test operator precedence with multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0675', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a - b * c;
      const result2: number = (a - b) * c;
      expect(result1).assertEqual(4);
      expect(result2).assertEqual(14);
    });

    /**
     * @tc.name   ExpressionTest0676
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0676
     * @tc.desc   Test grouped expressions in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0676', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 9;
      const y: number = 4;
      const result: string = `${x} + ${y} * 2 = ${x + y * 2}, (${x} + ${y}) * 2 = ${(x + y) * 2}`;
      expect(result).assertEqual("9 + 4 * 2 = 17, (9 + 4) * 2 = 26");
    });

    /**
     * @tc.name   ExpressionTest0677
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0677
     * @tc.desc   Test string method with arithmetic parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0677', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const start: number = 5;
      const length: number = 3;
      const result: string = str.substr(start, length * 2);
      expect(result).assertEqual("fghijk");
    });

    /**
     * @tc.name   ExpressionTest0678
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0678
     * @tc.desc   Test unary minus with arithmetic in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0678', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: string = `-${a} + ${b} = ${-a + b}`;
      expect(result).assertEqual("-12 + 5 = -7");
    });

    /**
     * @tc.name   ExpressionTest0679
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0679
     * @tc.desc   Test comparison with unary operator results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0679', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 6;
      const b: number = 4;
      const result: boolean = +a > -b * 2;
      // 6 > -8 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0680
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0680
     * @tc.desc   Test compound assignment with addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      num += 3; // 8
      num *= 2; // 16
      num -= 4; // 12
      expect(num).assertEqual(12);
    });

    /**
     * @tc.name   ExpressionTest0681
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0681
     * @tc.desc   Test string concatenation with loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0681', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      const str: string = "abcdefghijklmno";
      for (let i = 0; i < str.length; i++) {
        if (i > 5 && i < 10) {
          result += str[i];
        }
      }
      expect(result).assertEqual("ghij");
    });

    /**
     * @tc.name   ExpressionTest0682
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0682
     * @tc.desc   Test modulus with range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0682', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 38;
      const mod: number = 7;
      const remainder: number = num % mod;
      const result: boolean = remainder >= 3 && remainder <= 5;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0683
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0683
     * @tc.desc   Test string concatenation with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0683', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 11;
      const b: number = 5;
      const result: string = a + " & " + b + " = " + (a & b);
      expect(result).assertEqual("11 & 5 = 1");
    });

    /**
     * @tc.name   ExpressionTest0684
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0684
     * @tc.desc   Test comparison with bitwise complement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0684', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 5;
      const result: boolean = ~num === -6;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0685
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0685
     * @tc.desc   Test template string with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0685', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 8;
      const b: number = 3;
      const result: string = `${a} > ${b}: ${a > b}, ${a} / ${b} = ${a / b}, ${a} % ${b} = ${a % b}`;
      expect(result).assertEqual("8 > 3: true, 8 / 3 = 2.6666666666666665, 8 % 3 = 2");
    });

    /**
     * @tc.name   ExpressionTest0686
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0686
     * @tc.desc   Test string length with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0686', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const result: number = str.length | 0x0F;
      // 10 | 15 = 15
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0687
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0687
     * @tc.desc   Test string index with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0687', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789abcdef";
      const a: number = 7;
      const b: number = 3;
      const result: string = str[a ^ b];
      // 7 ^ 3 = 4, str[4] = "4"
      expect(result).assertEqual("4");
    });

    /**
     * @tc.name   ExpressionTest0688
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0688
     * @tc.desc   Test template string with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0688', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 4;
      const result: string = `${a} >> ${b} = ${a >> b}, ${a} >>> ${b} = ${a >>> b}`;
      expect(result).assertEqual("15 >> 4 = 0, 15 >>> 4 = 0");
    });

    /**
     * @tc.name   ExpressionTest0689
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0689
     * @tc.desc   Test comparison with bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0689', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 32;
      const b: number = 3;
      const result: boolean = (a >> b) === 4;
      // 32 >> 3 = 4
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0690
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0690
     * @tc.desc   Test string concatenation with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const count: number = 7;
      const result: string = "Count " + count + ": " +
        (count > 10 ? "many" :
          count > 5 ? "several" :
            count > 1 ? "a few" : "one");
      expect(result).assertEqual("Count 7: several");
    });

    /**
     * @tc.name   ExpressionTest0691
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0691
     * @tc.desc   Test range check with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0691', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const temperature: number = 98.6;
      const result: boolean = temperature >= 97 && temperature <= 99;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0692
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0692
     * @tc.desc   Test string length with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0692', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const result: number = (str.length - 6) & 0x1F;
      // 20 & 31 = 20
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   ExpressionTest0693
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0693
     * @tc.desc   Test nested ternary with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0693', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 89;
      const result: string = score >= 95 ? "A+" :
        score >= 90 ? "A" :
          score >= 85 ? "A-" :
            score >= 80 ? "B+" : "B";
      expect(result).assertEqual("A-");
    });

    /**
     * @tc.name   ExpressionTest0694
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0694
     * @tc.desc   Test comma operator in for loop with multiple variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0694', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, j: number;
      for (i = 1, j = 1; i <= 5; i++, j *= 2) {
        result += i * j;
      }
      expect(result).assertEqual(1 * 1 + 2 * 2 + 3 * 4 + 4 * 8 + 5 * 16);
    });

    /**
     * @tc.name   ExpressionTest0695
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0695
     * @tc.desc   Test string comparison with substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0695', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello World";
      const substr: string = "lo W";
      const result: boolean = str.substring(3, 7) === substr;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0696
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0696
     * @tc.desc   Test unary operators with arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0696', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 4;
      const result: number = ~num + (-num) * 2;
      // -5 + (-4) * 2 = -5 - 8 = -13
      expect(result).assertEqual(-13);
    });

    /**
     * @tc.name   ExpressionTest0697
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0697
     * @tc.desc   Test bitwise operations in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0697', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0b1101;
      const mask: number = 0b1000;
      const result: boolean = (value & mask) !== 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0698
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0698
     * @tc.desc   Test string concatenation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0698', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let count: number = 1;
      while (count <= 5) {
        result += (count % 2 === 0 ? "even" : "odd") + count + " ";
        count++;
      }
      expect(result).assertEqual("odd1 even2 odd3 even4 odd5 ");
    });

    /**
     * @tc.name   ExpressionTest0699
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0699
     * @tc.desc   Test comparison with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0699', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 22;
      const b: number = 15;
      const result: boolean = (a ^ b) > (a & b);
      // 27 > 14 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0700
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0700
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnop";
      let result: string = "";
      let i: number, chunkSize: number;
      for (i = 0, chunkSize = 1; i < str.length; i += chunkSize, chunkSize = Math.min(chunkSize + 1, 4)) {
        result += str.substr(i, chunkSize) + "|";
      }
      expect(result).assertEqual("a|bc|def|ghij|klmn|op|");
    });

    /**
     * @tc.name   ExpressionTest0701
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0701
     * @tc.desc   Test string concatenation with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello";
      const result: string = str + (str.length > 3 || str.startsWith("X") ? " is valid" : " is invalid");
      expect(result).assertEqual("Hello is valid");
    });

    /**
     * @tc.name   ExpressionTest0702
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0702
     * @tc.desc   Test unary plus with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0702', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: string = "25";
      const b: string = "7";
      const result: number = (+Number(a) % +Number(b)) * 2;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest0703
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0703
     * @tc.desc   Test comma operator in for loop with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0703', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 0, mask = 1; i < 8; i++, mask <<= 1) {
        if (i % 2 === 0) {
          result |= mask;
        }
      }
      expect(result).assertEqual(1 + 4 + 16 + 64);
    });

    /**
     * @tc.name   ExpressionTest0704
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0704
     * @tc.desc   Test logical NOT with numeric condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0704', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 7;
      const result: boolean = !(num % 2 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0705
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0705
     * @tc.desc   Test bitwise AND with equality check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0705', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 22;
      const b: number = 15;
      const result: boolean = (a & b) === 14;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0706
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0706
     * @tc.desc   Test string concatenation with nested ternary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0706', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 3.7;
      let result: string = "Value " + value + " is ";
      result += value > 5 ? "high" : value > 3 ? "medium" : "low";
      expect(result).assertEqual("Value 3.7 is medium");
    });

    /**
     * @tc.name   ExpressionTest0707
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0707
     * @tc.desc   Test unary minus with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0707', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const result: number = -(a >>> 2);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.name   ExpressionTest0708
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0708
     * @tc.desc   Test string length with arithmetic in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0708', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      let result: string = "";
      for (let i = 0; i < str.length; i += Math.floor(str.length / 5)) {
        result += str[i];
      }
      expect(result).assertEqual("afkpuz");
    });

    /**
     * @tc.name   ExpressionTest0709
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0709
     * @tc.desc   Test logical AND with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 18;
      const b: number = 12;
      const result: boolean = a > 15 && b < 15 && a - b > 5;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0710
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0710
     * @tc.desc   Test logical OR with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "typescript";
      const num: number = 5;
      const result: boolean = str.length < 5 || num < 3 || str.includes("script");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0711
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0711
     * @tc.desc   Test compound assignment with bitwise XOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0711', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 0b1100;
      value ^= 0b0101; // 0b1001
      value ^= 0b1110; // 0b0111
      expect(value).assertEqual(0b0111);
    });

    /**
     * @tc.name   ExpressionTest0712
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0712
     * @tc.desc   Test string template with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0712', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 3;
      const b: number = 4;
      const c: number = 5;
      const result: string = `${a}^2 + ${b}^2 = ${c}^2: ${a**2 + b**2 === c**2}`;
      expect(result).assertEqual("3^2 + 4^2 = 5^2: true");
    });

    /**
     * @tc.name   ExpressionTest0713
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0713
     * @tc.desc   Test prefix increment in arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0713', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 2;
      const result: number = ++num * 2 + ++num * 3;
      // 3 * 2 + 4 * 3 = 6 + 12 = 18
      expect(result).assertEqual(18);
      expect(num).assertEqual(4);
    });

    /**
     * @tc.name   ExpressionTest0714
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0714
     * @tc.desc   Test postfix decrement in expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0714', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 15;
      const result: number = num--
      / 3 + num-- * 2;
      // 15 / 3 + 14 * 2 = 5 + 28 = 33
      expect(result).assertEqual(33);
      expect(num).assertEqual(13);
    });

    /**
     * @tc.name   ExpressionTest0715
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0715
     * @tc.desc   Test comma operator in for loop with string indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789abcdefghijklmnopqrstuvwxyz";
      let result: string = "";
      let i: number, step: number;
      for (i = 0, step = 3; i < str.length; i += step, step = step < 5 ? step + 1 : 3) {
        result += str[i];
      }
      expect(result).assertEqual("037cfjorv");
    });

    /**
     * @tc.name   ExpressionTest0716
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0716
     * @tc.desc   Test string comparison with transformed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0716', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello World";
      const str2: string = "hello world";
      const result: boolean = str1.toUpperCase() === str2.toUpperCase();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0717
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0717
     * @tc.desc   Test modulus with conditional in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0717', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 1; i <= 20; i++) {
        if (i % 3 === 0) {
          result += "Fizz";
        }
        if (i % 5 === 0) {
          result += "Buzz";
        }
        if (i % 3 !== 0 && i % 5 !== 0) {
          result += i;
        }
        result += " ";
      }
      expect(result).assertEqual("1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz ");
    });

    /**
     * @tc.name   ExpressionTest0718
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0718
     * @tc.desc   Test nullish coalescing with default values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0718', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const config: GeneratedTypeLiteralInterface_4 = {};
      const defaultTimeout: number = 5000;
      const result: number = config.timeout ?? defaultTimeout;
      expect(result).assertEqual(5000);
    });

    /**
     * @tc.name   ExpressionTest0719
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0719
     * @tc.desc   Test bitwise operations with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0719', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -12;
      const b: number = -8;
      const result: number = a ^ b;
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   ExpressionTest0720
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0720
     * @tc.desc   Test string index with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      let index: number = 1;
      index = index * 5 + 3; // 8
      const result: string = str[index];
      expect(result).assertEqual("i");
    });

    /**
     * @tc.name   ExpressionTest0721
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0721
     * @tc.desc   Test logical AND assignment with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0721', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 25;
      const filter: number = 10;
      value &&= filter; // 25 is truthy, so value = 10
      expect(value).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0723
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0723
     * @tc.desc   Test comparison with left shift results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0723', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 9;
      const result: boolean = (a << 2) === 36;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0724
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0724
     * @tc.desc   Test string concatenation with exponentiation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0724', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 4;
      const exp: number = 3;
      const result: string = base + " raised to " + exp + " is " + (base**exp);
      expect(result).assertEqual("4 raised to 3 is 64");
    });

    /**
     * @tc.name   ExpressionTest0725
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0725
     * @tc.desc   Test operator precedence with multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0725', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 5;
      const c: number = 2;
      const result1: number = a / b + c;
      const result2: number = a / (b + c);
      expect(result1).assertEqual(5);
      expect(result2).assertClose(2.1428571, 0.0000001);
    });

    /**
     * @tc.name   ExpressionTest0726
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0726
     * @tc.desc   Test grouped expressions in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0726', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 7;
      const y: number = 3;
      const result: string = `${x} * ${y} + 5 = ${x * y + 5}, ${x} * (${y} + 5) = ${x * (y + 5)}`;
      expect(result).assertEqual("7 * 3 + 5 = 26, 7 * (3 + 5) = 56");
    });

    /**
     * @tc.name   ExpressionTest0727
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0727
     * @tc.desc   Test string method with arithmetic parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0727', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const position: number = 4;
      const result: string = str.slice(position, position + 6);
      expect(result).assertEqual("efghij");
    });

    /**
     * @tc.name   ExpressionTest0728
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0728
     * @tc.desc   Test unary minus with arithmetic in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0728', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 18;
      const b: number = 7;
      const result: string = `-${a} / ${b} = ${-a / b}`;
      expect(result).assertEqual("-18 / 7 = -2.5714285714285716");
    });

    /**
     * @tc.name   ExpressionTest0729
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0729
     * @tc.desc   Test comparison with unary operator results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0729', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 9;
      const b: number = 5;
      const result: boolean = ~a < -b;
      // -10 < -5 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0730
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0730
     * @tc.desc   Test compound assignment with subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 30;
      num -= 5; // 25
      num /= 5; // 5
      num += 8; // 13
      expect(num).assertEqual(13);
    });

    /**
     * @tc.name   ExpressionTest0731
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0731
     * @tc.desc   Test string concatenation with loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0731', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      for (let i = 0; i < str.length; i++) {
        if (i === 5 || i === 10 || i === 15 || i === 20) {
          result += str[i];
        }
      }
      expect(result).assertEqual("fkpu");
    });

    /**
     * @tc.name   ExpressionTest0732
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0732
     * @tc.desc   Test modulus with range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0732', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 47;
      const mod: number = 9;
      const remainder: number = num % mod;
      const result: boolean = remainder < 3 || remainder > 7;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0733
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0733
     * @tc.desc   Test string concatenation with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0733', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 21;
      const b: number = 13;
      const result: string = a + " | " + b + " = " + (a | b);
      expect(result).assertEqual("21 | 13 = 29");
    });

    /**
     * @tc.name   ExpressionTest0734
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0734
     * @tc.desc   Test comparison with bitwise complement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0734', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 8;
      const result: boolean = ~num === -9;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0735
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0735
     * @tc.desc   Test template string with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0735', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: string = `${a} > ${b}: ${a > b}, ${a} * 2 = ${a * 2}, ${b} + ${a} = ${b + a}`;
      expect(result).assertEqual("12 > 5: true, 12 * 2 = 24, 5 + 12 = 17");
    });

    /**
     * @tc.name   ExpressionTest0736
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0736
     * @tc.desc   Test string length with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0736', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const result: number = str.length ^ 0x1F;
      // 26 ^ 31 = 5
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0737
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0737
     * @tc.desc   Test string index with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0737', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "0123456789abcdefghijklmnopqrstuvwxyz";
      const a: number = 10;
      const b: number = 3;
      const result: string = str[a >> b];
      // 10 >> 3 = 1, str[1] = "1"
      expect(result).assertEqual("1");
    });

    /**
     * @tc.name   ExpressionTest0738
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0738
     * @tc.desc   Test template string with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0738', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 25;
      const b: number = 3;
      const result: string = `${a} << ${b} = ${a << b}, ${a} >> ${b} = ${a >> b}`;
      expect(result).assertEqual("25 << 3 = 200, 25 >> 3 = 3");
    });

    /**
     * @tc.name   ExpressionTest0739
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0739
     * @tc.desc   Test comparison with bitwise shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0739', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 48;
      const b: number = 4;
      const result: boolean = (a >> b) === 3;
      // 48 >> 4 = 3
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0740
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0740
     * @tc.desc   Test string concatenation with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: number = 0.75;
      const result: string = "Value " + value + ": " +
        (value > 0.8 ? "high" :
          value > 0.5 ? "medium" :
            value > 0.2 ? "low" : "very low");
      expect(result).assertEqual("Value 0.75: medium");
    });
  })
}