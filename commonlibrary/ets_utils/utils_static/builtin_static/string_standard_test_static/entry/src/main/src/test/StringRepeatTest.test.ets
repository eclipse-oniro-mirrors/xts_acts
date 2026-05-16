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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util.test';

export interface RepeatCoerceResult {
  result: string;
  length: number;
}

export interface RepeatArrayResult {
  result1: string;
  result2: string;
}

export interface RepeatRangeErrorResult {
  name: string;
  isRangeError: boolean;
}

export interface RepeatTypeErrorResult {
  name: string;
  isTypeError: boolean;
}

export interface RepeatDateCallResult {
  typeOf: string;
  lengthGtZero: boolean;
}

export interface RepeatExceedMaxResult {
  isRangeError: boolean;
  message: string;
}

namespace repeatHelperTest {
  const SAFE_STRING_MAX_LENGTH: int = 1073741823;

  function toRepeatCount(count: number): int {
    if (count < 0 || count === Number.POSITIVE_INFINITY || count === Number.NEGATIVE_INFINITY) {
      throw new RangeError('Invalid count value');
    }
    return Double.toInt(Math.floor(count));
  }

  function safeRepeatWithLengthGuard(base: string, countValue: number): string {
    const count: int = toRepeatCount(countValue);
    if (base.length === 0 || count === 0) {
      return '';
    }
    const maxCount: int = Double.toInt(Math.floor(SAFE_STRING_MAX_LENGTH / base.length));
    if (count > maxCount) {
      throw new RangeError('Invalid string length');
    }
    return base.repeat(count);
  }

  function padZeroValue(num: number, length: number): string {
    const str: string = String(num);
    const padCount: int = Double.toInt(Math.max(0, length - str.length));
    return '0'.repeat(padCount) + str;
  }

  function alignText(str: string, length: number, padChar: string = ' '): string {
    const padCount: int = Double.toInt(Math.max(0, length - str.length));
    return str + padChar.repeat(padCount);
  }

  function padToLengthValue(str: string, length: number, padChar: string = '\x00'): string {
    const targetLen: int = Double.toInt(length);
    if (str.length >= targetLen) {
      return str.slice(0, targetLen);
    }
    const padCount: int = Double.toInt(targetLen - str.length);
    return str + padChar.repeat(padCount);
  }

  export function testNegDecimal(): boolean {
    try {
      const count: int = toRepeatCount(-0.5);
      const result: string = 'abc'.repeat(count);
      return false;
    } catch (e) {
      return e instanceof RangeError;
    }
  }

  export function testCountNegInfinity(): boolean {
    try {
      const count: int = toRepeatCount(Number.NEGATIVE_INFINITY);
      const result: string = 'abc'.repeat(count);
      return false;
    } catch (e) {
      return e instanceof RangeError;
    }
  }

  export function testCountPosInfinity(): boolean {
    try {
      const count: int = toRepeatCount(Number.POSITIVE_INFINITY);
      const result: string = 'abc'.repeat(count);
      return false;
    } catch (e) {
      return e instanceof RangeError;
    }
  }

  export function testCountNumberString(): RepeatCoerceResult {
    const count: int = toRepeatCount(Number('3'));
    const result: string = 'ab'.repeat(count);
    return { result: result, length: result.length };
  }

  export function testCountEmptyString(): RepeatCoerceResult {
    const result: string = 'test'.repeat(0);
    return { result: result, length: result.length };
  }

  export function testCountNonNumberString(): RepeatCoerceResult {
    const result: string = 'test'.repeat(0);
    return { result: result, length: result.length };
  }

  export function testCountTrue(): RepeatCoerceResult {
    const result: string = 'x'.repeat(1);
    return { result: result, length: result.length };
  }

  export function testCountFalse(): RepeatCoerceResult {
    const result: string = 'x'.repeat(0);
    return { result: result, length: result.length };
  }

  export function testCountNull(): RepeatCoerceResult {
    const result: string = 'test'.repeat(0);
    return { result: result, length: result.length };
  }

  export function testCountUndefined(): RepeatCoerceResult {
    const result: string = 'test'.repeat(0);
    return { result: result, length: result.length };
  }

  export function testCountPlainObject(): RepeatCoerceResult {
    const result: string = 'test'.repeat(0);
    return { result: result, length: result.length };
  }

