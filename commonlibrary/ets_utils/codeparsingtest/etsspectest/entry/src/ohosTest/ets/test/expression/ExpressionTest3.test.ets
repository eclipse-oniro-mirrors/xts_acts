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

function encode(a: number, b: number): number {
  return (a << 4) | (b & 0x0F);
}

interface GeneratedTypeLiteralInterface_1 {
  a: number;
  b: number;
}

function decode(value: number): GeneratedTypeLiteralInterface_1 {
  return {
    a: value >> 4,
    b: value & 0x0F
  };
}

interface GeneratedTypeLiteralInterface_2 {
  name?: string;
}

function innerStrFunc(str: string): string {
  return "Inner: " + str;
}

function outerStrFunc(str: string): string {
  return innerStrFunc("Outer: " + str);
}

interface GeneratedTypeLiteralInterface_3 {
  text?: string;
}

function getGreeting(): string {
  return "Hello";
}

function getName(): string {
  return "Jane";
}

export default function expressionTest3() {
  describe('ExpressionTest3', () => {
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
     * @tc.name   ExpressionTest0321
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0321
     * @tc.desc   Test strict equality with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 2;
      const result: boolean = (a >> b) === (a / (2**b));
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0322
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0322
     * @tc.desc   Test strict inequality with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -10;
      const b: number = 2;
      const result: boolean = (a >> b) !== (a / (2**b));
      expect(result).assertTrue(); // Different for negative numbers
    });

    /**
     * @tc.name   ExpressionTest0323
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0323
     * @tc.desc   Test greater than with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 15;
      const b: number = 4;
      const result: boolean = (a & b) > (a ^ b);
      expect(result).assertFalse(); // 4 > 11 is false
    });

    /**
     * @tc.name   ExpressionTest0324
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0324
     * @tc.desc   Test less than with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -15;
      const b: number = 4;
      const result: boolean = (a & b) < (a ^ b);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0325
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0325
     * @tc.desc   Test logical AND with bitwise conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 5;
      const result: boolean = (a & 1) === 0 && (b & 1) !== 0;
      // a is even (10 & 1 = 0), b is odd (5 & 1 = 1)
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0326
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0326
     * @tc.desc   Test logical OR with bitwise conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 5;
      const result: boolean = (a & 8) !== 0 || (b & 8) !== 0;
      // a has 8's bit set (1010), b does not (0101)
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0327
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0327
     * @tc.desc   Test logical NOT with bitwise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0;
      const result: boolean = !(a | 0);
      // a | 0 is 0, which is falsy, so !0 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0328
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0328
     * @tc.desc   Test conditional operator with bitwise conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12; // 1100
      const result: string = (a & 0x0F) === a ? "8-bit" : "More than 8 bits";
      // 12 in binary is 1100, which fits in 4 bits
      expect(result).assertEqual("8-bit");
    });

    /**
     * @tc.name   ExpressionTest0329
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0329
     * @tc.desc   Test comma operator in for loop with bitwise updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 1, mask = 1; i <= 4; i++, mask <<= 1) {
        result += i * mask;
      }
      // 1*1 + 2*2 + 3*4 + 4*8 = 1 + 4 + 12 + 32 = 49
      expect(result).assertEqual(49);
    });

    /**
     * @tc.name   ExpressionTest0330
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0330
     * @tc.desc   Test unary plus with bitwise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: number = +(a ^ b);
      const expected: number = 9;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0331
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0331
     * @tc.desc   Test unary minus with bitwise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const result: number = -(a & b);
      const expected: number = -2;
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name   ExpressionTest0332
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0332
     * @tc.desc   Test prefix increment with bitwise operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      const result: number = ++a & 0x0F;
      // a becomes 6 (110), 6 & 15 = 6
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest0333
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0333
     * @tc.desc   Test postfix increment with bitwise operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 5; // 101
      const result: number = a++ & 0x0F;
      // Uses 5 before incrementing, 5 & 15 = 5
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0334
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0334
     * @tc.desc   Test prefix decrement with bitwise operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 6; // 110
      const result: number = --a | 0x10;
      // a becomes 5 (101), 5 | 16 = 21
      expect(result).assertEqual(21);
    });

    /**
     * @tc.name   ExpressionTest0335
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0335
     * @tc.desc   Test postfix decrement with bitwise operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 6; // 110
      const result: number = a-- | 0x10;
      // Uses 6 before decrementing, 6 | 16 = 22
      expect(result).assertEqual(22);
    });

    /**
     * @tc.name   ExpressionTest0336
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0336
     * @tc.desc   Test logical nullish assignment with bitwise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number | null = null;
      const b: number = 15;
      const c: number = 8;
      a ??= b & c;
      // b & c = 8, so a becomes 8
      expect(a).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest0337
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0337
     * @tc.desc   Test logical OR assignment with bitwise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 0;
      const b: number = 5;
      const c: number = 3;
      a ||= b ^ c;
      // b ^ c = 6, so a becomes 6
      expect(a).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest0338
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0338
     * @tc.desc   Test logical AND assignment with bitwise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: number = 10;
      const b: number = 12;
      const c: number = 3;
      a &&= b >> c;
      // b >> c = 1, so a becomes 1
      expect(a).assertEqual(1);
    });

    /**
     * @tc.name   ExpressionTest0339
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0339
     * @tc.desc   Test operator precedence with bitwise and arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a + b & c;
      const result2: number = a + (b & c);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(12);
    });

    /**
     * @tc.name   ExpressionTest0340
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0340
     * @tc.desc   Test operator precedence with shift and comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 2;
      const c: number = 3;
      const result: boolean = a >> b > c;
      // 10 >> 2 = 2, 2 > 3 is false
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0341
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0341
     * @tc.desc   Test optional chaining with bitwise result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class BitProcessor {
        process(value: number): number {
          return value ^ 0x0F;
        }
      }

      let processor: BitProcessor | null = new BitProcessor();
      const result1: number | undefined = processor?.process(10);
      processor = null;
      // 10 ^ 15 = 5
      expect(result1).assertEqual(5);
    });

    /**
     * @tc.name   ExpressionTest0342
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0342
     * @tc.desc   Test bitwise operations in function returns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const encoded: number = encode(5, 10);
      const decoded = decode(encoded);
      expect(encoded).assertEqual(0x5A); // 90 in decimal
      expect(decoded.a).assertEqual(5);
      expect(decoded.b).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0343
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0343
     * @tc.desc   Test bitwise operations with function parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let checkBit: (value: number, bit: number) => boolean = (value: number, bit: number): boolean => {
        return (value & (1 << bit)) !== 0;
      };
      const num: number = 0b1010; // 10 in decimal
      expect(checkBit(num, 0)).assertFalse(); // Bit 0 is 0
      expect(checkBit(num, 1)).assertTrue(); // Bit 1 is 1
      expect(checkBit(num, 2)).assertFalse(); // Bit 2 is 0
      expect(checkBit(num, 3)).assertTrue(); // Bit 3 is 1
    });

    /**
     * @tc.name   ExpressionTest0344
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0344
     * @tc.desc   Test bitwise operations in array initialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 1;
      const mask: number[] = [
        base << 0,
        base << 1,
        base << 2,
        base << 3
      ];
      expect(mask[0]).assertEqual(1);
      expect(mask[1]).assertEqual(2);
      expect(mask[2]).assertEqual(4);
      expect(mask[3]).assertEqual(8);
    });

    /**
     * @tc.name   ExpressionTest0345
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0345
     * @tc.desc   Test bitwise operations with object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class Flags {
        value: number = 0;

        setFlag(flag: number): void {
          this.value |= flag;
        }

        clearFlag(flag: number): void {
          this.value &= ~flag;
        }

        hasFlag(flag: number): boolean {
          return (this.value & flag) !== 0;
        }
      }

      const flags: Flags = new Flags();
      const FLAG_A: number = 1 << 0;
      const FLAG_B: number = 1 << 1;

      flags.setFlag(FLAG_A);
      expect(flags.hasFlag(FLAG_A)).assertTrue();
      expect(flags.hasFlag(FLAG_B)).assertFalse();

      flags.setFlag(FLAG_B);
      expect(flags.hasFlag(FLAG_A)).assertTrue();
      expect(flags.hasFlag(FLAG_B)).assertTrue();

      flags.clearFlag(FLAG_A);
      expect(flags.hasFlag(FLAG_A)).assertFalse();
      expect(flags.hasFlag(FLAG_B)).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0346
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0346
     * @tc.desc   Test nested bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 0b1010;
      const b: number = 0b0110;
      const c: number = 0b1001;

      // Nested bitwise operations
      const result: number = (a & b) | ~(c << 1);
      // a & b = 0b0010
      // c << 1 = 0b10010
      // ~(c << 1) = all bits except those in 0b10010 are set
      // (a & b) | ~(c << 1) = all bits set except those in 0b10000
      expect(result).assertEqual(~0b10000);
    });

    /**
     * @tc.name   ExpressionTest0347
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0347
     * @tc.desc   Test bitwise operations with maximum negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const min32: number = -2147483648; // 0b10000000000000000000000000000000
      const result1: number = min32 >> 1; // Sign-preserving shift
      const result2: number = min32 << 1; // Overflow
      const result3: number = ~min32; // Bitwise NOT

      expect(result1).assertEqual(-1073741824); // Special case for minimum value
      expect(result2).assertEqual(0); // Overflow results in 0
      expect(result3).assertEqual(2147483647); // 0b01111111111111111111111111111111
    });

    /**
     * @tc.name   ExpressionTest0348
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0348
     * @tc.desc   Test bitwise operations with maximum positive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const max32: number = 2147483647; // 0b01111111111111111111111111111111
      const result1: number = max32 >> 1;
      const result2: number = max32 << 1;
      const result3: number = ~max32;

      expect(result1).assertEqual(1073741823);
      expect(result2).assertEqual(-2);
      expect(result3).assertEqual(-2147483648);
    });

    /**
     * @tc.name   ExpressionTest0349
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0349
     * @tc.desc   Test bitwise operations in loop conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = 1; // 0b1
      let count: number = 0;
      while ((value & 0x80) === 0) { // While 8th bit is not set
        value <<= 1;
        count++;
      }
      // Should loop 7 times: 1 → 2 → 4 → 8 → 16 → 32 → 64 → 128
      expect(count).assertEqual(7);
      expect(value).assertEqual(128);
    });

    /**
     * @tc.name   ExpressionTest0350
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0350
     * @tc.desc   Test comma operator in for loop with multiple bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let mask: number, shift: number;
      for (mask = 1, shift = 0; mask <= 0x80; mask <<= 1, shift++) {
        if (shift % 2 === 0) { // Only use even shifts
          result |= mask;
        }
      }
      expect(result).assertEqual(85);
    });

    /**
     * @tc.name   ExpressionTest0351
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0351
     * @tc.desc   Test string concatenation with + operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = " World";
      const result: string = str1 + str2;
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.name   ExpressionTest0352
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0352
     * @tc.desc   Test string concatenation with multiple values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "a";
      const str2: string = "b";
      const str3: string = "c";
      const result: string = str1 + str2 + str3;
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.name   ExpressionTest0353
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0353
     * @tc.desc   Test string concatenation assignment (+=)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Hello";
      str += " there";
      expect(str).assertEqual("Hello there");
    });

    /**
     * @tc.name   ExpressionTest0354
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0354
     * @tc.desc   Test string concatenation with numbers (same type operations)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      const strNum: string = "42";
      // Convert number to string first to ensure same type operation
      const result: string = String(num) + strNum;
      expect(result).assertEqual("4242");
    });

    /**
     * @tc.name   ExpressionTest0355
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0355
     * @tc.desc   Test string length comparison with numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      const len: number = str.length;
      const result: boolean = len > 3;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0356
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0356
     * @tc.desc   Test string strict equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "test";
      const str2: string = "test";
      const str3: string = "Test";
      expect(str1 === str2).assertTrue();
      expect(str1 === str3).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0357
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0357
     * @tc.desc   Test string strict inequality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "banana";
      const str3: string = "apple";
      expect(str1 !== str2).assertTrue();
      expect(str1 !== str3).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0358
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0358
     * @tc.desc   Test string comparison with > operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "orange";
      const str2: string = "apple";
      const result: boolean = str1 > str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0359
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0359
     * @tc.desc   Test string comparison with < operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "cat";
      const str2: string = "dog";
      const result: boolean = str1 < str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0360
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0360
     * @tc.desc   Test string comparison with >= operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "grape";
      const str2: string = "grape";
      const str3: string = "grapevines";
      expect(str1 >= str2).assertTrue();
      expect(str3 >= str1).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0361
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0361
     * @tc.desc   Test string comparison with <= operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "berry";
      const str2: string = "berry";
      const str3: string = "apple";
      expect(str1 <= str2).assertTrue();
      expect(str3 <= str1).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0362
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0362
     * @tc.desc   Test logical AND with string conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      const result: boolean = str.length > 5 && str.startsWith("hello");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0363
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0363
     * @tc.desc   Test logical OR with string conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "goodbye";
      const result: boolean = str.endsWith("hello") || str.length === 7;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0364
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0364
     * @tc.desc   Test conditional operator with string checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: string = str.length > 5 ? "long" : "short";
      expect(result).assertEqual("short");
    });

    /**
     * @tc.name   ExpressionTest0365
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0365
     * @tc.desc   Test string concatenation in function calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatGreeting: (title: string, name: string) => string = (title: string, name: string): string => {
        return "Hello, " + title + " " + name;
      };
      const result: string = formatGreeting("Dr", "Smith");
      expect(result).assertEqual("Hello, Dr Smith");
    });

    /**
     * @tc.name   ExpressionTest0366
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0366
     * @tc.desc   Test string return values in arithmetic expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getStringLength: (str: string) => number = (str: string): number => {
        return str.length;
      };
      const result: number = getStringLength("example") * 2;
      expect(result).assertEqual(14);
    });

    /**
     * @tc.name   ExpressionTest0367
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0367
     * @tc.desc   Test string concatenation with ternary operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const isMorning: boolean = true;
      const greeting: string = "Good " + (isMorning ? "morning" : "evening");
      expect(greeting).assertEqual("Good morning");
    });

    /**
     * @tc.name   ExpressionTest0368
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0368
     * @tc.desc   Test comma operator in for loop with string operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let i: number, char: string;
      for (i = 0, char = "a"; i < 3; i++, char = String.fromCharCode(char.charCodeAt(0) + 1)) {
        result += char;
      }
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.name   ExpressionTest0369
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0369
     * @tc.desc   Test typeof with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello";
      const str2: string = "";
      expect(typeof str1).assertEqual("string");
      expect(typeof str2).assertEqual("string");
    });

    /**
     * @tc.name   ExpressionTest0370
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0370
     * @tc.desc   Test string concatenation with template strings (expression operator)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: string = "Alice";
      const age: number = 30;
      const result: string = `${name} is ${age} years old`;
      expect(result).assertEqual("Alice is 30 years old");
    });

    /**
     * @tc.name   ExpressionTest0371
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0371
     * @tc.desc   Test string index access with arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      const index: number = 2;
      const result: string = str[index + 1];
      expect(result).assertEqual("d");
    });

    /**
     * @tc.name   ExpressionTest0372
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0372
     * @tc.desc   Test string concatenation with incremented values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 1;
      const result: string = "Item " + count++ + ", Item " + count++;
      expect(result).assertEqual("Item 1, Item 2");
    });

    /**
     * @tc.name   ExpressionTest0373
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0373
     * @tc.desc   Test string methods with operator results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      const start: number = 6;
      const length: number = 5;
      const result: string = str.substring(start, start + length);
      expect(result).assertEqual("world");
    });

    /**
     * @tc.name   ExpressionTest0374
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0374
     * @tc.desc   Test logical NOT with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "not empty";
      const str2: string = "";
      expect(!str1).assertFalse();
      expect(!str2).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0375
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0375
     * @tc.desc   Test string concatenation assignment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      const parts: string[] = ["a", "b", "c"];
      for (let i = 0; i < parts.length; i++) {
        result += parts[i];
      }
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.name   ExpressionTest0376
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0376
     * @tc.desc   Test string comparison with logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "javascript";
      const result: boolean = str.startsWith("java") && str.length > 5;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0377
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0377
     * @tc.desc   Test string length with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello";
      const str2: string = "world";
      const result: number = str1.length + str2.length;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0378
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0378
     * @tc.desc   Test string concatenation with function return values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getFirstName: () => string = (): string => {
        return "John";
      };
      let getLastName: () => string = (): string => {
        return "Doe";
      };
      const result: string = getFirstName() + " " + getLastName();
      expect(result).assertEqual("John Doe");
    });

    /**
     * @tc.name   ExpressionTest0379
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0379
     * @tc.desc   Test string conditions in conditional operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "typescript";
      const result: string = str.includes("type") ? "Type found" : "Type not found";
      expect(result).assertEqual("Type found");
    });

    /**
     * @tc.name   ExpressionTest0380
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0380
     * @tc.desc   Test string concatenation with nullish coalescing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: string | null = null;
      const defaultName: string = "Guest";
      const result: string = "Hello, " + (name ?? defaultName);
      expect(result).assertEqual("Hello, Guest");
    });

    /**
     * @tc.name   ExpressionTest0381
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0381
     * @tc.desc   Test string comparison with bitwise operators (same-type conversion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Convert strings to their numeric representations first
      const str1: string = "10";
      const str2: string = "20";
      const num1: number = Number(str1);
      const num2: number = Number(str2);
      const result: number = num1 & num2;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest0382
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0382
     * @tc.desc   Test string index with decrement operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example";
      let index: number = str.length;
      const result: string = str[--index];
      expect(result).assertEqual("e");
    });

    /**
     * @tc.name   ExpressionTest0383
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0383
     * @tc.desc   Test string concatenation with logical assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "Error: ";
      const errorDetail: string = "File not found";
      message ||= "Default message"; // Should not change since message is not empty
      message += errorDetail;
      expect(message).assertEqual("Error: File not found");
    });

    /**
     * @tc.name   ExpressionTest0384
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0384
     * @tc.desc   Test optional chaining with string properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_2 = {};
      const result1: string | undefined = data.name?.toUpperCase();
      data.name = "test";
      const result2: string | undefined = data.name?.toUpperCase();
      expect(result1).assertUndefined();
      expect(result2).assertEqual("TEST");
    });

    /**
     * @tc.name   ExpressionTest0385
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0385
     * @tc.desc   Test string length with modulus operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      const result: number = str.length % 3;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0386
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0386
     * @tc.desc   Test string concatenation with exponentiation result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 2;
      const exponent: number = 3;
      const result: string = "Result: " + String(base**exponent);
      expect(result).assertEqual("Result: 8");
    });

    /**
     * @tc.name   ExpressionTest0387
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0387
     * @tc.desc   Test string comparison with operator precedence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "app";
      const str3: string = "apricot";
      const result: boolean = str1 > str2 && str1 < str3;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0388
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0388
     * @tc.desc   Test string concatenation with grouped expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: string = "Hello";
      const b: string = "World";
      const c: string = "!";
      const result: string = a + " " + (b + c);
      expect(result).assertEqual("Hello World!");
    });

    /**
     * @tc.name   ExpressionTest0389
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0389
     * @tc.desc   Test string methods with operator results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const start: number = 2;
      const end: number = 7;
      const result: string = str.slice(start, end);
      expect(result).assertEqual("cdefg");
    });

    /**
     * @tc.name   ExpressionTest0390
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0390
     * @tc.desc   Test string concatenation with unary plus on numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      // Convert to string explicitly before concatenation
      const result: string = "Value: " + String(+num);
      expect(result).assertEqual("Value: 42");
    });

    /**
     * @tc.name   ExpressionTest0391
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0391
     * @tc.desc   Test string comparison with negative unary operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "5";
      const num: number = 10;
      // Convert string to number first for same-type comparison
      const result: boolean = -Number(str) > -num;
      expect(result).assertTrue(); // -5 > -10 is true
    });

    /**
     * @tc.name   ExpressionTest0392
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0392
     * @tc.desc   Test string length with assignment operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello";
      let result: number = 0;
      result += str.length;
      result *= 2;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0393
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0393
     * @tc.desc   Test string concatenation with increment in loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 1; i <= 3; i++) {
        result += "Item " + i + " ";
      }
      expect(result).assertEqual("Item 1 Item 2 Item 3 ");
    });

    /**
     * @tc.name   ExpressionTest0394
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0394
     * @tc.desc   Test string conditions with arithmetic results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      const result: boolean = str.length / 2 > 2;
      expect(result).assertTrue(); // 6 / 2 = 3 > 2
    });

    /**
     * @tc.name   ExpressionTest0395
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0395
     * @tc.desc   Test string concatenation with bitwise results (converted to string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      // Convert bitwise result to string first
      const result: string = "Result: " + String(a & b);
      expect(result).assertEqual("Result: 2");
    });

    /**
     * @tc.name   ExpressionTest0396
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0396
     * @tc.desc   Test string comparison with shifted values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "8";
      const shifted: number = 2 << 2; // 8
      // Convert string to number first
      expect(Number(str) === shifted).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0397
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0397
     * @tc.desc   Test string concatenation with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: boolean = true;
      const b: boolean = false;
      // Convert boolean results to strings first
      const result: string = String(a && b) + " " + String(a || b);
      expect(result).assertEqual("false true");
    });

    /**
     * @tc.name   ExpressionTest0398
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0398
     * @tc.desc   Test string length with bitwise NOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: number = ~str.length;
      expect(result).assertEqual(-5); // ~4 = -5
    });

    /**
     * @tc.name   ExpressionTest0399
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0399
     * @tc.desc   Test string index with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefgh";
      const result: string = str[(str.length / 2) - 1];
      expect(result).assertEqual("d"); // Length is 8, 8/2 - 1 = 3, index 3 is 'd'
    });

    /**
     * @tc.name   ExpressionTest0400
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0400
     * @tc.desc   Test comma operator in for loop with string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strings: string[] = ["a", "bb", "ccc", "dddd"];
      let totalLength: number = 0;
      let i: number, current: string;
      for (i = 0, current = strings[0]; i < strings.length; i++, current = strings[i]) {
        totalLength += current.length;
      }
      expect(totalLength).assertEqual(10);
    });

    /**
     * @tc.name   ExpressionTest0401
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0401
     * @tc.desc   Test string concatenation with escaped characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "He said, \"Hello\"";
      const str2: string = "World\n";
      const result: string = str1 + " " + str2;
      expect(result).assertEqual("He said, \"Hello\" World\n");
    });

    /**
     * @tc.name   ExpressionTest0402
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0402
     * @tc.desc   Test string concatenation with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Café";
      const str2: string = " au lait";
      const result: string = str1 + str2;
      expect(result).assertEqual("Café au lait");
    });

    /**
     * @tc.name   ExpressionTest0403
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0403
     * @tc.desc   Test string comparison with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "äpple"; // With umlaut
      const result: boolean = str1 < str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0404
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0404
     * @tc.desc   Test string concatenation with empty strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "";
      const str3: string = "World";
      const result: string = str1 + str2 + str3;
      expect(result).assertEqual("HelloWorld");
    });

    /**
     * @tc.name   ExpressionTest0405
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0405
     * @tc.desc   Test string concatenation assignment with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Test";
      const empty: string = "";
      str += empty;
      expect(str).assertEqual("Test");
    });

    /**
     * @tc.name   ExpressionTest0406
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0406
     * @tc.desc   Test string length comparison with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "";
      const str2: string = "non-empty";
      expect(str1.length === 0).assertTrue();
      expect(str2.length === 0).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0407
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0407
     * @tc.desc   Test string strict equality with whitespace differences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello world";
      const str2: string = "hello  world"; // Extra space
      expect(str1 === str2).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0408
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0408
     * @tc.desc   Test string comparison with case differences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "Hello";
      const str2: string = "hello";
      expect(str1 > str2).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0409
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0409
     * @tc.desc   Test logical AND with string length checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "moderate length";
      const result: boolean = str.length > 5 && str.length < 20;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0410
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0410
     * @tc.desc   Test logical OR with string content checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "password";
      const result: boolean = str.includes("admin") || str.length < 6;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0411
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0411
     * @tc.desc   Test conditional operator with string length ranges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "short";
      const result: string = str.length > 10 ? "long" :
        str.length > 5 ? "medium" : "short";
      expect(result).assertEqual("short");
    });

    /**
     * @tc.name   ExpressionTest0412
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0412
     * @tc.desc   Test string concatenation in nested function calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = outerStrFunc("content");
      expect(result).assertEqual("Inner: Outer: content");
    });

    /**
     * @tc.name   ExpressionTest0413
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0413
     * @tc.desc   Test string return values in comparison expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let getString: () => string = (): string => {
        return "comparison";
      };
      const result: boolean = getString() > "compare";
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0414
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0414
     * @tc.desc   Test template strings with arithmetic expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 3;
      const result: string = `${a} + ${b} = ${a + b}`;
      expect(result).assertEqual("5 + 3 = 8");
    });

    /**
     * @tc.name   ExpressionTest0415
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0415
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      let i: number, currentChar: string;
      for (i = 65, currentChar = String.fromCharCode(i); i <= 67; i++, currentChar = String.fromCharCode(i)) {
        result += currentChar;
      }
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.name   ExpressionTest0416
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0416
     * @tc.desc   Test typeof with string literals vs variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strVar: string = "test";
      const result1: string = typeof strVar;
      const result2: string = typeof "literal";
      expect(result1).assertEqual("string");
      expect(result2).assertEqual("string");
    });

    /**
     * @tc.name   ExpressionTest0417
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0417
     * @tc.desc   Test string index access with variable arithmetic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmno";
      const offset: number = 3;
      const step: number = 2;
      const result: string = str[offset + step * 2];
      expect(result).assertEqual("h"); // 3 + 4 = 7, index 7 is 'i'
    });

    /**
     * @tc.name   ExpressionTest0418
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0418
     * @tc.desc   Test string concatenation with post-increment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 5;
      const result: string = "Count: " + count++ + ", Next: " + count;
      expect(result).assertEqual("Count: 5, Next: 6");
    });

    /**
     * @tc.name   ExpressionTest0419
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0419
     * @tc.desc   Test string methods with operator results in parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const start: number = 2;
      const length: number = 4;
      const result: string = str.substr(start, length + 1);
      expect(result).assertEqual("cdefg");
    });

    /**
     * @tc.name   ExpressionTest0420
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0420
     * @tc.desc   Test logical NOT with string methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "hello";
      const str2: string = "world";
      expect(!str1.includes("x")).assertTrue();
      expect(!str2.startsWith("w")).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0421
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0421
     * @tc.desc   Test string concatenation assignment with loop index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 0; i < 3; i++) {
        result += "[" + i + "]";
      }
      expect(result).assertEqual("[0][1][2]");
    });

    /**
     * @tc.name   ExpressionTest0422
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0422
     * @tc.desc   Test string comparison with combined logical operators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "typescript";
      const result: boolean = (str.length > 5 && str.startsWith("type")) || str.endsWith("script");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0423
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0423
     * @tc.desc   Test string length with multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "abc";
      const str2: string = "defgh";
      const result: number = str1.length * str2.length;
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ExpressionTest0424
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0424
     * @tc.desc   Test string concatenation with function return values in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result: string = getGreeting() + ", " + getName() + "!";
      expect(result).assertEqual("Hello, Jane!");
    });

    /**
     * @tc.name   ExpressionTest0425
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0425
     * @tc.desc   Test nested conditional operators with string checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "apple";
      const result: string = str.length > 6 ? "Very long" :
        str.length > 4 ? "Long" :
          str.length > 2 ? "Medium" : "Short";
      expect(result).assertEqual("Long");
    });

    /**
     * @tc.name   ExpressionTest0426
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0426
     * @tc.desc   Test string concatenation with nullish coalescing in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const title: string | null = null;
      const defaultTitle: string = "Document";
      const result: string = `${title ?? defaultTitle} - Page 1`;
      expect(result).assertEqual("Document - Page 1");
    });

    /**
     * @tc.name   ExpressionTest0427
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0427
     * @tc.desc   Test string to number conversion before bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "12";
      const str2: string = "5";
      const num1: number = Number(str1);
      const num2: number = Number(str2);
      const result: number = num1 ^ num2;
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ExpressionTest0428
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0428
     * @tc.desc   Test string index with prefix decrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdef";
      let index: number = 3;
      const result: string = str[--index] + str[index++];
      expect(result).assertEqual("cc");
    });

    /**
     * @tc.name   ExpressionTest0429
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0429
     * @tc.desc   Test logical AND assignment with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "Success";
      const error: string = "Error occurred";
      message &&= error; // Should update since message is truthy
      expect(message).assertEqual("Error occurred");
    });

    /**
     * @tc.name   ExpressionTest0430
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0430
     * @tc.desc   Test optional chaining with string methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const data: GeneratedTypeLiteralInterface_3 = { text: "example" };
      const result1: string | undefined = data.text?.replace("example", "test");
      data.text = undefined;
      expect(result1).assertEqual("test");
    });

    /**
     * @tc.name   ExpressionTest0431
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0431
     * @tc.desc   Test string length with division
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijkl";
      const result: number = str.length / 4;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0432
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0432
     * @tc.desc   Test string concatenation with exponentiation in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 3;
      const exponent: number = 3;
      const result: string = `${base} to the power of ${exponent} is ${base**exponent}`;
      expect(result).assertEqual("3 to the power of 3 is 27");
    });

    /**
     * @tc.name   ExpressionTest0433
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0433
     * @tc.desc   Test string comparison with operator precedence and parentheses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "app";
      const str3: string = "apricot";
      const result1: boolean = str1 > str2 && str1 < str3;
      const temp: string = str2 && str1;
      const result2: boolean = str1 > temp && temp < str3;
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0434
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0434
     * @tc.desc   Test string concatenation with grouped template expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 20;
      const result: string = `Total: ${a + b}, Average: ${(a + b) / 2}`;
      expect(result).assertEqual("Total: 30, Average: 15");
    });

    /**
     * @tc.name   ExpressionTest0435
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0435
     * @tc.desc   Test string methods with arithmetic in parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghijklmnopqrstuvwxyz";
      const start: number = 0;
      const count: number = 5;
      const result: string = str.substring(start, start + count * 2);
      expect(result).assertEqual("abcdefghij");
    });

    /**
     * @tc.name   ExpressionTest0436
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0436
     * @tc.desc   Test string concatenation with unary minus in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      const result: string = `Value: ${-num}`;
      expect(result).assertEqual("Value: -42");
    });

    /**
     * @tc.name   ExpressionTest0437
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0437
     * @tc.desc   Test string comparison with unary operator results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "100";
      const num: number = 50;
      const result: boolean = Number(str) > -num;
      expect(result).assertTrue(); // 100 > -50 is true
    });

    /**
     * @tc.name   ExpressionTest0438
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0438
     * @tc.desc   Test string length with subtraction assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      let result: number = 20;
      result -= str.length;
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ExpressionTest0439
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0439
     * @tc.desc   Test string concatenation with increment in nested loops
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: string = "";
      for (let i = 0; i < 2; i++) {
        for (let j = 0; j < 2; j++) {
          result += `(${i},${j})`;
        }
      }
      expect(result).assertEqual("(0,0)(0,1)(1,0)(1,1)");
    });

    /**
     * @tc.name   ExpressionTest0440
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0440
     * @tc.desc   Test string conditions with modulus results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const result: boolean = str.length % 2 === 0;
      expect(result).assertTrue(); // Length is 10, 10 % 2 = 0
    });

    /**
     * @tc.name   ExpressionTest0441
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0441
     * @tc.desc   Test string concatenation with bitwise shift results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: string = `5 shifted left by 2: ${a << 2}`;
      expect(result).assertEqual("5 shifted left by 2: 20");
    });

    /**
     * @tc.name   ExpressionTest0442
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0442
     * @tc.desc   Test string comparison with bitwise NOT results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "3";
      const num: number = 3;
      const result: boolean = Number(str) === ~~num; // Double bitwise NOT truncates
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0443
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0443
     * @tc.desc   Test string concatenation with logical expressions in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 20;
      const result: string = `${a} < ${b}: ${a < b}, ${a} > ${b}: ${a > b}`;
      expect(result).assertEqual("10 < 20: true, 10 > 20: false");
    });

    /**
     * @tc.name   ExpressionTest0444
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0444
     * @tc.desc   Test string length with bitwise AND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "hello world";
      const result: number = str.length & 1;
      expect(result).assertEqual(1); // Length is 11, 11 & 1 = 1 (odd)
    });

    /**
     * @tc.name   ExpressionTest0445
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0445
     * @tc.desc   Test string index with bitwise OR operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const a: number = 2;
      const b: number = 3;
      const result: string = str[a | b];
      expect(result).assertEqual("d");
    });

    /**
     * @tc.name   ExpressionTest0446
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0446
     * @tc.desc   Test string concatenation with XOR result in template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 12;
      const b: number = 5;
      const result: string = `${a} XOR ${b} = ${a ^ b}`;
      expect(result).assertEqual("12 XOR 5 = 9");
    });

    /**
     * @tc.name   ExpressionTest0447
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0447
     * @tc.desc   Test string comparison with shifted values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "16";
      const shifted: number = 4 << 2; // 16
      expect(Number(str) === shifted).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0448
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0448
     * @tc.desc   Test string concatenation with multiple logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 10;
      const c: number = 15;
      const result: string = `a < b: ${a < b}, b < c: ${b < c}, both: ${a < b && b < c}`;
      expect(result).assertEqual("a < b: true, b < c: true, both: true");
    });

    /**
     * @tc.name   ExpressionTest0449
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0449
     * @tc.desc   Test string length with bitwise NOT in condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "test";
      const result: boolean = ~str.length < -5;
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0450
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0450
     * @tc.desc   Test comma operator in for loop with string length and index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "reverse me";
      let reversed: string = "";
      let i: number, len: number;
      for (i = str.length - 1, len = str.length; i >= 0; i--, len--) {
        reversed += str[i];
      }
      expect(reversed).assertEqual("em esrever");
      expect(len).assertEqual(0);
    });

    /**
     * @tc.name   ExpressionTest0451
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0451
     * @tc.desc   Test string concatenation with ternary operator and length check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "Hello";
      const result: string = str + (str.length > 4 ? " there" : "");
      expect(result).assertEqual("Hello there");
    });

    /**
     * @tc.name   ExpressionTest0452
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0452
     * @tc.desc   Test numeric operations with unary plus in string template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      const result: string = `Value: ${+num}, Incremented: ${+num++}`;
      expect(result).assertEqual("Value: 5, Incremented: 5");
      expect(num).assertEqual(6);
    });

    /**
     * @tc.name   ExpressionTest0453
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0453
     * @tc.desc   Test bitwise operations in for loop with comma operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0453', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: number = 0;
      let i: number, mask: number;
      for (i = 0, mask = 1; i < 4; i++, mask <<= 1) {
        result += mask;
      }
      expect(result).assertEqual(15); // 1 + 2 + 4 + 8
    });

    /**
     * @tc.name   ExpressionTest0454
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0454
     * @tc.desc   Test string comparison with logical NOT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0454', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "apple";
      const result: boolean = !(str1 === str2);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   ExpressionTest0455
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0455
     * @tc.desc   Test numeric equality with bitwise results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0455', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 6;
      const result: boolean = (a & b) === 2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0456
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0456
     * @tc.desc   Test string concatenation with multiple conditionals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0456', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const score: number = 85;
      let result: string = "Score: " + score + " - ";
      result += score > 90 ? "Excellent" :
        score > 80 ? "Good" :
          score > 70 ? "Average" : "Poor";
      expect(result).assertEqual("Score: 85 - Good");
    });

    /**
     * @tc.name   ExpressionTest0457
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0457
     * @tc.desc   Test unary minus with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0457', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const result: number = -(a << 1);
      expect(result).assertEqual(-20);
    });

    /**
     * @tc.name   ExpressionTest0458
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0458
     * @tc.desc   Test string length with arithmetic in loop condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0458', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "looping";
      let count: number = 0;
      for (let i = 0; i < str.length / 2; i++) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name   ExpressionTest0459
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0459
     * @tc.desc   Test logical AND with numeric range checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0459', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 42;
      const result: boolean = num > 10 && num < 50;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0460
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0460
     * @tc.desc   Test logical OR with string checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "example";
      const result: boolean = str.startsWith("test") || str.endsWith("ple");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0461
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0461
     * @tc.desc   Test compound assignment with bitwise operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0461', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      num &= 15; // 1010 & 1111 = 1010 (10)
      num |= 4; // 1010 | 0100 = 1110 (14)
      num ^= 3; // 1110 ^ 0011 = 1101 (13)
      expect(num).assertEqual(13);
    });

    /**
     * @tc.name   ExpressionTest0462
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0462
     * @tc.desc   Test string template with logical expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0462', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const b: number = 10;
      const result: string = `${a} is ${a > b ? 'greater than' : 'less than'} ${b}`;
      expect(result).assertEqual("5 is less than 10");
    });

    /**
     * @tc.name   ExpressionTest0463
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0463
     * @tc.desc   Test increment operator in string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0463', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      const result: string = "Count: " + ++count + ", Next: " + count++;
      expect(result).assertEqual("Count: 1, Next: 1");
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   ExpressionTest0464
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0464
     * @tc.desc   Test decrement operator in numeric expressions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0464', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 5;
      const result: number = num-- * 2 + --num;
      // (5 * 2) + 3 = 10 + 3 = 13
      expect(result).assertEqual(13);
      expect(num).assertEqual(3);
    });

    /**
     * @tc.name   ExpressionTest0465
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0465
     * @tc.desc   Test comma operator in for loop with string manipulation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: string = "item";
      let result: string = "";
      let i: number, current: string;
      for (i = 1, current = base + i; i <= 3; i++, current = base + i) {
        result += current + " ";
      }
      expect(result).assertEqual("item1 item2 item3 ");
    });

    /**
     * @tc.name   ExpressionTest0466
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0466
     * @tc.desc   Test string comparison with length and content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str1: string = "apple";
      const str2: string = "app";
      const result: boolean = str1.length > str2.length && str1 > str2;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0467
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0467
     * @tc.desc   Test numeric operations with modulus in condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 15;
      let result: string = "";
      if (num % 2 === 0) {
        result = "Even";
      } else {
        result = "Odd";
      }
      expect(result).assertEqual("Odd");
    });

    /**
     * @tc.name   ExpressionTest0468
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0468
     * @tc.desc   Test string concatenation with nullish coalescing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const name: string | null = null;
      const defaultName: string = "User";
      const result: string = "Hello, " + (name ?? defaultName);
      expect(result).assertEqual("Hello, User");
    });

    /**
     * @tc.name   ExpressionTest0469
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0469
     * @tc.desc   Test bitwise operations with negative numbers in condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = -5;
      const b: number = -3;
      const result: boolean = (a & b) === -7;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0470
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0470
     * @tc.desc   Test string index access with arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const index: number = 3;
      const result: string = str[index] + str[index + 2];
      expect(result).assertEqual("df");
    });

    /**
     * @tc.name   ExpressionTest0471
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0471
     * @tc.desc   Test logical assignment with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "";
      const defaultMsg: string = "Default message";
      message ||= defaultMsg;
      expect(message).assertEqual("Default message");
    });

    /**
     * @tc.name   ExpressionTest0472
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0472
     * @tc.desc   Test optional chaining with string properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface Info {
        name?: string;
      }

      interface Data {
        info?: Info;
      }

      const data: Data = { info: { name: "Test" } };
      const result1: string | undefined = data.info?.name?.toUpperCase();
      data.info = undefined;
      const info = data.info as Info | undefined;
      const result2: string | undefined = info?.name?.toUpperCase();
      expect(result1).assertEqual("TEST");
      expect(result2).assertUndefined();
    });

    /**
     * @tc.name   ExpressionTest0473
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0473
     * @tc.desc   Test numeric comparison with shifted values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 5;
      const result: boolean = (a << 1) > (a * 1.5);
      // 10 > 7.5 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0474
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0474
     * @tc.desc   Test string concatenation with exponentiation result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const base: number = 2;
      const exp: number = 3;
      const result: string = base + "^" + exp + " = " + (base**exp);
      expect(result).assertEqual("2^3 = 8");
    });

    /**
     * @tc.name   ExpressionTest0475
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0475
     * @tc.desc   Test operator precedence with arithmetic and bitwise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 3;
      const c: number = 2;
      const result1: number = a + b * c;
      const result2: number = (a + b) * c;
      expect(result1).assertEqual(16);
      expect(result2).assertEqual(26);
    });

    /**
     * @tc.name   ExpressionTest0476
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0476
     * @tc.desc   Test grouped expressions in string template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const x: number = 5;
      const y: number = 3;
      const result: string = `${x} + ${y} = ${x + y}, ${x} * ${y} = ${x * y}`;
      expect(result).assertEqual("5 + 3 = 8, 5 * 3 = 15");
    });

    /**
     * @tc.name   ExpressionTest0477
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0477
     * @tc.desc   Test string methods with operator results as parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = "abcdefghij";
      const start: number = 2;
      const length: number = 4;
      const result: string = str.substr(start, length);
      expect(result).assertEqual("cdef");
    });

    /**
     * @tc.name   ExpressionTest0478
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0478
     * @tc.desc   Test unary minus with arithmetic in string template
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num: number = 15;
      const result: string = `Negative: ${-num}, Absolute: ${-(-num)}`;
      expect(result).assertEqual("Negative: -15, Absolute: 15");
    });

    /**
     * @tc.name   ExpressionTest0479
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0479
     * @tc.desc   Test numeric comparison with unary operator results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const a: number = 10;
      const b: number = 5;
      const result: boolean = -a < -b;
      // -10 < -5 is true
      expect(result).assertTrue();
    });

    /**
     * @tc.name   ExpressionTest0480
     * @tc.number SUB_BUILTINS_EXPRESSION_TEST0480
     * @tc.desc   Test compound assignment with arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExpressionTest0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number = 10;
      num += 5; // 15
      num *= 2; // 30
      num -= 8; // 22
      num /= 2; // 11
      expect(num).assertEqual(11);
    });
  })
}