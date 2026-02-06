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

export default function expressionTest6() {
  describe('ExpressionTest6', () => {
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
     * @tc.name   ExpressionTest0906
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0906
     * @tc.desc   Test array length with multiplication in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0906', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5];
      let numVar: number = 1;
      let result: number = 0;
      while (numVar <= numArray.length * 0.6) {
        result += numArray[numVar];
        numVar++;
      }
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ExpressionTest0907
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0907
     * @tc.desc   Test logical AND with array value conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0907', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [14, 6, 22, 8, 28];
      let numVar: number = 0;
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] > 10 && numArray[i] % 7 === 0) {
          numVar += numArray[i];
        }
      }
      expect(numVar).assertEqual(14 + 28);
    });

    /**
     * @tc.name   ExpressionTest0908
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0908
     * @tc.desc   Test logical OR with array value checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0908', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [4, 15, 7, 21, 3];
      let boolVar: boolean = false;
      for (let i: number = 0; i < numArray.length; i++) {
        boolVar = boolVar || numArray[i] < 5 || numArray[i] === 21;
      }
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0909
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0909
     * @tc.desc   Test compound assignment with modulus and addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0909', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 50;
      numVar %= 13;
      numVar += 7;
      numVar %= 5;
      numVar *= 4;
      expect(numVar).assertEqual(12);
    });

    /**
     * @tc.name   ExpressionTest0910
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0910
     * @tc.desc   Test string template with bitwise operations on array indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
      let i: number = 5;
      let j: number = 2;
      let strVar: string = `${i} & ${j} = ${i & j}, arr[${i & j}] = ${numArray[i & j]}`;
      expect(strVar).assertEqual("5 & 2 = 0, arr[0] = 0");
    });

    /**
     * @tc.name   ExpressionTest0911
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0911
     * @tc.desc   Test prefix decrement with array index and value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0911', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [100, 200, 300, 400, 500];
      let numVar: number = 4;
      let result: number = numArray[--numVar] - --numVar;
      expect(result).assertEqual(398);
    });

    /**
     * @tc.name   ExpressionTest0912
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0912
     * @tc.desc   Test postfix increment with array index calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0912', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, 10, 15, 20, 25];
      let numVar: number = 1;
      let result: number = numArray[numVar++] + numArray[numVar++];
      expect(result).assertEqual(25);
      expect(numVar).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0913
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0913
     * @tc.desc   Test comma operator in for loop with dual array indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0913', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [2, 4, 6, 8, 10];
      let otherArray: number[] = [1, 3, 5, 7, 9];
      let numVar: number = 0;
      let i: number, j: number;
      for (i = 0, j = otherArray.length - 1; i < numArray.length; i++, j--) {
        numVar += numArray[i] * otherArray[j];
      }
      expect(numVar).assertEqual(2 * 9 + 4 * 7 + 6 * 5 + 8 * 3 + 10 * 1);
    });

    /**
     * @tc.name   ExpressionTest0914
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0914
     * @tc.desc   Test string comparison with array values and transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0914', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["Hello", "WORLD", "hello", "world"];
      let strVar: string = "hello";
      let numVar: number = 0;
      for (let i: number = 0; i < strArray.length; i++) {
        if (strArray[i].toLowerCase() === strVar) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0915
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0915
     * @tc.desc   Test modulus with array indices in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0915', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
      let results: number[] = [];
      for (let i: number = 0; i < numArray.length; i++) {
        results.push(i % 3);
      }
      expect(results).assertDeepEquals([0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2]);
    });

    /**
     * @tc.name   ExpressionTest0917
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0917
     * @tc.desc   Test bitwise operations with positive and negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0917', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [18, -7, 12, -5];
      let results: number[] = [];
      for (let i: number = 0; i < numArray.length; i += 2) {
        results.push(numArray[i] | numArray[i + 1]);
      }
      expect(results).assertDeepEquals([18 | -7, 12 | -5]);
    });

    /**
     * @tc.name   ExpressionTest0918
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0918
     * @tc.desc   Test array index calculation with complex arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0918', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"];
      let numVar: number = 5;
      let index: number = (numVar * 2) - (numVar / 2);
      let strVar: string = strArray[index];
      expect(strVar).assertUndefined();
    });

    /**
     * @tc.name   ExpressionTest0919
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0919
     * @tc.desc   Test logical OR assignment with calculated values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0919', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boolVar: boolean = false;
      let numArray: number[] = [0, 5, 3, 7];

      for (let i: number = 0; i < numArray.length; i++) {
        boolVar ||= numArray[i] > 6;
      }

      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0920
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0920
     * @tc.desc   Test array index with left shift operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let numVar: number = 3;
      let result: number = numArray[numVar << 1];
      expect(result).assertEqual(70);
    });

    /**
     * @tc.name   ExpressionTest0921
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0921
     * @tc.desc   Test string concatenation with multiple modulus operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0921', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [37, 10, 5, 3];
      let strVar: string = numArray[0] + " mod " + numArray[1] + " = " + (numArray[0] % numArray[1]) +
        ", then mod " + numArray[2] + " = " + ((numArray[0] % numArray[1]) % numArray[2]) +
        ", then mod " + numArray[3] + " = " + (((numArray[0] % numArray[1]) % numArray[2]) % numArray[3]);
      expect(strVar).assertEqual("37 mod 10 = 7, then mod 5 = 2, then mod 3 = 2");
    });

    /**
     * @tc.name   ExpressionTest0922
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0922
     * @tc.desc   Test operator precedence with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0922', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [20, 5, 3];
      let result1: number = numArray[0] / numArray[1] + numArray[2];
      let result2: number = numArray[0] / (numArray[1] + numArray[2]);
      expect(result1).assertEqual(4 + 3);
      expect(result2).assertEqual(20 / 8);
    });

    /**
     * @tc.name   ExpressionTest0923
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0923
     * @tc.desc   Test grouped expressions in template with array calculations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0923', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [12, 4, 6, 2];
      let i: number = 0;
      let j: number = 2;
      let strVar: string = `${numArray[i]} / ${numArray[1]} = ${numArray[i] /
      numArray[1]}, (${numArray[i]} + ${numArray[j]}) / ${numArray[3]} = ${(numArray[i] + numArray[j]) / numArray[3]}`;
      expect(strVar).assertEqual("12 / 4 = 3, (12 + 6) / 2 = 9");
    });

    /**
     * @tc.name   ExpressionTest0924
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0924
     * @tc.desc   Test array method with calculated parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0924', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
      let numVar: number = 2;
      let start: number = numVar;
      let end: number = numArray.length - numVar;
      let subArray: number[] = numArray.slice(start, end);
      numVar = 0;
      for (let i: number = 0; i < subArray.length; i++) {
        numVar += subArray[i];
      }
      expect(numVar).assertEqual(30 + 40 + 50 + 60 + 70 + 80);
    });

    /**
     * @tc.name   ExpressionTest0925
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0925
     * @tc.desc   Test unary minus with string array values in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0925', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["18", "7"];
      let strVar: string = `-${strArray[0]} + ${strArray[1]} = ${-+Number(strArray[0]) + +Number(strArray[1])}`;
      expect(strVar).assertEqual("-18 + 7 = -11");
    });

    /**
     * @tc.name   ExpressionTest0926
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0926
     * @tc.desc   Test comparison with bitwise complement results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0926', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [6, 3];
      let boolVar: boolean = ~numArray[0] < ~numArray[1];
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0927
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0927
     * @tc.desc   Test compound assignment with division and subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0927', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numVar: number = 180;
      numVar /= 3; // 60
      numVar -= 15; // 45
      numVar /= 5; // 9
      numVar *= 2; // 18
      expect(numVar).assertEqual(18);
    });

    /**
     * @tc.name   ExpressionTest0928
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0928
     * @tc.desc   Test array manipulation with complex conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0928', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [3, 6, 9, 12, 15, 18, 21, 24, 27, 30];
      let filtered: number[] = [];
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] > 10 && (numArray[i] % 4 === 0 || numArray[i] % 7 === 0)) {
          filtered.push(numArray[i]);
        }
      }
      expect(filtered).assertDeepEquals([12, 21, 24]);
    });

    /**
     * @tc.name   ExpressionTest0929
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0929
     * @tc.desc   Test modulus with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0929', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [41, 53, 67, 79];
      let numVar: number = 0;
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] % 6 === 5 && numArray[i] % 5 === 4) {
          numVar = numArray[i];
          break;
        }
      }
      expect(numVar).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest0930
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0930
     * @tc.desc   Test string concatenation with array values and math operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["Monday", "Tuesday", "Wednesday", "Thursday"];
      let numVar: number = 2;
      let strVar: string = strArray[numVar] + " has " + strArray[numVar].length + " letters, " +
        "next day: " + strArray[numVar + 1] + " (" + strArray[numVar + 1].length + " letters)";
      expect(strVar).assertEqual("Wednesday has 9 letters, next day: Thursday (8 letters)");
    });

    /**
     * @tc.name   ExpressionTest0931
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0931
     * @tc.desc   Test comparison with exponentiation results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0931', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [4, 3, 64];
      let boolVar: boolean = numArray[0]**numArray[1] === numArray[2];
      // 4^3 = 64
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0932
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0932
     * @tc.desc   Test template string with array expressions and calculations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0932', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [2.5, 3.5, 4.5, 5.5];
      let strVar: string = `Sum: ${numArray[0] + numArray[1] + numArray[2] + numArray[3]}, ` +
        `Average: ${(numArray[0] + numArray[1] + numArray[2] + numArray[3]) / numArray.length}`;
      expect(strVar).assertEqual("Sum: 16, Average: 4");
    });

    /**
     * @tc.name   ExpressionTest0933
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0933
     * @tc.desc   Test array length with bitwise operations in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0933', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4];
      let numVar: number = numArray.length << 2;
      // 4 << 2 = 16
      expect(numVar).assertEqual(16);
    });

    /**
     * @tc.name   ExpressionTest0934
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0934
     * @tc.desc   Test array index calculation with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0934', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["zero", "one", "two", "three", "four", "five", "six", "seven"];
      let numVar: number = 7 & 3; // 3
      let strVar: string = strArray[numVar];
      expect(strVar).assertEqual("three");
    });

    /**
     * @tc.name   ExpressionTest0935
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0935
     * @tc.desc   Test template string with array manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0935', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [6, 12, 18, 24, 30];
      let numVar: number = 3;
      let strVar: string =
        `arr[${numVar}] = ${numArray[numVar]}, arr[${numVar}] / ${numVar} = ${numArray[numVar] / numVar}`;
      expect(strVar).assertEqual("arr[3] = 24, arr[3] / 3 = 8");
    });

    /**
     * @tc.name   ExpressionTest0936
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0936
     * @tc.desc   Test comparison with array length and calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0936', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, 10, 15, 20, 25];
      let numVar: number = 3;
      let boolVar: boolean = numArray.length === numVar + 2;
      // 5 === 3 + 2 → true
      expect(boolVar).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0937
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0937
     * @tc.desc   Test array concatenation with conditional results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0937', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [8, 16, 24, 32, 40, 48];
      let numVar: number = 20;
      let strVar: string = "Numbers >= " + numVar + " and even: ";
      let first: boolean = true;
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] >= numVar && numArray[i] % 2 === 0) {
          strVar += (first ? "" : ", ") + numArray[i];
          first = false;
        }
      }
      expect(strVar).assertEqual("Numbers >= 20 and even: 24, 32, 40, 48");
    });

    /**
     * @tc.name   ExpressionTest0938
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0938
     * @tc.desc   Test range check with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0938', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [15, 25, 35, 45, 55];
      let numVar: number = 0;
      let min: number = 20;
      let max: number = 50;
      for (let i: number = 0; i < numArray.length; i++) {
        if (numArray[i] > min && numArray[i] < max) {
          numVar += numArray[i];
        }
      }
      expect(numVar).assertEqual(25 + 35 + 45);
    });

    /**
     * @tc.name   ExpressionTest0939
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0939
     * @tc.desc   Test array length with arithmetic and bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0939', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [1, 2, 3, 4, 5];
      let numVar: number = (numArray.length * 2) ^ 0x0F;
      // 10 ^ 15 = 5
      expect(numVar).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0940
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0940
     * @tc.desc   Test nested ternary with array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [45, 55, 65, 75, 85, 95];
      let strVar: string = "";
      for (let i: number = 0; i < numArray.length; i++) {
        strVar += numArray[i] >= 90 ? "Excellent " :
          numArray[i] >= 70 ? "Good " :
            numArray[i] >= 50 ? "Average " : "Poor ";
      }
      expect(strVar).assertEqual("Poor Average Average Good Good Excellent ");
    });

    /**
     * @tc.name   ExpressionTest0941
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0941
     * @tc.desc   Test comma operator in for loop with array transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0941', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [2, 4, 6, 8, 10];
      let transformed: number[] = [];
      let i: number, factor: number;
      for (i = 0, factor = 3; i < numArray.length; i++, factor -= 1) {
        transformed.push(numArray[i] * factor);
      }
      expect(transformed).assertDeepEquals([2 * 3, 4 * 2, 6 * 1, 8 * 0, 10 * (-1)]);
    });

    /**
     * @tc.name   ExpressionTest0942
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0942
     * @tc.desc   Test string comparison with array values and lengths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0942', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["apple", "apples", "apricot", "application"];
      let strVar: string = "apple";
      let numVar: number = 0;
      for (let i: number = 0; i < strArray.length; i++) {
        if (strArray[i].startsWith(strVar) && strArray[i].length > strVar.length) {
          numVar++;
        }
      }
      expect(numVar).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest0943
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0943
     * @tc.desc   Test unary operators with array values in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0943', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [8, 3, 5, 2];
      let numVar: number = ~numArray[0] + (-numArray[1]) * numArray[2] + ~numArray[3];
      // -9 + (-3)*5 + (-3) = -9 - 15 - 3 = -27
      expect(numVar).assertEqual(-27);
    });

    /**
     * @tc.name   ExpressionTest0944
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0944
     * @tc.desc   Test bitwise operations with array values in conditional
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0944', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [0b1101, 0b1011, 0b0111, 0b1110];
      let mask: number = 0b1001;
      let numVar: number = 0;
      for (let i: number = 0; i < numArray.length; i++) {
        if ((numArray[i] & mask) === mask) {
          numVar++;
        }
      }
      // Only 0b1101 & 0b1001 = 0b1001
      expect(numVar).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0945
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0945
     * @tc.desc   Test array manipulation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0945', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [];
      let numVar: number = 2;
      for (let i: number = 0; i < 5; i++) {
        numArray.push(numVar);
        numVar *= 2;
      }
      expect(numArray).assertDeepEquals([2, 4, 8, 16, 32]);
    });

    /**
     * @tc.name   ExpressionTest0946
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0946
     * @tc.desc   Test comparison with transformed array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0946', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [24, 4, 8, 12];
      let boolVar: boolean = (numArray[0] / numArray[1]) >= (numArray[2] + numArray[3]);
      // 6 >= 20 is false
      expect(boolVar).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0947
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0947
     * @tc.desc   Test comma operator in for loop with filtered array values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0947', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, 10, 15, 20, 25, 30, 35, 40];
      let filtered: number[] = [];
      let i: number, threshold: number;
      for (i = 0, threshold = 10; i < numArray.length; i++, threshold += 5) {
        if (numArray[i] > 10 && i !== 1 && i !== 3 && i !== 5) {
          filtered.push(numArray[i]);
        }
      }
      expect(filtered).assertDeepEquals([15, 25, 35, 40]);
    });

    /**
     * @tc.name   ExpressionTest0948
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0948
     * @tc.desc   Test string concatenation with array index arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0948', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["Q1", "Q2", "Q3", "Q4", "Q1", "Q2"];
      let numVar: number = 3;
      let strVar: string = strArray[numVar] + " + 2 quarters = " + strArray[(numVar + 2) % strArray.length];
      expect(strVar).assertEqual("Q4 + 2 quarters = Q2");
    });

    /**
     * @tc.name   ExpressionTest0949
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0949
     * @tc.desc   Test unary plus with array string values in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0949', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strArray: string[] = ["9.5", "2.5", "3"];
      let numVar: number = +Number(strArray[0]) / +Number(strArray[1]) - +Number(strArray[2]);
      expect(numVar).assertClose(9.5 / 2.5 - 3, 0.001);
    });

    /**
     * @tc.name   ExpressionTest0950
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0950
     * @tc.desc   Test comma operator in for loop with array index and value manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numArray: number[] = [5, 10, 15, 20, 25];
      let numVar: number = 0;
      let i: number, multiplier: number;
      for (i = 0, multiplier = 1; i < numArray.length; i++, multiplier += 0.5) {
        numVar += numArray[i] * multiplier;
      }
      expect(numVar).assertClose(5 * 1 + 10 * 1.5 + 15 * 2 + 20 * 2.5 + 25 * 3, 0.001);
    });

    /**
     * @tc.name   ExpressionTest0951
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0951
     * @tc.desc   Test exponentiation with negative base and even exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0951', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = -3;
      let exponent: number = 4;
      let result: number = base**exponent;
      expect(result).assertEqual(81);
    });

    /**
     * @tc.name   ExpressionTest0952
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0952
     * @tc.desc   Test bitwise operations with left shift and addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0952', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num1: number = 5; // 101
      let num2: number = 2;
      let result: number = (num1 << num2) + 3; // 10100 + 11 = 10111 (23)
      expect(result).assertEqual(23);
    });

    /**
     * @tc.name   ExpressionTest0953
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0953
     * @tc.desc   Test logical AND assignment with string checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0953', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strVar: string = "Hello";
      let condition: boolean = true;
      condition &&= strVar.length > 3 && strVar.startsWith("H");
      expect(condition).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0954
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0954
     * @tc.desc   Test remainder operator with negative dividend
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0954', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dividend: number = -17;
      let divisor: number = 5;
      let result: number = dividend % divisor;
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.name   ExpressionTest0955
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0955
     * @tc.desc   Test template string with string methods and calculations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0955', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "TypeScript";
      let len: number = str.length;
      let strVar: string = `${str.substring(4)} has ${len - 4} letters (original: ${len})`;
      expect(strVar).assertEqual("Script has 6 letters (original: 10)");
    });

    /**
     * @tc.name   ExpressionTest0956
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0956
     * @tc.desc   Test prefix increment in array index calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0956', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30, 40, 50];
      let index: number = 2;
      let result: number = arr[++index] - arr[index--];
      // Uses index 3 (40) then 3 (40) before decrementing: 40 - 40 = 0
      expect(result).assertEqual(0);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0957
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0957
     * @tc.desc   Test array index with right shift operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0957', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c", "d", "e", "f", "g", "h"];
      let num: number = 14; // 14 >> 2 = 3
      let result: string = arr[num >> 2];
      expect(result).assertEqual("d");
    });

    /**
     * @tc.name   ExpressionTest0958
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0958
     * @tc.desc   Test bitwise XOR with incrementing values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0958', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 12; // 1100
      let y: number = 5; // 0101
      let result: number = x ^ y; // 1001 (9)
      y++; // 6 (0110)
      result += x ^ y; // 1100 ^ 0110 = 1010 (10) → total 19
      expect(result).assertEqual(19);
    });

    /**
     * @tc.name   ExpressionTest0959
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0959
     * @tc.desc   Test compound assignment with bitwise AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0959', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 25; // 11001
      num &= 15; // 11001 & 01111 = 01001 (9)
      num &= 10; // 01001 & 01010 = 01000 (8)
      expect(num).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest0960
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0960
     * @tc.desc   Test string concatenation with number operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 18;
      let b: number = 7;
      let str: string = a + " divided by " + b + " is " + Math.floor(a / b) +
        " with remainder " + (a % b);
      expect(str).assertEqual("18 divided by 7 is 2 with remainder 4");
    });

    /**
     * @tc.name   ExpressionTest0961
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0961
     * @tc.desc   Test nullish coalescing with different falsy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0961', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val1: number | null = 0;
      let val2: number | null = null;
      let val3: number | undefined = undefined;
      let val4: number | null = 10;

      let result: number = (val1 ?? 5) + (val2 ?? 5) + (val3 ?? 5) + (val4 ?? 5);
      expect(result).assertEqual(0 + 5 + 5 + 10);
    });

    /**
     * @tc.name   ExpressionTest0962
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0962
     * @tc.desc   Test logical OR with string checks in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0962', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let words: string[] = ["apple", "Banana", "cherry", "Date", "elderberry"];
      let count: number = 0;
      for (let i: number = 0; i < words.length; i++) {
        if (words[i].length > 6 || words[i][0] === words[i][0].toUpperCase()) {
          count++;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0963
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0963
     * @tc.desc   Test exponentiation with compound assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0963', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 2;
      num **= 3; // 8
      num **= 2; // 64
      expect(num).assertEqual(64);
    });

    /**
     * @tc.name   ExpressionTest0964
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0964
     * @tc.desc   Test postfix decrement in calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0964', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 10;
      let y: number = 5;
      let result: number = x-- + --y;
      // Uses x=10, then x becomes 9; uses y=4 (after decrement)
      expect(result).assertEqual(14);
      expect(x).assertEqual(9);
      expect(y).assertEqual(4);
    });

    /**
     * @tc.name   ExpressionTest0965
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0965
     * @tc.desc   Test template string with boolean expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0965', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 15;
      let b: number = 25;
      let str: string = `${a} > ${b}: ${a > b}, ${a} * 2 <= ${b}: ${a * 2 <= b}`;
      expect(str).assertEqual("15 > 25: false, 15 * 2 <= 25: false");
    });

    /**
     * @tc.name   ExpressionTest0966
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0966
     * @tc.desc   Test comma operator in conditional expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0966', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 5;
      let y: number = 10;
      let result: number;
      if (x > 3) {
        x++;
        y *= 2;
        result = x + y;
      } else {
        result = 0;
      }
      // x becomes 6, y becomes 20, result is 6 + 20 = 26
      expect(result).assertEqual(26);
    });

    /**
     * @tc.name   ExpressionTest0967
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0967
     * @tc.desc   Test bitwise NOT with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0967', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 8;
      let result: number = ~num + 16 / 2;
      // -9 + 8 = -1
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   ExpressionTest0968
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0968
     * @tc.desc   Test string index with calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0968', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Programming";
      let len: number = str.length;
      let mid: number = len / 2;
      let result: string = str[Math.floor(mid)] + str[Math.ceil(mid)];
      expect(result).assertEqual("am");
    });

    /**
     * @tc.name   ExpressionTest0969
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0969
     * @tc.desc   Test compound assignment with subtraction and multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0969', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 40;
      num -= 15; // 25
      num *= 3; // 75
      num -= 25; // 50
      expect(num).assertEqual(50);
    });

    /**
     * @tc.name   ExpressionTest0970
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0970
     * @tc.desc   Test array manipulation with modulus in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [];
      let i: number = 1;
      while (i % 17 !== 0) {
        arr.push(i * 2);
        i++;
      }
      expect(arr.length).assertEqual(16);
      expect(arr[arr.length - 1]).assertEqual(32);
    });

    /**
     * @tc.name   ExpressionTest0971
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0971
     * @tc.desc   Test logical NOT with comparison results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0971', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 7;
      let b: number = 12;
      let c: number = 7;

      let result1: boolean = !(a > b);
      let result2: boolean = !(a === c);

      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0972
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0972
     * @tc.desc   Test bitwise OR with compound assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0972', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 0b1010; // 10
      num |= 0b0111; // 10 | 7 = 15 (1111)
      num |= 0b1100; // 15 | 12 = 15 (1111)
      expect(num).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0973
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0973
     * @tc.desc   Test string concatenation with ternary operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0973', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let temp: number = 28;
      let str: string = "The temperature is " + temp + "°C, which is " +
        (temp > 30 ? "hot" : temp > 20 ? "warm" : "cool");
      expect(str).assertEqual("The temperature is 28°C, which is warm");
    });

    /**
     * @tc.name   ExpressionTest0974
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0974
     * @tc.desc   Test operator precedence with multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0974', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5;
      let b: number = 3;
      let c: number = 2;

      let result1: number = a + b * c;
      let result2: number = (a + b) * c;
      let result3: number = a / b + c;

      expect(result1).assertEqual(11);
      expect(result2).assertEqual(16);
      expect(result3).assertClose(5 / 3 + 2, 0.001);
    });

    /**
     * @tc.name   ExpressionTest0975
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0975
     * @tc.desc   Test grouped expressions in calculations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0975', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 10;
      let y: number = 4;

      let result: number = (x + y) * (x - y) / (y * 2);
      // (14) * (6) / 8 = 84 / 8 = 10.5
      expect(result).assertEqual(10.5);
    });

    /**
     * @tc.name   ExpressionTest0976
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0976
     * @tc.desc   Test array method with calculated parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0976', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c", "d", "e", "f", "g"];
      let start: number = 2;
      let count: number = 3;
      let subArr: string[] = arr.slice(start, start + count);
      expect(subArr).assertDeepEquals(["c", "d", "e"]);
    });

    /**
     * @tc.name   ExpressionTest0977
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0977
     * @tc.desc   Test unary minus with calculations in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0977', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 12;
      let b: number = 5;
      let str: string = `-${a} + ${b} = ${-a + b}, ${a} - ${b} * 2 = ${a - b * 2}`;
      expect(str).assertEqual("-12 + 5 = -7, 12 - 5 * 2 = 2");
    });

    /**
     * @tc.name   ExpressionTest0978
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0978
     * @tc.desc   Test comparison with bitwise complement results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0978', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = 10;
      let y: number = 3;
      let result: boolean = ~x > ~y;
      // -11 > -4 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0979
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0979
     * @tc.desc   Test compound assignment with division and addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0979', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 100;
      num /= 4; // 25
      num += 15; // 40
      num /= 8; // 5
      num *= 3; // 15
      expect(num).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0980
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0980
     * @tc.desc   Test array manipulation with complex conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [14, 22, 28, 35, 42, 50, 63, 70];
      let filtered: number[] = [];
      for (let i: number = 0; i < arr.length; i++) {
        if ((arr[i] % 7 === 0 || arr[i] % 5 === 0) && arr[i] > 30) {
          filtered.push(arr[i]);
        }
      }
      expect(filtered).assertDeepEquals([35, 42, 50, 63, 70]);
    });

    /**
     * @tc.name   ExpressionTest0981
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0981
     * @tc.desc   Test modulus with multiple conditions on numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0981', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numbers: number[] = [31, 43, 59, 71, 83];
      let result: number = 0;
      for (let i: number = 0; i < numbers.length; i++) {
        if (numbers[i] % 4 === 3 && numbers[i] % 6 === 5) {
          result = numbers[i];
          break;
        }
      }
      expect(result).assertEqual(59);
    });

    /**
     * @tc.name   ExpressionTest0982
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0982
     * @tc.desc   Test string concatenation with length calculations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0982', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let words: string[] = ["Elephant", "Giraffe", "Hippopotamus", "Zebra"];
      let longest: string = "";
      for (let i: number = 0; i < words.length; i++) {
        if (words[i].length > longest.length) {
          longest = words[i];
        }
      }
      let str: string = "Longest word: " + longest + " (" + longest.length + " letters)";
      expect(str).assertEqual("Longest word: Hippopotamus (12 letters)");
    });

    /**
     * @tc.name   ExpressionTest0983
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0983
     * @tc.desc   Test comparison with exponentiation results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0983', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = 5;
      let exp1: number = 3;
      let exp2: number = 2;
      let result: boolean = base**exp1 > base**exp2 * base;
      // 125 > 25 * 5 → 125 > 125 → false
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0984
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0984
     * @tc.desc   Test template string with math operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0984', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let radius: number = 5;
      let pi: number = Math.PI;
      let area: number = pi * radius**2;
      let str: string = `Circle with radius ${radius} has area ~${Math.round(area)} (exact: ${area.toFixed(2)})`;
      expect(str).assertEqual(`Circle with radius 5 has area ~79 (exact: 78.54)`);
    });

    /**
     * @tc.name   ExpressionTest0985
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0985
     * @tc.desc   Test array length with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0985', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5, 6, 7];
      let len: number = arr.length; // 7
      let result: number = len << 1 | 3; // 14 | 3 = 15
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0986
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0986
     * @tc.desc   Test index calculation with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0986', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let colors: string[] = ["red", "green", "blue", "yellow", "purple", "orange", "pink"];
      let index: number = 10 & 5; // 1010 & 0101 = 0000 → 0
      expect(colors[index]).assertEqual("red");
    });

    /**
     * @tc.name   ExpressionTest0987
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0987
     * @tc.desc   Test template string with array index calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0987', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30, 40, 50, 60];
      let x: number = 3;
      let y: number = 2;
      let str: string = `arr[${x}] * ${y} = ${arr[x] * y}, arr[${x - y}] = ${arr[x - y]}`;
      expect(str).assertEqual("arr[3] * 2 = 80, arr[1] = 20");
    });

    /**
     * @tc.name   ExpressionTest0988
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0988
     * @tc.desc   Test comparison with array length calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0988', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: string[] = ["a", "b", "c", "d", "e"];
      let threshold: number = 3;
      let result: boolean = arr.length - 1 > threshold;
      // 4 > 3 → true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0989
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0989
     * @tc.desc   Test string concatenation with conditional results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0989', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let scores: number[] = [85, 92, 78, 95, 88];
      let minPass: number = 80;
      let report: string = "Passed: ";
      let first: boolean = true;
      for (let i: number = 0; i < scores.length; i++) {
        if (scores[i] >= minPass) {
          report += (first ? "" : ", ") + scores[i];
          first = false;
        }
      }
      expect(report).assertEqual("Passed: 85, 92, 95, 88");
    });

    /**
     * @tc.name   ExpressionTest0990
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0990
     * @tc.desc   Test range check with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [12, 24, 36, 48, 60, 72];
      let total: number = 0;
      let lower: number = 20;
      let upper: number = 60;
      for (let i: number = 0; i < values.length; i++) {
        if (values[i] > lower && values[i] < upper) {
          total += values[i] / 12;
        }
      }
      // 24/12 + 36/12 + 48/12 = 2 + 3 + 4 = 9
      expect(total).assertEqual(9);
    });

    /**
     * @tc.name   ExpressionTest0991
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0991
     * @tc.desc   Test array length with arithmetic and bitwise XOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0991', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [10, 20, 30, 40];
      let len: number = arr.length; // 4
      let result: number = (len * 3) ^ 5; // 12 ^ 5 = 9
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ExpressionTest0992
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0992
     * @tc.desc   Test nested ternary with multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0992', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 75;
      let category: string = value >= 90 ? "Expert" :
        value >= 70 ? "Advanced" :
          value >= 50 ? "Intermediate" : "Beginner";
      expect(category).assertEqual("Advanced");
    });

    /**
     * @tc.name   ExpressionTest0993
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0993
     * @tc.desc   Test comma operator in for loop with transformations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0993', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numbers: number[] = [3, 6, 9, 12, 15];
      let transformed: number[] = [];
      let i: number, factor: number;
      for (i = 0, factor = 1; i < numbers.length; i++, factor += 0.5) {
        transformed.push(numbers[i] * factor);
      }
      expect(transformed).assertDeepEquals([3 * 1, 6 * 1.5, 9 * 2, 12 * 2.5, 15 * 3]);
    });

    /**
     * @tc.name   ExpressionTest0994
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0994
     * @tc.desc   Test string comparison with substring checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0994', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let words: string[] = ["apple", "applet", "application", "applause", "apply"];
      let prefix: string = "app";
      let count: number = 0;
      for (let i: number = 0; i < words.length; i++) {
        if (words[i].startsWith(prefix) && words[i].length > prefix.length + 2) {
          count++;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0995
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0995
     * @tc.desc   Test unary operators with multiple calculations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0995', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      let b: number = 3;
      let c: number = 2;
      let result: number = ~a + (-b) * c + ~~(a / b);
      // -11 + (-3)*2 + 3 = -11 - 6 + 3 = -14
      expect(result).assertEqual(-14);
    });

    /**
     * @tc.name   ExpressionTest0996
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0996
     * @tc.desc   Test bitwise operations with conditional checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0996', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numbers: number[] = [0b1011, 0b1101, 0b1110, 0b0111];
      let mask: number = 0b1011;
      let result: number = 0;
      for (let i: number = 0; i < numbers.length; i++) {
        if ((numbers[i] & mask) === mask) {
          result += numbers[i];
        }
      }
      // Only 0b1011 & 0b1010 = 0b1010
      expect(result).assertEqual(0b1011);
    });

    /**
     * @tc.name   ExpressionTest0997
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0997
     * @tc.desc   Test array manipulation with decrement in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0997', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [];
      let num: number = 16;
      while (num >= 1) {
        arr.push(num);
        num /= 2;
      }
      expect(arr).assertDeepEquals([16, 8, 4, 2, 1]);
    });

    /**
     * @tc.name   ExpressionTest0998
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0998
     * @tc.desc   Test comparison with transformed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0998', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 18;
      let b: number = 5;
      let c: number = 7;
      let result: boolean = (a % b) * 2 > c;
      // (3) * 2 > 7 → 6 > 7 → false
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0999
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0999
     * @tc.desc   Test comma operator in for loop with filtered values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0999', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [12, 24, 36, 48, 60, 72, 84];
      let filtered: number[] = [];
      let i: number, divisor: number;
      for (i = 0, divisor = 5; i < values.length; i++, divisor++) {
        if (values[i] % divisor === 0) {
          filtered.push(values[i]);
        }
      }
      expect(filtered).assertDeepEquals([24, 48]);
    });

    /**
     * @tc.name   ExpressionTest1000
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1000
     * @tc.desc   Test string concatenation with index arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let months: string[] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
      let current: number = 10; // November
      let next: number = (current + 2) % 12;
      let str: string = months[current] + " + 2 months = " + months[next];
      expect(str).assertEqual("Nov + 2 months = Jan");
    });

    /**
     * @tc.name   ExpressionTest1001
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1001
     * @tc.desc   Test arithmetic operations with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let result: number = maxVal + 1;
      // Adding 1 to MAX_VALUE still equals MAX_VALUE
      expect(result).assertEqual(maxVal);

      result = maxVal * 2;
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1002
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1002
     * @tc.desc   Test arithmetic operations with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minVal: number = Number.MIN_VALUE;
      let result: number = minVal / 2;
      // Dividing MIN_VALUE by 2 underflows to 0
      expect(result).assertEqual(0);

      result = minVal * 0.5;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1003
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1003
     * @tc.desc   Test modulus with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -17;
      let b: number = 5;
      let result1: number = a % b; // -2
      let result2: number = a % -b; // -2
      let result3: number = -a % b; // 2

      expect(result1).assertEqual(-2);
      expect(result2).assertEqual(-2);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest1004
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1004
     * @tc.desc   Test division with zero and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = -5;
      let b: number = 0;

      let result1: number = a / b; // -Infinity
      let result2: number = b / a; // 0
      let result3: number = -a / b; // Infinity

      expect(result1).assertEqual(-Infinity);
      expect(result2).assertEqual(0);
      expect(result3).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1005
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1005
     * @tc.desc   Test NaN propagation in arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let num: number = 10;

      let result1: number = nanVal + num;
      let result2: number = num - nanVal;
      let result3: number = nanVal * num;
      let result4: number = num / nanVal;

      expect(isNaN(result1)).assertTrue();
      expect(isNaN(result2)).assertTrue();
      expect(isNaN(result3)).assertTrue();
      expect(isNaN(result4)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1006
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1006
     * @tc.desc   Test bitwise operations with negative boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minInt: number = -2147483648;
      let result1: number = minInt >> 1;
      let result2: number = minInt << 1;
      expect(result1).assertEqual(-1073741824);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1007
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1007
     * @tc.desc   Test Infinity operations with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let num: number = -5;

      let result1: number = inf + negInf; // NaN
      let result2: number = inf * num; // -Infinity
      let result3: number = negInf / num; // Infinity

      expect(isNaN(result1)).assertTrue();
      expect(result2).assertEqual(-Infinity);
      expect(result3).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1008
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1008
     * @tc.desc   Test comparison with NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let num: number = 0;

      let result1: boolean = nanVal === nanVal; // false
      let result2: boolean = nanVal < num; // false
      let result3: boolean = nanVal > num; // false
      let result4: boolean = isNaN(nanVal); // true

      expect(result1).assertFalse();
      expect(result2).assertFalse();
      expect(result3).assertFalse();
      expect(result4).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1009
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1009
     * @tc.desc   Test exponentiation with negative base and fractional exponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = -8;
      let exponent: number = 1 / 3; // Cube root

      let result: number = base**exponent;
      // In JavaScript, this results in NaN for negative bases with fractional exponents
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1010
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1010
     * @tc.desc   Test arithmetic with zero boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let zero: number = 0;
      let negZero: number = -0;

      let result1: number = zero + negZero;
      let result2: number = zero * negZero;
      let result3: number = 1 / negZero;

      expect(result1).assertEqual(0);
      expect(1 / result2).assertEqual(-Infinity);
      expect(result3).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1011
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1011
     * @tc.desc   Test unary operators with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let minVal: number = Number.MIN_VALUE;
      let inf: number = Infinity;

      let result1: number = -maxVal; // Negative maximum value
      let result2: number = -minVal; // Negative minimum value
      let result3: number = -inf; // -Infinity

      expect(result1).assertEqual(-maxVal);
      expect(result2).assertEqual(-minVal);
      expect(result3).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1012
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1012
     * @tc.desc   Test bitwise NOT with boundary integers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 2147483647; // Maximum 32-bit signed integer
      let minInt: number = -2147483648; // Minimum 32-bit signed integer

      let result1: number = ~maxInt; // -2147483648
      let result2: number = ~minInt; // 2147483647

      expect(result1).assertEqual(minInt);
      expect(result2).assertEqual(maxInt);
    });

    /**
     * @tc.name   ExpressionTest1013
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1013
     * @tc.desc   Test comparison with Infinity and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let largeNeg: number = -1e308;

      let result1: boolean = negInf < largeNeg; // true
      let result2: boolean = inf > -largeNeg; // true
      let result3: boolean = negInf === -inf; // true

      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1014
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1014
     * @tc.desc   Test NaN in conditional expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let num: number = 10;

      let result1: number = nanVal ? 1 : 0; // 0 (NaN is falsy)
      let result2: number = isNaN(nanVal) ? num : 0; // 10

      expect(result1).assertEqual(0);
      expect(result2).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest1015
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1015
     * @tc.desc   Test array access with boundary indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let len: number = arr.length;

      let result1: number | undefined = arr[len]; // undefined
      let result2: number | undefined = arr[-1]; // undefined
      let result3: number | undefined = arr[len - 1]; // 5

      expect(result1).assertUndefined();
      expect(result2).assertUndefined();
      expect(result3).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest1016
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1016
     * @tc.desc   Test division with very small negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tinyNeg: number = -Number.MIN_VALUE;
      let result1: number = 1 / tinyNeg;
      let result2: number = tinyNeg / 2;

      expect(result1).assertEqual(-Infinity);
      expect(1 / result2).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1017
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1017
     * @tc.desc   Test modulus with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let num: number = 10;
      let negNum: number = -5;

      let result1: number = inf % num; // NaN
      let result2: number = num % inf; // 10
      let result3: number = negNum % inf; // -5

      expect(isNaN(result1)).assertTrue();
      expect(result2).assertEqual(10);
      expect(result3).assertEqual(-5);
    });

    /**
     * @tc.name   ExpressionTest1018
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1018
     * @tc.desc   Test exponentiation with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let num: number = 2;

      let result1: number = inf**num; // Infinity
      let result2: number = inf**-num; // 0
      let result3: number = negInf**num; // Infinity

      expect(result1).assertEqual(Infinity);
      expect(result2).assertEqual(0);
      expect(result3).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1019
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1019
     * @tc.desc   Test bitwise operations with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let num: number = 0b1010;

      let result1: number = nanVal & num; // 0 (NaN treated as 0 in bitwise ops)
      let result2: number = nanVal | num; // 10 (0b1010)
      let result3: number = nanVal ^ num; // 10 (0b1010)

      expect(result1).assertEqual(0);
      expect(result2).assertEqual(10);
      expect(result3).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest1020
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1020
     * @tc.desc   Test string conversion with boundary numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let nanVal: number = NaN;

      let result1: string = inf + ""; // "Infinity"
      let result2: string = negInf + ""; // "-Infinity"
      let result3: string = nanVal + ""; // "NaN"

      expect(result1).assertEqual("Infinity");
      expect(result2).assertEqual("-Infinity");
      expect(result3).assertEqual("NaN");
    });

    /**
     * @tc.name   ExpressionTest1021
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1021
     * @tc.desc   Test arithmetic with Number.MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxSafe: number = Number.MAX_SAFE_INTEGER;

      let result1: number = maxSafe + 1; // Still accurate
      let result2: number = maxSafe + 2; // May lose precision
      let result3: number = maxSafe * 2; // Loses precision

      expect(result1).assertEqual(9007199254740992);
      expect(result2).assertEqual(9007199254740993);
      expect(result3).assertEqual(18014398509481982);
    });

    /**
     * @tc.name   ExpressionTest1022
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1022
     * @tc.desc   Test arithmetic with Number.MIN_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minSafe: number = Number.MIN_SAFE_INTEGER;

      let result1: number = minSafe - 1; // Still accurate
      let result2: number = minSafe - 2; // May lose precision

      expect(result1).assertEqual(-9007199254740992);
      expect(result2).assertEqual(-9007199254740993);
    });

    /**
     * @tc.name   ExpressionTest1023
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1023
     * @tc.desc   Test increment/decrement with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let minVal: number = Number.MIN_VALUE;
      let inf: number = Infinity;

      let result1: number = maxVal++;
      let result2: number = ++maxVal;
      let result3: number = --minVal;
      let result4: number = inf++;

      expect(result1).assertEqual(Number.MAX_VALUE);
      expect(result2).assertEqual(Number.MAX_VALUE);
      expect(1 / result3).assertEqual(-1);
      expect(result4).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1024
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1024
     * @tc.desc   Test logical operations with NaN and Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let inf: number = Infinity;
      let negInf: number = -Infinity;

      let result1: boolean = Boolean(nanVal) && true;
      let result2: boolean = Boolean(inf) || false;
      let result3: boolean = !Boolean(negInf);
      expect(result1).assertFalse();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1025
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1025
     * @tc.desc   Test comparison with -0 and 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let zero: number = 0;
      let negZero: number = -0;

      let result1: boolean = zero === negZero;
      let result2: boolean = 1 / zero === 1 / negZero;
      let result3: boolean = zero < negZero;

      expect(result1).assertTrue();
      expect(result2).assertFalse();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1026
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1026
     * @tc.desc   Test array length boundary (2^32 - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxArrayLength: number = 2**32 - 1;
      let arr: number[] = [1, 2, 3];
      let result1: boolean = arr.length < maxArrayLength;
      let result2: number = maxArrayLength + 1;
      expect(result1).assertTrue();
      expect(result2).assertEqual(4294967296);
    });

    /**
     * @tc.name   ExpressionTest1027
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1027
     * @tc.desc   Test remainder with very large negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let largeNeg: number = -1e300;
      let divisor: number = 1e299;
      let result: number = largeNeg % divisor;
      expect(result).assertEqual(-0);
    });

    /**
     * @tc.name   ExpressionTest1028
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1028
     * @tc.desc   Test NaN in template literals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let inf: number = Infinity;
      let str: string = `Calculation result: ${nanVal}, Limit: ${inf}`;
      expect(str).assertEqual("Calculation result: NaN, Limit: Infinity");
    });

    /**
     * @tc.name   ExpressionTest1029
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1029
     * @tc.desc   Test bitwise shift with maximum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 2147483647;
      let shift: number = 31;
      let result1: number = 1 << shift;
      let result2: number = maxInt << 1;
      expect(result1).assertEqual(-2147483648);
      expect(result2).assertEqual(-2);
    });

    /**
     * @tc.name   ExpressionTest1030
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1030
     * @tc.desc   Test division of Infinity by negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negNum: number = -5;
      let negSmall: number = -0.0001;

      let result1: number = inf / negNum;
      let result2: number = inf / negSmall;
      let result3: number = negNum / inf;

      expect(result1).assertEqual(-Infinity);
      expect(result2).assertEqual(-Infinity);
      expect(1 / result3).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1031
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1031
     * @tc.desc   Test conditional expressions with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let nanVal: number = NaN;

      let result1: string = inf > 1e308 ? "Large" : "Small";
      let result2: string = negInf < -1e308 ? "Small" : "Large";
      let result3: string = isNaN(nanVal) ? "Invalid" : "Valid";

      expect(result1).assertEqual("Large");
      expect(result2).assertEqual("Small");
      expect(result3).assertEqual("Invalid");
    });

    /**
     * @tc.name   ExpressionTest1032
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1032
     * @tc.desc   Test exponentiation with negative exponents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = -2;
      let exp1: number = -3;
      let exp2: number = -4;

      let result1: number = base**exp1;
      let result2: number = base**exp2;

      expect(result1).assertEqual(-0.125);
      expect(result2).assertEqual(0.0625);
    });

    /**
     * @tc.name   ExpressionTest1033
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1033
     * @tc.desc   Test modulo with negative divisors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 17;
      let negDiv: number = -5;

      let result1: number = num % negDiv;
      let result2: number = -num % negDiv;

      expect(result1).assertEqual(2);
      expect(result2).assertEqual(-2);
    });

    /**
     * @tc.name   ExpressionTest1034
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1034
     * @tc.desc   Test arithmetic with Infinity and negative Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;

      let result1: number = inf + inf;
      let result2: number = negInf + negInf;
      let result3: number = inf * negInf;
      let result4: number = inf + negInf;

      expect(result1).assertEqual(Infinity);
      expect(result2).assertEqual(-Infinity);
      expect(result3).assertEqual(-Infinity);
      expect(isNaN(result4)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1035
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1035
     * @tc.desc   Test zero division with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = -5;
      let zero: number = 0;

      let result1: number = num / zero;
      let result2: number = num / -zero;
      let result3: number = zero / num;

      expect(result1).assertEqual(-Infinity);
      expect(result2).assertEqual(Infinity);
      expect(1 / result3).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1036
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1036
     * @tc.desc   Test NaN with compound assignment operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      let nanVal: number = NaN;

      num += nanVal;
      expect(isNaN(num)).assertTrue();

      num = 10;
      num *= nanVal;
      expect(isNaN(num)).assertTrue();

      num = 10;
      num -= nanVal;
      expect(isNaN(num)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1037
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1037
     * @tc.desc   Test bitwise operations with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let num: number = 0b1111;
      let result1: number = inf & num;
      let result2: number = inf | num;
      let result3: number = inf ^ num;

      expect(result1).assertEqual(0);
      expect(result2).assertEqual(15);
      expect(result3).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest1038
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1038
     * @tc.desc   Test comparison with MAX_VALUE and Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let inf: number = Infinity;

      let result1: boolean = inf > maxVal;
      let result2: boolean = maxVal < inf;
      let result3: boolean = maxVal === inf;

      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1039
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1039
     * @tc.desc   Test negative numbers with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let negNum: number = -5;

      let result1: number = negNum & 0b1111;
      let result2: number = negNum << 1;
      let result3: number = negNum >>> 2;

      expect(result1).assertEqual(11);
      expect(result2).assertEqual(-10);
      expect(result3).assertEqual(1073741822);
    });

    /**
     * @tc.name   ExpressionTest1040
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1040
     * @tc.desc   Test string concatenation with negative boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minInt: number = -2147483648;
      let maxInt: number = 2147483647;
      let str: string = "Min int: " + minInt + ", Max int: " + maxInt;
      expect(str).assertEqual("Min int: -2147483648, Max int: 2147483647");
    });

    /**
     * @tc.name   ExpressionTest1041
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1041
     * @tc.desc   Test exponentiation with boundary exponents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base: number = 2;
      let largeExp: number = 1024;
      let result1: number = base**largeExp;
      base = 1.1;
      result1 = base**largeExp;
      expect(result1).assertEqual(2.432817896953684e+42);
    });

    /**
     * @tc.name   ExpressionTest1042
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1042
     * @tc.desc   Test modulo with zero and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = -10;
      let zero: number = 0;

      let result1: number = num % zero;
      let result2: number = zero % num;

      expect(isNaN(result1)).assertTrue();
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1043
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1043
     * @tc.desc   Test logical assignment with NaN and Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = NaN;
      let fallback: number = 10;

      value ||= fallback;
      expect(value).assertEqual(10);

      value = Infinity;
      value &&= 20;
      expect(value).assertEqual(20);

      value = -Infinity;
      value ??= 30;
      expect(value).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1044
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1044
     * @tc.desc   Test increment/decrement with negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let negZero: number = -0;

      let result1: number = negZero++;
      let result2: number = ++negZero;

      expect(1 / result1).assertEqual(-Infinity);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest1045
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1045
     * @tc.desc   Test array operations with boundary indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = new Array(3);
      arr[0] = 1;
      arr[2] = 3;

      let result1: number | undefined = arr[1];
      let result2: number = arr.length;
      arr[result2] = 4;
      let result3: number = arr.length;

      expect(result1).assertUndefined();
      expect(result2).assertEqual(3);
      expect(result3).assertEqual(4);
    });

    /**
     * @tc.name   ExpressionTest1046
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1046
     * @tc.desc   Test division of negative numbers near zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let x: number = -1e-308;
      let y: number = -1e-308;

      let result1: number = x / y;
      let result2: number = x / 2;

      expect(result1).assertEqual(1);
      expect(1 / result2).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1047
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1047
     * @tc.desc   Test comparison with NaN in ternary operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = NaN;
      let result: string = isNaN(value) ? "Not a number" : value.toString();
      expect(result).assertEqual("Not a number");
    });

    /**
     * @tc.name   ExpressionTest1048
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1048
     * @tc.desc   Test bitwise XOR with negative boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minInt: number = -2147483648;
      let maxInt: number = 2147483647;

      let result1: number = minInt ^ maxInt;
      let result2: number = minInt ^ -1;

      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(maxInt);
    });

    /**
     * @tc.name   ExpressionTest1049
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1049
     * @tc.desc   Test Infinity in arithmetic with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let large: number = 1e308;
      let inf: number = Infinity;

      let result1: number = large + large;
      let result2: number = inf - large;
      let result3: number = large * 2;

      expect(result1).assertEqual(Infinity);
      expect(result2).assertEqual(Infinity);
      expect(result3).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1050
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1050
     * @tc.desc   Test NaN and Infinity in comma operator expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let inf: number = Infinity;
      let result: number;

      result = 5;
      expect(result).assertEqual(5);

      let i: number, sum: number;
      for (i = 0, sum = 0; i < 3; i++, sum += i) {
      }
      expect(sum).assertEqual(6);
    });
    /**
     * @tc.name   ExpressionTest1071
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1071
     * @tc.desc   Test nullish coalescing with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let zero: number = 0;
      let negZero: number = -0;
      let negInf: number = -Infinity;

      let result1: number = nanVal ?? 10;
      let result2: number = zero ?? 20;
      let result3: number = negZero ?? 30;
      let result4: number = negInf ?? 40;

      expect(result1).assertNaN();
      expect(result2).assertEqual(0);
      expect(1 / result3).assertEqual(-Infinity);
      expect(result4).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1072
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1072
     * @tc.desc   Test logical AND assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let inf: number = Infinity;
      let zero: number = 0;

      maxVal &&= 100;
      inf &&= 200;
      zero &&= 300;

      expect(maxVal).assertEqual(100);
      expect(inf).assertEqual(200);
      expect(zero).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1073
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1073
     * @tc.desc   Test logical OR assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minVal: number = Number.MIN_VALUE;
      let nanVal: number = NaN;
      let negInf: number = -Infinity;

      minVal ||= 50; // MIN_VALUE (truthy)
      nanVal ||= 60; // 60 (NaN is falsy)
      negInf ||= 70; // -Infinity (truthy)

      expect(minVal).assertEqual(Number.MIN_VALUE);
      expect(nanVal).assertEqual(60);
      expect(negInf).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1074
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1074
     * @tc.desc   Test nullish coalescing assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let emptyStr: string = "";
      let zero: number = 0;
      let negZero: number = -0;
      let undefinedVal: number | undefined = undefined;

      emptyStr ??= "default"; // "" (not nullish)
      zero ??= 5; // 0 (not nullish)
      negZero ??= 10; // -0 (not nullish)
      undefinedVal ??= 15; // 15 (was undefined)

      expect(emptyStr).assertEqual("");
      expect(zero).assertEqual(0);
      expect(1 / negZero).assertEqual(-Infinity); // Verify -0
      expect(undefinedVal).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest1075
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1075
     * @tc.desc   Test conditional operator with NaN and Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nanVal: number = NaN;
      let inf: number = Infinity;
      let negInf: number = -Infinity;

      let result1: string = isNaN(nanVal) ? "invalid" : "valid"; // "invalid"
      let result2: number = inf > 1e308 ? inf - 1e308 : inf; // Infinity
      let result3: number = negInf < -1e308 ? negInf + 1e308 : 0; // -Infinity

      expect(result1).assertEqual("invalid");
      expect(result2).assertEqual(Infinity);
      expect(result3).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1077
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1077
     * @tc.desc   Test unary plus with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let negNum: number = -100;
      let negInf: number = -Infinity;
      let nanVal: number = NaN;
      let minVal: number = Number.MIN_VALUE;

      let result1: number = +negNum; // -100
      let result2: number = +negInf; // -Infinity
      let result3: number = +nanVal; // NaN
      let result4: number = +minVal; // MIN_VALUE

      expect(result1).assertEqual(-100);
      expect(result2).assertEqual(-Infinity);
      expect(isNaN(result3)).assertTrue();
      expect(result4).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name   ExpressionTest1078
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1078
     * @tc.desc   Test unary negation with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let inf: number = Infinity;
      let zero: number = 0;
      let nanVal: number = NaN;

      let result1: number = -maxVal; // -MAX_VALUE
      let result2: number = -inf; // -Infinity
      let result3: number = -zero; // -0
      let result4: number = -nanVal; // NaN

      expect(result1).assertEqual(-maxVal);
      expect(result2).assertEqual(-Infinity);
      expect(1 / result3).assertEqual(-Infinity); // Verify -0
      expect(isNaN(result4)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1079
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1079
     * @tc.desc   Test prefix and postfix increment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxSafe: number = Number.MAX_SAFE_INTEGER;
      let minSafe: number = Number.MIN_SAFE_INTEGER;

      let result1: number = ++maxSafe; // MAX_SAFE_INTEGER + 1 (loses precision)
      let result2: number = minSafe--; // MIN_SAFE_INTEGER (postfix)
      let result3: number = minSafe; // MIN_SAFE_INTEGER - 1 (loses precision)

      expect(result1).assertEqual(9007199254740992);
      expect(result2).assertEqual(-9007199254740991);
      expect(result3).assertEqual(-9007199254740992);
    });

    /**
     * @tc.name   ExpressionTest1080
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1080
     * @tc.desc   Test prefix and postfix decrement with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxSafe: number = Number.MAX_SAFE_INTEGER;
      let minSafe: number = Number.MIN_SAFE_INTEGER;
      let zero: number = 0;

      let result1: number = --maxSafe;
      let result2: number = minSafe--;
      let result3: number = --zero;

      expect(result1).assertEqual(9007199254740990);
      expect(result2).assertEqual(-9007199254740991);
      expect(result3).assertEqual(-1);
    });

    /**
     * @tc.name   ExpressionTest1081
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1081
     * @tc.desc   Test exponentiation assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num1: number = 2;
      let num2: number = 0.5;
      let num3: number = -3;
      num1 **= 53;
      num2 **= 1000;
      num3 **= 3;
      expect(num1).assertEqual(9007199254740992);
      expect(num2).assertEqual(9.332636185032189e-302);
      expect(num3).assertEqual(-27);
    });

    /**
     * @tc.name   ExpressionTest1082
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1082
     * @tc.desc   Test division assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let inf: number = Infinity;
      let negNum: number = -100;

      maxVal /= 2; // MAX_VALUE / 2
      inf /= 1000; // Still Infinity
      negNum /= 3; // -33.333...

      expect(maxVal).assertEqual(Number.MAX_VALUE / 2);
      expect(inf).assertEqual(Infinity);
      expect(negNum).assertEqual(-33.333333333333336);
    });

    /**
     * @tc.name   ExpressionTest1083
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1083
     * @tc.desc   Test multiplication assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let halfMax: number = Number.MAX_VALUE / 2;
      let tiny: number = Number.MIN_VALUE;
      let negTiny: number = -Number.MIN_VALUE;

      halfMax *= 2; // MAX_VALUE
      tiny *= 0.5; // 0 (underflow)
      negTiny *= 0.5; // -0 (underflow)

      expect(halfMax).assertEqual(Number.MAX_VALUE);
      expect(tiny).assertEqual(0);
      expect(1 / negTiny).assertEqual(-Infinity); // Verify -0
    });

    /**
     * @tc.name   ExpressionTest1084
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1084
     * @tc.desc   Test subtraction assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let zero: number = 0;
      let minVal: number = Number.MIN_VALUE;
      let maxVal: number = Number.MAX_VALUE;

      zero -= minVal; // -MIN_VALUE
      minVal -= minVal; // 0
      maxVal -= Number.MAX_VALUE / 2; // MAX_VALUE / 2

      expect(zero).assertEqual(-Number.MIN_VALUE);
      expect(minVal).assertEqual(0);
      expect(maxVal).assertEqual(Number.MAX_VALUE / 2);
    });

    /**
     * @tc.name   ExpressionTest1085
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1085
     * @tc.desc   Test addition assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let halfMax: number = Number.MAX_VALUE / 2;
      let inf: number = Infinity;
      let negInf: number = -Infinity;

      halfMax += halfMax;
      inf += 1e308;
      negInf += -1e308;

      expect(halfMax).assertEqual(Number.MAX_VALUE);
      expect(inf).assertEqual(Infinity);
      expect(negInf).assertEqual(-Infinity);
    });

    /**
     * @tc.name   ExpressionTest1086
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1086
     * @tc.desc   Test modulus assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let large: number = 1e308;
      let mod: number = 1e307;
      let negLarge: number = -1e308;
      large %= mod;
      negLarge %= mod;
      expect(large).assertEqual(2.4948003869184e+291);
      expect(1 / negLarge).assertEqual(-4.008336720017946e-292);
    });

    /**
     * @tc.name   ExpressionTest1087
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1087
     * @tc.desc   Test bitwise AND assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 2147483647;
      let minInt: number = -2147483648;
      let mask: number = 0x0000FFFF;

      maxInt &= mask;
      minInt &= mask;

      expect(maxInt).assertEqual(65535);
      expect(minInt).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest1088
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1088
     * @tc.desc   Test bitwise OR assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 0;
      let maxInt: number = 2147483647;
      let mask: number = 0x80000000;
      num |= maxInt;
      num |= mask;
      expect(num).assertEqual(-1);
    });

    /**
     * @tc.name   ExpressionTest1089
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1089
     * @tc.desc   Test bitwise XOR assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 2147483647;
      let allOnes: number = -1;

      maxInt ^= allOnes;

      expect(maxInt).assertEqual(-2147483648);
    });

    /**
     * @tc.name   ExpressionTest1090
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1090
     * @tc.desc   Test left shift assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 1;
      let negNum: number = -1;

      num <<= 31;
      negNum <<= 31;

      expect(num).assertEqual(-2147483648);
      expect(negNum).assertEqual(-2147483648);
    });

    /**
     * @tc.name   ExpressionTest1091
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1091
     * @tc.desc   Test right shift assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minInt: number = -2147483648;
      let maxInt: number = 2147483647;
      minInt >>= 31;
      maxInt >>= 30;
      expect(minInt).assertEqual(-1);
      expect(maxInt).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest1092
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1092
     * @tc.desc   Test unsigned right shift assignment with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let minInt: number = -2147483648;
      let maxInt: number = 2147483647;
      minInt >>>= 1;
      maxInt >>>= 30;
      expect(minInt).assertEqual(1073741824);
      expect(maxInt).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest1093
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1093
     * @tc.desc   Test greater than and less than with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let minVal: number = Number.MIN_VALUE;

      let result1: boolean = inf > maxVal;
      let result2: boolean = negInf < -maxVal;
      let result3: boolean = 0 > minVal;
      let result4: boolean = -0 < 0;

      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
      expect(result4).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest1094
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1094
     * @tc.desc   Test greater than or equal and less than or equal with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxSafe: number = Number.MAX_SAFE_INTEGER;
      let aboveSafe: number = maxSafe + 1;
      let zero: number = 0;
      let negZero: number = -0;

      let result1: boolean = aboveSafe >= maxSafe;
      let result2: boolean = maxSafe <= aboveSafe;
      let result3: boolean = zero >= negZero;
      let result4: boolean = negZero <= zero;

      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1095
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1095
     * @tc.desc   Test equality and identity with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let zero: number = 0;
      let negZero: number = -0;
      let nanVal: number = NaN;
      let inf: number = Infinity;
      let negInf: number = -Infinity;

      let result1: boolean = zero === negZero;
      let result2: boolean = nanVal === nanVal;
      let result3: boolean = inf === -inf;
      let result4: boolean = (1 / zero) === inf;

      expect(result1).assertTrue();
      expect(result2).assertFalse();
      expect(result3).assertFalse();
      expect(result4).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1096
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1096
     * @tc.desc   Test inequality with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let inf: number = Infinity;
      let zero: number = 0;
      let negZero: number = -0;
      let nanVal: number = NaN;

      let result1: boolean = maxVal !== inf;
      let result2: boolean = zero !== negZero;
      let result3: boolean = nanVal !== 0;
      let result4: boolean = nanVal !== nanVal;

      expect(result1).assertTrue();
      expect(result2).assertFalse();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1097
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1097
     * @tc.desc   Test string concatenation operator with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let nanVal: number = NaN;
      let maxVal: number = Number.MAX_VALUE;

      let result1: string = "Value: " + inf;
      let result2: string = negInf + " is small";
      let result3: string = nanVal + "";
      let result4: string = maxVal + " is big";

      expect(result1).assertEqual("Value: Infinity");
      expect(result2).assertEqual("-Infinity is small");
      expect(result3).assertEqual("NaN");
      expect(result4).assertEqual(Number.MAX_VALUE + " is big");
    });

    /**
     * @tc.name   ExpressionTest1098
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1098
     * @tc.desc   Test typeof operator with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let nanVal: number = NaN;
      let zero: number = 0;
      let negZero: number = -0;

      let result1: string = typeof inf;
      let result2: string = typeof negInf;
      let result3: string = typeof nanVal;
      let result4: string = typeof negZero;

      expect(result1).assertEqual("number");
      expect(result2).assertEqual("number");
      expect(result3).assertEqual("number");
      expect(result4).assertEqual("number");
    });

    /**
     * @tc.name   ExpressionTest1100
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1100
     * @tc.desc   Test instanceof operator with boundary objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let numObj: Number = new Number(Number.MAX_VALUE);
      let arr: number[] = new Array(0);
      let strObj: String = new String("");

      let result1: boolean = numObj instanceof Number;
      let result2: boolean = arr instanceof Array;
      let result3: boolean = strObj instanceof String;

      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1101
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1101
     * @tc.desc   Test bitwise NOT with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 2147483647;
      let minInt: number = -2147483648;
      let zero: number = 0;
      let one: number = 1;

      let result1: number = ~maxInt;
      let result2: number = ~minInt;
      let result3: number = ~zero;
      let result4: number = ~one;

      expect(result1).assertEqual(-2147483648);
      expect(result2).assertEqual(2147483647);
      expect(result3).assertEqual(-1);
      expect(result4).assertEqual(-2);
    });

    /**
     * @tc.name   ExpressionTest1102
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1102
     * @tc.desc   Test ternary operator with multiple boundary conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let val1: number = Infinity;
      let val2: number = -Infinity;
      let val3: number = NaN;

      let result1: string = val1 > 1e308 ? "infinite" : "finite";
      let result2: string = val2 < -1e308 ? "negative infinite" : "finite";
      let result3: string = isNaN(val3) ? "not a number" : val3.toString();

      expect(result1).assertEqual("infinite");
      expect(result2).assertEqual("negative infinite");
      expect(result3).assertEqual("not a number");
    });

    /**
     * @tc.name   ExpressionTest1103
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1103
     * @tc.desc   Test compound assignment with mixed boundary operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 1;
      num <<= 30;
      num *= 2;
      num /= 2;
      num -= 1;
      num &= 0xFF;
      expect(num).assertEqual(255);
    });

    /**
     * @tc.name   ExpressionTest1104
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1104
     * @tc.desc   Test operator precedence with boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxVal: number = Number.MAX_VALUE;
      let halfMax: number = maxVal / 2;

      // Without parentheses
      let result1: number = maxVal + halfMax * 2;
      // With parentheses
      let result2: number = (maxVal + halfMax) * 2;

      expect(result1).assertEqual(Infinity);
      expect(result2).assertEqual(Infinity);
    });

    /**
     * @tc.name   ExpressionTest1106
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1106
     * @tc.desc   Test logical operators with mixed boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let inf: number = Infinity;
      let negInf: number = -Infinity;
      let nanVal: number = NaN;
      let zero: number = 0;

      let result1: number = inf && negInf;
      let result2: number = nanVal || inf;
      let result3: boolean = !(zero);

      expect(result1).assertEqual(-Infinity);
      expect(result2).assertEqual(Infinity);
      expect(result3).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest1107
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1107
     * @tc.desc   Test exponentiation with mixed boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let base1: number = 2;
      let base2: number = 0.5;
      let exp1: number = 1023;
      let exp2: number = 1024;

      let result1: number = base1**exp1;
      let result2: number = base1**exp2;
      let result3: number = base2**exp1;
      let result4: number = base2**exp2;

      expect(result1).assertLess(Infinity);
      expect(result2).assertEqual(Infinity);
      expect(result3).assertLarger(0);
      expect(result4).assertEqual(5.562684646268003e-309);
    });

    /**
     * @tc.name   ExpressionTest1108
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1108
     * @tc.desc   Test bitwise operations with mixed boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let maxInt: number = 2147483647;
      let minInt: number = -2147483648;
      let mask: number = 0x0F;

      let result1: number = (maxInt ^ minInt) & mask;
      let result2: number = (minInt >> 28) | mask;

      expect(result1).assertEqual(15);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.name   ExpressionTest1109
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1109
     * @tc.desc   Test string operators with boundary string lengths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let longStr: string = "a".repeat(10000);
      let emptyStr: string = "";

      let result1: string = longStr + emptyStr;
      let result2: number = result1.length;
      let result3: string = emptyStr + longStr;

      expect(result1).assertEqual(longStr);
      expect(result2).assertEqual(10000);
      expect(result3).assertEqual(longStr);
    });

    /**
     * @tc.name   ExpressionTest1110
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST1110
     * @tc.desc   Test array operators with boundary indices and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = new Array(3);
      let maxSafe: number = Number.MAX_SAFE_INTEGER;
      arr[0] = maxSafe;
      arr[1] = maxSafe + 1;
      arr[2] = -maxSafe;
      let result1: number = arr[0];
      let result2: number = arr[1];
      let result3: number = arr[2];
      expect(result1).assertEqual(9007199254740991);
      expect(result2).assertEqual(9007199254740992);
      expect(result3).assertEqual(-9007199254740991);
    });
  }
  )
}