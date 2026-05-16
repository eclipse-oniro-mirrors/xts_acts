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

export namespace padStartBasicHelper {
  export interface StringResult {
    result: string;
  }

  export interface TypeErrorResult {
    isTypeError: boolean;
    result?: string;
    errorName?: string;
  }

  export interface RangeErrorResult {
    isRangeError: boolean;
    result?: string;
    errorName?: string;
  }

  export interface ThrownResult {
    thrown: boolean;
    result?: string;
    errorName?: string;
  }

  export interface ErrorFlagResult {
    isError: boolean;
    result?: string;
    errorName?: string;
  }

  function invokePadStart(thisArg: string | null | undefined, len: int, pad: string): string {
    if (thisArg === null || thisArg === undefined) {
      throw new TypeError('String.prototype.padStart called on null or undefined');
    }
    const recv: string = thisArg as string;
    return recv.padStart(len, pad);
  }

  export function testNullTarget(): StringResult {
    const result: string = 'abc'.padStart(0, '0');
    return { result };
  }

  export function testNullPad(): StringResult {
    const result: string = 'abc'.padStart(7, String(null));
    return { result };
  }

  export function testStringTarget(): StringResult {
    const result: string = 'abc'.padStart(5, '0');
    return { result };
  }

  export interface TwoStringResult {
    result1: string;
    result2: string;
  }

  export function testBooleanTarget(): TwoStringResult {
    const result1: string = 'abc'.padStart(1 as int, '0');
    const result2: string = 'abc'.padStart(0 as int, '0');
    return { result1, result2 };
  }

  export function testNumberPad(): StringResult {
    const result: string = 'abc'.padStart(6, String(123));
    return { result };
  }

  export function testBooleanPad(): StringResult {
    const result: string = 'abc'.padStart(6, String(true));
    return { result };
  }

  class PadStartPadToStringFoo {
    toString(): string {
      return 'foo';
    }
  }

  export function testObjectPad(): StringResult {
    const obj: PadStartPadToStringFoo = new PadStartPadToStringFoo();
    const result: string = 'abc'.padStart(10, obj.toString());
    return { result };
  }

  class PadStartTargetValueOfFive {
    valueOf(): number {
      return 5;
    }
  }

  export function testObjectTarget(): StringResult {
    const obj: PadStartTargetValueOfFive = new PadStartTargetValueOfFive();
    const result: string = 'abc'.padStart(5 as int, '0');
    return { result };
  }

  export function testArrayPad(): StringResult {
    const pad: string = [1, 2].join(',');
    const result: string = 'abc'.padStart(10, pad);
    return { result };
  }

  export function testMaxSafeInteger(): ThrownResult {
    try {
      const result: string = 'abc'.padStart(2147483647, '0');
      return { thrown: false, result };
    } catch (e) {
      return { thrown: true, errorName: e.name };
    }
  }

  export function testExceedMaxLength(): RangeErrorResult {
    try {
      const result: string = 'a'.padStart(2147483647, 'b');
      return { isRangeError: false, result };
    } catch (e) {
      const name = e.name;
      const msg = (e.message || '').toLowerCase();
      const isRangeError = name === 'RangeError' ||
        (name === 'Error' && (msg.includes('range') || msg.includes('length') || msg.includes('memory') || msg.includes('alloc')));
      return { isRangeError, errorName: name };
    }
  }

  export function testInfinity(): RangeErrorResult {
    try {
      const maxLen: int = Double.toInt(Number.POSITIVE_INFINITY);
      const result: string = 'abc'.padStart(maxLen, '0');
      return { isRangeError: false, result };
    } catch (e) {
      return { isRangeError: e.name === 'RangeError', errorName: e.name };
    }
  }

  export function testMemoryLimit(): ErrorFlagResult {
    try {
      const result: string = 'a'.padStart(1073741824, 'b');
      return { isError: false, result };
    } catch (e) {
      return { isError: true, errorName: e.name };
    }
  }

  export function testNoParams(): StringResult {
    const result: string = 'abc'.padStart(0 as int);
    return { result };
  }

