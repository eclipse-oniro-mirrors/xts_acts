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

export default function StringToUpperCaseTest():void {
  describe('StringToUpperCaseTest', () => {
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
     * @tc.name   StringToUpperCase_Lowercase_001
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0100
     * @tc.desc   Test toUpperCase with pure lowercase letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Lowercase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_MixedCase_002
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0200
     * @tc.desc   Test toUpperCase with mixed case letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_MixedCase_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'HeLLo WoRLd';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_WithNumbers_003
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0300
     * @tc.desc   Test toUpperCase with numbers in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_WithNumbers_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello123world456';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO123WORLD456');
    });

    /**
     * @tc.name   StringToUpperCase_WithSpaces_004
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0400
     * @tc.desc   Test toUpperCase with spaces in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_WithSpaces_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_WithPunctuation_005
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0500
     * @tc.desc   Test toUpperCase with punctuation marks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_WithPunctuation_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello, world!';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO, WORLD!');
    });

    /**
     * @tc.name   StringToUpperCase_FloatString_006
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0600
     * @tc.desc   Test toUpperCase with float number string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_FloatString_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '3.14159';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('3.14159');
    });

    /**
     * @tc.name   StringToUpperCase_ScientificNotation_007
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0700
     * @tc.desc   Test toUpperCase with scientific notation string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ScientificNotation_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '1e10';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('1E10');
    });

    /**
     * @tc.name   StringToUpperCase_Infinity_008
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0800
     * @tc.desc   Test toUpperCase with infinity string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Infinity_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'infinity';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('INFINITY');
    });

    /**
     * @tc.name   StringToUpperCase_NaN_009
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BASIC_0900
     * @tc.desc   Test toUpperCase with NaN string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_NaN_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'nan';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('NAN');
    });


    /**
     * @tc.name   StringToUpperCase_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BOUNDARY_0100
     * @tc.desc   Test toUpperCase with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringToUpperCase_SingleLowercase_002
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BOUNDARY_0200
     * @tc.desc   Test toUpperCase with single lowercase letter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_SingleLowercase_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringToUpperCase_SingleUppercase_003
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BOUNDARY_0300
     * @tc.desc   Test toUpperCase with single uppercase letter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_SingleUppercase_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'A';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringToUpperCase_SingleNonLetter_004
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BOUNDARY_0400
     * @tc.desc   Test toUpperCase with single non-letter character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_SingleNonLetter_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '1';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('1');
    });

    /**
     * @tc.name   StringToUpperCase_LongString_005
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_BOUNDARY_0500
     * @tc.desc   Test toUpperCase with long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LongString_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'the quick brown fox jumps over the lazy dog';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG');
    });


    /**
     * @tc.name   StringToUpperCase_ToUpperCaseToLower_001
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0100
     * @tc.desc   Test toUpperCase followed by toLowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ToUpperCaseToLower_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase().toLowerCase();
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   StringToUpperCase_ToLowerToUpper_002
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0200
     * @tc.desc   Test toLowerCase followed by toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ToLowerToUpper_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'HeLLo WoRLd';
      let result: string = str.toLowerCase().toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_TrimThenUpper_003
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0300
     * @tc.desc   Test trim followed by toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_TrimThenUpper_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '  hello world  ';
      let result: string = str.trim().toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_UpperThenTrim_004
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0400
     * @tc.desc   Test toUpperCase followed by trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_UpperThenTrim_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '  hello world  ';
      let result: string = str.toUpperCase().trim();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_ConcatThenUpper_005
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0500
     * @tc.desc   Test concat followed by toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ConcatThenUpper_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'hello';
      let str2: string = ' world';
      let result: string = str1.concat(str2).toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_UpperThenConcat_006
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0600
     * @tc.desc   Test toUpperCase on each string then concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_UpperThenConcat_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'hello';
      let str2: string = ' world';
      let result: string = str1.toUpperCase().concat(str2.toUpperCase());
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_UpperThenSplit_007
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0700
     * @tc.desc   Test toUpperCase followed by split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_UpperThenSplit_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world test';
      let arr: string[] = str.toUpperCase().split(' ');
      expect(arr[0]).assertEqual('HELLO');
      expect(arr[1]).assertEqual('WORLD');
      expect(arr[2]).assertEqual('TEST');
    });

    /**
     * @tc.name   StringToUpperCase_UpperThenReplace_008
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0800
     * @tc.desc   Test toUpperCase followed by replace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_UpperThenReplace_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase().replace('WORLD', 'ARKTS');
      expect(result).assertEqual('HELLO ARKTS');
    });

    /**
     * @tc.name   StringToUpperCase_UpperThenSlice_009
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_0900
     * @tc.desc   Test toUpperCase followed by slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_UpperThenSlice_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase().slice(0, 5);
      expect(result).assertEqual('HELLO');
    });

    /**
     * @tc.name   StringToUpperCase_UpperThenSubstring_010
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_1000
     * @tc.desc   Test toUpperCase followed by substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_UpperThenSubstring_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase().substring(6, 11);
      expect(result).assertEqual('WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_MultipleUpperCalls_011
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_1100
     * @tc.desc   Test multiple consecutive toUpperCase calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_MultipleUpperCalls_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result1: string = str.toUpperCase();
      let result2: string = result1.toUpperCase();
      let result3: string = result2.toUpperCase();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result3).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_AlternatingCalls_012
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_COMBINED_1200
     * @tc.desc   Test alternating toUpperCase and toLowerCase calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_AlternatingCalls_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'HeLLo';
      let result1: string = str.toUpperCase();
      let result2: string = result1.toLowerCase();
      let result3: string = result2.toUpperCase();
      expect(result1).assertEqual('HELLO');
      expect(result2).assertEqual('hello');
      expect(result3).assertEqual('HELLO');
    });

    /**
     * @tc.name   StringToUpperCase_StringObject_011
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_CONTEXT_1100
     * @tc.desc   Test toUpperCase called on String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_StringObject_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let strObj: String = new String('hello world');
      let result: string = strObj.toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_ObjectStringConsistency_012
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_CONTEXT_1200
     * @tc.desc   Test toUpperCase consistency between String object and primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ObjectStringConsistency_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let strObj: String = new String('hello world');
      let result1: string = str.toUpperCase();
      let result2: string = strObj.toUpperCase();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   StringToUpperCase_OriginalUnchanged_001
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0100
     * @tc.desc   Test that original string is unchanged after toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_OriginalUnchanged_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase();
      expect(str).assertEqual('hello world');
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_MultipleCallsUnchanged_002
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0200
     * @tc.desc   Test that original string remains unchanged after multiple toUpperCase calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_MultipleCallsUnchanged_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result1: string = str.toUpperCase();
      let result2: string = str.toUpperCase();
      let result3: string = str.toUpperCase();
      expect(str).assertEqual('hello world');
      expect(result1).assertEqual('HELLO WORLD');
      expect(result2).assertEqual('HELLO WORLD');
      expect(result3).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_ReturnsNewObject_003
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0300
     * @tc.desc   Test that toUpperCase returns a new string object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ReturnsNewObject_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase();
      expect(result !== str).assertTrue();
    });

    /**
     * @tc.name   StringToUpperCase_ReturnsStringType_004
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0400
     * @tc.desc   Test that toUpperCase returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ReturnsStringType_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringToUpperCase_NotNullOrUndefined_005
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0500
     * @tc.desc   Test that toUpperCase returns non-null and non-undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_NotNullOrUndefined_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase();
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name   StringToUpperCase_CanChainMethods_006
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0600
     * @tc.desc   Test that returned value can continue calling string methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_CanChainMethods_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase().toLowerCase();
      expect(typeof result).assertEqual('string');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringToUpperCase_LengthProperty_007
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0700
     * @tc.desc   Test accessing length property of result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LengthProperty_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringToUpperCase_CharAtMethod_008
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0800
     * @tc.desc   Test using charAt on result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_CharAtMethod_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase();
      expect(result.charAt(0).toString()).assertEqual('H');
    });

    /**
     * @tc.name   StringToUpperCase_CharCodeAtMethod_009
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_0900
     * @tc.desc   Test using charCodeAt on result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_CharCodeAtMethod_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase();
      expect(result.charCodeAt(0)).assertEqual(72);
    });

    /**
     * @tc.name   StringToUpperCase_IndexOfMethod_010
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_IMMUTABILITY_1000
     * @tc.desc   Test using indexOf on result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_IndexOfMethod_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let result: string = str.toUpperCase();
      expect(result.indexOf('W')).assertEqual(6);
    });

    /**
     * @tc.name   StringToUpperCase_ControlChars_001
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_SPECIAL_0100
     * @tc.desc   Test toUpperCase with control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ControlChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello\tworld\n';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO\tWORLD\n');
    });

    /**
     * @tc.name   StringToUpperCase_Emoji_002
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_SPECIAL_0200
     * @tc.desc   Test toUpperCase with emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Emoji_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello 😊 world';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO 😊 WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_ZeroWidthChars_003
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_SPECIAL_0300
     * @tc.desc   Test toUpperCase with zero-width characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_ZeroWidthChars_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello\u200Bworld';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO\u200BWORLD');
    });

    /**
     * @tc.name   StringToUpperCase_CombiningChars_004
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_SPECIAL_0400
     * @tc.desc   Test toUpperCase with combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_CombiningChars_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'cafe\u0301';
      let result: string = str.toUpperCase();
      expect(result.length).assertEqual(str.length);
    });


    /**
     * @tc.name   StringToUpperCase_StrictBasic_001
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_STRICT_0100
     * @tc.desc   Test toUpperCase in strict mode with basic string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_StrictBasic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      'use strict';
      let str: string = 'hello world';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_StrictEmpty_002
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_STRICT_0200
     * @tc.desc   Test toUpperCase in strict mode with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_StrictEmpty_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      'use strict';
      let str: string = '';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('');
    });


    /**
     * @tc.name   StringToUpperCase_Latin1_001
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0100
     * @tc.desc   Test toUpperCase with basic Latin-1 characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Latin1_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café résumé naïve';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('CAFÉ RÉSUMÉ NAÏVE');
    });

    /**
     * @tc.name   StringToUpperCase_AccentedChars_002
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0200
     * @tc.desc   Test toUpperCase with accented characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_AccentedChars_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'éèêëàâäùûüîïôöçñ';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('ÉÈÊËÀÂÄÙÛÜÎÏÔÖÇÑ');
    });

    /**
     * @tc.name   StringToUpperCase_Greek_003
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0300
     * @tc.desc   Test toUpperCase with Greek letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Greek_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'αβγδε';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('ΑΒΓΔΕ');
    });

    /**
     * @tc.name   StringToUpperCase_Cyrillic_004
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0400
     * @tc.desc   Test toUpperCase with Cyrillic letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Cyrillic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'абвгд';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('АБВГД');
    });

    /**
     * @tc.name   StringToUpperCase_GermanSharpS_005
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0500
     * @tc.desc   Test toUpperCase with German sharp s (eszett)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_GermanSharpS_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'straße';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('STRASSE');
    });

    /**
     * @tc.name   StringToUpperCase_Turkish_006
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0600
     * @tc.desc   Test toUpperCase with Turkish characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Turkish_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'istanbul';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('ISTANBUL');
    });

    /**
     * @tc.name   StringToUpperCase_Icelandic_007
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0700
     * @tc.desc   Test toUpperCase with Icelandic thorn character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_Icelandic_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'þetta';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('ÞETTA');
    });

    /**
     * @tc.name   StringToUpperCase_GreekSigma_008
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0800
     * @tc.desc   Test toUpperCase with Greek sigma variants
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_GreekSigma_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'σ';
      let str2: string = 'ς';
      let result1: string = str1.toUpperCase();
      let result2: string = str2.toUpperCase();
      expect(result1).assertEqual('Σ');
      expect(result2).assertEqual('Σ');
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   StringToUpperCase_SurrogatePair_009
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_0900
     * @tc.desc   Test toUpperCase with surrogate pair characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_SurrogatePair_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '𐍈';
      let result: string = str.toUpperCase();
      expect(result.length >= 2).assertTrue();
    });

    /**
     * @tc.name   StringToUpperCase_SurrogatePairMixed_010
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1000
     * @tc.desc   Test toUpperCase with surrogate pair mixed with ASCII
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_SurrogatePairMixed_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello 𐍈 world';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO 𐍈 WORLD');
    });

    /**
     * @tc.name   StringToUpperCase_UTF16Surrogate_011
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1100
     * @tc.desc   Test toUpperCase with UTF-16 surrogate pair validation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_UTF16Surrogate_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '𐍈';
      let codeUnit1: number = str.charCodeAt(0);
      let codeUnit2: number = str.charCodeAt(1);
      expect(codeUnit1 >= 0xD800 && codeUnit1 <= 0xDBFF).assertTrue();
      expect(codeUnit2 >= 0xDC00 && codeUnit2 <= 0xDFFF).assertTrue();
    });

    /**
     * @tc.name   StringToUpperCase_BMPChar_012
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1200
     * @tc.desc   Test toUpperCase with BMP character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_BMPChar_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'A';
      let length: number = str.length;
      expect(length).assertEqual(1);
      expect(str.charCodeAt(0) < 0x10000).assertTrue();
    });

    /**
     * @tc.name   StringToUpperCase_LatinCyrillicMix_013
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1300
     * @tc.desc   Test toUpperCase with Latin and Cyrillic mixed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LatinCyrillicMix_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello Мир';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO МИР');
    });

    /**
     * @tc.name   StringToUpperCase_LatinGreekMix_014
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1400
     * @tc.desc   Test toUpperCase with Latin and Greek mixed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LatinGreekMix_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Alpha βeta';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('ALPHA ΒETA');
    });

    /**
     * @tc.name   StringToUpperCase_LatinDigitMix_015
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1500
     * @tc.desc   Test toUpperCase with Latin letters and digits mixed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LatinDigitMix_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'abc123xyz';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('ABC123XYZ');
    });

    /**
     * @tc.name   StringToUpperCase_LatinCJKMix_016
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1600
     * @tc.desc   Test toUpperCase with Latin and CJK characters mixed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LatinCJKMix_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello 世界';
      let result: string = str.toUpperCase();
      expect(result).assertEqual('HELLO 世界');
    });

    /**
     * @tc.name   StringToUpperCase_LengthIncrease_017
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1700
     * @tc.desc   Test toUpperCase where length increases after conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LengthIncrease_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ß';
      let result: string = str.toUpperCase();
      expect(str.length).assertEqual(1);
      expect(result).assertEqual('SS');
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringToUpperCase_LengthSame_018
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1800
     * @tc.desc   Test toUpperCase where length stays the same
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LengthSame_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.toUpperCase();
      expect(str.length).assertEqual(result.length);
    });

    /**
     * @tc.name   StringToUpperCase_LengthMixed_019
     * @tc.number SUB_BUILTINS_STRING_TOUPPERCASE_UNICODE_1900
     * @tc.desc   Test toUpperCase with mixed length changes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToUpperCase_LengthMixed_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'straße';
      let result: string = str.toUpperCase();
      expect(str.length).assertEqual(6);
      expect(result).assertEqual('STRASSE');
      expect(result.length).assertEqual(7);
    });
  })
}
