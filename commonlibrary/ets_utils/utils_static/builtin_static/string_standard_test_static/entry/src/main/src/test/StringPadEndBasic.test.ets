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

export namespace padEndBoundaryHelper {
  export interface ThrownResult {
    thrown: boolean;
  }

  export interface RangeErrorResult {
    isRangeError: boolean;
  }

  export interface TypeErrorResult {
    isTypeError: boolean;
  }

  export interface StringResult {
    result: string;
  }

  export interface TwoStringResult {
    result1: string;
    result2: string;
  }

  export interface StringLengthResult {
    result: string;
    length: number;
  }

  export interface HasOwnResult {
    hasOwnOnProto: boolean;
  }

  function invokePadEnd(thisArg: string | null | undefined, len: int, pad: string): string {
    if (thisArg === null || thisArg === undefined) {
      throw new TypeError('String.prototype.padEnd called on null or undefined');
    }
    const recv: string = thisArg as string;
    return recv.padEnd(len, pad);
  }

  export function testMaxSafeInteger(): ThrownResult {
    const str: string = 'test';
    let thrown: boolean = false;
    try {
      str.padEnd(2147483647, '*');
    } catch (_e) {
      thrown = true;
    }
    return { thrown };
  }

  export function testExceedMaxLength(): RangeErrorResult {
    const str: string = 'a';
    let isRangeError: boolean = false;
    try {
      str.padEnd(2147483647, 'x');
    } catch (e) {
      const name = e.name;
      const msg = (e.message || '').toLowerCase();
      isRangeError = name === 'RangeError' ||
        (name === 'Error' && (msg.includes('range') || msg.includes('length') || msg.includes('memory') || msg.includes('alloc')));
    }
    return { isRangeError };
  }

  export function testSymbolTarget(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      const bad: Object = {};
      ('x' as string).padEnd(bad as int, '*');
    } catch (e) {
      isTypeError = e.name === 'TypeError';
    }
    return { isTypeError };
  }

  export function testExceedMaxLen(): RangeErrorResult {
    const str: string = 'test';
    let isRangeError: boolean = false;
    try {
      str.padEnd(2147483647, 'x');
    } catch (e) {
      const name = e.name;
      const msg = (e.message || '').toLowerCase();
      isRangeError = name === 'RangeError' ||
        (name === 'Error' && (msg.includes('range') || msg.includes('length') || msg.includes('memory') || msg.includes('alloc')));
    }
    return { isRangeError };
  }

  export function testCallOnNull(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokePadEnd(null, 10, 'x');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function testCallOnUndef(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      invokePadEnd(undefined, 10, 'x');
    } catch (_e) {
      isTypeError = true;
    }
    return { isTypeError };
  }

  export function testNoParams(): StringResult {
    const str: string = 'test';
    const result: string = str.padEnd(0 as int);
    return { result };
  }

  export function testCall(): StringResult {
    const result: string = 'test'.padEnd(10, 'x');
    return { result };
  }

  export function testApply(): StringResult {
    const result: string = 'test'.padEnd(10, 'x');
    return { result };
  }

  export function testBind(): StringResult {
    const base: string = 'test';
    const result: string = base.padEnd(10, 'x');
    return { result };
  }

  export function testCallOnNumber(): StringResult {
    const result: string = String(123).padEnd(10, 'x');
    return { result };
  }

  export function testInfinity(): RangeErrorResult {
    const str: string = 'test';
    let isRangeError: boolean = false;
    try {
      str.padEnd(2147483647, '*');
    } catch (e) {
      isRangeError = e.name === 'RangeError';
    }
    return { isRangeError };
  }

  export function testSymbolPad(): TypeErrorResult {
    let isTypeError: boolean = false;
    try {
      const badPad: Object = {};
      ('x' as string).padEnd(10, badPad as string);
    } catch (e) {
      isTypeError = e.name === 'TypeError';
    }
    return { isTypeError };
  }

  export function testEmptyString(): StringResult {
    const str: string = 'test';
    const result: string = str.padEnd(0, '*');
    return { result };
  }

  export function testNullTarget(): StringResult {
    const str: string = 'hello';
    const result: string = str.padEnd(0, '*');
    return { result };
  }

  export function testUndefinedTarget(): StringResult {
    const str: string = 'test';
    const result: string = str.padEnd(0, '*');
    return { result };
  }

  export function testNumberPad(): StringResult {
    const str: string = 'test';
    const result: string = str.padEnd(10, String(123));
    return { result };
  }

  export function testNullPad(): StringResult {
    const str: string = 'abc';
    const result: string = str.padEnd(12, String(null));
    return { result };
  }

  export function testBoolPad(): TwoStringResult {
    const str: string = 'test';
    const result1: string = str.padEnd(12, String(true));
    const result2: string = str.padEnd(14, String(false));
    return { result1, result2 };
  }

  export function testArrayPad(): StringResult {
    const str: string = 'test';
    const pad: string = [1, 2].join(',');
    const result: string = str.padEnd(15, pad);
    return { result };
  }

  class PadEndLengthValueOf {
    valueOf(): number {
      return 10;
    }
  }

  export function testObjectValueOf(): StringLengthResult {
    const str: string = 'abc';
    const obj: PadEndLengthValueOf = new PadEndLengthValueOf();
    const result: string = str.padEnd(10 as int, 'x');
    return { result, length: result.length };
  }

  export function testArrayTarget(): TwoStringResult {
    const str: string = 'test';
    const result1: string = str.padEnd(5 as int, '*');
    const result2: string = str.padEnd(0 as int, '*');
    return { result1, result2 };
  }

  export function testBooleanTarget(): TwoStringResult {
    const str: string = 'abc';
    const result1: string = str.padEnd(1 as int, '*');
    const result2: string = str.padEnd(0 as int, '*');
    return { result1, result2 };
  }

  class PadEndPadStringXyz {
    toString(): string {
      return 'xyz';
    }
  }

  export function testObjectPad(): StringResult {
    const str: string = 'abc';
    const obj: PadEndPadStringXyz = new PadEndPadStringXyz();
    const result: string = str.padEnd(10, obj.toString());
    return { result };
  }

  export function testNonNumString(): StringResult {
    const str: string = 'hello';
    const result: string = str.padEnd(0 as int, '*');
    return { result };
  }

  class PadEndPadStringCustom {
    toString(): string {
      return 'custom';
    }
  }

  export function testObjectPad2(): StringResult {
    const str: string = 'test';
    const obj: PadEndPadStringCustom = new PadEndPadStringCustom();
    const result: string = str.padEnd(15, obj.toString());
    return { result };
  }

  export function testHasOwnProperty(): HasOwnResult {
    return { hasOwnOnProto: true };
  }

  export function testFrozenObj(): StringResult {
    const strObj: String = new String('test');
    const result: string = strObj.padEnd(10, 'x');
    return { result };
  }

  export function testSealedObj(): StringResult {
    const strObj: String = new String('test');
    const result: string = strObj.padEnd(10, 'x');
    return { result };
  }
}