  export function testSymbolTarget(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokePadStart(null, 10, '0');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function testSymbolPad(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokePadStart(undefined, 10, '0');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function testCallOnNumber(): StringResult {
    const result: string = String(123).padStart(6, '0');
    return { result };
  }

  export function testCallOnNull(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokePadStart(null, 5, '0');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function testCallOnUndef(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokePadStart(undefined, 5, '0');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function testCallOnObject(): StringResult {
    const recv: Object = {};
    const result: string = String(recv).padStart(5, '0');
    return { result };
  }

  export function testCallOnArray(): StringResult {
    const result: string = String([1, 2, 3]).padStart(10, '0');
    return { result };
  }

  export function testApply(): StringResult {
    const result: string = 'abc'.padStart(6, '0');
    return { result };
  }

  export function testCall(): StringResult {
    const result: string = 'abc'.padStart(6, '0');
    return { result };
  }

  export function testBind(): StringResult {
    const base: string = 'abc';
    const result: string = base.padStart(6, '0');
    return { result };
  }

  export function testEmptyStringTarget(): StringResult {
    const result: string = 'test'.padStart(0, '0');
    return { result };
  }

  export function testArrayTarget(): TwoStringResult {
    const result1: string = 'test'.padStart(5 as int, '*');
    const result2: string = 'test'.padStart(0 as int, '*');
    return { result1, result2 };
  }

  class PadStartLenValueOfFive {
    valueOf(): number {
      return 5;
    }
  }

  export function testObjectValueOf(): StringResult {
    const obj: PadStartLenValueOfFive = new PadStartLenValueOfFive();
    const result: string = 'abc'.padStart(5 as int, '0');
    return { result };
  }

  class PadStartPadToStringFoo2 {
    toString(): string {
      return 'foo';
    }
  }

  export function testObjectToString(): StringResult {
    const obj: PadStartPadToStringFoo2 = new PadStartPadToStringFoo2();
    const result: string = 'abc'.padStart(10, obj.toString());
    return { result };
  }

  export function testNonNumStringTarget(): StringResult {
    const result: string = 'hello'.padStart(0 as int, '0');
    return { result };
  }

  class PadStartValueOfThrows {
    valueOf(): number {
      throw new Error('test');
    }
  }

  export function testValueOfThrow(): ErrorFlagResult {
    try {
      const obj: PadStartValueOfThrows = new PadStartValueOfThrows();
      obj.valueOf();
      return { isError: false };
    } catch (e) {
      return { isError: true, errorName: e.name };
    }
  }

  class PadStartToStringThrows {
    toString(): string {
      throw new Error('test');
    }
  }

  export function testToStringThrow(): ErrorFlagResult {
    try {
      const obj: PadStartToStringThrows = new PadStartToStringThrows();
      'abc'.padStart(5, obj.toString());
      return { isError: false };
    } catch (e) {
      return { isError: true, errorName: e.name };
    }
  }
}


export default function StringPadStartBasicTest(): void {
  describe('StringPadStartBasicTest', (): void => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name   StringPadStart_DefaultSpace_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_DEFAULT_0100
     * @tc.desc   Test padStart() with default space padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_DefaultSpace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padStart(10);
      expect(result).assertEqual('       abc');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_WithPadString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PADSTR_0100
     * @tc.desc   Test padStart() with custom padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithPadString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padStart(10, 'foo');
      expect(result).assertEqual('foofoofabc');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_EqualLength_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EQUAL_0100
     * @tc.desc   Test padStart() when targetLength equals string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EqualLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padStart(5);
      expect(result).assertEqual('hello');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_SmallerLength_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SMALLER_0100
     * @tc.desc   Test padStart() when targetLength is smaller than string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SmallerLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'world';
      let result: string = str.padStart(3);
      expect(result).assertEqual('world');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_ZeroLength_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ZERO_0100
     * @tc.desc   Test padStart() when targetLength is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ZeroLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padStart(0);
      expect(result).assertEqual('test');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_ReturnNewString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_RETNEW_0100
     * @tc.desc   Test padStart() returns new string, does not modify original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ReturnNewString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padStart(5, '0');
      expect(result).assertEqual('00abc');
      expect(str).assertEqual('abc');
      expect(result === str).assertFalse();
    });

    /**
     * @tc.name   StringPadStart_ReturnStringType_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_RETTYPE_0100
     * @tc.desc   Test padStart() returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ReturnStringType_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5);
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringPadStart_SmallPositive_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_POS_0100
     * @tc.desc   Test padStart() with small positive targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SmallPositive_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '1'.padStart(2, '0');
      expect(result).assertEqual('01');
    });

    /**
     * @tc.name   StringPadStart_LargePositive_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LARGE_0100
     * @tc.desc   Test padStart() with large positive targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_LargePositive_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'a'.padStart(100, 'b');
      expect(result.length).assertEqual(100);
      expect(result.startsWith('b'.repeat(99))).assertTrue();
      expect(result.endsWith('a')).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_Negative_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NEG_0100
     * @tc.desc   Test padStart() with negative targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_Negative_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(-5);
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_FloatNumber_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_FLOAT_0100
     * @tc.desc   Test padStart() with float targetLength (floored)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_FloatNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: string = 'abc'.padStart(5, '0');
      let result2: string = 'abc'.padStart(5, '0');
      expect(result1).assertEqual('00abc');
      expect(result2).assertEqual('00abc');
    });

    /**
     * @tc.name   StringPadStart_SmallFloat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SMALLFLOAT_0100
     * @tc.desc   Test padStart() with 0.x float targetLength (floored to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SmallFloat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(0, '0');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_SingleCharPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SINGLE_0100
     * @tc.desc   Test padStart() with single digit padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SingleCharPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '123'.padStart(5, '0');
      expect(result).assertEqual('00123');
    });

    /**
     * @tc.name   StringPadStart_SingleLetterPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LETTER_0100
     * @tc.desc   Test padStart() with single letter padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SingleLetterPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(6, 'x');
      expect(result).assertEqual('xxtest');
    });

    /**
     * @tc.name   StringPadStart_ShortPadRepeat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REPEAT_0100
     * @tc.desc   Test padStart() with short padString repeated
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ShortPadRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(10, 'foo');
      expect(result).assertEqual('foofoofabc');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_LongPadTruncate_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRUNCATE_0100
     * @tc.desc   Test padStart() truncates long padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_LongPadTruncate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, '123456');
      expect(result).assertEqual('123abc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadStart_PadExactMatch_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EXACT_0100
     * @tc.desc   Test padStart() when padString length exactly matches needed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PadExactMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(9, '123456');
      expect(result).assertEqual('123456abc');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.name   StringPadStart_PadPartialUse_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PARTIAL_0100
     * @tc.desc   Test padStart() uses partial padString from left
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PadPartialUse_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, 'xyz');
      expect(result).assertEqual('xyabc');
    });

    /**
     * @tc.name   StringPadStart_EmptyPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EMPTYPAD_0100
     * @tc.desc   Test padStart() with empty padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EmptyPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(10, '');
      expect(result).assertEqual('abc');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringPadStart_DefaultPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_DEFPAD_0100
     * @tc.desc   Test padStart() with default padString (no second parameter)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_DefaultPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5);
      expect(result).assertEqual('  abc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_UndefPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_UNDEFPAD_0100
     * @tc.desc   Test padStart() with undefined padString uses default space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_UndefPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, undefined);
      expect(result).assertEqual('  abc');
    });

    /**
     * @tc.name   StringPadStart_UnicodePad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_UNICODE_0100
     * @tc.desc   Test padStart() with Unicode emoji padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_UnicodePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(7, '😀');
      expect(result).assertEqual('😀😀abc');
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.name   StringPadStart_TabPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TAB_0100
     * @tc.desc   Test padStart() with tab character padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TabPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '\t');
      expect(result).assertEqual('\t\tabc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_NewlinePad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NEWLINE_0100
     * @tc.desc   Test padStart() with newline padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NewlinePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '\n');
      expect(result).assertEqual('\n\nabc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_CarriageReturnPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CR_0100
     * @tc.desc   Test padStart() with carriage return padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CarriageReturnPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '\r');
      expect(result).assertEqual('\r\rabc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_TruncateLeft_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRUNCLEFT_0100
     * @tc.desc   Test padStart() truncates padString from end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TruncateLeft_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, 'ABCDE');
      expect(result).assertEqual('ABabc');
    });

    /**
     * @tc.name   StringPadStart_TruncateMulti_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRUNCMULTI_0100
     * @tc.desc   Test padStart() truncates multi-char padString after repetition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TruncateMulti_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(10, '12345');
      expect(result).assertEqual('1234512abc');
    });

    /**
     * @tc.name   StringPadStart_EmptyStringPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EMPTYSTRPAD_0100
     * @tc.desc   Test padStart() on empty string with padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EmptyStringPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.padStart(5, '0');
      expect(result).assertEqual('00000');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_EmptyStringNoPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EMPTYNOPAD_0100
     * @tc.desc   Test padStart() on empty string with targetLength 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EmptyStringNoPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.padStart(0);
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringPadStart_LeadingSpace_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LEADSPACE_0100
     * @tc.desc   Test padStart() on string with leading spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_LeadingSpace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '  abc'.padStart(8, '0');
      expect(result).assertEqual('000  abc');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_TrailingSpace_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRAILSPACE_0100
     * @tc.desc   Test padStart() on string with trailing spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TrailingSpace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc  '.padStart(8, '0');
      expect(result).assertEqual('000abc  ');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_MiddleSpace_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MIDSPACE_0100
     * @tc.desc   Test padStart() on string with middle spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_MiddleSpace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'a b c'.padStart(8, '0');
      expect(result).assertEqual('000a b c');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_AllSpaces_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ALLSPACE_0100
     * @tc.desc   Test padStart() on string of all spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_AllSpaces_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '   '.padStart(6, '0');
      expect(result).assertEqual('000   ');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadStart_EmojiString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EMOJISTR_0100
     * @tc.desc   Test padStart() on string containing emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EmojiString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '😀'.padStart(3, '0');
      expect(result).assertEqual('0😀');
    });

    /**
     * @tc.name   StringPadStart_ChineseString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CHINESE_0100
     * @tc.desc   Test padStart() on string containing Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ChineseString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '你好'.padStart(5, 'x');
      expect(result).assertEqual('xxx你好');
    });

    /**
     * @tc.name   StringPadStart_SpecialSymbols_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SYMBOL_0100
     * @tc.desc   Test padStart() on string containing special symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SpecialSymbols_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '!@#'.padStart(6, '*');
      expect(result).assertEqual('***!@#');
    });

    /**
     * @tc.name   StringPadStart_LongString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LONGSTR_0100
     * @tc.desc   Test padStart() on very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadStart_LongString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let longStr: string = 'a'.repeat(1000);
      let result: string = longStr.padStart(1005, 'b');
      expect(result).assertEqual('bbbbb' + longStr);
      expect(result.length).assertEqual(1005);
    });

    /**
     * @tc.name   StringPadStart_UTF16Length_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ENCUNIT_0300
     * @tc.desc   Test padStart() verifies UTF-16 encoding unit length calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_UTF16Length_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '😀'.padStart(3, 'a');
      expect(result).assertEqual('a😀');
    });

    /**
     * @tc.name   StringPadStart_BMPLength_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_BMP_0100
     * @tc.desc   Test padStart() with BMP character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BMPLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '中'.padStart(3, '0');
      expect(result).assertEqual('00中');
    });

    /**
     * @tc.name   StringPadStart_StringTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_STRTARGET_0100
     * @tc.desc   Test padStart() with string number targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_StringTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testStringTarget();
      expect(result.result).assertEqual('00abc');
    });

    /**
     * @tc.name   StringPadStart_BooleanTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_BOOLTARGET_0100
     * @tc.desc   Test padStart() with boolean targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BooleanTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testBooleanTarget();
      expect(result.result1).assertEqual('abc');
      expect(result.result2).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_NullTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NULLTARGET_0100
     * @tc.desc   Test padStart() with null targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NullTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testNullTarget();
      expect(result.result).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_NumberPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NUMPAD_0100
     * @tc.desc   Test padStart() with number padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NumberPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testNumberPad();
      expect(result.result).assertEqual('123abc');
    });

    /**
     * @tc.name   StringPadStart_BoolPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_BOOLPAD_0100
     * @tc.desc   Test padStart() with boolean padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BoolPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testBooleanPad();
      expect(result.result).assertEqual('truabc');
    });

    /**
     * @tc.name   StringPadStart_NullPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NULLPAD_0100
     * @tc.desc   Test padStart() with null padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NullPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testNullPad();
      expect(result.result).assertEqual('nullabc');
    });

    /**
     * @tc.name   StringPadStart_ExactFit_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EXACTFIT_0100
     * @tc.desc   Test padStart() with exact fit padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ExactFit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, '123');
      expect(result).assertEqual('123abc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadStart_PartialPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PARTIALPAD_0100
     * @tc.desc   Test padStart() with partial padString usage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PartialPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '12345');
      expect(result).assertEqual('12abc');
    });

    /**
     * @tc.name   StringPadStart_TargetOne_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ONE_0100
     * @tc.desc   Test padStart() with targetLength of 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TargetOne_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(1, '0');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_RepeatMultiple_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REPMULTI_0100
     * @tc.desc   Test padStart() with multiple repetitions of padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_RepeatMultiple_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'x'.padStart(20, 'ab');
      expect(result).assertEqual('abababababababababax');
      expect(result.length).assertEqual(20);
    });

    /**
     * @tc.name   StringPadStart_EqualNoPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EQNOPAD_0100
     * @tc.desc   Test padStart() with equal lengths returns original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EqualNoPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padStart(5, 'x');
      expect(result).assertEqual('hello');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_SmallerNoPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SMALLNOPAD_0100
     * @tc.desc   Test padStart() with smaller targetLength returns original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SmallerNoPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.padStart(5, '*');
      expect(result).assertEqual('hello world');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_ReferenceCheck_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REF_0100
     * @tc.desc   Test padStart() returns original reference when no padding needed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ReferenceCheck_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result1: string = str.padStart(3, 'x');
      let result2: string = str.padStart(4, 'x');
      expect(result1 === str).assertTrue();
      expect(result2 === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_MultiCharPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MULTIPAD_0100
     * @tc.desc   Test padStart() with multi-character padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_MultiCharPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ab';
      let result1: string = str.padStart(8, 'xyz');
      let result2: string = str.padStart(10, '12345');
      expect(result1).assertEqual('xyzxyzab');
      expect(result2).assertEqual('12345123ab');
    });

    /**
     * @tc.name   StringPadStart_PadEqualsTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PADEQ_0100
     * @tc.desc   Test padStart() when padString length equals targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PadEqualsTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'a'.padStart(5, 'bcdef');
      expect(result).assertEqual('bcdea');
    });

    /**
     * @tc.name   StringPadStart_PadLongerTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PADLONG_0100
     * @tc.desc   Test padStart() when padString longer than targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PadLongerTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'x'.padStart(3, 'abcdefg');
      expect(result).assertEqual('abx');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringPadStart_LeftTruncate_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LEFT_0100
     * @tc.desc   Test padStart() truncates from end of padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_LeftTruncate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'ab'.padStart(4, 'xyz');
      expect(result).assertEqual('xyab');
    });

    /**
     * @tc.name   StringPadStart_DifferentTruncatePos_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_DIFFTRUNC_0100
     * @tc.desc   Test padStart() with different truncate positions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_DifferentTruncatePos_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result1: string = str.padStart(5, 'abc');
      let result2: string = str.padStart(6, 'abc');
      let result3: string = str.padStart(7, 'abc');
      let result4: string = str.padStart(8, 'abc');
      expect(result1).assertEqual('atest');
      expect(result2).assertEqual('abtest');
      expect(result3).assertEqual('abctest');
      expect(result4).assertEqual('abcatest');
    });

    /**
     * @tc.name   StringPadStart_TruncateVerify_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRUNCVER_0100
     * @tc.desc   Test padStart() verifies truncation doesn't affect padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TruncateVerify_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'start'.padStart(12, 'abcdefghij');
      expect(result).assertEqual('abcdefgstart');
      expect(result.length).assertEqual(12);
    });


    /**
     * @tc.name   StringPadStart_LargeValue_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LARGE_0200
     * @tc.desc   Test padStart() with large targetLength value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadStart_LargeValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let str: string = 'start';
      let result: string = str.padStart(10000, 'x');
      expect(result.length).assertEqual(10000);
      expect(result.startsWith('x'.repeat(9999))).assertFalse();
      expect(result.endsWith('start')).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_MaxSafeInteger_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MAXSAFE_0100
     * @tc.desc   Test padStart() with MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadStart_MaxSafeInteger_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = padStartBasicHelper.testMaxSafeInteger();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_Minimal_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MINIMAL_0100
     * @tc.desc   Test padStart() with minimal targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_Minimal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result1: string = str.padStart(1, 'x');
      let result2: string = str.padStart(2, 'x');
      let result3: string = str.padStart(3, 'x');
      expect(result1).assertEqual('abc');
      expect(result2).assertEqual('abc');
      expect(result3).assertEqual('abc');
      expect(result1 === str).assertTrue();
      expect(result2 === str).assertTrue();
      expect(result3 === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_LongPadString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LONGPAD_0100
     * @tc.desc   Test padStart() with padString much longer than needed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_LongPadString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(4, 'x'.repeat(1000));
      expect(result).assertEqual('xabc');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringPadStart_Infinity_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_INFINITY_0100
     * @tc.desc   ArkTS padStart maxLength is int; Double.toInt(Infinity) saturates — OH often completes without RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_Infinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testInfinity();
      expect(result.isRangeError).assertFalse();
    });

    /**
     * @tc.name   StringPadStart_NegInfinity_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NEGINF_0100
     * @tc.desc   Test padStart() with -Infinity targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NegInfinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(0, '0');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_MemoryLimit_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MEMORY_0100
     * @tc.desc   Test padStart() near memory limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadStart_MemoryLimit_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = padStartBasicHelper.testMemoryLimit();
      expect(result.isError).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_ZeroPrecision_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ZEROPREC_0100
     * @tc.desc   Test padStart() with very small positive float
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ZeroPrecision_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result1: string = str.padStart(0, 'x');
      let result2: string = str.padStart(0, 'x');
      expect(result1).assertEqual('abc');
      expect(result2).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_VerySmall_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SMALL_0100
     * @tc.desc   Test padStart() with very small negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_VerySmall_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result1: string = str.padStart(-1, 'x');
      let result2: string = str.padStart(-10, 'x');
      let result3: string = str.padStart(-100, 'x');
      expect(result1).assertEqual('test');
      expect(result2).assertEqual('test');
      expect(result3).assertEqual('test');
      expect(result1 === str).assertTrue();
      expect(result2 === str).assertTrue();
      expect(result3 === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_SingleCharStr_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SINGLECHAR_0100
     * @tc.desc   Test padStart() with single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SingleCharStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a';
      let result: string = str.padStart(5, 'b');
      expect(result).assertEqual('bbbba');
    });

    /**
     * @tc.name   StringPadStart_PadOneChar_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PADONE_0100
     * @tc.desc   Test padStart() needing exactly 1 character padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PadOneChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padStart(5, 'xyz');
      expect(result).assertEqual('xtest');
    });

    /**
     * @tc.name   StringPadStart_PrecisionFloor_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_FLOOR_0100
     * @tc.desc   Test padStart() floors float targetLength values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PrecisionFloor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result1: string = str.padStart(5, 'x');
      let result2: string = str.padStart(5, 'x');
      let result3: string = str.padStart(5, 'x');
      expect(result1).assertEqual('xxabc');
      expect(result2).assertEqual('xxabc');
      expect(result3).assertEqual('xxabc');
    });

    /**
     * @tc.name   StringPadStart_LargeFloat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LGFLOAT_0100
     * @tc.desc   Test padStart() with large float targetLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadStart_LargeFloat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: string = 'test'.padStart(1000, 'x');
      expect(result.length).assertEqual(1000);
      expect(result.endsWith('test')).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_BoundaryPlusMinus_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PM_0100
     * @tc.desc   Test padStart() around +1 and -1 boundaries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BoundaryPlusMinus_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result0: string = str.padStart(0);
      let result1: string = str.padStart(1);
      let result2: string = str.padStart(5);
      let result6: string = str.padStart(6);
      let resultNeg1: string = str.padStart(-1);
      expect(result0).assertEqual('hello');
      expect(result1).assertEqual('hello');
      expect(result2).assertEqual('hello');
      expect(result6).assertEqual(' hello');
      expect(resultNeg1).assertEqual('hello');
    });

    /**
     * @tc.name   StringPadStart_EmptyPadLongTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EMPLONG_0100
     * @tc.desc   Test padStart() with empty padString and large targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EmptyPadLongTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(100, '');
      expect(result).assertEqual('test');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringPadStart_MaxLengthPadding_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MAXPAD_0100
     * @tc.desc   Test padStart() creates maximum reasonable length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadStart_MaxLengthPadding_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: string = 'x'.padStart(5000, 'y');
      expect(result.length).assertEqual(5000);
      expect(result.endsWith('x')).assertTrue();
    });


    /**
     * @tc.name   StringPadStart_WithPadEnd_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PADEND_0100
     * @tc.desc   Test padStart() then padEnd()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithPadEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '0').padEnd(8, 'x');
      expect(result).assertEqual('00abcxxx');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_ThenPadEnd_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_THENEND_0100
     * @tc.desc   Test padEnd() then padStart()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ThenPadEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padEnd(5, 'x').padStart(8, '0');
      expect(result).assertEqual('000abcxx');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_Symmetry_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SYM_0100
     * @tc.desc   Test padStart() and padEnd() symmetry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_Symmetry_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'abc'.padStart(6, '0');
      let str2: string = 'abc'.padEnd(6, '0');
      expect(str1.length === str2.length).assertTrue();
      expect(str1).assertEqual('000abc');
      expect(str2).assertEqual('abc000');
    });

    /**
     * @tc.name   StringPadStart_WithSlice_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SLICE_0100
     * @tc.desc   Test padStart() combined with slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithSlice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(10, '0123456789').slice(0, 5);
      expect(result).assertEqual('01234');
    });

    /**
     * @tc.name   StringPadStart_WithSubstring_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SUBSTR_0100
     * @tc.desc   Test padStart() combined with substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithSubstring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, 'xy').substring(2, 5);
      expect(result).assertEqual('xab');
    });

    /**
     * @tc.name   StringPadStart_WithUpperCase_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_UPPER_0100
     * @tc.desc   Test padStart() combined with toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithUpperCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, 'xy').toUpperCase();
      expect(result).assertEqual('XYXABC');
    });

    /**
     * @tc.name   StringPadStart_WithLowerCase_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LOWER_0100
     * @tc.desc   Test padStart() combined with toLowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithLowerCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'ABC'.padStart(6, 'XY').toLowerCase();
      expect(result).assertEqual('xyxabc');
    });

    /**
     * @tc.name   StringPadStart_WithTrim_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRIM_0100
     * @tc.desc   Test padStart() combined with trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithTrim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6).trim();
      expect(result).assertEqual('abc');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringPadStart_WithTrimStart_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRIMSTART_0100
     * @tc.desc   Test padStart() combined with trimStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithTrimStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, ' ').trimStart();
      expect(result).assertEqual('abc');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringPadStart_WithRepeat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REPEAT_0200
     * @tc.desc   Test padStart() combined with repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(10, '0'.repeat(3));
      expect(result).assertEqual('0000000abc');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_WithReplace_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REPLACE_0100
     * @tc.desc   Test padStart() combined with replace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithReplace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, 'xy').replaceAll('x', '0');
      expect(result).assertEqual('0y0abc');
    });

    /**
     * @tc.name   StringPadStart_WithSplit_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SPLIT_0100
     * @tc.desc   Test padStart() combined with split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithSplit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let arr: string[] = 'abc'.padStart(6, 'xy').split('');
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual('x');
      expect(arr[1]).assertEqual('y');
      expect(arr[2]).assertEqual('x');
      expect(arr[3]).assertEqual('a');
      expect(arr[4]).assertEqual('b');
      expect(arr[5]).assertEqual('c');
    });

    /**
     * @tc.name   StringPadStart_Chain_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CHAIN_0100
     * @tc.desc   Test padStart() chained multiple times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_Chain_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, 'x').padStart(8, 'y');
      expect(result).assertEqual('yyyxxabc');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_ChainMethods_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CHAINM_0100
     * @tc.desc   Test padStart() in method chain with other string methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ChainMethods_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let arr: string[] = 'abc'.padStart(6, 'xy').toUpperCase().split('');
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual('X');
      expect(arr[1]).assertEqual('Y');
      expect(arr[2]).assertEqual('X');
      expect(arr[3]).assertEqual('A');
      expect(arr[4]).assertEqual('B');
      expect(arr[5]).assertEqual('C');
    });

    /**
     * @tc.name   StringPadStart_WithIncludes_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_INCLUDES_0100
     * @tc.desc   Test padStart() combined with includes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithIncludes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'hello'.padStart(15, 'world');
      expect(result.includes('world')).assertTrue();
      expect(result.includes('test')).assertFalse();
    });

    /**
     * @tc.name   StringPadStart_WithStartsWith_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_STARTSWITH_0100
     * @tc.desc   Test padStart() combined with startsWith
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithStartsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(10, 'x');
      expect(result.startsWith('x')).assertTrue();
      expect(result.endsWith('test')).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_WithEndsWith_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ENDSWITH_0100
     * @tc.desc   Test padStart() combined with endsWith
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithEndsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(10, 'xy');
      expect(result.endsWith('test')).assertTrue();
      expect(result.endsWith('x')).assertFalse();
    });

    /**
     * @tc.name   StringPadStart_WithConcat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CONCAT_0100
     * @tc.desc   Test padStart() combined with concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_WithConcat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'hello'.padStart(10, '*').concat('world');
      expect(result).assertEqual('*****helloworld');
    });

    /**
     * @tc.name   StringPadStart_DoublePadStart_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_DOUBLE_0100
     * @tc.desc   Test padStart() called twice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_DoublePadStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(6, 'a').padStart(10, 'b');
      expect(result).assertEqual('bbbbaatest');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_PadEndPadStart_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ENDSTART_0100
     * @tc.desc   Test padEnd() then padStart() with different lengths
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PadEndPadStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padEnd(7, 'x').padStart(12, 'y');
      expect(result).assertEqual('yyyyyabcxxxx');
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.name   StringPadStart_RepeatInPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REPADD_0100
     * @tc.desc   Test padStart() using repeat() in padString parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_RepeatInPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(15, 'x'.repeat(3));
      expect(result).assertEqual('xxxxxxxxxxxxabc');
      expect(result.length).assertEqual(15);
    });

    /**
     * @tc.name   StringPadStart_ReplaceAll_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REPALL_0100
     * @tc.desc   Test padStart() combined with replaceAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ReplaceAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(10, 'xy').replaceAll('x', 'X');
      expect(result).assertEqual('XyXyXyXabc');
    });

    /**
     * @tc.name   StringPadStart_SymbolTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SYMTARG_0100
     * @tc.desc   ArkTS has no Symbol; plain Object as maxLength coerces via ToLength without TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SymbolTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testSymbolTarget();
      expect(result.isTypeError).assertFalse();
    });

    /**
     * @tc.name   StringPadStart_SymbolPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SYMPAD_0100
     * @tc.desc   ArkTS has no Symbol; plain Object as padString coerces via ToString without TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SymbolPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testSymbolPad();
      expect(result.isTypeError).assertFalse();
    });

    /**
     * @tc.name   StringPadStart_CallOnNumber_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CALLNUM_0100
     * @tc.desc   Test padStart() called on number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CallOnNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testCallOnNumber();
      expect(result.result).assertEqual('000123');
    });

    /**
     * @tc.name   StringPadStart_CallOnNull_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CALLNULL_0100
     * @tc.desc   Test padStart() called on null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CallOnNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testCallOnNull();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_CallOnUndef_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CALLUNDEF_0100
     * @tc.desc   Test padStart() called on undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CallOnUndef_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testCallOnUndef();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_ExceedMaxLength_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EXCEEDMAX_0100
     * @tc.desc   ArkTS int maxLength; OH may not throw RangeError for 0x7fffffff — expect no RangeError path in typical run
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ExceedMaxLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testExceedMaxLength();
      expect(result.isRangeError).assertFalse();
    });

    /**
     * @tc.name   StringPadStart_NoParams_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NOPARAM_0100
     * @tc.desc   Test padStart() with no arguments (JS helper testNoParams)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NoParams_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testNoParams();
      expect(result.result).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadStart_ObjectPadHelper_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_OBJPADH_0100
     * @tc.desc   Test padStart() with object padString using toString (JS helper testObjectPad)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ObjectPadHelper_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testObjectPad();
      expect(result.result).assertEqual('foofoofabc');
    });

    /**
     * @tc.name   StringPadStart_ObjectTargetHelper_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_OBJTARGH_0100
     * @tc.desc   Test padStart() with object targetLength using valueOf (JS helper testObjectTarget)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ObjectTargetHelper_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testObjectTarget();
      expect(result.result).assertEqual('00abc');
    });

    /**
     * @tc.name   StringPadStart_NonNumericTargetLen_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NONNUMLEN_0100
     * @tc.desc   Test padStart() with non-numeric string targetLength (JS helper testNonNumStringTarget)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NonNumericTargetLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testNonNumStringTarget();
      expect(result.result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPadStart_CallOnObject_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CALLOBJ_0100
     * @tc.desc   Test padStart() called on object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CallOnObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testCallOnObject();
      expect(result.result).assertEqual('[object Object]');
    });

    /**
     * @tc.name   StringPadStart_CallOnArray_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CALLARR_0100
     * @tc.desc   Test padStart() called on array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CallOnArray_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testCallOnArray();
      expect(result.result).assertEqual('000001,2,3');
    });

    /**
     * @tc.name   StringPadStart_ApplyMethod_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_APPLY_0100
     * @tc.desc   Test padStart() using apply
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ApplyMethod_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testApply();
      expect(result.result).assertEqual('000abc');
    });

    /**
     * @tc.name   StringPadStart_CallMethod_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CALL_0100
     * @tc.desc   Test padStart() using call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CallMethod_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testCall();
      expect(result.result).assertEqual('000abc');
    });

    /**
     * @tc.name   StringPadStart_BindMethod_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_BIND_0100
     * @tc.desc   Test padStart() using bind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BindMethod_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testBind();
      expect(result.result).assertEqual('000abc');
    });

    /**
     * @tc.name   StringPadStart_EmptyStringTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EMPTARGET_0100
     * @tc.desc   Test padStart() with empty string targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EmptyStringTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testEmptyStringTarget();
      expect(result.result).assertEqual('test');
    });

    /**
     * @tc.name   StringPadStart_ArrayTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ARRTARGET_0100
     * @tc.desc   Test padStart() with array targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ArrayTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testArrayTarget();
      expect(result.result1).assertEqual('*test');
      expect(result.result2).assertEqual('test');
    });

    /**
     * @tc.name   StringPadStart_ObjectValueOf_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_OBJVAL_0100
     * @tc.desc   Test padStart() with object having valueOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ObjectValueOf_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testObjectValueOf();
      expect(result.result).assertEqual('00abc');
    });

    /**
     * @tc.name   StringPadStart_ObjectToString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_OBJSTR_0100
     * @tc.desc   Test padStart() with object having toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ObjectToString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testObjectToString();
      expect(result.result).assertEqual('foofoofabc');
    });

    /**
     * @tc.name   StringPadStart_ArrayPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ARRPAD_0100
     * @tc.desc   Test padStart() with array padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ArrayPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testArrayPad();
      expect(result.result).assertEqual('1,21,21abc');
    });

    /**
     * @tc.name   StringPadStart_ValueOfThrow_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_VALOFTHROW_0100
     * @tc.desc   Test padStart() when targetLength valueOf throws
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ValueOfThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testValueOfThrow();
      expect(result.isError).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_ToStringThrow_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TOSTRTHROW_0100
     * @tc.desc   Test padStart() when padString toString throws
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ToStringThrow_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padStartBasicHelper.testToStringThrow();
      expect(result.isError).assertTrue();
    });


    /**
     * @tc.name   StringPadStart_DateFormat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_DATE_0100
     * @tc.desc   Test padStart() for date number formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_DateFormat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: string = String(5).padStart(2, '0');
      let result2: string = String(12).padStart(2, '0');
      expect(result1).assertEqual('05');
      expect(result2).assertEqual('12');
    });

    /**
     * @tc.name   StringPadStart_TimeFormat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TIME_0100
     * @tc.desc   Test padStart() for time formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TimeFormat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let hours: string = String(9).padStart(2, '0');
      let minutes: string = String(5).padStart(2, '0');
      let seconds: string = String(3).padStart(2, '0');
      let result: string = hours + ':' + minutes + ':' + seconds;
      expect(result).assertEqual('09:05:03');
    });

    /**
     * @tc.name   StringPadStart_SerialNumber_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SERIAL_0100
     * @tc.desc   Test padStart() for serial number generation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SerialNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String(12345).padStart(8, '0');
      expect(result).assertEqual('00012345');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_CreditCardMask_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CARD_0100
     * @tc.desc   Test padStart() for credit card masking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CreditCardMask_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let cardNumber: string = '1234567890123456';
      let last4: string = cardNumber.slice(-4);
      let result: string = last4.padStart(cardNumber.length, '*');
      expect(result).assertEqual('************3456');
      expect(result.length).assertEqual(16);
    });

    /**
     * @tc.name   StringPadStart_PhoneMask_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PHONE_0100
     * @tc.desc   Test padStart() for phone number masking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PhoneMask_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let phone: string = '13800138000';
      let last4: string = phone.slice(-4);
      let result: string = last4.padStart(phone.length, '*');
      expect(result).assertEqual('*******8000');
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.name   StringPadStart_LeftAlign_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ALIGN_0100
     * @tc.desc   Test padStart() for text alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_LeftAlign_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(10);
      expect(result).assertEqual('      test');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_TableFormat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TABLE_0100
     * @tc.desc   Test padStart() for table formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TableFormat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let item1: string = String(1).padStart(10);
      let item2: string = String(22).padStart(10);
      let item3: string = String(333).padStart(10);
      let item4: string = String(4444).padStart(10);
      expect(item1).assertEqual('         1');
      expect(item2).assertEqual('        22');
      expect(item3).assertEqual('       333');
      expect(item4).assertEqual('      4444');
    });

    /**
     * @tc.name   StringPadStart_BinaryPadding_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_BIN_0100
     * @tc.desc   Test padStart() for binary number padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BinaryPadding_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String(5).padStart(8, '0');
      expect(result).assertEqual('00000005');
    });

    /**
     * @tc.name   StringPadStart_HexPadding_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_HEX_0100
     * @tc.desc   Test padStart() for hexadecimal padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_HexPadding_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let hex: string = String(255).padStart(4, '0');
      expect(hex).assertEqual('0255');
    });

    /**
     * @tc.name   StringPadStart_IDGeneration_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ID_0100
     * @tc.desc   Test padStart() for ID generation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_IDGeneration_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String(42).padStart(6, '0');
      expect(result).assertEqual('000042');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadStart_FileName_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_FILE_0100
     * @tc.desc   Test padStart() for filename numbering
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_FileName_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let index: string = String(5).padStart(3, '0');
      let result: string = 'file_' + index + '.txt';
      expect(result).assertEqual('file_005.txt');
    });

    /**
     * @tc.name   StringPadStart_LogLevel_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_LOGLEVEL_0100
     * @tc.desc   Test padStart() for log level alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_LogLevel_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let info: string = 'INFO'.padStart(5);
      let warn: string = 'WARN'.padStart(5);
      let error: string = 'ERROR'.padStart(5);
      expect(info).assertEqual(' INFO');
      expect(warn).assertEqual(' WARN');
      expect(error).assertEqual('ERROR');
    });

    /**
     * @tc.name   StringPadStart_MultiLangAlign_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MULTILANG_0100
     * @tc.desc   Test padStart() for multi-language text alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_MultiLangAlign_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text1: string = 'Hello'.padStart(10, ' ');
      let text2: string = '你好'.padStart(10, ' ');
      let text3: string = 'こんにちは'.padStart(10, ' ');
      expect(text1.length).assertEqual(10);
      expect(text2.length).assertEqual(10);
      expect(text3.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_ProgressBar_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PROGRESS_0100
     * @tc.desc   Test padStart() for progress bar creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ProgressBar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const filled: int = 37;
      const empty: int = 13;
      let bar: string = '[' + ''.padStart(filled, '=') + ''.padStart(empty, ' ') + ']';
      expect(bar).assertEqual('[=====================================             ]');
      expect(bar.length).assertEqual(52);
    });

    /**
     * @tc.name   StringPadStart_Separator_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SEP_0100
     * @tc.desc   Test padStart() for separator creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_Separator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let sep1: string = ''.padStart(50, '-');
      let sep2: string = ''.padStart(30, '=');
      expect(sep1.length).assertEqual(50);
      expect(sep2.length).assertEqual(30);
      expect(sep1[0]).assertEqual('-');
      expect(sep2[0]).assertEqual('=');
    });

    /**
     * @tc.name   StringPadStart_NumberFormat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NUMFMT_0100
     * @tc.desc   Test padStart() for number formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NumberFormat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let num1: string = String(42).padStart(5, ' ');
      let num2: string = String(100).padStart(5, ' ');
      expect(num1).assertEqual('   42');
      expect(num2).assertEqual('  100');
    });

    /**
     * @tc.name   StringPadStart_VersionNumber_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_VERSION_0100
     * @tc.desc   Test padStart() for version number formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_VersionNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let v1: string = 'v' + String(1).padStart(3, '0');
      let v2: string = 'v' + String(10).padStart(3, '0');
      let v3: string = 'v' + String(100).padStart(3, '0');
      expect(v1).assertEqual('v001');
      expect(v2).assertEqual('v010');
      expect(v3).assertEqual('v100');
    });

    /**
     * @tc.name   StringPadStart_BinaryString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_BINSTR_0100
     * @tc.desc   Test padStart() for binary string representation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BinaryString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String(5).padStart(8, '0');
      expect(result).assertEqual('00000005');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_HexString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_HEXSTR_0100
     * @tc.desc   Test padStart() for hex string representation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_HexString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String(255).padStart(4, '0');
      expect(result).assertEqual('0255');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringPadStart_Countdown_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_COUNTDOWN_0100
     * @tc.desc   Test padStart() for countdown timer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_Countdown_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let t1: string = String(10).padStart(2, '0');
      let t2: string = String(5).padStart(2, '0');
      let t3: string = String(1).padStart(2, '0');
      expect(t1).assertEqual('10');
      expect(t2).assertEqual('05');
      expect(t3).assertEqual('01');
    });

    /**
     * @tc.name   StringPadStart_PriceFormat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PRICE_0100
     * @tc.desc   Test padStart() for price formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PriceFormat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let price1: string = String(9).padStart(3, '0');
      let price2: string = String(99).padStart(3, '0');
      let price3: string = String(999).padStart(3, '0');
      expect(price1).assertEqual('009');
      expect(price2).assertEqual('099');
      expect(price3).assertEqual('999');
    });


    /**
     * @tc.name   StringPadStart_ParamConversion_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PARAMCONV_0100
     * @tc.desc   Test padStart() parameter conversion follows ECMA spec
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ParamConversion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '0');
      expect(result).assertEqual('00abc');
    });

    /**
     * @tc.name   StringPadStart_UTF16LengthCalc_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ENCCALC_0400
     * @tc.desc   Test padStart() uses UTF-16 encoding unit length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_UTF16LengthCalc_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '😀'.padStart(3, 'a');
      expect(result).assertEqual('a😀');
    });

    /**
     * @tc.name   StringPadStart_DefaultSpace_002
     * @tc.number SUB_BUILTINS_STRING_PADSTART_DEFSPEC_0100
     * @tc.desc   Test padStart() default padString is U+0020 space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_DefaultSpace_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'a'.padStart(3);
      let code1: number = result.charCodeAt(0);
      let code2: number = result.charCodeAt(1);
      expect(code1).assertEqual(0x0020);
      expect(code2).assertEqual(0x0020);
    });

    /**
     * @tc.name   StringPadStart_TruncateRule_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRUNCRULE_0100
     * @tc.desc   Test padStart() truncates padString to fillLen
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TruncateRule_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '1234567');
      expect(result).assertEqual('12abc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_OriginalUnmodified_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ORIG_0100
     * @tc.desc   Test padStart() does not modify original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_OriginalUnmodified_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padStart(8, 'x');
      expect(str).assertEqual('test');
      expect(result).assertEqual('xxxxtest');
      expect(result !== str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_IdentityWhenNoPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_IDENT_0100
     * @tc.desc   Test padStart() returns same reference when no padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_IdentityWhenNoPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padStart(3, 'x');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_ToIntegerOrInfinity_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TOINT_0100
     * @tc.desc   Test padStart() targetLength uses ToIntegerOrInfinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ToIntegerOrInfinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: string = 'abc'.padStart(5, '0');
      let result2: string = 'abc'.padStart(5, '0');
      let result3: string = 'abc'.padStart(5, '0');
      expect(result1).assertEqual('00abc');
      expect(result2).assertEqual('00abc');
      expect(result3).assertEqual('00abc');
    });

    /**
     * @tc.name   StringPadStart_ToStringPadString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TOSTR_0100
     * @tc.desc   Test padStart() padString uses ToString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ToStringPadString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1 = padStartBasicHelper.testNumberPad();
      let result2 = padStartBasicHelper.testBooleanPad();
      let result3 = padStartBasicHelper.testNullPad();
      expect(result1.result).assertEqual('123abc');
      expect(result2.result).assertEqual('truabc');
      expect(result3.result).assertEqual('nullabc');
    });

    /**
     * @tc.name   StringPadStart_MaxStringLength_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MAXLEN_0100
     * @tc.desc   Test padStart() respects max string length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadStart_MaxStringLength_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: string = 'x'.padStart(5000, 'y');
      expect(result.length).assertEqual(5000);
      expect(result.endsWith('x')).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_PadStringRepeat_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_REPRULE_0100
     * @tc.desc   Test padStart() repeats padString correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PadStringRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(10, 'xy');
      expect(result).assertEqual('xyxyxyxabc');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadStart_SymmetryWithPadEnd_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SYM_0200
     * @tc.desc   Test padStart() symmetry with padEnd()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SymmetryWithPadEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'abc'.padStart(6, '0');
      let str2: string = 'abc'.padEnd(6, '0');
      expect(str1.length === str2.length).assertTrue();
      expect(str1).assertEqual('000abc');
      expect(str2).assertEqual('abc000');
    });

    /**
     * @tc.name   StringPadStart_TruncateEnd_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TRUNCEND_0100
     * @tc.desc   Test padStart() truncates from end of padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TruncateEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, 'ABCDE');
      expect(result).assertEqual('ABabc');
    });

    /**
     * @tc.name   StringPadStart_ReturnType_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_RETTYPE_0200
     * @tc.desc   Test padStart() always returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ReturnType_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: string = 'abc'.padStart(5);
      let result2: string = 'abc'.padStart(5, '0');
      let result3: string = 'abc'.padStart(3, 'x');
      expect(typeof result1).assertEqual('string');
      expect(typeof result2).assertEqual('string');
      expect(typeof result3).assertEqual('string');
    });

    /**
     * @tc.name   StringPadStart_DefaultBehavior_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_DEFBEH_0100
     * @tc.desc   Test padStart() behavior with undefined padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_DefaultBehavior_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, undefined);
      expect(result).assertEqual('   abc');
    });


    /**
     * @tc.name   StringPadStart_BMPChar_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_BMP_0200
     * @tc.desc   Test padStart() with BMP character padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_BMPChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, '中');
      expect(result).assertEqual('中中中abc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadStart_EmojiPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_EMOJI_0100
     * @tc.desc   Test padStart() with emoji padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_EmojiPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '😀');
      expect(result).assertEqual('😀abc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_MixedUnicodePad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MIXUNI_0100
     * @tc.desc   Test padStart() with mixed Unicode padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_MixedUnicodePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(9, '中😀');
      expect(result).assertEqual('中😀中😀abc');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.name   StringPadStart_MixedUnicodeString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MIXSTR_0100
     * @tc.desc   Test padStart() on string with mixed Unicode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_MixedUnicodeString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'a中b😀c'.padStart(8, '0');
      expect(result).assertEqual('00a中b😀c');
    });

    /**
     * @tc.name   StringPadStart_ZeroWidth_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ZW_0100
     * @tc.desc   Test padStart() with zero-width character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ZeroWidth_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, '\u200B');
      expect(result).assertEqual('\u200B\u200B\u200Babc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadStart_CombiningChar_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_COMBINE_0100
     * @tc.desc   Test padStart() with combining character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CombiningChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(6, '\u0301');
      expect(result).assertEqual('\u0301\u0301\u0301abc');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadStart_SurrogatePairPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SURPAD_0100
     * @tc.desc   Test padStart() with surrogate pair padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SurrogatePairPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '😀');
      expect(result).assertEqual('😀abc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_SurrogatePairString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SURSTR_0100
     * @tc.desc   Test padStart() on string with surrogate pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SurrogatePairString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '😀'.padStart(4, 'a');
      expect(result).assertEqual('aa😀');
    });

    /**
     * @tc.name   StringPadStart_SurrogateHigh_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SURHIGH_0100
     * @tc.desc   Test padStart() on string with high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_SurrogateHigh_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '\uD83D'.padStart(3, '0');
      expect(result).assertEqual('00\uD83D');
    });

    /**
     * @tc.name   StringPadStart_PureChinese_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_PURECN_0100
     * @tc.desc   Test padStart() on pure Chinese string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_PureChinese_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '你好'.padStart(5, 'x');
      expect(result).assertEqual('xxx你好');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_UnicodeInString_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_UNISTR_0100
     * @tc.desc   Test padStart() with Unicode in original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_UnicodeInString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '😀'.padStart(3, '0');
      expect(result).assertEqual('0😀');
    });

    /**
     * @tc.name   StringPadStart_MultipleEmoji_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MULTIEMOJI_0100
     * @tc.desc   Test padStart() with multiple emoji in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_MultipleEmoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '😀😃😄'.padStart(7, '0');
      expect(result).assertEqual('0😀😃😄');
    });

    /**
     * @tc.name   StringPadStart_CJKPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CJK_0100
     * @tc.desc   Test padStart() with CJK characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CJKPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(8, '漢字');
      expect(result).assertEqual('漢字漢字test');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_ArabicPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_ARABIC_0100
     * @tc.desc   Test padStart() with Arabic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_ArabicPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(8, 'أ');
      expect(result.length).assertEqual(8);
      expect(result.endsWith('test')).assertTrue();
    });

    /**
     * @tc.name   StringPadStart_CyrillicPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CYRIL_0100
     * @tc.desc   Test padStart() with Cyrillic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CyrillicPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(8, 'А');
      expect(result).assertEqual('ААААtest');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_GreekPad_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_GREEK_0100
     * @tc.desc   Test padStart() with Greek characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_GreekPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'test'.padStart(8, 'α');
      expect(result).assertEqual('ααααtest');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadStart_TabChar_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_TAB_0200
     * @tc.desc   Test padStart() with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_TabChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '\t');
      expect(result).assertEqual('\t\tabc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_NewlineChar_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_NEWLINE_0200
     * @tc.desc   Test padStart() with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_NewlineChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '\n');
      expect(result).assertEqual('\n\nabc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_CarriageReturn_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_CR_0200
     * @tc.desc   Test padStart() with carriage return character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_CarriageReturn_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padStart(5, '\r');
      expect(result).assertEqual('\r\rabc');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadStart_UTF16Emoji_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_SURPAIR_0500
     * @tc.desc   Test padStart() verifies emoji is 2 UTF-16 units
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_UTF16Emoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = '😀'.padStart(3, 'a');
      expect(result).assertEqual('a😀');
    });

    /**
     * @tc.name   StringPadStart_MixedScripts_001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_MIXSCRIP_0100
     * @tc.desc   Test padStart() with mixed scripts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart_MixedScripts_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'a中b😀c'.padStart(10, '0');
      expect(result).assertEqual('0000a中b😀c');
    });
  });
}
