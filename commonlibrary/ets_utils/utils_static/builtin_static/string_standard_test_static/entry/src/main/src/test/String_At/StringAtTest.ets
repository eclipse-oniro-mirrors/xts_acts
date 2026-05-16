/*
* Copyright (C) 2026 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import Utils from '../Util.test';


export interface CompareCharAtResult {
  atResult: string | undefined;
  charAtResult: Char;
}

export interface CompareSliceResult {
  atResult: string | undefined;
  sliceResult: string;
}

export interface LastCharThreeWaysResult {
  atResult: string | undefined;
  lengthWay: Char;
  sliceWay: string;
}

export interface EmojiCodePointResult {
  result: string | undefined;
  codePoint: number;
}

namespace atTest{
  export function testAtPositiveIndex():string|undefined {
    const sentence = "The quick brown fox jumps over the lazy dog.";
    const index = 5;
    return sentence.at(index);
  }

  export function testAtZeroIndex():string|undefined {
    const str = "test";
    return str.at(0);
  }

  export function testAtMiddleIndex():string|undefined {
    const str = "The quick brown fox jumps over the lazy dog.";
    return str.at(10);
  }

  export function testAtNegativeIndex():string|undefined {
    const sentence = "The quick brown fox jumps over the lazy dog.";
    return sentence.at(-4);
  }

  export function testAtNegativeIndex2():string|undefined {
    const sentence = "The quick brown fox jumps over the lazy dog.";
    return sentence.at(-2);
  }

  export function testAtNegativeIndex3():string|undefined {
    const str = "test";
    return str.at(-1);
  }

  export function testAtNegativeIndex4():string|undefined {
    const str = "test";
    return str.at(-4);
  }

  export function testAtReturnType(str: string): string {
    return typeof str.at(1);
  }

  export function testAtReturnLength(str: string): number {
    return str.at(1)!.length;
  }

  export function testAtInvalidPositive(str: string): string | undefined {
    return str.at(100);
  }

  export function testAtInvalidNegative(str: string): string | undefined {
    return str.at(-10);
  }

  export function testAtOutOfBoundsLength(str: string): string | undefined {
    return str.at(5);
  }

  export function testAtEmptyZero():string|undefined {
    const emptyStr = "";
    return emptyStr.at(0);
  }

  export function testAtEmptyNegative():string|undefined {
    const emptyStr = "";
    return emptyStr.at(-1);
  }

  export function testAtEmptyPositive():string|undefined {
    const emptyStr = "";
    return emptyStr.at(1);
  }

  export function testAtFloatPositive(): string | undefined {
    const str = "hello";
    return str.at(1);
  }

  export function testAtFloatNegative(): string | undefined {
    const str = "hello";
    return str.at(-1);
  }

  export function testAtFloatPositive2(): string | undefined {
    const str = "hello";
    return str.at(2);
  }

  export function testAtStringNumber(): string | undefined {
    const str = "abc";
    return str.at(1);
  }

  export function testAtStringNegative(): string | undefined {
    const str = "abc";
    return str.at(-2);
  }

  export function testAtNaN(): string | undefined {
    const str = "test";
    return str.at(0);
  }

  export function testAtNull(): string | undefined {
    const str = "hello";
    return str.at(0);
  }

  export function testAtUndefined(): string | undefined {
    const str = "hello";
    return str.at(0);
  }

  export function testAtNoParameter(): string | undefined {
    const str = "hello";
    return str.at(0);
  }

  export function testAtTwoCharFirst():string|undefined {
    const str = "AB";
    return str.at(0);
  }

  export function testAtTwoCharLast():string|undefined {
    const str = "AB";
    return str.at(1);
  }

  export function testAtTwoCharNegFirst():string|undefined {
    const str = "AB";
    return str.at(-2);
  }

  export function testAtTwoCharNegLast():string|undefined {
    const str = "AB";
    return str.at(-1);
  }

  export function testAtTwoCharOutOfBounds():string|undefined {
    const str = "AB";
    return str.at(2);
  }

  export function testAtSingleCharZero():string|undefined {
    const str = "x";
    return str.at(0);
  }

  export function testAtSingleCharNeg():string|undefined {
    const str = "x";
    return str.at(-1);
  }

  export function testAtSingleCharOne():string|undefined {
    const str = "x";
    return str.at(1);
  }

  export function testAtSingleCharNegTwo():string|undefined {
    const str = "x";
    return str.at(-2);
  }

  export function testAtLongStringFirst():string|undefined {
    const longStr = "a".repeat(1000);
    return longStr.at(0);
  }

  export function testAtLongStringLast():string|undefined {
    const longStr = "a".repeat(1000);
    return longStr.at(999);
  }

  export function testAtLongStringNeg():string|undefined {
    const longStr = "a".repeat(1000);
    return longStr.at(-1);
  }

  export function testAtLongStringNeg1000():string|undefined {
    const longStr = "a".repeat(1000);
    return longStr.at(-1000);
  }

  export function testAtLongStringMid():string|undefined {
    const longStr = "a".repeat(1000);
    return longStr.at(500);
  }

  export function testAtCompareCharAtValid(): CompareCharAtResult {
    const str = "test";
    return {
      atResult: str.at(1),
      charAtResult: str.charAt(1)
    };
  }

  export function testAtCompareSliceNeg(): CompareSliceResult {
    const str = "Every green bus drives fast.";
    return {
      atResult: str.at(-2),
      sliceResult: str.slice(-2, -1)
    };
  }

  export function testAtCompareSlicePos(): CompareSliceResult {
    const str = "Every green bus drives fast.";
    return {
      atResult: str.at(5),
      sliceResult: str.slice(5, 6)
    };
  }

  export function testAtLastCharThreeWays(): LastCharThreeWaysResult {
    const str = "Every green bus drives fast.";
    return {
      atResult: str.at(-1),
      lengthWay: str.charAt(str.length - 1),
      sliceWay: str.slice(-1)
    };
  }

  export function testAtASCII():string|undefined {
    const str = "Hello, World! 123";
    return str.at(7);
  }

  export function testAtBMPFirst():string|undefined {
    const str = "你好世界";
    return str.at(0);
  }

  export function testAtBMPSecond():string|undefined {
    const str = "你好世界";
    return str.at(1);
  }

  export function testAtBMPNeg():string|undefined {
    const str = "你好世界";
    return str.at(-1);
  }

  export function testAtBMPThird():string|undefined {
    const str = "你好世界";
    return str.at(-2);
  }

  export function testAtEmojiFirst(): EmojiCodePointResult {
    const str = "😀🎉";
    const result = str.at(0);
    return {
      result: result,
      codePoint: result!.charCodeAt(0)
    };
  }

  export function testAtEmojiSecond(): EmojiCodePointResult {
    const str = "😀🎉";
    const result = str.at(1);
    return {
      result: result,
      codePoint: result!.charCodeAt(0)
    };
  }

  export function testAtEmojiLength(): number {
    const str = "😀🎉";
    return str.length;
  }

  export function testAtEmojiThird(): EmojiCodePointResult {
    const str = "😀🎉";
    const result = str.at(2);
    return {
      result: result,
      codePoint: result!.charCodeAt(0)
    };
  }

  export function testAtMixedString(): Array<string | undefined> {
    const str = "Hi你好";
    return [str.at(0), str.at(1), str.at(2), str.at(3)];
  }

  export function testAtPracticalLast1():string|undefined {
    const invoiceRef = "myinvoice01";
    return invoiceRef.at(-1);
  }

  export function testAtPracticalLast2():string|undefined {
    const invoiceRef = "myinvoice02";
    return invoiceRef.at(-1);
  }

  export function testAtPracticalSecondLast():string|undefined {
    const str = "Every green bus drives fast.";
    return str.at(-2);
  }

  export function testAtPracticalThirdLast():string|undefined {
    const str = "Every green bus drives fast.";
    return str.at(-3);
  }

  export function testAtPracticalCondNeg():string|undefined {
    const str = "hello";
    const useNegative = true;
    const index = useNegative ? -1 : 0;
    return str.at(index);
  }

  export function testAtPracticalCondPos():string|undefined {
    const str = "hello";
    const useNegative = false;
    const index = useNegative ? -1 : 0;
    return str.at(index);
  }

  export function testAtPracticalLoopForward():Array<string | undefined> {
    const str = "hello";
    return [str.at(0), str.at(1), str.at(2)];
  }

  export function testAtPracticalLoopBackward():Array<string | undefined>  {
    const str = "hello";
    return [str.at(-1), str.at(-2), str.at(-3)];
  }

}

export default function StringAtTest():void {
  describe('StringAtTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach( async () => {
      await Utils.msSleep(20)
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
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.name   StringPrototypeAt_PositiveIndex_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_POSITIVE_0100
     * @tc.desc   Test at() with positive index to get character at position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_PositiveIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtPositiveIndex()!;
      expect(result).assertEqual('u');
    });

    /**
     * @tc.name   StringPrototypeAt_PositiveIndex_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_POSITIVE_0200
     * @tc.desc   Test at() with index 0 to get first character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_PositiveIndex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtZeroIndex()!;
      expect(result).assertEqual('t');
    });

    /**
     * @tc.name   StringPrototypeAt_PositiveIndex_003
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_POSITIVE_0300
     * @tc.desc   Test at() with positive index in middle of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_PositiveIndex_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtMiddleIndex()!;
      expect(result).assertEqual('b');
    });

    /**
     * @tc.name   StringPrototypeAt_NegativeIndex_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_NEGATIVE_0100
     * @tc.desc   Test at() with negative index -4 to get character from end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_NegativeIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtNegativeIndex()!;
      expect(result).assertEqual('d');
    });

    /**
     * @tc.name   StringPrototypeAt_NegativeIndex_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_NEGATIVE_0200
     * @tc.desc   Test at() with negative index -2 to get second last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_NegativeIndex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtNegativeIndex2()!;
      expect(result).assertEqual('g');
    });

    /**
     * @tc.name   StringPrototypeAt_NegativeIndex_003
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_NEGATIVE_0300
     * @tc.desc   Test at() with negative index from end of short string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_NegativeIndex_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtNegativeIndex3()!;
      expect(result).assertEqual('t');
    });

    /**
     * @tc.name   StringPrototypeAt_NegativeIndex_004
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_NEGATIVE_0400
     * @tc.desc   Test at() with negative index equal to string length (first char)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_NegativeIndex_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtNegativeIndex4()!;
      expect(result).assertEqual('t');
    });

    /**
     * @tc.name   StringPrototypeAt_ZeroIndex_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_ZERO_0100
     * @tc.desc   Test at() with zero index to get first character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_ZeroIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: string = atTest.testAtZeroIndex()!;
      expect(result).assertEqual('t');
    });

    /**
     * @tc.name   StringPrototypeAt_TwoCharFirst_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0100
     * @tc.desc   Test at() accessing first character of two-char string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_TwoCharFirst_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtTwoCharFirst()!;
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringPrototypeAt_TwoCharLast_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0200
     * @tc.desc   Test at() accessing last character of two-char string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_TwoCharLast_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtTwoCharLast()!;
      expect(result).assertEqual('B');
    });

    /**
     * @tc.name   StringPrototypeAt_TwoCharNegFirst_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0300
     * @tc.desc   Test at() with -2 accessing first character of two-char string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_TwoCharNegFirst_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtTwoCharNegFirst()!;
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringPrototypeAt_TwoCharNegLast_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0400
     * @tc.desc   Test at() with -1 accessing last character of two-char string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_TwoCharNegLast_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtTwoCharNegLast()!;
      expect(result).assertEqual('B');
    });

    /**
     * @tc.name   StringPrototypeAt_TwoCharOutOfBounds_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0500
     * @tc.desc   Test at() with index 2 on two-char string (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_TwoCharOutOfBounds_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtTwoCharOutOfBounds();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_SingleCharValid_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0600
     * @tc.desc   Test at() with 0 on single-char string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_SingleCharValid_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtSingleCharZero()!;
      expect(result).assertEqual('x');
    });

    /**
     * @tc.name   StringPrototypeAt_SingleCharValid_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0700
     * @tc.desc   Test at() with -1 on single-char string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_SingleCharValid_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtSingleCharNeg()!;
      expect(result).assertEqual('x');
    });

    /**
     * @tc.name   StringPrototypeAt_SingleCharInvalid_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0800
     * @tc.desc   Test at() with index 1 on single-char string (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_SingleCharInvalid_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtSingleCharOne();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_SingleCharInvalid_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_0900
     * @tc.desc   Test at() with -2 on single-char string (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_SingleCharInvalid_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtSingleCharNegTwo();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_LongStringFirst_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_1000
     * @tc.desc   Test at() accessing first character of long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LongStringFirst_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtLongStringFirst()!;
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeAt_LongStringLast_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_1100
     * @tc.desc   Test at() accessing last character of long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LongStringLast_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtLongStringLast()!;
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeAt_LongStringNeg_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_1200
     * @tc.desc   Test at() with -1 on long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LongStringNeg_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtLongStringNeg()!;
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeAt_LongStringNeg_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_1300
     * @tc.desc   Test at() with -1000 on long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LongStringNeg_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtLongStringNeg1000()!;
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeAt_LongStringMid_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_BOUND_1400
     * @tc.desc   Test at() accessing middle of long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LongStringMid_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtLongStringMid()!;
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeAt_CompareCharAt_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_COMPARE_0100
     * @tc.desc   Compare at() and charAt() with valid positive index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_CompareCharAt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = atTest.testAtCompareCharAtValid();
      expect(result.atResult).assertEqual(result.charAtResult+"");
    });

    /**
     * @tc.name   StringPrototypeAt_CompareSlice_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_COMPARE_0400
     * @tc.desc   Compare at(-2) and slice(-2, -1) for getting second last char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_CompareSlice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = atTest.testAtCompareSliceNeg();
      expect(result.atResult).assertEqual(result.sliceResult);
      expect(result.atResult).assertEqual('t');
    });

    /**
     * @tc.name   StringPrototypeAt_CompareSlice_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_COMPARE_0500
     * @tc.desc   Compare at(5) and slice(5, 6) for getting middle char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_CompareSlice_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = atTest.testAtCompareSlicePos();
      expect(result.atResult).assertEqual(result.sliceResult);
      expect(result.atResult).assertEqual(' ');
    });

    /**
     * @tc.name   StringPrototypeAt_LastCharComparison_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_COMPARE_0600
     * @tc.desc   Compare three methods to get last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LastCharComparison_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = atTest.testAtLastCharThreeWays();
      expect(result.atResult).assertEqual(result.lengthWay+"");
      expect(result.atResult).assertEqual(result.sliceWay);
      expect(result.atResult).assertEqual('.');
    });


    /**
     * @tc.name   StringPrototypeAt_FloatIndex_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_FLOAT_0100
     * @tc.desc   Test at() with positive float index (truncated toward zero)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_FloatIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtFloatPositive()!;
      expect(result).assertEqual('e');
    });

    /**
     * @tc.name   StringPrototypeAt_FloatIndex_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_FLOAT_0200
     * @tc.desc   Test at() with negative float index (truncated toward zero)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_FloatIndex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtFloatNegative()!;
      expect(result).assertEqual('o');
    });

    /**
     * @tc.name   StringPrototypeAt_FloatIndex_003
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_FLOAT_0300
     * @tc.desc   Test at() with float 2.99 truncated to 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_FloatIndex_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtFloatPositive2()!;
      expect(result).assertEqual('l');
    });

    /**
     * @tc.name   StringPrototypeAt_StringNumber_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_STRNUM_0100
     * @tc.desc   Test at() with string number "1" converted to number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_StringNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtStringNumber()!;
      expect(result).assertEqual('b');
    });

    /**
     * @tc.name   StringPrototypeAt_StringNumber_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_STRNUM_0200
     * @tc.desc   Test at() with negative string number "-2"
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_StringNumber_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtStringNegative()!;
      expect(result).assertEqual('b');
    });

    /**
     * @tc.name   StringPrototypeAt_SpecialValue_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_SPECIAL_0100
     * @tc.desc   Test at() with NaN parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_SpecialValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtNaN()!;
      expect(result).assertEqual('t');
    });

    /**
     * @tc.name   StringPrototypeAt_NullParameter_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_NULL_0100
     * @tc.desc   Test at() with null parameter (converted to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_NullParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtNull()!;
      expect(result).assertEqual('h');
    });

    /**
     * @tc.name   StringPrototypeAt_UndefinedParameter_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_UNDEF_0100
     * @tc.desc   Test at() with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_UndefinedParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtUndefined()!;
      expect(result).assertEqual('h');
    });

    /**
     * @tc.name   StringPrototypeAt_NoParameter_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PARAM_NONE_0100
     * @tc.desc   Test at() with no parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_NoParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtNoParameter()!;
      expect(result).assertEqual('h');
    });


    /**
     * @tc.name   StringPrototypeAt_LastChar_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0100
     * @tc.desc   Test getting last character of invoice reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_LastChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtPracticalLast1()!;
      expect(result).assertEqual('1');
    });

    /**
     * @tc.name   StringPrototypeAt_LastChar_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0200
     * @tc.desc   Test getting last character of different invoice reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_LastChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtPracticalLast2()!;
      expect(result).assertEqual('2');
    });

    /**
     * @tc.name   StringPrototypeAt_SecondLast_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0300
     * @tc.desc   Test getting second to last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_SecondLast_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtPracticalSecondLast()!;
      expect(result).assertEqual('t');
    });

    /**
     * @tc.name   StringPrototypeAt_ThirdLast_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0400
     * @tc.desc   Test getting third to last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_ThirdLast_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtPracticalThirdLast()!;
      expect(result).assertEqual('s');
    });

    /**
     * @tc.name   StringPrototypeAt_ConditionalAccess_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0500
     * @tc.desc   Test conditional access with variable index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_ConditionalAccess_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtPracticalCondNeg()!;
      expect(result).assertEqual('o');
    });

    /**
     * @tc.name   StringPrototypeAt_ConditionalAccess_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0600
     * @tc.desc   Test conditional access with positive index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_ConditionalAccess_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = atTest.testAtPracticalCondPos()!;
      expect(result).assertEqual('h');
    });

    /**
     * @tc.name   StringPrototypeAt_LoopForward_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0700
     * @tc.desc   Test forward iteration using at()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LoopForward_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Array<string | undefined> = atTest.testAtPracticalLoopForward();
      expect(result[0]).assertEqual('h');
      expect(result[1]).assertEqual('e');
      expect(result[2]).assertEqual('l');
    });

    /**
     * @tc.name   StringPrototypeAt_LoopBackward_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_PRACTICAL_0800
     * @tc.desc   Test backward iteration using at()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_LoopBackward_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Array<string | undefined> = atTest.testAtPracticalLoopBackward();
      expect(result[0]).assertEqual('o');
      expect(result[1]).assertEqual('l');
      expect(result[2]).assertEqual('l');
    });


    /**
     * @tc.name   StringPrototypeAt_ReturnType_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_RETURN_0100
     * @tc.desc   Test at() returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_ReturnType_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtReturnType("abc");
      expect(result).assertEqual('string');
    });

    /**
     * @tc.name   StringPrototypeAt_ReturnLength_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_RETURN_0200
     * @tc.desc   Test at() returns single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_ReturnLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = atTest.testAtReturnLength("abc");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringPrototypeAt_InvalidIndex_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_INVALID_0100
     * @tc.desc   Test at() with positive index out of bounds returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_InvalidIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtInvalidPositive("hello");
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_InvalidIndex_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_INVALID_0200
     * @tc.desc   Test at() with negative index out of bounds returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_InvalidIndex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtInvalidNegative("hello");
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_InvalidIndex_003
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_INVALID_0300
     * @tc.desc   Test at() with index equal to string length returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_InvalidIndex_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtOutOfBoundsLength("hello");
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_EMPTY_0100
     * @tc.desc   Test at() with empty string and index 0 returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtEmptyZero();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_EmptyString_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_EMPTY_0200
     * @tc.desc   Test at() with empty string and negative index returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_EmptyString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtEmptyNegative();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringPrototypeAt_EmptyString_003
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_EMPTY_0300
     * @tc.desc   Test at() with empty string and positive index returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_EmptyString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string | undefined = atTest.testAtEmptyPositive();
      expect(result).assertEqual(undefined);
    });


    /**
     * @tc.name   StringPrototypeAt_ASCII_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0100
     * @tc.desc   Test at() with ASCII characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_ASCII_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtASCII()!;
      expect(result).assertEqual('W');
    });

    /**
     * @tc.name   StringPrototypeAt_BMP_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0200
     * @tc.desc   Test at() with BMP Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_BMP_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtBMPFirst()!;
      expect(result).assertEqual('你');
    });

    /**
     * @tc.name   StringPrototypeAt_BMP_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0300
     * @tc.desc   Test at() accessing second Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_BMP_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtBMPSecond()!;
      expect(result).assertEqual('好');
    });

    /**
     * @tc.name   StringPrototypeAt_BMP_003
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0400
     * @tc.desc   Test at() with negative index on Chinese string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_BMP_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtBMPNeg()!;
      expect(result).assertEqual('界');
    });

    /**
     * @tc.name   StringPrototypeAt_BMP_004
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0500
     * @tc.desc   Test at() accessing third Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeAt_BMP_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = atTest.testAtBMPThird()!;
      expect(result).assertEqual('世');
    });

    /**
     * @tc.name   StringPrototypeAt_SurrogatePair_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0600
     * @tc.desc   Test at() with emoji (surrogate pair) returns first code unit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_SurrogatePair_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = atTest.testAtEmojiFirst();
      expect(result.codePoint).assertEqual(0xD83D);
    });

    /**
     * @tc.name   StringPrototypeAt_SurrogatePair_002
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0700
     * @tc.desc   Test at() with emoji returns second code unit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_SurrogatePair_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = atTest.testAtEmojiSecond();
      expect(result.codePoint).assertEqual(0xDE00);
    });

    /**
     * @tc.name   StringPrototypeAt_SurrogatePair_003
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0800
     * @tc.desc   Test at() emoji string length is 4 (2 per emoji)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_SurrogatePair_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: number = atTest.testAtEmojiLength();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringPrototypeAt_SurrogatePair_004
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_0900
     * @tc.desc   Test at() accessing first code unit of second emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_SurrogatePair_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = atTest.testAtEmojiThird();
      expect(result.codePoint).assertEqual(0xD83C);
    });

    /**
     * @tc.name   StringPrototypeAt_MixedString_001
     * @tc.number SUB_BUILTINS_STRING_PROTO_AT_UNICODE_1000
     * @tc.desc   Test at() with mixed ASCII and Chinese
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringPrototypeAt_MixedString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Array<string | undefined> = atTest.testAtMixedString();
      expect(result[0]).assertEqual('H');
      expect(result[1]).assertEqual('i');
      expect(result[2]).assertEqual('你');
      expect(result[3]).assertEqual('好');
    });
  });
}