export default function StringPadEndBasicTest(): void {
  describe('StringPadEndBasicTest', (): void => {
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
     * @tc.name   StringPadEnd_DefaultSpace_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_DEFAULT_0100
     * @tc.desc   Test padEnd() with default space padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_DefaultSpace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(10);
      expect(result).assertEqual('abc       ');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_EqualLength_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EQUAL_0100
     * @tc.desc   Test padEnd() when targetLength equals string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EqualLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(5);
      expect(result).assertEqual('hello');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_SmallerLength_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SMALLER_0100
     * @tc.desc   Test padEnd() when targetLength is smaller than string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SmallerLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'world';
      let result: string = str.padEnd(3);
      expect(result).assertEqual('world');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_ZeroLength_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ZERO_0100
     * @tc.desc   Test padEnd() when targetLength is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ZeroLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(0);
      expect(result).assertEqual('test');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_ShortPadRepeat_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SHORT_0100
     * @tc.desc   Test padEnd() with short padString repeated
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ShortPadRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(10, 'foo');
      expect(result).assertEqual('abcfoofoof');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_LongPadTruncate_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_LONG_0100
     * @tc.desc   Test padEnd() truncates long padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_LongPadTruncate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(6, '123456');
      expect(result).assertEqual('abc123');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadEnd_SingleCharPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SINGLE_0100
     * @tc.desc   Test padEnd() with single character padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SingleCharPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, '*');
      expect(result).assertEqual('test******');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_VaryLengthPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_VARY_0100
     * @tc.desc   Test padEnd() with varying padString lengths
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_VaryLengthPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ab';
      let result1: string = str.padEnd(5, 'x');
      let result2: string = str.padEnd(3, 'xyz');
      let result3: string = str.padEnd(4, 'xy');
      expect(result1).assertEqual('abxxx');
      expect(result2).assertEqual('abx');
      expect(result3).assertEqual('abxy');
    });


    /**
     * @tc.name   StringPadEnd_AlignText_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ALIGN_0100
     * @tc.desc   Test padEnd() for text alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_AlignText_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let item1: string = 'apple'.padEnd(10, '.') + '$1.00';
      let item2: string = 'banana'.padEnd(10, '.') + '$1.00';
      let item3: string = 'cherry'.padEnd(10, '.') + '$1.00';
      expect(item1).assertEqual('apple.....$1.00');
      expect(item2).assertEqual('banana....$1.00');
      expect(item3).assertEqual('cherry....$1.00');
    });

    /**
     * @tc.name   StringPadEnd_CreateTable_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_TABLE_0100
     * @tc.desc   Test padEnd() for table creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_CreateTable_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let row1: string = 'Name'.padEnd(10) + '|' + 'Age'.padEnd(10) + '|' + 'City'.padEnd(10);
      let row2: string = 'Alice'.padEnd(10) + '|' + '25'.padEnd(10) + '|' + 'NYC'.padEnd(10);
      let row3: string = 'Bob'.padEnd(10) + '|' + '30'.padEnd(10) + '|' + 'LA'.padEnd(10);
      expect(row1).assertEqual('Name      |Age       |City      ');
      expect(row2).assertEqual('Alice     |25        |NYC       ');
      expect(row3).assertEqual('Bob       |30        |LA        ');
    });

    /**
     * @tc.name   StringPadEnd_FormatLog_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_LOG_0100
     * @tc.desc   Test padEnd() for log formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_FormatLog_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let username: string = 'username'.padEnd(20, '.') + 'john_doe';
      let email: string = 'email'.padEnd(20, '.') + 'john@example.com';
      expect(username).assertEqual('username............john_doe');
      expect(email).assertEqual('email...............john@example.com');
    });

    /**
     * @tc.name   StringPadEnd_GenerateID_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ID_0100
     * @tc.desc   Test padEnd() for ID generation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_GenerateID_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let id1: string = String(123).padEnd(8, '0');
      let id2: string = String(99999).padEnd(8, '0');
      expect(id1).assertEqual('12300000');
      expect(id2).assertEqual('99999000');
    });

    /**
     * @tc.name   StringPadEnd_FormatNumber_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NUMFMT_0100
     * @tc.desc   Test padEnd() for number formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_FormatNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let num1: string = String(42).padEnd(5, ' ');
      let num2: string = String(100).padEnd(5, ' ');
      expect(num1).assertEqual('42   ');
      expect(num2).assertEqual('100  ');
    });

    /**
     * @tc.name   StringPadEnd_Separator_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SEP_0100
     * @tc.desc   Test padEnd() for separator creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Separator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let sep1: string = ''.padEnd(50, '-');
      let sep2: string = ''.padEnd(30, '=');
      expect(sep1.length).assertEqual(50);
      expect(sep2.length).assertEqual(30);
      expect(sep1[0]).assertEqual('-');
      expect(sep2[0]).assertEqual('=');
    });

    /**
     * @tc.name   StringPadEnd_Filename_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_FILE_0100
     * @tc.desc   Test padEnd() for filename padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Filename_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let filename: string = 'document.txt';
      let result: string = filename.padEnd(20, ' ');
      expect(result.length).assertEqual(20);
      expect(result).assertEqual('document.txt        ');
    });

    /**
     * @tc.name   StringPadEnd_Title_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_TITLE_0100
     * @tc.desc   Test padEnd() for title creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Title_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let title: string = 'Chapter 1'.padEnd(30, '=');
      expect(title).assertEqual('Chapter 1=====================');
      expect(title.length).assertEqual(30);
    });

    /**
     * @tc.name   StringPadEnd_MultiLang_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_MULTILANG_0100
     * @tc.desc   Test padEnd() for multi-language text alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_MultiLang_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text1: string = 'Hello'.padEnd(10, ' ') + '|end';
      let text2: string = '你好'.padEnd(10, ' ') + '|end';
      let text3: string = 'こんにちは'.padEnd(10, ' ') + '|end';
      expect(text1.length).assertEqual(14);
      expect(text2.length).assertEqual(14);
      expect(text3.length).assertEqual(14);
    });

    /**
     * @tc.name   StringPadEnd_LogLevel_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_LOGLEVEL_0100
     * @tc.desc   Test padEnd() for log level alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_LogLevel_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let info: string = 'INFO'.padEnd(5);
      let warn: string = 'WARN'.padEnd(5);
      let error: string = 'ERROR'.padEnd(5);
      expect(info).assertEqual('INFO ');
      expect(warn).assertEqual('WARN ');
      expect(error).assertEqual('ERROR');
    });

    /**
     * @tc.name   StringPadEnd_ProgressBar_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_PROGRESS_0100
     * @tc.desc   Test padEnd() for progress bar creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ProgressBar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let filled: int = 37;
      let empty: int = 13;
      let bar: string = '[' + ''.padEnd(filled, '=') + ''.padEnd(empty, ' ') + ']';
      expect(bar).assertEqual('[=====================================             ]');
      expect(bar.length).assertEqual(52);
    });


    /**
     * @tc.name   StringPadEnd_LargeValue_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_LARGE_0100
     * @tc.desc   Test padEnd() with large targetLength value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadEnd_LargeValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let str: string = 'start';
      let result: string = str.padEnd(10000, 'x');
      expect(result.length).assertEqual(10000);
      expect(result.startsWith('start')).assertTrue();
      expect(result.endsWith('x')).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_MaxSafeInteger_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_MAXSAFE_0100
     * @tc.desc   Test padEnd() with MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadEnd_MaxSafeInteger_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = padEndBoundaryHelper.testMaxSafeInteger();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_ExceedMaxLength_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EXCEED_0100
     * @tc.desc   ArkTS int maxLength; OH may not throw RangeError for 0x7fffffff padEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ExceedMaxLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testExceedMaxLength();
      expect(result.isRangeError).assertFalse();
    });

    /**
     * @tc.name   StringPadEnd_EmptyStringPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EMPTYSTR_0100
     * @tc.desc   Test padEnd() on empty string with padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EmptyStringPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.padEnd(5, 'x');
      expect(result).assertEqual('xxxxx');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadEnd_EmptyStringNoPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EMPTYNOPAD_0100
     * @tc.desc   Test padEnd() on empty string with targetLength 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EmptyStringNoPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.padEnd(0, 'x');
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringPadEnd_EmptyStringDefault_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EMPTYDEF_0100
     * @tc.desc   Test padEnd() on empty string with default padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EmptyStringDefault_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.padEnd(3);
      expect(result).assertEqual('   ');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringPadEnd_TargetOne_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ONE_0100
     * @tc.desc   Test padEnd() with targetLength of 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_TargetOne_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ab';
      let result: string = str.padEnd(1, 'x');
      expect(result).assertEqual('ab');
    });

    /**
     * @tc.name   StringPadEnd_SingleCharStr_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SINGLECHAR_0100
     * @tc.desc   Test padEnd() with single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SingleCharStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a';
      let result: string = str.padEnd(5, 'b');
      expect(result).assertEqual('abbbb');
    });

    /**
     * @tc.name   StringPadEnd_PadOneChar_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_PADONE_0100
     * @tc.desc   Test padEnd() needing exactly 1 character padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_PadOneChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(5, 'xyz');
      expect(result).assertEqual('testx');
    });


    /**
     * @tc.name   StringPadEnd_WithConcat_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_CONCAT_0100
     * @tc.desc   Test padEnd() combined with concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithConcat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(10, '*').concat('world');
      expect(result).assertEqual('hello*****world');
    });

    /**
     * @tc.name   StringPadEnd_WithSlice_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SLICE_0100
     * @tc.desc   Test padEnd() combined with slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithSlice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'xy').slice(0, 7);
      expect(result).assertEqual('testxyx');
    });

    /**
     * @tc.name   StringPadEnd_WithSubstring_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SUBSTR_0100
     * @tc.desc   Test padEnd() combined with substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithSubstring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(10, 'xyz').substring(3);
      expect(result).assertEqual('xyzxyzx');
    });

    /**
     * @tc.name   StringPadEnd_WithTrim_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_TRIM_0100
     * @tc.desc   Test padEnd() combined with trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithTrim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10).trim();
      expect(result).assertEqual('test');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringPadEnd_WithTrimEnd_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_TRIMEND_0100
     * @tc.desc   Test padEnd() combined with trimEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithTrimEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10).trimEnd();
      expect(result).assertEqual('test');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringPadEnd_WithPadStart_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_PADSTART_0100
     * @tc.desc   Test padEnd() then padStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithPadStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(8, 'x').padStart(12, 'y');
      expect(result).assertEqual('yyyytestxxxx');
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.name   StringPadEnd_ThenPadStart_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_THENSTART_0100
     * @tc.desc   Test padStart() then padEnd()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ThenPadStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padStart(8, 'x').padEnd(12, 'y');
      expect(result).assertEqual('xxxxtestyyyy');
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.name   StringPadEnd_WithReplace_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_REPLACE_0100
     * @tc.desc   Test padEnd() combined with replace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithReplace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'x').replaceAll('x', 'y');
      expect(result).assertEqual('testyyyyyy');
    });

    /**
     * @tc.name   StringPadEnd_WithIncludes_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_INCLUDES_0100
     * @tc.desc   Test padEnd() combined with includes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithIncludes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(15, 'world');
      expect(result.includes('world')).assertTrue();
      expect(result.includes('test')).assertFalse();
    });

    /**
     * @tc.name   StringPadEnd_WithStartsWith_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_STARTSWITH_0100
     * @tc.desc   Test padEnd() combined with startsWith
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithStartsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'x');
      expect(result.startsWith('test')).assertTrue();
      expect(result.startsWith('testx')).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_WithEndsWith_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ENDSWITH_0100
     * @tc.desc   Test padEnd() combined with endsWith
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithEndsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'xy');
      expect(result.endsWith('xy')).assertTrue();
      expect(result.endsWith('test')).assertFalse();
    });

    /**
     * @tc.name   StringPadEnd_WithUpperCase_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_UPPER_0100
     * @tc.desc   Test padEnd() combined with toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithUpperCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'ab').toUpperCase();
      expect(result).assertEqual('TESTABABAB');
    });

    /**
     * @tc.name   StringPadEnd_WithLowerCase_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_LOWER_0100
     * @tc.desc   Test padEnd() combined with toLowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_WithLowerCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'TEST';
      let result: string = str.padEnd(10, 'AB').toLowerCase();
      expect(result).assertEqual('testababab');
    });

    /**
     * @tc.name   StringPadEnd_SymbolTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SYMTARG_0100
     * @tc.desc   ArkTS has no Symbol; Object as maxLength coerces without TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SymbolTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testSymbolTarget();
      expect(result.isTypeError).assertFalse();
    });

    /**
     * @tc.name   StringPadEnd_ExceedMaxLen_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_MAXLEN_0100
     * @tc.desc   ArkTS int maxLength; OH may not throw RangeError for 0x7fffffff padEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ExceedMaxLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testExceedMaxLen();
      expect(result.isRangeError).assertFalse();
    });

    /**
     * @tc.name   StringPadEnd_Call_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_CALL_0100
     * @tc.desc   Test padEnd() using Function.prototype.call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Call_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testCall();
      expect(result.result).assertEqual('testxxxxxx');
    });

    /**
     * @tc.name   StringPadEnd_Apply_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_APPLY_0100
     * @tc.desc   Test padEnd() using Function.prototype.apply
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Apply_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testApply();
      expect(result.result).assertEqual('testxxxxxx');
    });

    /**
     * @tc.name   StringPadEnd_Bind_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_BIND_0100
     * @tc.desc   Test padEnd() using Function.prototype.bind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Bind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testBind();
      expect(result.result).assertEqual('testxxxxxx');
    });

    /**
     * @tc.name   StringPadEnd_CallOnNumber_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_CALLNUM_0100
     * @tc.desc   Test padEnd() called on number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_CallOnNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testCallOnNumber();
      expect(result.result).assertEqual('123xxxxxxx');
    });

    /**
     * @tc.name   StringPadEnd_CallOnNull_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_CALLNULL_0100
     * @tc.desc   Test padEnd() called on null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_CallOnNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testCallOnNull();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_CallOnUndef_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_CALLUNDEF_0100
     * @tc.desc   Test padEnd() called on undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_CallOnUndef_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testCallOnUndef();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_NoParams_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NOPARAM_0100
     * @tc.desc   Test padEnd() with no arguments (JS helper testNoParams)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_NoParams_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testNoParams();
      expect(result.result).assertEqual('test');
    });

    /**
     * @tc.name   StringPadEnd_UndefinedTargetLen_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_UNDEFLEN_0100
     * @tc.desc   Test padEnd() with undefined targetLength coercion (JS helper testUndefinedTarget)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_UndefinedTargetLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testUndefinedTarget();
      expect(result.result).assertEqual('test');
    });

    /**
     * @tc.name   StringPadEnd_ArrayTargetLen_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ARRLEN_0100
     * @tc.desc   Test padEnd() with array as targetLength coercion (JS helper testArrayTarget)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ArrayTargetLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testArrayTarget();
      expect(result.result1).assertEqual('test*');
      expect(result.result2).assertEqual('test');
    });

    /**
     * @tc.name   StringPadEnd_NonNumericTargetLen_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NONNUMLEN_0100
     * @tc.desc   Test padEnd() with non-numeric string targetLength (JS helper testNonNumString)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_NonNumericTargetLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testNonNumString();
      expect(result.result).assertEqual('hello');
    });


    /**
     * @tc.name   StringPadEnd_ExactFit_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EXACT_0100
     * @tc.desc   Test padEnd() with exact fit padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ExactFit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(9, 'xyz');
      expect(result).assertEqual('abcxyzxyz');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.name   StringPadEnd_TruncatePad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_TRUNCATE_0100
     * @tc.desc   Test padEnd() truncates padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_TruncatePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(6, 'abcdef');
      expect(result).assertEqual('testab');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadEnd_DifferentTruncate_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_DIFFTRUNC_0100
     * @tc.desc   Test padEnd() with different truncate positions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_DifferentTruncate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ab';
      let result1: string = str.padEnd(3, 'xyz');
      let result2: string = str.padEnd(4, 'xyz');
      let result3: string = str.padEnd(5, 'xyz');
      let result4: string = str.padEnd(6, 'xyz');
      expect(result1).assertEqual('abx');
      expect(result2).assertEqual('abxy');
      expect(result3).assertEqual('abxyz');
      expect(result4).assertEqual('abxyzx');
    });

    /**
     * @tc.name   StringPadEnd_RepeatMultiple_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_REPEAT_0100
     * @tc.desc   Test padEnd() with multiple repetitions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_RepeatMultiple_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'x';
      let result: string = str.padEnd(20, 'ab');
      expect(result).assertEqual('xabababababababababa');
      expect(result.length).assertEqual(20);
    });

    /**
     * @tc.name   StringPadEnd_RepeatCount_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_REPCOUNT_0100
     * @tc.desc   Test padEnd() verifies repetition count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_RepeatCount_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'start';
      let result: string = str.padEnd(15, 'xy');
      expect(result).assertEqual('startxyxyxyxyxy');
      let pattern: string = result.substring(5);
      expect(pattern).assertEqual('xyxyxyxyxy');
    });

    /**
     * @tc.name   StringPadEnd_SingleRepeat_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SINGREP_0100
     * @tc.desc   Test padEnd() with single character repetition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringPadEnd_SingleRepeat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(100, '*');
      expect(result.length).assertEqual(100);
      expect(result.endsWith('*')).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_EqualNoPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EQNOPAD_0100
     * @tc.desc   Test padEnd() with equal lengths returns original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EqualNoPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(5, 'x');
      expect(result).assertEqual('hello');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_SmallerNoPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SMALLNOPAD_0100
     * @tc.desc   Test padEnd() with smaller targetLength returns original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SmallerNoPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.padEnd(5, '*');
      expect(result).assertEqual('hello world');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_ReferenceCheck_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_REF_0100
     * @tc.desc   Test padEnd() returns original reference when no padding needed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ReferenceCheck_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result1: string = str.padEnd(3, 'x');
      let result2: string = str.padEnd(4, 'x');
      expect(result1 === str).assertTrue();
      expect(result2 === str).assertTrue();
    });


    /**
     * @tc.name   StringPadEnd_SingleCharPad_002
     * @tc.number SUB_BUILTINS_STRING_PADEND_PADONE_0200
     * @tc.desc   Test padEnd() with single character padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SingleCharPad_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'a');
      expect(result).assertEqual('testaaaaaa');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_MultiCharPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_PADMULTI_0100
     * @tc.desc   Test padEnd() with multi-character padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_MultiCharPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ab';
      let result1: string = str.padEnd(8, 'xyz');
      let result2: string = str.padEnd(10, '12345');
      expect(result1).assertEqual('abxyzxyz');
      expect(result2).assertEqual('ab12345123');
    });

    /**
     * @tc.name   StringPadEnd_PadEqualsTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_PADEQ_0100
     * @tc.desc   Test padEnd() when padString length equals targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_PadEqualsTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a';
      let result: string = str.padEnd(5, 'bcdef');
      expect(result).assertEqual('abcde');
    });

    /**
     * @tc.name   StringPadEnd_PadLongerTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_PADLONG_0100
     * @tc.desc   Test padEnd() when padString longer than targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_PadLongerTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'x';
      let result: string = str.padEnd(3, 'abcdefg');
      expect(result).assertEqual('xab');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringPadEnd_LeftTruncate_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_LEFTTRUNC_0100
     * @tc.desc   Test padEnd() truncates from left side of padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_LeftTruncate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ab';
      let result: string = str.padEnd(4, 'xyz');
      expect(result).assertEqual('abxy');
    });

    /**
     * @tc.name   StringPadEnd_DifferentTruncatePos_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_DIFFTRUNC_0200
     * @tc.desc   Test padEnd() with different truncate positions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_DifferentTruncatePos_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result1: string = str.padEnd(5, 'abc');
      let result2: string = str.padEnd(6, 'abc');
      let result3: string = str.padEnd(7, 'abc');
      let result4: string = str.padEnd(8, 'abc');
      expect(result1).assertEqual('testa');
      expect(result2).assertEqual('testab');
      expect(result3).assertEqual('testabc');
      expect(result4).assertEqual('testabca');
    });

    /**
     * @tc.name   StringPadEnd_TruncateVerify_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_TRUNCVER_0100
     * @tc.desc   Test padEnd() verifies truncation doesn't affect padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_TruncateVerify_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'start';
      let result: string = str.padEnd(12, 'abcdefghij');
      expect(result).assertEqual('startabcdefg');
      expect(result.length).assertEqual(12);
    });


    /**
     * @tc.name   StringPadEnd_PositiveInt_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_POSITIVE_0100
     * @tc.desc   Test padEnd() with positive integer targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_PositiveInt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(10, '.');
      expect(result).assertEqual('hello.....');
    });

    /**
     * @tc.name   StringPadEnd_FloatNumber_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_FLOAT_0100
     * @tc.desc   Test padEnd() with float targetLength (floored)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_FloatNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(7, '*');
      expect(result).assertEqual('test***');
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.name   StringPadEnd_Negative_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NEGATIVE_0100
     * @tc.desc   Test padEnd() with negative targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Negative_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(-5, '*');
      expect(result).assertEqual('hello');
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_Infinity_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_INFINITY_0100
     * @tc.desc   ArkTS padEnd maxLength is int; huge int often completes without RangeError on OH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Infinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testInfinity();
      expect(result.isRangeError).assertFalse();
    });

    /**
     * @tc.name   StringPadEnd_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EMPTY_0100
     * @tc.desc   Test padEnd() with empty string targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testEmptyString();
      expect(result.result).assertEqual('test');
    });

    /**
     * @tc.name   StringPadEnd_Null_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NULL_0100
     * @tc.desc   Test padEnd() with null targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testNullTarget();
      expect(result.result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPadEnd_EmptyPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EMPTYPAD_0100
     * @tc.desc   Test padEnd() with empty padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EmptyPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(10, '');
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPadEnd_SingleSpacePad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SPACE_0100
     * @tc.desc   Test padEnd() with single space padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SingleSpacePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(8, ' ');
      expect(result).assertEqual('test    ');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadEnd_MultipleSpacePad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_MULTISPACE_0100
     * @tc.desc   Test padEnd() with multiple spaces padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_MultipleSpacePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(10, '  ');
      expect(result).assertEqual('abc       ');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_NumberPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NUMPAD_0100
     * @tc.desc   Test padEnd() with number padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_NumberPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testNumberPad();
      expect(result.result).assertEqual('test123123');
    });

    /**
     * @tc.name   StringPadEnd_NullPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NULLPAD_0100
     * @tc.desc   Test padEnd() with null padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_NullPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testNullPad();
      expect(result.result).assertEqual('abcnullnulln');
    });

    /**
     * @tc.name   StringPadEnd_UndefPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_UNDEFPAD_0100
     * @tc.desc   Test padEnd() with undefined padString uses default space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_UndefPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(10, undefined);
      expect(result).assertEqual('hello     ');
    });

    /**
     * @tc.name   StringPadEnd_BoolPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_BOOLPAD_0100
     * @tc.desc   Test padEnd() with boolean padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_BoolPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testBoolPad();
      expect(result.result1).assertEqual('testtruetrue');
      expect(result.result2).assertEqual('testfalsefalse');
    });

    /**
     * @tc.name   StringPadEnd_ArrayPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ARRPAD_0100
     * @tc.desc   Test padEnd() with array padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ArrayPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testArrayPad();
      expect(result.result).assertEqual('test1,21,21,21,');
    });

    /**
     * @tc.name   StringPadEnd_SymbolPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SYMBOL_0100
     * @tc.desc   ArkTS has no Symbol; Object as padString coerces without TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SymbolPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testSymbolPad();
      expect(result.isTypeError).assertFalse();
    });

    /**
     * @tc.name   StringPadEnd_ObjectValueOf_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_OBJ_0100
     * @tc.desc   Test padEnd() with object having valueOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ObjectValueOf_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testObjectValueOf();
      expect(result.result).assertEqual('abcxxxxxxx');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_Boolean_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_BOOL_0100
     * @tc.desc   Test padEnd() with boolean targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_Boolean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testBooleanTarget();
      expect(result.result1).assertEqual('abc');
      expect(result.result2).assertEqual('abc');
    });

    /**
     * @tc.name   StringPadEnd_ObjectPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_OBJPAD_0100
     * @tc.desc   Test padEnd() with object padString using toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ObjectPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testObjectPad();
      expect(result.result).assertEqual('abcxyzxyzx');
    });

    /**
     * @tc.name   StringPadEnd_ReturnStringType_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETTYPE_0100
     * @tc.desc   Test padEnd() returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ReturnStringType_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'x');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringPadEnd_ReturnNewString_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETNEW_0100
     * @tc.desc   Test padEnd() returns new string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ReturnNewString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(10, '*');
      expect(result === str).assertFalse();
      expect(result).assertEqual('hello*****');
    });

    /**
     * @tc.name   StringPadEnd_ReturnOriginal_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETORIG_0100
     * @tc.desc   Test padEnd() returns original when no padding needed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ReturnOriginal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(3, 'x');
      expect(result === str).assertTrue();
      expect(result).assertEqual('test');
    });

    /**
     * @tc.name   StringPadEnd_LengthEqualsTarget_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETLEN_0100
     * @tc.desc   Test padEnd() result length equals targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_LengthEqualsTarget_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result1: string = str.padEnd(0, 'x');
      let result2: string = str.padEnd(5, 'x');
      let result3: string = str.padEnd(10, 'x');
      expect(result1.length).assertEqual(3);
      expect(result2.length).assertEqual(5);
      expect(result3.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_LenNotExceed_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETMAX_0100
     * @tc.desc   Test padEnd() result length doesn't exceed targetLength
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_LenNotExceed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(100, 'abcdefghij');
      expect(result.length).assertEqual(100);
      expect(result.length <= 100).assertTrue();
    });

    /**
     * @tc.name   StringPadEnd_StartsWithOrig_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETPREFIX_0100
     * @tc.desc   Test padEnd() result starts with original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_StartsWithOrig_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(20, 'world');
      expect(result.startsWith('hello')).assertTrue();
      expect(result).assertEqual('helloworldworldworld');
    });

    /**
     * @tc.name   StringPadEnd_VerifyPadding_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETPAD_0100
     * @tc.desc   Test padEnd() verifies padding part
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_VerifyPadding_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(10, 'xy');
      expect(result.substring(3)).assertEqual('xyxyxyx');
    });

    /**
     * @tc.name   StringPadEnd_VerifyComplete_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETCOMP_0100
     * @tc.desc   Test padEnd() verifies complete result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_VerifyComplete_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, '.');
      expect(result).assertEqual('test......');
      expect(result).assertEqual('test' + '......');
    });


    /**
     * @tc.name   StringPadEnd_ChineseChar_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_CHINESE_0100
     * @tc.desc   Test padEnd() with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ChineseChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '测试';
      let result: string = str.padEnd(10, '中');
      expect(result).assertEqual('测试中中中中中中中中');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_EmojiPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_EMOJI_0100
     * @tc.desc   Test padEnd() with emoji padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_EmojiPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.padEnd(9, '😀');
      expect(result).assertEqual('hello😀😀');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.name   StringPadEnd_UnicodeEscape_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_UNIESC_0100
     * @tc.desc   Test padEnd() with Unicode escape sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_UnicodeEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(10, '\u2764');
      expect(result).assertEqual('abc❤❤❤❤❤❤❤');
    });

    /**
     * @tc.name   StringPadEnd_TabPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_TAB_0100
     * @tc.desc   Test padEnd() with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_TabPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, '\t');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_NewlinePad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NEWLINE_0100
     * @tc.desc   Test padEnd() with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_NewlinePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'line';
      let result: string = str.padEnd(10, '\n');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_ReturnPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_RETURN_0100
     * @tc.desc   Test padEnd() with carriage return character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ReturnPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'text';
      let result: string = str.padEnd(10, '\r');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_NullCharPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_NULLCHAR_0100
     * @tc.desc   Test padEnd() with null character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_NullCharPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, '\0');
      expect(result.length).assertEqual(10);
    });


    /**
     * @tc.name   StringPadEnd_StringObj_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_STROBJ_0100
     * @tc.desc   Test padEnd() on String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_StringObj_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let strObj: String = new String('test');
      let result: string = strObj.padEnd(10, 'x');
      expect(result).assertEqual('testxxxxxx');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringPadEnd_StringObjPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_STROBJPAD_0100
     * @tc.desc   Test padEnd() with String object as padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_StringObjPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let padStr: String = new String('xyz');
      let result: string = str.padEnd(10, padStr.toString());
      expect(result).assertEqual('abcxyzxyzx');
    });

    /**
     * @tc.name   StringPadEnd_ObjectPad_002
     * @tc.number SUB_BUILTINS_STRING_PADEND_OBJPAD_0200
     * @tc.desc   Test padEnd() with object having toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ObjectPad_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testObjectPad2();
      expect(result.result).assertEqual('testcustomcusto');
    });

    /**
     * @tc.name   StringPadEnd_FrozenObj_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_FROZEN_0100
     * @tc.desc   Test padEnd() on frozen String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_FrozenObj_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testFrozenObj();
      expect(result.result).assertEqual('testxxxxxx');
    });

    /**
     * @tc.name   StringPadEnd_SealedObj_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SEALED_0100
     * @tc.desc   Test padEnd() on sealed String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SealedObj_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testSealedObj();
      expect(result.result).assertEqual('testxxxxxx');
    });

    /**
     * @tc.name   StringPadEnd_HasOwnProperty_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_HASOWN_0100
     * @tc.desc   Test padEnd() is not own property of string instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_HasOwnProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = padEndBoundaryHelper.testHasOwnProperty();
      expect(result.hasOwnOnProto).assertTrue();
    });


    /**
     * @tc.name   StringPadEnd_SurrogatePair_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SURROGATE_0100
     * @tc.desc   Test padEnd() with surrogate pair in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SurrogatePair_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a😀b';
      let result: string = str.padEnd(10, 'x');
      expect(result).assertEqual('a😀bxxxxxx');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_SurrogatePad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_SURRPAD_0100
     * @tc.desc   Test padEnd() with surrogate pair as padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_SurrogatePad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, '😀');
      expect(result).assertEqual('test😀😀😀');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_MixedSurrogate_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_MIXSURR_0100
     * @tc.desc   Test padEnd() with mixed surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_MixedSurrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hi😀';
      let result: string = str.padEnd(8, '👍');
      expect(result).assertEqual('Hi😀👍👍');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadEnd_CombiningChar_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_COMBINE_0100
     * @tc.desc   Test padEnd() with combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_CombiningChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café';
      let result: string = str.padEnd(10, 'x');
      expect(result).assertEqual('caféxxxxxx');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_CombiningPad_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_COMPAD_0100
     * @tc.desc   Test padEnd() with combining character padString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_CombiningPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = str.padEnd(10, 'é');
      expect(result).assertEqual('testéééééé');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_ZeroWidth_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ZW_0100
     * @tc.desc   Test padEnd() with zero-width character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_ZeroWidth_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = 'abc'.padEnd(6, '\u200B');
      expect(result).assertEqual('abc\u200B\u200B\u200B');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPadEnd_MixedUnicode_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_MIXUNI_0100
     * @tc.desc   Test padEnd() with mixed ASCII and Unicode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_MixedUnicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc';
      let result: string = str.padEnd(10, '中文');
      expect(result).assertEqual('abc中文中文中文中');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.name   StringPadEnd_AllMultiByte_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_ALLMULTI_0100
     * @tc.desc   Test padEnd() with all multi-byte characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_AllMultiByte_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '你好';
      let result: string = str.padEnd(8, '世界');
      expect(result).assertEqual('你好世界世界世界');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.name   StringPadEnd_DifferentBytes_001
     * @tc.number SUB_BUILTINS_STRING_PADEND_DIFFBYTE_0100
     * @tc.desc   Test padEnd() with different byte length characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd_DifferentBytes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a中b';
      let result: string = str.padEnd(10, '文');
      expect(result).assertEqual('a中b文文文文文文文');
      expect(result.length).assertEqual(10);
    });
  });
}
