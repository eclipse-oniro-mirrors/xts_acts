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

class TestObj {
}

export default function StringBasicTest():void {
  describe('StringBasicTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })

    beforeEach(async () => {
      await Utils.msSleep(20)
      // Presets an action, which is performed before each unit test case starts.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })


    /**
     * @tc.name   StringLength001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_0100
     * @tc.desc   String length returns UTF-16 code units
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength002
     * @tc.number SUB_BUILTINS_STRING_LENGTH_0200
     * @tc.desc   Chinese string length in UTF-16
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '你好';
      expect(str.length).assertEqual(2); // Each Chinese char = 1 UTF-16 code unit
    });

    /**
     * @tc.name   StringLength003
     * @tc.number SUB_BUILTINS_STRING_LENGTH_0300
     * @tc.desc   Emoji string length (surrogate pairs)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringLength003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '😀'; // One emoji
      expect(str.length).assertEqual(2); // Surrogate pair = 2 code units
    });

    /**
     * @tc.name   StringLength004
     * @tc.number SUB_BUILTINS_STRING_LENGTH_0400
     * @tc.desc   Mixed ASCII, Chinese, and emoji string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringLength004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'Hi你好😀';
      expect(str.length).assertEqual(6); // 2 + 2 + 2
    });

    /**
     * @tc.name   StringCompareEqual001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_EQUAL_0100
     * @tc.desc   String equality with === operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareEqual001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'hello';
      let str2: string = 'hello';
      let result: boolean = str1 === str2;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringCompareEqual002
     * @tc.number SUB_BUILTINS_STRING_COMPARE_EQUAL_0200
     * @tc.desc   String inequality with === operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareEqual002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'hello';
      let str2: string = 'world';
      let result: boolean = str1 === str2;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringCompareCaseSensitive001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_CASE_0100
     * @tc.desc   Case-sensitive string comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareCaseSensitive001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'Hello';
      let str2: string = 'hello';
      let result: boolean = str1 === str2;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringCompareLessThan001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_LESS_0100
     * @tc.desc   String less than comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareLessThan001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'apple';
      let str2: string = 'banana';
      let result: boolean = str1 < str2;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringCompareGreaterThan001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_GREATER_0100
     * @tc.desc   String greater than comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareGreaterThan001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'banana';
      let str2: string = 'apple';
      let result: boolean = str1 > str2;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringCompareUnicode001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_UNICODE_0100
     * @tc.desc   Unicode code point comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCompareUnicode001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str1: string = 'A';
      let str2: string = 'a';
      expect(str1 < str2).assertEqual(true); // 'A' (65) < 'a' (97)
    });

    /**
     * @tc.name   StringCompareChinese001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_CHINESE_0100
     * @tc.desc   Chinese character comparison by code point
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCompareChinese001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str1: string = '一';
      let str2: string = '二';
      expect(str1 < str2).assertEqual(true);
    });

    /**
     * @tc.name   StringLocaleCompare001
     * @tc.number SUB_BUILTINS_STRING_LOCALE_COMPARE_0100
     * @tc.desc   Basic localeCompare usage
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringLocaleCompare001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str1: string = 'apple';
      let str2: string = 'banana';
      let result: number = str1.localeCompare(str2);
      expect(result).assertLess(0);
    });

    /**
     * @tc.name   StringLocaleCompare002
     * @tc.number SUB_BUILTINS_STRING_LOCALE_COMPARE_0200
     * @tc.desc   localeCompare with equal strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringLocaleCompare002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str1: string = 'hello';
      let str2: string = 'hello';
      let result: number = str1.localeCompare(str2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare003
     * @tc.number SUB_BUILTINS_STRING_LOCALE_COMPARE_0300
     * @tc.desc   localeCompare with greater string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringLocaleCompare003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str1: string = 'banana';
      let str2: string = 'apple';
      let result: number = str1.localeCompare(str2);
      expect(result).assertLarger(0);
    });

    /**
     * @tc.name   StringNormalize001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_0100
     * @tc.desc   NFC normalization form
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringNormalize001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'café';
      let normalized: string = str.normalize('NFC');
      expect(normalized.length).assertLarger(0);
    });

    /**
     * @tc.name   StringNormalize002
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_0200
     * @tc.desc   NFD normalization form
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringNormalize002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'café';
      let normalized: string = str.normalize('NFD');
      expect(normalized.length).assertLarger(0);
    });

    /**
     * @tc.name   StringNormalize003
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_0300
     * @tc.desc   NFKC normalization form
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringNormalize003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'café';
      let normalized: string = str.normalize('NFKC');
      expect(normalized.length).assertLarger(0);
    });

    /**
     * @tc.name   StringNormalize004
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_0400
     * @tc.desc   NFKD normalization form
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringNormalize004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'café';
      let normalized: string = str.normalize('NFKD');
      expect(normalized.length).assertLarger(0);
    });

    /**
     * @tc.name   StringCompareEmpty001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_EMPTY_0100
     * @tc.desc   Empty string comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareEmpty001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = '';
      let str2: string = '';
      let result: boolean = str1 === str2;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringCompareEmpty002
     * @tc.number SUB_BUILTINS_STRING_COMPARE_EMPTY_0200
     * @tc.desc   Empty string vs non-empty comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareEmpty002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = '';
      let str2: string = 'a';
      let result: boolean = str1 === str2;
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringCompareLength001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_LENGTH_0100
     * @tc.desc   String comparison by length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareLength001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'abc';
      let str2: string = 'abcdef';
      expect(str1.length < str2.length).assertEqual(true);
    });

    /**
     * @tc.name   StringCompareMixed001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_MIXED_0100
     * @tc.desc   Mixed ASCII and Chinese comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCompareMixed001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str1: string = 'a';
      let str2: string = '中';
      expect(str1 < str2).assertEqual(true); // ASCII comes before Chinese in Unicode
    });

    /**
     * @tc.name   StringCompareNumberInString001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_NUM_STR_0100
     * @tc.desc   String comparison with numeric characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareNumberInString001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = '123';
      let str2: string = '456';
      expect(str1 < str2).assertEqual(true);
    });

    /**
     * @tc.name   StringCompareAlphanumeric001
     * @tc.number SUB_BUILTINS_STRING_COMPARE_ALPHANUM_0100
     * @tc.desc   Alphanumeric string comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCompareAlphanumeric001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'abc123';
      let str2: string = 'abc124';
      expect(str1 < str2).assertEqual(true);
    });


    /**
     * @tc.name   StringEmpty001
     * @tc.number SUB_BUILTINS_STRING_EMPTY_0100
     * @tc.desc   Empty string with single quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEmpty001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      expect(str.length).assertEqual(0);
      expect(str).assertEqual('');
    });

    /**
     * @tc.name   StringEmpty002
     * @tc.number SUB_BUILTINS_STRING_EMPTY_0200
     * @tc.desc   Empty string with double quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEmpty002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      expect(str.length).assertEqual(0);
      expect(str).assertEqual("");
    });

    /**
     * @tc.name   StringEmpty003
     * @tc.number SUB_BUILTINS_STRING_EMPTY_0300
     * @tc.desc   Empty template literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEmpty003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = ``;
      expect(str.length).assertEqual(0);
      expect(str).assertEqual(``);
    });

    /**
     * @tc.name   StringImmutability001
     * @tc.number SUB_BUILTINS_STRING_IMMUTABILITY_0100
     * @tc.desc   String character cannot be modified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringImmutability001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'hello';
      // In ArkTS, string index access is not allowed
      // This tests that strings are immutable
      let newStr: string = str.replace('h', 'H');
      expect(str).assertEqual('hello'); // Original unchanged
      expect(newStr).assertEqual('Hello');
    });

    /**
     * @tc.name   StringImmutability002
     * @tc.number SUB_BUILTINS_STRING_IMMUTABILITY_0200
     * @tc.desc   String methods return new strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringImmutability002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'hello';
      let upper: string = str.toUpperCase();
      expect(str).assertEqual('hello'); // Original unchanged
      expect(upper).assertEqual('HELLO');
    });

    /**
     * @tc.name   StringConcatImmutability001
     * @tc.number SUB_BUILTINS_STRING_IMMUTABILITY_0300
     * @tc.desc   String concatenation creates new string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringConcatImmutability001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str1: string = 'hello';
      let str2: string = str1 + ' world';
      expect(str1).assertEqual('hello'); // Original unchanged
      expect(str2).assertEqual('hello world');
    });

    /**
     * @tc.name   StringTypeConversion001
     * @tc.number SUB_BUILTINS_STRING_CONVERSION_0100
     * @tc.desc   Convert undefined to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTypeConversion001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String(undefined);
      expect(result).assertEqual('undefined');
    });

    /**
     * @tc.name   StringTypeConversion002
     * @tc.number SUB_BUILTINS_STRING_CONVERSION_0200
     * @tc.desc   Convert null to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTypeConversion002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.name   StringTypeConversion003
     * @tc.number SUB_BUILTINS_STRING_CONVERSION_0300
     * @tc.desc   Convert boolean to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTypeConversion003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let t: string = String(true);
      let f: string = String(false);
      expect(t).assertEqual('true');
      expect(f).assertEqual('false');
    });

    /**
     * @tc.name   StringTypeConversion004
     * @tc.number SUB_BUILTINS_STRING_CONVERSION_0400
     * @tc.desc   Convert number to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTypeConversion004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let num: string = String(123);
      let nan: string = String(NaN);
      let inf: string = String(Infinity);
      expect(num).assertEqual('123');
      expect(nan).assertEqual('NaN');
      expect(inf).assertEqual('Infinity');
    });

    /**
     * @tc.name   StringTypeConversion005
     * @tc.number SUB_BUILTINS_STRING_CONVERSION_0500
     * @tc.desc   Convert array to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTypeConversion005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let arr: number[] = [1, 2, 3];
      let result: string = String(arr);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.name   StringTypeConversion006
     * @tc.number SUB_BUILTINS_STRING_CONVERSION_0600
     * @tc.desc   Convert empty array to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTypeConversion006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let arr: number[] = [];
      let result: string = String(arr);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringTypeConversion007
     * @tc.number SUB_BUILTINS_STRING_CONVERSION_0700
     * @tc.desc   Convert object to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTypeConversion007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj: Object = new TestObj();
      let result: string = String(obj);
      expect(result).assertEqual('[object Object]');
    });

    /**
     * @tc.name   StringConcatWithTypes001
     * @tc.number SUB_BUILTINS_STRING_CONCAT_TYPES_0100
     * @tc.desc   String concatenation with number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcatWithTypes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Value: ' + 42;
      expect(str).assertEqual('Value: 42');
    });

    /**
     * @tc.name   StringConcatWithTypes002
     * @tc.number SUB_BUILTINS_STRING_CONCAT_TYPES_0200
     * @tc.desc   String concatenation with boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcatWithTypes002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Result: ' + true;
      expect(str).assertEqual('Result: true');
    });

    /**
     * @tc.name   StringConcatWithTypes003
     * @tc.number SUB_BUILTINS_STRING_CONCAT_TYPES_0300
     * @tc.desc   String concatenation with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcatWithTypes003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Value: ' + null;
      expect(str).assertEqual('Value: null');
    });

    /**
     * @tc.name   StringTemplateExpression001
     * @tc.number SUB_BUILTINS_STRING_TEMPLATE_EXPR_0100
     * @tc.desc   Template literal with number expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTemplateExpression001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let a: number = 10;
      let b: number = 20;
      let str: string = `Sum: ${a + b}`;
      expect(str).assertEqual('Sum: 30');
    });

    /**
     * @tc.name   StringTemplateExpression002
     * @tc.number SUB_BUILTINS_STRING_TEMPLATE_EXPR_0200
     * @tc.desc   Template literal with function call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringTemplateExpression002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const getName: () => string = (): string => {
        return 'ArkTS';
      };
      let str: string = `Language: ${getName()}`;
      expect(str).assertEqual('Language: ArkTS');
    });

    /**
     * @tc.name   StringTemplateExpression003
     * @tc.number SUB_BUILTINS_STRING_TEMPLATE_EXPR_0300
     * @tc.desc   Template literal with multiple expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringTemplateExpression003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let x: number = 10;
      let y: number = 20;
      let str: string = `${x} + ${y} = ${x + y}`;
      expect(str).assertEqual('10 + 20 = 30');
    });


    /**
     * @tc.name   StringEscapeQuote001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_QUOTE_0100
     * @tc.desc   Escaped single quote in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeQuote001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'It\'s a test';
      expect(str.length).assertEqual(11);
      expect(str.charAt(2)+"").assertEqual('\'');
    });

    /**
     * @tc.name   StringEscapeQuote002
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_QUOTE_0200
     * @tc.desc   Escaped double quote in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeQuote002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Say \"hello\"";
      expect(str.charAt(4).toString()).assertEqual('"');
    });

    /**
     * @tc.name   StringEscapeBackslash001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_BACKSLASH_0100
     * @tc.desc   Escaped backslash in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeBackslash001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'path\\to\\file';
      expect(str).assertEqual('path\\to\\file');
    });

    /**
     * @tc.name   StringEscapeNewline001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_NEWLINE_0100
     * @tc.desc   Escaped newline character \n
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeNewline001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'line1\nline2';
      expect(str.length).assertEqual(11);
      expect(str.indexOf('\n')).assertEqual(5);
    });

    /**
     * @tc.name   StringEscapeCarriageReturn001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_CR_0100
     * @tc.desc   Escaped carriage return character \r
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeCarriageReturn001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'text\rmore';
      expect(str.indexOf('\r')).assertEqual(4);
    });

    /**
     * @tc.name   StringEscapeTab001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_TAB_0100
     * @tc.desc   Escaped tab character \t
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeTab001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'col1\tcol2';
      expect(str.indexOf('\t')).assertEqual(4);
    });

    /**
     * @tc.name   StringEscapeNull001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_NULL_0100
     * @tc.desc   Escaped null character \0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeNull001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'before\0after';
      expect(str.length).assertLarger(6);
    });

    /**
     * @tc.name   StringEscapeBackspace001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_BACKSPACE_0100
     * @tc.desc   Escaped backspace character \b
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeBackspace001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc\bdef';
      expect(str.indexOf('\b')).assertEqual(3);
    });

    /**
     * @tc.name   StringEscapeFormFeed001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_FORMFEED_0100
     * @tc.desc   Escaped form feed character \f
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeFormFeed001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'page1\fpage2';
      expect(str.indexOf('\f')).assertEqual(5);
    });

    /**
     * @tc.name   StringEscapeVerticalTab001
     * @tc.number SUB_BUILTINS_STRING_ESCAPE_VERTICALTAB_0100
     * @tc.desc   Escaped vertical tab character \v
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEscapeVerticalTab001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'line1\vline2';
      expect(str.indexOf('\v')).assertEqual(5);
    });

    /**
     * @tc.name   StringHexEscape001
     * @tc.number SUB_BUILTINS_STRING_HEX_ESCAPE_0100
     * @tc.desc   Hexadecimal escape sequence \xHH for Latin-1 characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringHexEscape001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\x41'; // 'A' in hex
      expect(str).assertEqual('A');
    });

    /**
     * @tc.name   StringHexEscape002
     * @tc.number SUB_BUILTINS_STRING_HEX_ESCAPE_0200
     * @tc.desc   Hexadecimal escape for special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringHexEscape002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\x0A'; // newline in hex
      expect(str.charCodeAt(0)).assertEqual(10);
    });

    /**
     * @tc.name   StringUnicodeEscape001
     * @tc.number SUB_BUILTINS_STRING_UNICODE_ESCAPE_0100
     * @tc.desc   Unicode escape sequence \uXXXX for BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringUnicodeEscape001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u0041'; // 'A' in Unicode
      expect(str).assertEqual('A');
    });

    /**
     * @tc.name   StringUnicodeEscape002
     * @tc.number SUB_BUILTINS_STRING_UNICODE_ESCAPE_0200
     * @tc.desc   Unicode escape for Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringUnicodeEscape002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u4E2D\u6587'; // '中文' in Unicode
      expect(str).assertEqual('中文');
    });

    /**
     * @tc.name   StringUnicodeEscape003
     * @tc.number SUB_BUILTINS_STRING_UNICODE_ESCAPE_0300
     * @tc.desc   Unicode escape with brace notation \u{XXXXXX} for supplementary planes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringUnicodeEscape003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u{1F600}'; // 😀 emoji
      expect(str.length).assertLarger(1); // Surrogate pair
    });

    /**
     * @tc.name   StringUnicodeEscape004
     * @tc.number SUB_BUILTINS_STRING_UNICODE_ESCAPE_0400
     * @tc.desc   Unicode escape for emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringUnicodeEscape004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u{1F603}'; // 😃 emoji
      expect(str.charCodeAt(0)).assertLarger(0xD800); // High surrogate
    });


    /**
     * @tc.name   StringSingleQuotes001
     * @tc.number SUB_BUILTINS_STRING_SINGLE_QUOTES_0100
     * @tc.desc   Basic usage of single quotes string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSingleQuotes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      expect(str).assertEqual('hello world');
    });

    /**
     * @tc.name   StringSingleQuotes002
     * @tc.number SUB_BUILTINS_STRING_SINGLE_QUOTES_0200
     * @tc.desc   Single quotes string containing double quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSingleQuotes002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'He said "hello"';
      expect(str).assertEqual('He said "hello"');
    });

    /**
     * @tc.name   StringSingleQuotes003
     * @tc.number SUB_BUILTINS_STRING_SINGLE_QUOTES_0300
     * @tc.desc   Single quotes string with escaped single quote
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSingleQuotes003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'It\'s a beautiful day';
      expect(str).assertEqual('It\'s a beautiful day');
    });

    /**
     * @tc.name   StringSingleQuotes004
     * @tc.number SUB_BUILTINS_STRING_SINGLE_QUOTES_0400
     * @tc.desc   Empty string with single quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSingleQuotes004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      expect(str.length).assertEqual(0);
    });

    /**
     * @tc.name   StringDoubleQuotes001
     * @tc.number SUB_BUILTINS_STRING_DOUBLE_QUOTES_0100
     * @tc.desc   Basic usage of double quotes string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringDoubleQuotes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      expect(str).assertEqual("hello world");
    });

    /**
     * @tc.name   StringDoubleQuotes002
     * @tc.number SUB_BUILTINS_STRING_DOUBLE_QUOTES_0200
     * @tc.desc   Double quotes string containing single quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringDoubleQuotes002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "It's a beautiful day";
      expect(str).assertEqual("It's a beautiful day");
    });

    /**
     * @tc.name   StringDoubleQuotes003
     * @tc.number SUB_BUILTINS_STRING_DOUBLE_QUOTES_0300
     * @tc.desc   Double quotes string with escaped double quote
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringDoubleQuotes003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "He said \"hello\"";
      expect(str).assertEqual("He said \"hello\"");
    });

    /**
     * @tc.name   StringDoubleQuotes004
     * @tc.number SUB_BUILTINS_STRING_DOUBLE_QUOTES_0400
     * @tc.desc   Empty string with double quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringDoubleQuotes004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      expect(str.length).assertEqual(0);
    });


    /**
     * @tc.name   StringTemplateLiterals001
     * @tc.number SUB_BUILTINS_STRING_TEMPLATE_0100
     * @tc.desc   Basic usage of template literals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTemplateLiterals001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let name: string = 'world';
      let str: string = `hello ${name}`;
      expect(str).assertEqual('hello world');
    });

    /**
     * @tc.name   StringTemplateLiterals002
     * @tc.number SUB_BUILTINS_STRING_TEMPLATE_0200
     * @tc.desc   Template literals with expression interpolation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTemplateLiterals002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let a: number = 10;
      let b: number = 20;
      let str: string = `The sum is ${a + b}`;
      expect(str).assertEqual('The sum is 30');
    });

    /**
     * @tc.name   StringTemplateLiterals003
     * @tc.number SUB_BUILTINS_STRING_TEMPLATE_0300
     * @tc.desc   Template literals with nested quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTemplateLiterals003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = `He said "It's beautiful"`;
      expect(str).assertEqual('He said "It\'s beautiful"');
    });

    /**
     * @tc.name   StringTemplateLiterals004
     * @tc.number SUB_BUILTINS_STRING_TEMPLATE_0400
     * @tc.desc   Empty template literals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTemplateLiterals004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = ``;
      expect(str.length).assertEqual(0);
    });

    /**
     * @tc.name   StringConcatenation001
     * @tc.number SUB_BUILTINS_STRING_CONCAT_0100
     * @tc.desc   String concatenation with + operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcatenation001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'Hello';
      let str2: string = 'World';
      let result: string = str1 + ' ' + str2;
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringConcatenation002
     * @tc.number SUB_BUILTINS_STRING_CONCAT_0200
     * @tc.desc   String concatenation with += operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcatenation002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello';
      str += ' World';
      expect(str).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringConcatenation003
     * @tc.number SUB_BUILTINS_STRING_CONCAT_0300
     * @tc.desc   Mixed quote type concatenation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcatenation003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'Hello';
      let str2: string = "World";
      let result: string = str1 + ' ' + str2;
      expect(result).assertEqual('Hello World');
    });


    /**
     * @tc.name   StringCharAt001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_0100
     * @tc.desc   Get character at index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let ch: string = str.charAt(1).toString();
      expect(ch).assertEqual('e');
    });

    /**
     * @tc.name   StringCharAt002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_0200
     * @tc.desc   Get character at first index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let ch: string = str.charAt(0).toString();
      expect(ch).assertEqual('h');
    });

    /**
     * @tc.name   StringCharAt003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_0300
     * @tc.desc   Get character at last index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let ch: string = str.charAt(4).toString();
      expect(ch).assertEqual('o');
    });

    /**
     * @tc.name   StringCharCodeAt001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_0100
     * @tc.desc   Get character code at index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let code: number = str.charCodeAt(0);
      expect(code).assertEqual(104); // 'h' = 104
    });

    /**
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_0200
     * @tc.desc   charCodeAt for Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharCodeAt002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '中';
      let code: number = str.charCodeAt(0);
      expect(code).assertEqual(0x4E2D);
    });

    /**
     * @tc.name   StringConcat001
     * @tc.number SUB_BUILTINS_STRING_CONCAT_METHOD_0100
     * @tc.desc   String concat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcat001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'Hello';
      let str2: string = 'World';
      let result: string = str1.concat(' ', str2);
      expect(result).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringConcat002
     * @tc.number SUB_BUILTINS_STRING_CONCAT_METHOD_0200
     * @tc.desc   Concat multiple strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringConcat002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a'.concat('b', 'c', 'd');
      expect(str).assertEqual('abcd');
    });

    /**
     * @tc.name   StringIncludes001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_0100
     * @tc.desc   Check if string includes substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: boolean = str.includes('world');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_0200
     * @tc.desc   Check if string includes non-existent substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: boolean = str.includes('goodbye');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIndexOf001
     * @tc.number SUB_BUILTINS_STRING_INDEXOF_0100
     * @tc.desc   Find index of substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIndexOf001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let index: number = str.indexOf('world');
      expect(index).assertEqual(6);
    });

    /**
     * @tc.name   StringIndexOf002
     * @tc.number SUB_BUILTINS_STRING_INDEXOF_0200
     * @tc.desc   Find index of non-existent substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIndexOf002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let index: number = str.indexOf('xyz');
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.name   StringSlice001
     * @tc.number SUB_BUILTINS_STRING_SLICE_0100
     * @tc.desc   Slice string with start and end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.slice(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringSlice002
     * @tc.number SUB_BUILTINS_STRING_SLICE_0200
     * @tc.desc   Slice with negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringSlice002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'hello world';
      let result: string = str.slice(-6);
      expect(result).assertEqual(' world');
    });

    /**
     * @tc.name   StringSubstr001
     * @tc.number SUB_BUILTINS_STRING_SUBSTR_0100
     * @tc.desc   Substr with start and length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSubstr001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.substr(6, 5);
      expect(result).assertEqual('world');
    });

    /**
     * @tc.name   StringSubstring001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_0100
     * @tc.desc   Substring with start and end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSubstring001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.substring(6, 11);
      expect(result).assertEqual('world');
    });

    /**
     * @tc.name   StringToLower001
     * @tc.number SUB_BUILTINS_STRING_TOLOWER_0100
     * @tc.desc   Convert string to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLower001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'HELLO WORLD';
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   StringToUpper001
     * @tc.number SUB_BUILTINS_STRING_TOUPPER_0100
     * @tc.desc   Convert string to uppercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpper001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringTrim001
     * @tc.number SUB_BUILTINS_STRING_TRIM_0100
     * @tc.desc   Trim whitespace from both ends
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTrim001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '  hello  ';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringTrimStart001
     * @tc.number SUB_BUILTINS_STRING_TRIMSTART_0100
     * @tc.desc   Trim whitespace from start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTrimStart001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '  hello  ';
      let result: string = str.trimStart();
      expect(result).assertEqual('hello  ');
    });

    /**
     * @tc.name   StringTrimEnd001
     * @tc.number SUB_BUILTINS_STRING_TRIMEND_0100
     * @tc.desc   Trim whitespace from end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringTrimEnd001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '  hello  ';
      let result: string = str.trimEnd();
      expect(result).assertEqual('  hello');
    });

    /**
     * @tc.name   StringReplace001
     * @tc.number SUB_BUILTINS_STRING_REPLACE_0100
     * @tc.desc   Replace first occurrence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringReplace001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.replace('world', 'ArkTS');
      expect(result).assertEqual('hello ArkTS');
    });

    /**
     * @tc.name   StringSplit001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_0100
     * @tc.desc   Split string by separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSplit001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a,b,c';
      let arr: string[] = str.split(',');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
    });

    /**
     * @tc.name   StringRepeat001
     * @tc.number SUB_BUILTINS_STRING_REPEAT_0100
     * @tc.desc   Repeat string multiple times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRepeat001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ha';
      let result: string = str.repeat(3);
      expect(result).assertEqual('hahaha');
    });

    /**
     * @tc.name   StringStartsWith001
     * @tc.number SUB_BUILTINS_STRING_STARTSWITH_0100
     * @tc.desc   Check if string starts with prefix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringStartsWith001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: boolean = str.startsWith('hello');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringEndsWith001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_0100
     * @tc.desc   Check if string ends with suffix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: boolean = str.endsWith('world');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringPadStart001
     * @tc.number SUB_BUILTINS_STRING_PADSTART_0100
     * @tc.desc   Pad string at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadStart001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '5';
      let result: string = str.padStart(3, '0');
      expect(result).assertEqual('005');
    });

    /**
     * @tc.name   StringPadEnd001
     * @tc.number SUB_BUILTINS_STRING_PADEND_0100
     * @tc.desc   Pad string at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPadEnd001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '5';
      let result: string = str.padEnd(3, '0');
      expect(result).assertEqual('500');
    });


    /**
     * @tc.name   StringWhitespace001
     * @tc.number SUB_BUILTINS_STRING_WHITESPACE_0100
     * @tc.desc   Regular space character U+0020
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringWhitespace001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      expect(str.indexOf(' ')).assertEqual(5);
    });

    /**
     * @tc.name   StringWhitespace002
     * @tc.number SUB_BUILTINS_STRING_WHITESPACE_0200
     * @tc.desc   Non-breaking space U+00A0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringWhitespace002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'hello\u00A0world';
      expect(str.length).assertEqual(11);
    });

    /**
     * @tc.name   StringZeroWidthSpace001
     * @tc.number SUB_BUILTINS_STRING_ZERO_WIDTH_0100
     * @tc.desc   Zero-width space U+200B
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringZeroWidthSpace001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'hello\u200Bworld';
      expect(str.length).assertEqual(11);
      expect(str.charCodeAt(5)).assertEqual(0x200B);
    });

    /**
     * @tc.name   StringZeroWidthJoiner001
     * @tc.number SUB_BUILTINS_STRING_ZERO_WIDTH_0200
     * @tc.desc   Zero-width joiner U+200D for emoji composition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringZeroWidthJoiner001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u200D';
      expect(str.charCodeAt(0)).assertEqual(0x200D);
    });

    /**
     * @tc.name   StringZeroWidthNonJoiner001
     * @tc.number SUB_BUILTINS_STRING_ZERO_WIDTH_0300
     * @tc.desc   Zero-width non-joiner U+200C
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringZeroWidthNonJoiner001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u200C';
      expect(str.charCodeAt(0)).assertEqual(0x200C);
    });

    /**
     * @tc.name   StringZeroWidthNoBreak001
     * @tc.number SUB_BUILTINS_STRING_ZERO_WIDTH_0400
     * @tc.desc   Zero-width no-break space U+FEFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringZeroWidthNoBreak001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\uFEFF';
      expect(str.charCodeAt(0)).assertEqual(0xFEFF);
    });

    /**
     * @tc.name   StringEmojiBasic001
     * @tc.number SUB_BUILTINS_STRING_EMOJI_0100
     * @tc.desc   Basic emoji from BMP range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEmojiBasic001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '☀️⭐';
      expect(str.length).assertLarger(0);
    });

    /**
     * @tc.name   StringEmojiSupplementary001
     * @tc.number SUB_BUILTINS_STRING_EMOJI_0200
     * @tc.desc   Supplementary plane emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringEmojiSupplementary001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '😀';
      expect(str.charCodeAt(0)).assertLarger(0xD800); // High surrogate
    });

    /**
     * @tc.name   StringEmojiMultiple001
     * @tc.number SUB_BUILTINS_STRING_EMOJI_0300
     * @tc.desc   Multiple emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringEmojiMultiple001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '😀😃😄😁😆';
      expect(str.length).assertEqual(10); // Each = 2 code units
    });

    /**
     * @tc.name   StringPunctuation001
     * @tc.number SUB_BUILTINS_STRING_PUNCTUATION_0100
     * @tc.desc   English punctuation marks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPunctuation001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello, World!';
      expect(str.indexOf(',')).assertEqual(5);
      expect(str.indexOf('!')).assertEqual(12);
    });

    /**
     * @tc.name   StringPunctuation002
     * @tc.number SUB_BUILTINS_STRING_PUNCTUATION_0200
     * @tc.desc   Chinese punctuation marks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPunctuation002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '你好，世界！';
      expect(str.indexOf('，')).assertEqual(2);
      expect(str.indexOf('！')).assertEqual(5);
    });

    /**
     * @tc.name   StringPunctuation003
     * @tc.number SUB_BUILTINS_STRING_PUNCTUATION_0300
     * @tc.desc   Mixed punctuation marks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPunctuation003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello，世界！';
      expect(str.indexOf('，')).assertEqual(5);
      expect(str.indexOf('！')).assertEqual(8);
    });

    /**
     * @tc.name   StringMathSymbols001
     * @tc.number SUB_BUILTINS_STRING_MATH_0100
     * @tc.desc   Basic mathematical operators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMathSymbols001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '1 + 2 = 3';
      expect(str.indexOf('+')).assertEqual(2);
      expect(str.indexOf('=')).assertEqual(6);
    });

    /**
     * @tc.name   StringMathSymbols002
     * @tc.number SUB_BUILTINS_STRING_MATH_0200
     * @tc.desc   Mathematical comparison symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringMathSymbols002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'a ≤ b ≥ c';
      expect(str.length).assertEqual(9);
    });

    /**
     * @tc.name   StringMathSymbols003
     * @tc.number SUB_BUILTINS_STRING_MATH_0300
     * @tc.desc   Mathematical Greek letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringMathSymbols003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'α + β = γ';
      expect(str.length).assertEqual(9);
    });

    /**
     * @tc.name   StringCurrency001
     * @tc.number SUB_BUILTINS_STRING_CURRENCY_0100
     * @tc.desc   Currency symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCurrency001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '$100 €50 ¥1000';
      expect(str.indexOf('$')).assertEqual(0);
      expect(str.indexOf('€')).assertEqual(5);
      expect(str.indexOf('¥')).assertEqual(9);
    });

    /**
     * @tc.name   StringOtherSymbols001
     * @tc.number SUB_BUILTINS_STRING_SYMBOLS_0100
     * @tc.desc   Copyright and trademark symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringOtherSymbols001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '©2024 Company®';
      expect(str.indexOf('©')).assertEqual(0);
      expect(str.indexOf('®')).assertEqual(13);
    });

    /**
     * @tc.name   StringControlCharacters001
     * @tc.number SUB_BUILTINS_STRING_CONTROL_0100
     * @tc.desc   C0 control character range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringControlCharacters001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'before\u0001after';
      expect(str.charCodeAt(6)).assertEqual(0x01);
    });

    /**
     * @tc.name   StringControlCharacters002
     * @tc.number SUB_BUILTINS_STRING_CONTROL_0200
     * @tc.desc   Line separator U+2028
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringControlCharacters002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'line1\u2028line2';
      expect(str.charCodeAt(5)).assertEqual(0x2028);
    });

    /**
     * @tc.name   StringControlCharacters003
     * @tc.number SUB_BUILTINS_STRING_CONTROL_0300
     * @tc.desc   Paragraph separator U+2029
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringControlCharacters003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'para1\u2029para2';
      expect(str.charCodeAt(5)).assertEqual(0x2029);
    });


    /**
     * @tc.name   StringUnicodeASCII001
     * @tc.number SUB_BUILTINS_STRING_UNICODE_ASCII_0100
     * @tc.desc   ASCII characters in Unicode range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringUnicodeASCII001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ABCxyz123';
      expect(str.length).assertEqual(9);
      expect(str.charCodeAt(0)).assertEqual(65); // 'A'
    });

    /**
     * @tc.name   StringUnicodeChinese001
     * @tc.number SUB_BUILTINS_STRING_UNICODE_CHINESE_0100
     * @tc.desc   Chinese characters in BMP range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringUnicodeChinese001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '你好世界';
      expect(str.length).assertEqual(4);
      expect(str.charCodeAt(0)).assertLarger(0x4E00); // Chinese character range
    });

    /**
     * @tc.name   StringUnicodeJapanese001
     * @tc.number SUB_BUILTINS_STRING_UNICODE_JAPANESE_0100
     * @tc.desc   Japanese Hiragana characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringUnicodeJapanese001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'こんにちは';
      expect(str.length).assertEqual(5);
      expect(str.charCodeAt(0)).assertLarger(0x3040);
    });

    /**
     * @tc.name   StringUnicodeGreek001
     * @tc.number SUB_BUILTINS_STRING_UNICODE_GREEK_0100
     * @tc.desc   Greek letters in Unicode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringUnicodeGreek001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'αβγδε';
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.name   StringSurrogatePair001
     * @tc.number SUB_BUILTINS_STRING_SURROGATE_0100
     * @tc.desc   Emoji character using surrogate pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringSurrogatePair001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '😀'; // Grinning face emoji
      expect(str.length).assertEqual(2); // Surrogate pair
      expect(str.charCodeAt(0)).assertLarger(0xD800);
      expect(str.charCodeAt(0)).assertLess(0xDC00); // High surrogate
    });

    /**
     * @tc.name   StringSurrogatePair002
     * @tc.number SUB_BUILTINS_STRING_SURROGATE_0200
     * @tc.desc   Low surrogate character in emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringSurrogatePair002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '😀';
      expect(str.charCodeAt(1)).assertLarger(0xDC00);
      expect(str.charCodeAt(1)).assertLess(0xE000); // Low surrogate
    });

    /**
     * @tc.name   StringSurrogatePair003
     * @tc.number SUB_BUILTINS_STRING_SURROGATE_0300
     * @tc.desc   Multiple emoji characters in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringSurrogatePair003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '😀😃😄😁';
      expect(str.length).assertEqual(8); // Each emoji = 2 code units
    });

    /**
     * @tc.name   StringCodePoint001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINT_0100
     * @tc.desc   Code point escape for supplementary plane character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePoint001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u{1F600}';
      expect(str.length).assertEqual(2); // Surrogate pair
    });

    /**
     * @tc.name   StringCodePoint002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINT_0200
     * @tc.desc   Maximum valid Unicode code point
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePoint002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\u{10FFFF}';
      expect(str.length).assertEqual(2); // Surrogate pair
    });


  });
}
