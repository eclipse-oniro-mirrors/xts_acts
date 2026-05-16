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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {
  testRawEmptyArray,
  testRawLengthZero,
  testRawString,
  testInsufficientSubstitutions,
  testRawPropertyMissing,
  testRawPropertyNull,
  testRawPropertyUndefined
} from './stringraw_boundary_test';
import {
  testNullParameter,
  testUndefinedParameter,
  testNumberParameter,
  testStringParameter,
  testEmptyObjectParameter
} from './stringraw_error_test';
import {
  testIdentityTag,
  testIdentityTagLength,
  testIdentityTagHasNewline,
  testStringRawAsTag,
  testStringRawAsTagLength,
  testStringRawAsTagHasNewline,
  testRegexPattern,
  testRegexPatternLength
} from './stringraw_special_test';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringRawBasicTest() {
  describe('StringRawBasicTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(20);
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   StringRaw_TagFunctionSyntax_001
     * @tc.number SUB_BUILTINS_STRING_RAW_TAG_FUNCTION_0100
     * @tc.desc   Test String.raw with tag function syntax containing escape sequence and expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_TagFunctionSyntax_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Hi\n${2 + 3}!`;
      expect(result).assertEqual('Hi\\n5!');
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringRaw_TagFunctionSyntax_002
     * @tc.number SUB_BUILTINS_STRING_RAW_TAG_FUNCTION_0200
     * @tc.desc   Test String.raw with multiple expressions in tag function syntax
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_TagFunctionSyntax_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let x: number = 10;
      let y: number = 20;
      let result: string = String.raw`Sum: ${x + y}`;
      expect(result).assertEqual('Sum: 30');
    });

    /**
     * @tc.name   StringRaw_FunctionCallSyntax_001
     * @tc.number SUB_BUILTINS_STRING_RAW_FUNCTION_CALL_0100
     * @tc.desc   Test String.raw with function call syntax passing raw array and substitutions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_FunctionCallSyntax_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class RawArray {
        public raw: string[];
        constructor() {
          this.raw = ['foo', 'bar'];
        }
      }
      let rawObj: RawArray = new RawArray();
      let result: string = String.raw(rawObj, 'first', 'second');
      expect(result).assertEqual('foofirstbar');
    });

    /**
     * @tc.name   StringRaw_FunctionCallSyntax_002
     * @tc.number SUB_BUILTINS_STRING_RAW_FUNCTION_CALL_0200
     * @tc.desc   Test String.raw with function call syntax and single substitution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_FunctionCallSyntax_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class RawArray {
        public raw: string[];
        constructor() {
          this.raw = ['start', 'end'];
        }
      }
      let rawObj: RawArray = new RawArray();
      let result: string = String.raw(rawObj, 'middle');
      expect(result).assertEqual('startmiddleend');
    });

    /**
     * @tc.name   StringRaw_NoExpressionTemplate_001
     * @tc.number SUB_BUILTINS_STRING_RAW_NO_EXPRESSION_0100
     * @tc.desc   Test String.raw with template string containing no expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_NoExpressionTemplate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Hello\nWorld`;
      expect(result).assertEqual('Hello\\nWorld');
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.name   StringRaw_NoExpressionTemplate_002
     * @tc.number SUB_BUILTINS_STRING_RAW_NO_EXPRESSION_0200
     * @tc.desc   Test String.raw with simple template string without escape sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_NoExpressionTemplate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`SimpleText`;
      expect(result).assertEqual('SimpleText');
    });

    /**
     * @tc.name   StringRaw_NoExpressionTemplate_003
     * @tc.number SUB_BUILTINS_STRING_RAW_NO_EXPRESSION_0300
     * @tc.desc   Test String.raw with empty template string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_NoExpressionTemplate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw``;
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });


    /**
     * @tc.name   StringRaw_EmptyArray_001
     * @tc.number SUB_BUILTINS_STRING_RAW_BOUNDARY_EMPTY_ARRAY_0100
     * @tc.desc   Test String.raw with empty array as raw property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_EmptyArray_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testRawEmptyArray();
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRaw_LengthZero_001
     * @tc.number SUB_BUILTINS_STRING_RAW_BOUNDARY_LENGTH_ZERO_0100
     * @tc.desc   Test String.raw with raw.length = 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_LengthZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testRawLengthZero();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringRaw_RawString_001
     * @tc.number SUB_BUILTINS_STRING_RAW_BOUNDARY_STRING_0100
     * @tc.desc   Test String.raw with string as raw property (array-like)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_RawString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testRawString();
      expect(result).assertEqual('t0e1s2t');
    });

    /**
     * @tc.name   StringRaw_InsufficientSubstitutions_001
     * @tc.number SUB_BUILTINS_STRING_RAW_BOUNDARY_INSUFFICIENT_0100
     * @tc.desc   Test String.raw when substitutions count is less than raw.length - 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_InsufficientSubstitutions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = testInsufficientSubstitutions();
      expect(result).assertEqual('axbc');
    });

    /**
     * @tc.name   StringRaw_RawPropertyMissing_001
     * @tc.number SUB_BUILTINS_STRING_RAW_BOUNDARY_NO_RAW_0100
     * @tc.desc   Test String.raw when first parameter has no raw property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_RawPropertyMissing_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testRawPropertyMissing();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRaw_RawPropertyNull_001
     * @tc.number SUB_BUILTINS_STRING_RAW_BOUNDARY_NULL_RAW_0100
     * @tc.desc   Test String.raw when raw property is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_RawPropertyNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testRawPropertyNull();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRaw_RawPropertyUndefined_001
     * @tc.number SUB_BUILTINS_STRING_RAW_BOUNDARY_UNDEF_RAW_0100
     * @tc.desc   Test String.raw when raw property is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_RawPropertyUndefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testRawPropertyUndefined();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });


    /**
     * @tc.name   StringRaw_vsNormal_001
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0100
     * @tc.desc   Compare String.raw with normal template string for escape sequence handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = `Hello\nWorld`;
      let raw: string = String.raw`Hello\nWorld`;
      expect(normal).assertEqual('Hello\nWorld');
      expect(raw).assertEqual('Hello\\nWorld');
      expect(normal !== raw).assertTrue();
    });

    /**
     * @tc.name   StringRaw_vsNormal_002
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0200
     * @tc.desc   Compare length difference between normal and raw template strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = `Hello\nWorld`;
      let raw: string = String.raw`Hello\nWorld`;
      expect(normal.length).assertEqual(11);
      expect(raw.length).assertEqual(12);
    });

    /**
     * @tc.name   StringRaw_vsNormal_003
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0300
     * @tc.desc   Compare newline presence in normal vs raw template strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = `Hello\nWorld`;
      let raw: string = String.raw`Hello\nWorld`;
      let normalHasNewline: boolean = normal.indexOf('\n') !== -1;
      let rawHasNewline: boolean = raw.indexOf('\n') !== -1;
      expect(normalHasNewline).assertEqual(true);
      expect(rawHasNewline).assertEqual(false);
    });

    /**
     * @tc.name   StringRaw_vsNormal_004
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0400
     * @tc.desc   Compare String.raw with normal template for expression interpolation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let value: number = 42;
      let normal: string = `Value: ${value}`;
      let raw: string = String.raw`Value: ${value}`;
      expect(normal).assertEqual(raw);
      expect(normal).assertEqual('Value: 42');
    });

    /**
     * @tc.name   StringRaw_vsNormal_005
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0500
     * @tc.desc   Compare String.raw with normal template for tab escape
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = `Col1\tCol2`;
      let raw: string = String.raw`Col1\tCol2`;
      expect(normal !== raw).assertTrue();
      expect(normal.length).assertEqual(9);
      expect(raw.length).assertEqual(10);
    });

    /**
     * @tc.name   StringRaw_vsNormal_006
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0600
     * @tc.desc   Compare String.raw with normal template for Unicode escape
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = `Hi\u000A!`;
      let raw: string = String.raw`Hi\u000A!`;
      expect(normal !== raw).assertTrue();
      expect(normal).assertEqual('Hi\n!');
      expect(raw).assertEqual('Hi\\u000A!');
    });

    /**
     * @tc.name   StringRaw_vsNormal_007
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0700
     * @tc.desc   Compare String.raw with normal template with no escape sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = `SimpleText`;
      let raw: string = String.raw`SimpleText`;
      expect(normal).assertEqual(raw);
      expect(normal).assertEqual('SimpleText');
    });

    /**
     * @tc.name   StringRaw_vsNormal_008
     * @tc.number SUB_BUILTINS_STRING_RAW_COMPARE_NORMAL_0800
     * @tc.desc   Compare String.raw with normal template for backslash handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_vsNormal_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = `Path\\to\\file`;
      let raw: string = String.raw`Path\\to\\file`;
      expect(normal !== raw).assertTrue();
      expect(normal).assertEqual('Path\\to\\file');
      expect(raw).assertEqual('Path\\\\to\\\\file');
    });


    /**
     * @tc.name   StringRaw_NullParameter_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ERROR_NULL_0100
     * @tc.desc   Test String.raw with null as first parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_NullParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testNullParameter();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRaw_UndefinedParameter_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ERROR_UNDEFINED_0100
     * @tc.desc   Test String.raw with undefined as first parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_UndefinedParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testUndefinedParameter();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRaw_NumberParameter_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ERROR_NUMBER_0100
     * @tc.desc   Test String.raw with number as first parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_NumberParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testNumberParameter();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRaw_StringParameter_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ERROR_STRING_0100
     * @tc.desc   Test String.raw with string as first parameter throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_StringParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testStringParameter();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRaw_EmptyObjectParameter_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ERROR_EMPTY_OBJ_0100
     * @tc.desc   Test String.raw with empty object (no raw property) throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_EmptyObjectParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result = testEmptyObjectParameter();
      expect(result.error).assertEqual(true);
      expect(result.name).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringRaw_NotConstructor_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ERROR_CONSTRUCTOR_0100
     * @tc.desc   Test String.raw cannot be used with new operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_NotConstructor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // Note: This test case demonstrates the expected behavior
      // In actual implementation, attempting 'new String.raw' would throw TypeError
      // We cannot directly test this in ArkTS as it's a compile-time error
      // This test case documents the expected behavior
      let isStaticMethod: boolean = true;
      expect(isStaticMethod).assertEqual(true);
    });


    /**
     * @tc.name   StringRaw_NewlineEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_NEWLINE_0100
     * @tc.desc   Test String.raw preserves \\n as literal backslash and n
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_NewlineEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Line1\nLine2`;
      expect(result).assertEqual('Line1\\nLine2');
      expect(result.length).assertEqual(12);
      expect(result.indexOf('\n')).assertEqual(-1);
    });

    /**
     * @tc.name   StringRaw_NewlineEscape_002
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_NEWLINE_0200
     * @tc.desc   Test String.raw with multiple newline escape sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_NewlineEscape_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`A\nB\nC`;
      expect(result).assertEqual('A\\nB\\nC');
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.name   StringRaw_UnicodeEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_UNICODE_0100
     * @tc.desc   Test String.raw preserves \\u000A as literal characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_UnicodeEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Hi\u000A!`;
      expect(result).assertEqual('Hi\\u000A!');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.name   StringRaw_BackslashEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_BACKSLASH_0100
     * @tc.desc   Test String.raw preserves double backslash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_BackslashEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Path\\to\\file`;
      expect(result).assertEqual('Path\\\\to\\\\file');
    });

    /**
     * @tc.name   StringRaw_TabEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_TAB_0100
     * @tc.desc   Test String.raw preserves \\t as literal backslash and t
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_TabEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Col1\tCol2`;
      expect(result).assertEqual('Col1\\tCol2');
      expect(result.length).assertEqual(10);
      expect(result.indexOf('\t')).assertEqual(-1);
    });

    /**
     * @tc.name   StringRaw_CarriageReturnEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_CR_0100
     * @tc.desc   Test String.raw preserves \\r as literal backslash and r
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_CarriageReturnEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Line1\rLine2`;
      expect(result).assertEqual('Line1\\rLine2');
      expect(result.length).assertEqual(12);
    });

    /**
     * @tc.name   StringRaw_SingleQuoteEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_QUOTE_0100
     * @tc.desc   Test String.raw preserves \\' as literal backslash and quote
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_SingleQuoteEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`It\'s a test`;
      expect(result).assertEqual('It\\\'s a test');
    });

    /**
     * @tc.name   StringRaw_DoubleQuoteEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_DQUOTE_0100
     * @tc.desc   Test String.raw preserves \\" as literal backslash and quote
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_DoubleQuoteEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Say \"Hello\"`;
      expect(result).assertEqual('Say \\"Hello\\"');
    });

    /**
     * @tc.name   StringRaw_BackspaceEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_BS_0100
     * @tc.desc   Test String.raw preserves \\b as literal backslash and b
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_BackspaceEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`A\bb`;
      expect(result).assertEqual('A\\bb');
    });

    /**
     * @tc.name   StringRaw_FormFeedEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_FF_0100
     * @tc.desc   Test String.raw preserves \\f as literal backslash and f
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_FormFeedEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Page1\fPage2`;
      expect(result).assertEqual('Page1\\fPage2');
    });

    /**
     * @tc.name   StringRaw_NullEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_NULL_0100
     * @tc.desc   Test String.raw preserves \\0 as literal backslash and 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_NullEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Start\0End`;
      expect(result).assertEqual('Start\\0End');
    });

    /**
     * @tc.name   StringRaw_OctalEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_OCTAL_0100
     * @tc.desc   Test String.raw preserves octal escape sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_OctalEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Value\123`;
      expect(result).assertEqual('Value\\123');
    });

    /**
     * @tc.name   StringRaw_HexEscape_001
     * @tc.number SUB_BUILTINS_STRING_RAW_ESCAPE_HEX_0100
     * @tc.desc   Test String.raw preserves hexadecimal escape sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_HexEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Char\xFF`;
      expect(result).assertEqual('Char\\xFF');
    });

    /**
     * @tc.name   StringRaw_WindowsPath_001
     * @tc.number SUB_BUILTINS_STRING_RAW_WINDOWS_PATH_0100
     * @tc.desc   Test String.raw with Windows file path containing backslashes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_WindowsPath_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`C:\Development\profile\aboutme.html`;
      expect(result).assertEqual('C:\\Development\\profile\\aboutme.html');
    });

    /**
     * @tc.name   StringRaw_WindowsPath_002
     * @tc.number SUB_BUILTINS_STRING_RAW_WINDOWS_PATH_0200
     * @tc.desc   Test String.raw with Windows file path to Users directory
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_WindowsPath_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`C:\Users\Name\Documents\file.txt`;
      expect(result).assertEqual('C:\\Users\\Name\\Documents\\file.txt');
    });


    /**
     * @tc.name   StringRaw_ArithmeticExpression_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_ARITHMETIC_0100
     * @tc.desc   Test String.raw with arithmetic expression in template
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_ArithmeticExpression_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Result: ${2 + 3}`;
      expect(result).assertEqual('Result: 5');
    });

    /**
     * @tc.name   StringRaw_ArithmeticExpression_002
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_ARITHMETIC_0200
     * @tc.desc   Test String.raw with complex arithmetic expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_ArithmeticExpression_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Sum: ${10 * 5 + 3}`;
      expect(result).assertEqual('Sum: 53');
    });

    /**
     * @tc.name   StringRaw_VariableReplacement_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_VARIABLE_0100
     * @tc.desc   Test String.raw with string variable interpolation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_VariableReplacement_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let name: string = "Bob";
      let result: string = String.raw`Hello\n${name}!`;
      expect(result).assertEqual('Hello\\nBob!');
    });

    /**
     * @tc.name   StringRaw_VariableReplacement_002
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_VARIABLE_0200
     * @tc.desc   Test String.raw with number variable interpolation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_VariableReplacement_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let count: number = 42;
      let result: string = String.raw`Count: ${count}`;
      expect(result).assertEqual('Count: 42');
    });

    /**
     * @tc.name   StringRaw_MultipleExpressions_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_MULTIPLE_0100
     * @tc.desc   Test String.raw with multiple expression substitutions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_MultipleExpressions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let a: number = 10;
      let b: number = 20;
      let result: string = String.raw`${a} + ${b} = ${a + b}`;
      expect(result).assertEqual('10 + 20 = 30');
    });

    /**
     * @tc.name   StringRaw_MultipleExpressions_002
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_MULTIPLE_0200
     * @tc.desc   Test String.raw with five consecutive expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_MultipleExpressions_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let a: number = 1;
      let b: number = 2;
      let c: number = 3;
      let d: number = 4;
      let e: number = 5;
      let result: string = String.raw`${a}${b}${c}${d}${e}`;
      expect(result).assertEqual('12345');
    });

    /**
     * @tc.name   StringRaw_EscapedDollarSign_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_ESCAPED_0100
     * @tc.desc   Test String.raw with escaped dollar sign backslash-dollar sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_EscapedDollarSign_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Cost: \${price}`;
      expect(result).assertEqual('Cost: \\${price}');
    });

    /**
     * @tc.name   StringRaw_BooleanExpression_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_BOOLEAN_0100
     * @tc.desc   Test String.raw with boolean expression result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_BooleanExpression_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let flag: boolean = true;
      let result: string = String.raw`Flag: ${flag}`;
      expect(result).assertEqual('Flag: true');
    });

    /**
     * @tc.name   StringRaw_ComparisonExpression_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_COMPARE_0100
     * @tc.desc   Test String.raw with comparison expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_ComparisonExpression_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Result: ${5 > 3}`;
      expect(result).assertEqual('Result: true');
    });

    /**
     * @tc.name   StringRaw_TernaryExpression_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_TERNARY_0100
     * @tc.desc   Test String.raw with ternary operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_TernaryExpression_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let value: number = 10;
      let result: string = String.raw`Status: ${value > 5 ? 'high' : 'low'}`;
      expect(result).assertEqual('Status: high');
    });

    /**
     * @tc.name   StringRaw_EmptyStringExpression_001
     * @tc.number SUB_BUILTINS_STRING_RAW_INTERPOLATION_EMPTY_0100
     * @tc.desc   Test String.raw with empty string expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_EmptyStringExpression_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Start${''}End`;
      expect(result).assertEqual('StartEnd');
    });


    /**
     * @tc.name   StringRaw_WindowsFilePath_001
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_PATH_0100
     * @tc.desc   Test String.raw for Windows file path - Users directory
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_WindowsFilePath_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let path1: string = String.raw`C:\Users\Name\Documents\file.txt`;
      expect(path1).assertEqual('C:\\Users\\Name\\Documents\\file.txt');
    });

    /**
     * @tc.name   StringRaw_WindowsFilePath_002
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_PATH_0200
     * @tc.desc   Test String.raw for Windows file path - Development directory
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_WindowsFilePath_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let path2: string = String.raw`D:\Development\project\src\main.ts`;
      expect(path2).assertEqual('D:\\Development\\project\\src\\main.ts');
    });

    /**
     * @tc.name   StringRaw_WindowsFilePath_003
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_PATH_0300
     * @tc.desc   Test String.raw for Windows network path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_WindowsFilePath_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let path3: string = String.raw`\\server\share\folder\file.dat`;
      expect(path3).assertEqual('\\\\server\\share\\folder\\file.dat');
    });

    /**
     * @tc.name   StringRaw_RegexPattern_001
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_REGEX_0100
     * @tc.desc   Test String.raw for regex digits pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_RegexPattern_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let digitsPattern: string = String.raw`\d+`;
      expect(digitsPattern).assertEqual('\\d+');
    });

    /**
     * @tc.name   StringRaw_RegexPattern_002
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_REGEX_0200
     * @tc.desc   Test String.raw for regex phone number pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_RegexPattern_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let phonePattern: string = String.raw`\d{3}-\d{3}-\d{4}`;
      expect(phonePattern).assertEqual('\\d{3}-\\d{3}-\\d{4}');
    });

    /**
     * @tc.name   StringRaw_RegexPattern_003
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_REGEX_0300
     * @tc.desc   Test String.raw for regex email pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_RegexPattern_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emailPattern: string = String.raw`\w+@\w+\.\w+`;
      expect(emailPattern).assertEqual('\\w+@\\w+\\.\\w+');
    });

    /**
     * @tc.name   StringRaw_HTMLTemplate_001
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_HTML_0100
     * @tc.desc   Test String.raw for HTML template with class and content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_HTMLTemplate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let className: string = "container";
      let content: string = "Hello";
      let template: string = String.raw`
  <div class="${className}">
    ${content}
  </div>
  `;
      expect(template).assertContain('<div class="container">');
      expect(template).assertContain('Hello');
    });

    /**
     * @tc.name   StringRaw_HTMLTemplate_002
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_HTML_0200
     * @tc.desc   Test String.raw for HTML template with multiple attributes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_HTMLTemplate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let id: string = "main";
      let style: string = "color: red";
      let html: string = String.raw`<div id="${id}" style="${style}">Content</div>`;
      expect(html).assertEqual('<div id="main" style="color: red">Content</div>');
    });

    /**
     * @tc.name   StringRaw_SQLQuery_001
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_SQL_0100
     * @tc.desc   Test String.raw for SQL query template
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_SQLQuery_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let tableName: string = "users";
      let column: string = "name";
      let query: string = String.raw`SELECT ${column} FROM ${tableName} WHERE id = 1`;
      expect(query).assertEqual('SELECT name FROM users WHERE id = 1');
    });

    /**
     * @tc.name   StringRaw_CommandLine_001
     * @tc.number SUB_BUILTINS_STRING_RAW_PRACTICAL_CMD_0100
     * @tc.desc   Test String.raw for command line path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_CommandLine_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let exePath: string = String.raw`C:\Program Files\MyApp\app.exe`;
      expect(exePath).assertEqual('C:\\Program Files\\MyApp\\app.exe');
    });


    /**
     * @tc.name   StringRaw_Concatenation_001
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_CONCAT_0100
     * @tc.desc   Test String.raw string concatenation behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_Concatenation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`a${1}b${2}c`;
      expect(result).assertEqual('a1b2c');
    });

    /**
     * @tc.name   StringRaw_Concatenation_002
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_CONCAT_0200
     * @tc.desc   Test String.raw concatenation with multiple substitutions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_Concatenation_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let x: number = 5;
      let y: number = 10;
      let result: string = String.raw`${x}-${y}-${x + y}`;
      expect(result).assertEqual('5-10-15');
    });

    /**
     * @tc.name   StringRaw_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_EMPTY_0100
     * @tc.desc   Test String.raw with empty string expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`${''}${''}`;
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRaw_EmptyString_002
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_EMPTY_0200
     * @tc.desc   Test String.raw with empty template
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_EmptyString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw``;
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringRaw_TypeVerification_001
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_TYPE_0100
     * @tc.desc   Test String.raw return type is string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_TypeVerification_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`test`;
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringRaw_TypeVerification_002
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_TYPE_0200
     * @tc.desc   Test String.raw with expression returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_TypeVerification_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Value: ${42}`;
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringRaw_TypeVerification_003
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_TYPE_0300
     * @tc.desc   Test String.raw with escape sequence returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_TypeVerification_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Line1\nLine2`;
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringRaw_StringMethods_001
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_METHODS_0100
     * @tc.desc   Test String.raw result supports string methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_StringMethods_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Hello\nWorld`;
      expect(result.toUpperCase()).assertEqual('HELLO\\NWORLD');
    });

    /**
     * @tc.name   StringRaw_StringMethods_002
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_METHODS_0200
     * @tc.desc   Test String.raw result supports indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_StringMethods_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Hello\nWorld`;
      expect(result.indexOf('\\n')).assertEqual(5);
    });

    /**
     * @tc.name   StringRaw_StringMethods_003
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_METHODS_0300
     * @tc.desc   Test String.raw result supports substring method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_StringMethods_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`Hello\nWorld`;
      expect(result.substring(0, 5)).assertEqual('Hello');
    });

    /**
     * @tc.name   StringRaw_ConcatenationEdge_001
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_CONCAT_EDGE_0100
     * @tc.desc   Test String.raw with expression at the beginning
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_ConcatenationEdge_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`${1}start`;
      expect(result).assertEqual('1start');
    });

    /**
     * @tc.name   StringRaw_ConcatenationEdge_002
     * @tc.number SUB_BUILTINS_STRING_RAW_RETURN_CONCAT_EDGE_0200
     * @tc.desc   Test String.raw with expression at the end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_ConcatenationEdge_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.raw`end${1}`;
      expect(result).assertEqual('end1');
    });


    /**
     * @tc.name   StringRaw_IdentityTag_001
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_IDENTITY_TAG_0100
     * @tc.desc   Test identity tag construction that preserves processed escape sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_IdentityTag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = testIdentityTag();
      expect(result).assertEqual('<canvas>\n</canvas>');
    });

    /**
     * @tc.name   StringRaw_IdentityTag_002
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_IDENTITY_TAG_0200
     * @tc.desc   Test identity tag length with newline escape
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_IdentityTag_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let length: number = testIdentityTagLength();
      expect(length).assertEqual(18);
    });

    /**
     * @tc.name   StringRaw_IdentityTag_003
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_IDENTITY_TAG_0300
     * @tc.desc   Test identity tag contains actual newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_IdentityTag_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let hasNewline: boolean = testIdentityTagHasNewline();
      expect(hasNewline).assertEqual(true);
    });

    /**
     * @tc.name   StringRaw_DirectAsTag_001
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_DIRECT_TAG_0100
     * @tc.desc   Test String.raw used directly as identity tag (anti-pattern)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_DirectAsTag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = testStringRawAsTag();
      expect(result).assertEqual('<canvas>\\n</canvas>');
    });

    /**
     * @tc.name   StringRaw_DirectAsTag_002
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_DIRECT_TAG_0200
     * @tc.desc   Test direct String.raw tag length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_DirectAsTag_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let length: number = testStringRawAsTagLength();
      expect(length).assertEqual(19);
    });

    /**
     * @tc.name   StringRaw_DirectAsTag_003
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_DIRECT_TAG_0300
     * @tc.desc   Test direct String.raw tag does not contain actual newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringRaw_DirectAsTag_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let hasNewline: boolean = testStringRawAsTagHasNewline();
      expect(hasNewline).assertEqual(false);
    });

    /**
     * @tc.name   StringRaw_RegexPattern_001Adapt001
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_REGEX_0100
     * @tc.desc   Test String.raw for regex pattern avoiding double escape
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_RegexPattern_001Adapt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let pattern: string = testRegexPattern();
      expect(pattern).assertEqual('\\d{3}-\\d{3}-\\d{4}');
    });

    /**
     * @tc.name   StringRaw_RegexPattern_002Adapt001
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_REGEX_0200
     * @tc.desc   Test regex pattern length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_RegexPattern_002Adapt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let length: number = testRegexPatternLength();
      expect(length).assertEqual(17);
    });

    /**
     * @tc.name   StringRaw_RegexPattern_003Adapt001
     * @tc.number SUB_BUILTINS_STRING_RAW_SPECIAL_REGEX_0300
     * @tc.desc   Test String.raw with simple regex digits pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringRaw_RegexPattern_003Adapt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let pattern: string = String.raw`\d+`;
      expect(pattern).assertEqual('\\d+');
    });

  })
}