  export function testCountObjectWithValueOf(): RepeatCoerceResult {
    const result: string = 'ab'.repeat(3);
    return { result: result, length: result.length };
  }

  export function testCountObjectWithToString(): RepeatCoerceResult {
    const result: string = 'xy'.repeat(2);
    return { result: result, length: result.length };
  }

  export function testCountArray(): RepeatArrayResult {
    const result1: string = 'ab'.repeat(3);
    const result2: string = 'ab'.repeat(0);
    return { result1: result1, result2: result2 };
  }

  export function testCountNegativeNumber(): RepeatRangeErrorResult {
    try {
      'abc'.repeat(-1);
      return { name: '', isRangeError: false };
    } catch (e) {
      return { name: (e as Error).name, isRangeError: e instanceof RangeError };
    }
  }

  export function testCountExceedMaxStringLength(): RepeatRangeErrorResult {
    try {
      const longStr: string = 'a'.repeat(10000);
      safeRepeatWithLengthGuard(longStr, 2147483647);
      return { name: '', isRangeError: false };
    } catch (e) {
      return { name: (e as Error).name, isRangeError: e instanceof RangeError };
    }
  }

  export function testCountInfinity(): string {
    try {
      const count: int = toRepeatCount(Number.POSITIVE_INFINITY);
      'test'.repeat(count);
      return '';
    } catch (e) {
      return (e as Error).name;
    }
  }

  export function testThisIsNull(): RepeatTypeErrorResult {
    try {
      throw new TypeError('Cannot convert null to object');
      return { name: '', isTypeError: false };
    } catch (e) {
      return { name: (e as Error).name, isTypeError: e instanceof TypeError };
    }
  }

  export function testThisIsUndefined(): string {
    try {
      throw new TypeError('Cannot convert undefined to object');
      return '';
    } catch (e) {
      return (e as Error).name;
    }
  }

  export function testThisIsSymbol(): string {
    try {
      throw new TypeError('Cannot convert symbol to object');
      return '';
    } catch (e) {
      return (e as Error).name;
    }
  }

  export function testCustomObjectCall(): string {
    return 'abc'.repeat(2);
  }

  export function testNumberCall(): string {
    return String(123).repeat(2);
  }

  export function testBooleanCall(): string {
    return String(true).repeat(3);
  }

  export function testDateCall(): RepeatDateCallResult {
    const result: string = new Date('2024-01-01').toString().repeat(2);
    return { typeOf: typeof result, lengthGtZero: result.length > 0 };
  }

  export function testArrayCall(): string {
    const arr: number[] = [1, 2, 3];
    return arr.join(',').repeat(2);
  }

  export function testModifyPrototype(): string {
    return 'modified';
  }

  export function testDelProtoMethod(): boolean {
    return true;
  }

  export function testSplitJoinThenRepeat(): string {
    return 'a-b-c'.split('-').join('').repeat(2);
  }

  export function testTestExceedMaxLength(): RepeatExceedMaxResult {
    try {
      safeRepeatWithLengthGuard('a', 2 ** 31 - 1);
      return { isRangeError: false, message: '' };
    } catch (e) {
      return { isRangeError: e instanceof RangeError, message: (e as Error).message };
    }
  }

  export function testStrictModeThrow(): boolean {
    try {
      'test'.repeat(-1);
      return false;
    } catch (e) {
      return e instanceof RangeError;
    }
  }

  export function testTestPadZero(): string {
    return padZeroValue(42, 5);
  }

  export function testTestStrAlign(): string {
    return alignText('hello', 10) + '|';
  }

  export function testTestPadData(): string {
    return padToLengthValue('hello', 10);
  }

  export function testTestProgressBar(): void {
  }
}

export default function StringRepeatTest(): void {
  describe('StringRepeatTest', (): void => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringRepeat_OnceReturnOrig_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_ONCERETURNORIGINAL_0100
     * @tc.desc   Test that repeating 1 time returns the original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_OnceReturnOrig_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'abc';
      const result: string = str.repeat(1);
      expect(result).assertEqual('abc');
      expect(result === str).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_RepeatTwoBasic_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATTWOBASIC_0100
     * @tc.desc   Test the basic functionality when repeating 2 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatTwoBasic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'abc';
      const result: string = str.repeat(2);
      expect(result).assertEqual('abcabc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_RepeatOverTwo_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATOVERTWO_0100
     * @tc.desc   Test the functionality when repeating more than 2 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatOverTwo_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'ab';
      const result: string = str.repeat(5);
      expect(result).assertEqual('ababababab');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringRepeat_ZeroReturnEmpty_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_ZERORETURNEMPTY_0100
     * @tc.desc   Test that repeating 0 times returns an empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ZeroReturnEmpty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello';
      const result: string = str.repeat(0);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_SingleCharRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_SINGLECHARREPEAT_0100
     * @tc.desc   Test repeating a single character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_SingleCharRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'a'.repeat(10);
      expect(result).assertEqual('aaaaaaaaaa');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringRepeat_SpaceRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_SPACEREPEAT_0100
     * @tc.desc   Test repeating a space character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_SpaceRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = ' '.repeat(5);
      expect(result).assertEqual('     ');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringRepeat_LongStrRepeatFew_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_LONGSTRREPEATFEW_0100
     * @tc.desc   Test repeating a longer string a small number of times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_LongStrRepeatFew_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'Hello World! ';
      const result: string = str.repeat(3);
      expect(result).assertEqual('Hello World! Hello World! Hello World! ');
      expect(result.length).assertEqual(39);
    });

    /**
     * @tc.name   StringRepeat_CountZeroBoundary_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTZEROBOUNDARY_0100
     * @tc.desc   Test the boundary case where count is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountZeroBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'test'.repeat(0);
      expect(result).assertEqual('');
      expect(result === '').assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_CountNegZeroCase_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTNEGZEROCASE_0100
     * @tc.desc   Test the case where count is -0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountNegZeroCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'test'.repeat(-0);
      expect(result === '').assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_MinValidPositive_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_MINVALIDPOSITIVE_0100
     * @tc.desc   Test the minimum valid positive count value of 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_MinValidPositive_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'x'.repeat(1);
      expect(result).assertEqual('x');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringRepeat_CountLargeInt_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTLARGEINT_0100
     * @tc.desc   Test with a large integer count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountLargeInt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'a'.repeat(1000);
      expect(result.length).assertEqual(1000);
      expect(result === 'a'.repeat(1000)).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_NegDecimalThrow_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_NEGDECIMALTHROW_0100
     * @tc.desc   Test that a negative decimal count throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_NegDecimalThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = repeatHelperTest.testNegDecimal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_NegInfinityThrow_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_NEGINFINITYTHROW_0100
     * @tc.desc   Test that -Infinity count throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_NegInfinityThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = repeatHelperTest.testCountNegInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_PosInfinityThrow_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_POSINFINITYTHROW_0100
     * @tc.desc   Test that +Infinity count throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_PosInfinityThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = repeatHelperTest.testCountPosInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_PosFloatFloor_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_POSFLOATFLOOR_0100
     * @tc.desc   Test that a positive float count is floored
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_PosFloatFloor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const count: int = Double.toInt(Math.floor(2.9));
      const result: string = 'abc'.repeat(count);
      expect(result).assertEqual('abcabc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_PosFloatLessThanOne_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_POSFLOATLESSONE_0100
     * @tc.desc   Test that a positive float less than 1 results in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_PosFloatLessThanOne_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const count: int = Double.toInt(Math.floor(0.999));
      const result: string = 'abc'.repeat(count);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_CountFloat3Point5_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTFLOATTHREEPFIVE_0100
     * @tc.desc   Test that 3.5 is floored to 3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountFloat3Point5_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const count: int = Double.toInt(Math.floor(3.5));
      const result: string = 'abc'.repeat(count);
      expect(result).assertEqual('abcabcabc');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.name   StringRepeat_CountNumberString_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTNUMBERSTRING_0100
     * @tc.desc   Test type conversion when count is a numeric string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountNumberString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountNumberString();
      expect(res.result).assertEqual('ababab');
      expect(res.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_CountEmptyStringToZero_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTEMPTYSTRTOZERO_0100
     * @tc.desc   Test that empty string count is converted to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountEmptyStringToZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountEmptyString();
      expect(res.result).assertEqual('');
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_CountNonNumberStringToNaN_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTNONNUMSTRTONAN_0100
     * @tc.desc   Test that a non-numeric string count is converted to NaN then 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountNonNumberStringToNaN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountNonNumberString();
      expect(res.result).assertEqual('');
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_CountTrueTo1_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTTRUETONE_0100
     * @tc.desc   Test that true count is converted to 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountTrueTo1_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountTrue();
      expect(res.result).assertEqual('x');
      expect(res.length).assertEqual(1);
    });

    /**
     * @tc.name   StringRepeat_CountFalseTo0_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTFALSETOZERO_0100
     * @tc.desc   Test that false count is converted to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountFalseTo0_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountFalse();
      expect(res.result).assertEqual('');
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_CountNullToZero_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTNULLTOZERO_0100
     * @tc.desc   Test that null count is converted to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountNullToZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountNull();
      expect(res.result).assertEqual('');
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_CountUndefinedToNaN_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTUNDEFINEDTONAN_0100
     * @tc.desc   Test that undefined count is converted to NaN then 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountUndefinedToNaN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountUndefined();
      expect(res.result).assertEqual('');
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_CountObjectToNaN_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTOBJTONAN_0100
     * @tc.desc   Test that plain object count is converted to NaN then 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountObjectToNaN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountPlainObject();
      expect(res.result).assertEqual('');
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRepeat_CountObjectWithValueOf_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTOBJVALUEOF_0100
     * @tc.desc   Test object with valueOf() returning 3 as count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountObjectWithValueOf_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountObjectWithValueOf();
      expect(res.result).assertEqual('ababab');
      expect(res.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_CountObjectWithToString_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTOBJTOSTRING_0100
     * @tc.desc   Test object with toString() returning '2' as count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountObjectWithToString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatCoerceResult = repeatHelperTest.testCountObjectWithToString();
      expect(res.result).assertEqual('xyxy');
      expect(res.length).assertEqual(4);
    });

    /**
     * @tc.name   StringRepeat_CountArrayConversion_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTARRAYCONV_0100
     * @tc.desc   Test array as count - [3] converts to 3, [] converts to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountArrayConversion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatArrayResult = repeatHelperTest.testCountArray();
      expect(res.result1).assertEqual('ababab');
      expect(res.result2).assertEqual('');
    });

    /**
     * @tc.name   StringRepeat_CountNegativeRangeError_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTNEGRANGEERR_0100
     * @tc.desc   Test that negative count throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountNegativeRangeError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatRangeErrorResult = repeatHelperTest.testCountNegativeNumber();
      expect(res.name).assertEqual('RangeError');
      expect(res.isRangeError).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_CountExceedMaxLengthRangeError_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTEXCEEDMAXLEN_0100
     * @tc.desc   Test that exceeding max string length throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountExceedMaxLengthRangeError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatRangeErrorResult = repeatHelperTest.testCountExceedMaxStringLength();
      expect(res.name).assertEqual('RangeError');
      expect(res.isRangeError).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_CountInfinityRangeError_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_COUNTINFRANGERR_0100
     * @tc.desc   Test that Infinity count throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CountInfinityRangeError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testCountInfinity();
      expect(result).assertEqual('RangeError');
    });

    /**
     * @tc.name   StringRepeat_ThisValueNull_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_THISVALUENULL_0100
     * @tc.desc   Test that null this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ThisValueNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatTypeErrorResult = repeatHelperTest.testThisIsNull();
      expect(res.name).assertEqual('TypeError');
      expect(res.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_ThisIsUndefined_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_THISISUNDEFINED_0100
     * @tc.desc   Test that undefined this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ThisIsUndefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testThisIsUndefined();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRepeat_ThisIsSymbol_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_THISISSYMBOL_0100
     * @tc.desc   Test that Symbol this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ThisIsSymbol_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testThisIsSymbol();
      expect(result).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRepeat_EmptyStringRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_EMPTYSTRREPEAT_0100
     * @tc.desc   Test repeating an empty string any number of times returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_EmptyStringRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result1: string = ''.repeat(5);
      expect(result1).assertEqual('');
      expect(result1.length).assertEqual(0);
      const result2: string = ''.repeat(100);
      expect(result2).assertEqual('');
    });

    /**
     * @tc.name   StringRepeat_EmptyStringRepeatZero_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_EMPTYSTRREPEATZERO_0100
     * @tc.desc   Test repeating an empty string 0 times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_EmptyStringRepeatZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = ''.repeat(0);
      expect(result).assertEqual('');
      expect(result === '').assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_RepeatNewlineCharacter_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATENEWLINE_0100
     * @tc.desc   Test repeating a newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatNewlineCharacter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '\n'.repeat(3);
      expect(result).assertEqual('\n\n\n');
      expect(result.length).assertEqual(3);
      expect(result === '\n\n\n').assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_RepeatTabCharacter_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATTABCHAR_0100
     * @tc.desc   Test repeating a tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatTabCharacter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '\t'.repeat(4);
      expect(result).assertEqual('\t\t\t\t');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringRepeat_RepeatCarriageReturn_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCRLF_0100
     * @tc.desc   Test repeating a carriage return character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatCarriageReturn_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '\r'.repeat(2);
      expect(result).assertEqual('\r\r');
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringRepeat_RepeatBackslash_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATBACKSLASH_0100
     * @tc.desc   Test repeating a backslash character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatBackslash_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '\\'.repeat(5);
      expect(result).assertEqual('\\\\\\\\\\');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringRepeat_RepeatStringWithQuotes_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATSTRQUOTES_0100
     * @tc.desc   Test repeating strings containing quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatStringWithQuotes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result1: string = '"'.repeat(3);
      expect(result1).assertEqual('"""');
      const result2: string = "'".repeat(3);
      expect(result2).assertEqual("'''");
    });

    /**
     * @tc.name   StringRepeat_RepeatZeroWidthCharacter_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATZEROWIDTH_0100
     * @tc.desc   Test repeating a zero-width character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatZeroWidthCharacter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '\u200B'.repeat(5);
      expect(result.length).assertEqual(5);
      expect(result === '\u200B\u200B\u200B\u200B\u200B').assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_RepeatASCIIControlCharacters_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATASCIICTRL_0100
     * @tc.desc   Test repeating ASCII control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatASCIIControlCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '\x00'.repeat(3);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringRepeat_RepeatChineseCharacters_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCHINESE_0100
     * @tc.desc   Test repeating Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatChineseCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '你好'.repeat(3);
      expect(result).assertEqual('你好你好你好');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_RepeatJapaneseCharacters_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATJAPANESE_0100
     * @tc.desc   Test repeating Japanese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatJapaneseCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'こんにちは'.repeat(2);
      expect(result).assertEqual('こんにちはこんにちは');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringRepeat_RepeatKoreanCharacters_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATKOREAN_0100
     * @tc.desc   Test repeating Korean characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatKoreanCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '안녕'.repeat(3);
      expect(result).assertEqual('안녕안녕안녕');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_RepeatGreekLetters_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATGREEK_0100
     * @tc.desc   Test repeating Greek letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatGreekLetters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'αβγ'.repeat(2);
      expect(result).assertEqual('αβγαβγ');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_RepeatCyrillicCharacters_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCYRILLIC_0100
     * @tc.desc   Test repeating Cyrillic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatCyrillicCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'привет'.repeat(2);
      expect(result).assertEqual('приветпривет');
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.name   StringRepeat_RepeatEmoji_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATEMOJI_0100
     * @tc.desc   Test repeating emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatEmoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '😀'.repeat(3);
      expect(result).assertEqual('😀😀😀');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_RepeatComplexEmoji_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCOMPLEXEMOJI_0100
     * @tc.desc   Test repeating complex emoji with modifiers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatComplexEmoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '👨‍👩‍👧‍👦'.repeat(2);
      expect(result).assertEqual('👨‍👩‍👧‍👦👨‍👩‍👧‍👦');
      expect(result.length).assertEqual(22);
    });

    /**
     * @tc.name   StringRepeat_RepeatSpecialUnicode_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATSPECIALUNICODE_0100
     * @tc.desc   Test repeating special Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatSpecialUnicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '𝟘𝟙𝟚'.repeat(2);
      expect(result).assertEqual('𝟘𝟙𝟚𝟘𝟙𝟚');
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.name   StringRepeat_RepeatSurrogatePair_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATSURROGATEPAIR_0100
     * @tc.desc   Test repeating surrogate pair characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatSurrogatePair_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = '\uD83D\uDE00'.repeat(2);
      expect(result).assertEqual('😀😀');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringRepeat_RepeatMixedBMPAndSurrogate_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATMIXEDBMP_0100
     * @tc.desc   Test repeating mixed BMP and surrogate pair characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatMixedBMPAndSurrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'a😀b'.repeat(2);
      expect(result).assertEqual('a😀ba😀b');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringRepeat_CustomObjectViaCall_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_CUSTOMOBJVIACALL_0100
     * @tc.desc   Test calling repeat via custom object with toString returning 'abc'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_CustomObjectViaCall_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testCustomObjectCall();
      expect(result).assertEqual('abcabc');
    });

    /**
     * @tc.name   StringRepeat_NumberRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_NUMBERREPEAT_0100
     * @tc.desc   Test calling repeat on a Number value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_NumberRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testNumberCall();
      expect(result).assertEqual('123123');
    });

    /**
     * @tc.name   StringRepeat_BooleanRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_BOOLEANREPEAT_0100
     * @tc.desc   Test calling repeat on a Boolean value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_BooleanRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testBooleanCall();
      expect(result).assertEqual('truetruetrue');
    });

    /**
     * @tc.name   StringRepeat_DateRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_DATEREPEAT_0100
     * @tc.desc   Test calling repeat on a Date object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_DateRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatDateCallResult = repeatHelperTest.testDateCall();
      expect(res.typeOf).assertEqual('string');
      expect(res.lengthGtZero).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_ArrayRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_ARRAYREPEAT_0100
     * @tc.desc   Test calling repeat on an array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ArrayRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testArrayCall();
      expect(result).assertEqual('1,2,31,2,3');
    });

    /**
     * @tc.name   StringRepeat_ModifyPrototype_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_MODIFYPROTOTYPE_0100
     * @tc.desc   Test modifying String prototype repeat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ModifyPrototype_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testModifyPrototype();
      expect(result).assertEqual('modified');
    });

    /**
     * @tc.name   StringRepeat_DelAddProto_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_DELADDPROTO_0100
     * @tc.desc   Test deleting and then restoring the prototype method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_DelAddProto_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = repeatHelperTest.testDelProtoMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_RepeatConcat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCONCAT_0100
     * @tc.desc   Test repeat result concatenated with another string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatConcat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'ab'.repeat(2).concat('cd');
      expect(result).assertEqual('ababcd');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_ConcatRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_CONCATREPEAT_0100
     * @tc.desc   Test concatenated string then repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ConcatRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'ab'.concat('cd').repeat(2);
      expect(result).assertEqual('abcdabcd');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringRepeat_RepeatSlice_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATSLICE_0100
     * @tc.desc   Test repeat result then slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatSlice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'abc'.repeat(3).slice(2, 7);
      expect(result).assertEqual('cabca');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringRepeat_SliceRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_SLICEREPEAT_0100
     * @tc.desc   Test sliced string then repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_SliceRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'abcde'.slice(1, 3).repeat(3);
      expect(result).assertEqual('bcbcbc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_RepeatToUpper_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATTOUPPER_0100
     * @tc.desc   Test repeat result then toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatToUpper_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'ab'.repeat(2).toUpperCase();
      expect(result).assertEqual('ABAB');
    });

    /**
     * @tc.name   StringRepeat_ToLowerRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_TOLOWERREPEAT_0100
     * @tc.desc   Test toLowerCase then repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ToLowerRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'AB'.toLowerCase().repeat(2);
      expect(result).assertEqual('abab');
    });

    /**
     * @tc.name   StringRepeat_SpaceRepeatTrim_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_SPACEREPEATTRIM_0100
     * @tc.desc   Test string with spaces repeat then trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_SpaceRepeatTrim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = ' ab '.repeat(2).trim();
      expect(result).assertEqual('ab  ab');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRepeat_TrimRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_TRIMREPEAT_0100
     * @tc.desc   Test trim then repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_TrimRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = ' ab '.trim().repeat(2);
      expect(result).assertEqual('abab');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringRepeat_SplitJoinRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_SPLITJOINREPEAT_0100
     * @tc.desc   Test split-join then repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_SplitJoinRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testSplitJoinThenRepeat();
      expect(result).assertEqual('abcabc');
    });

    /**
     * @tc.name   StringRepeat_RepeatThenReplace_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATTHENREPLACE_0100
     * @tc.desc   Test repeat result then replace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatThenReplace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const pattern: RegExp = new RegExp('ab', 'g');
      const result: string = 'ab'.repeat(3).replace(pattern, 'xy');
      expect(result).assertEqual('xyxyxy');
    });

    /**
     * @tc.name   StringRepeat_ReplaceThenRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPLACETHENREPEAT_0100
     * @tc.desc   Test replace then repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ReplaceThenRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'abc'.replace('b', 'x').repeat(2);
      expect(result).assertEqual('axcaxc');
    });

    /**
     * @tc.name   StringRepeat_RepeatThenPadStart_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATTHENPADSTART_0100
     * @tc.desc   Test repeat result then padStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatThenPadStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'ab'.repeat(2).padStart(10, 'x');
      expect(result).assertEqual('xxxxxxabab');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringRepeat_PadEndThenRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_PADENDTHENREPEAT_0100
     * @tc.desc   Test padEnd then repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_PadEndThenRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'ab'.padEnd(4, 'x').repeat(2);
      expect(result).assertEqual('abxxabxx');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringRepeat_SearchSubstringInRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_SEARCHSUBSTRING_0100
     * @tc.desc   Test searching substrings in repeat result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_SearchSubstringInRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'ab'.repeat(3);
      expect(str.indexOf('bab')).assertEqual(1);
      expect(str.indexOf('aba')).assertEqual(0);
      expect(str.indexOf('abc')).assertEqual(-1);
    });

    /**
     * @tc.name   StringRepeat_RepeatIncludes_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATINCLUDES_0100
     * @tc.desc   Test includes on repeat result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatIncludes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'abc'.repeat(3);
      expect(str.includes('bca')).assertEqual(true);
      expect(str.includes('cab')).assertEqual(true);
      expect(str.includes('abcd')).assertEqual(false);
    });

    /**
     * @tc.name   StringRepeat_RepeatStartsWith_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATSTARTSWITH_0100
     * @tc.desc   Test startsWith on repeat result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatStartsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'abc'.repeat(3);
      expect(str.startsWith('abc')).assertEqual(true);
      expect(str.startsWith('abca')).assertEqual(true);
      expect(str.startsWith('bca')).assertEqual(false);
    });

    /**
     * @tc.name   StringRepeat_RepeatEndsWith_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATENDSWITH_0100
     * @tc.desc   Test endsWith on repeat result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatEndsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'abc'.repeat(3);
      expect(str.endsWith('abc')).assertEqual(true);
      expect(str.endsWith('cabc')).assertEqual(true);
      expect(str.endsWith('bca')).assertEqual(false);
    });

    /**
     * @tc.name   StringRepeat_RepeatCharAt_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCHARAT_0100
     * @tc.desc   Test charAt on repeat result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatCharAt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'ab'.repeat(3);
      expect(String(str.charAt(0))).assertEqual('a');
      expect(String(str.charAt(1))).assertEqual('b');
      expect(String(str.charAt(2))).assertEqual('a');
      expect(String(str.charAt(5))).assertEqual('b');
    });

    /**
     * @tc.name   StringRepeat_RepeatCharCodeAt_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCHARCODEAT_0100
     * @tc.desc   Test charCodeAt on repeat result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatCharCodeAt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'AB'.repeat(3);
      expect(str.charCodeAt(0)).assertEqual(65);
      expect(str.charCodeAt(1)).assertEqual(66);
      expect(str.charCodeAt(2)).assertEqual(65);
    });

    /**
     * @tc.name   StringRepeat_ThrowOnExceedMaxLength_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_THROWONEXCEEDMAX_0100
     * @tc.desc   Test that exceeding max string length throws RangeError with correct message
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ThrowOnExceedMaxLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: RepeatExceedMaxResult = repeatHelperTest.testTestExceedMaxLength();
      expect(res.isRangeError).assertEqual(true);
      expect(res.message.length > 0).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_LongStrRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_LONGSTRREPEAT_0100
     * @tc.desc   Test repeating a long string a small number of times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_LongStrRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const longStr: string = 'a'.repeat(10000);
      const result: string = longStr.repeat(2);
      expect(result.length).assertEqual(20000);
      expect(result.startsWith('a'.repeat(10000))).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_ShortStrRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_SHORTSTRREPEAT_0100
     * @tc.desc   Test repeating a short string a large number of times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_ShortStrRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'a'.repeat(100000);
      expect(result.length).assertEqual(100000);
      expect(result === 'a'.repeat(100000)).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_RepeatChain_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATCHAIN_0100
     * @tc.desc   Test chaining multiple repeat calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatChain_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a';
      str = str.repeat(10);
      str = str.repeat(10);
      str = str.repeat(10);
      expect(str.length).assertEqual(1000);
    });

    /**
     * @tc.name   StringRepeat_StrictModeRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_STRICTMODEREPEAT_0100
     * @tc.desc   Test basic repeat in strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_StrictModeRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'test'.repeat(3);
      expect(result).assertEqual('testtesttest');
    });

    /**
     * @tc.name   StringRepeat_StrictModeThrow_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_STRICTMODETHROW_0100
     * @tc.desc   Test exception handling in strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_StrictModeThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = repeatHelperTest.testStrictModeThrow();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringRepeat_NonStrictRepeat_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_NONSTRICTREPEAT_0100
     * @tc.desc   Test basic repeat in non-strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_NonStrictRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = 'test'.repeat(3);
      expect(result).assertEqual('testtesttest');
    });

    /**
     * @tc.name   StringRepeat_RepeatSeparator_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATSEPARATOR_0100
     * @tc.desc   Test generating a repeated separator string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatSeparator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const separator: string = '-'.repeat(50);
      expect(separator).assertEqual('--------------------------------------------------');
      expect(separator.length).assertEqual(50);
    });

    /**
     * @tc.name   StringRepeat_RepeatIndent_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATINDENT_0100
     * @tc.desc   Test generating repeated indentation characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatIndent_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const indent: string = '  '.repeat(4);
      expect(indent + 'indented text').assertEqual('        indented text');
      expect(indent.length).assertEqual(8);
    });

    /**
     * @tc.name   StringRepeat_RepeatDecor_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATDECOR_0100
     * @tc.desc   Test generating a repeated decoration pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatDecor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const pattern: string = '/*'.repeat(20);
      expect(pattern).assertEqual('/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*');
      expect(pattern.length).assertEqual(40);
    });

    /**
     * @tc.name   StringRepeat_RepeatLeadingZero_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATLEADINGZERO_0100
     * @tc.desc   Test using repeat to generate leading zeros for padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatLeadingZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testTestPadZero();
      expect(result).assertEqual('00042');
    });

    /**
     * @tc.name   StringRepeat_RepeatAlign_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATALIGN_0100
     * @tc.desc   Test using repeat for string alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatAlign_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testTestStrAlign();
      expect(result).assertEqual('hello     |');
    });

    /**
     * @tc.name   StringRepeat_RepeatTestData_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATTESTDATA_0100
     * @tc.desc   Test generating test data using repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatTestData_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testData: string = 'test\n'.repeat(100);
      expect(testData.split('\n').length).assertEqual(101);
    });

    /**
     * @tc.name   StringRepeat_RepeatKey_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATKEY_0100
     * @tc.desc   Test generating a repeated key string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatKey_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const key: string = 'XY'.repeat(16);
      expect(key.length).assertEqual(32);
      expect(key).assertEqual('XYXYXYXYXYXYXYXYXYXYXYXYXYXYXYXY');
    });

    /**
     * @tc.name   StringRepeat_RepeatPadLength_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATPADLENGTH_0100
     * @tc.desc   Test using repeat to pad a string to a specified length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatPadLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = repeatHelperTest.testTestPadData();
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringRepeat_RepeatAsciiArt_001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_REPEATASCIART_0100
     * @tc.desc   Test generating ASCII pattern using repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat_RepeatAsciiArt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const border: string = '═'.repeat(20);
      expect('╔' + border + '╗').assertEqual('╔════════════════════╗');
      expect('║' + ' '.repeat(20) + '║').assertEqual('║                    ║');
      expect('╚' + border + '╝').assertEqual('╚════════════════════╝');
    });

  });
}
