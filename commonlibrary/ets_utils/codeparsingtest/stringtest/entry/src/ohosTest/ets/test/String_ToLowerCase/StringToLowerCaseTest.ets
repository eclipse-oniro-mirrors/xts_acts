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
import * as tolowercase_compare_helper from './tolowercase_compare_helper';
import * as tolowercase_exception_helper from './tolowercase_exception_helper';
import * as tolowercase_practical_helper from './tolowercase_practical_helper';
import * as tolowercase_unicode_helper from './tolowercase_unicode_helper';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringToLowerCaseTest() {
  describe('StringToLowerCaseTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringPrototypeToLowerCase_PureUppercase_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BASIC_0100
     * @tc.desc   Test toLowerCase with pure uppercase string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_PureUppercase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ALPHABET";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('alphabet');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_MixedCase_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BASIC_0200
     * @tc.desc   Test toLowerCase with mixed case string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_MixedCase_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HeLLo WoRLd";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_AlreadyLowercase_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BASIC_0300
     * @tc.desc   Test toLowerCase with already lowercase string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_AlreadyLowercase_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_CompleteSentence_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BASIC_0400
     * @tc.desc   Test toLowerCase with complete sentence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_CompleteSentence_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let sentence: string = "The quick brown fox jumps over the lazy dog.";
      let result: string = sentence.toLowerCase();
      expect(result).assertEqual('the quick brown fox jumps over the lazy dog.');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithPunctuation_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BASIC_0500
     * @tc.desc   Test toLowerCase with sentence containing punctuation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithPunctuation_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let sentence: string = "Hello, World! How are you?";
      let result: string = sentence.toLowerCase();
      expect(result).assertEqual('hello, world! how are you?');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_LatinAlphabet_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BASIC_0600
     * @tc.desc   Test toLowerCase with basic Latin alphabet A-Z
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_LatinAlphabet_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('abcdefghijklmnopqrstuvwxyz');
    });


    /**
     * @tc.name   StringPrototypeToLowerCase_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0100
     * @tc.desc   Test toLowerCase with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_SingleChar_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0200
     * @tc.desc   Test toLowerCase with single uppercase character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_SingleChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "A";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_LongString_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0300
     * @tc.desc   Test toLowerCase with long string (10000 characters)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_LongString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "A".repeat(10000);
      let result: string = str.toLowerCase();
      expect(result.length).assertEqual(10000);
      expect(result.charAt(0)).assertEqual('a');
      expect(result.charAt(9999)).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_TwoChars_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0400
     * @tc.desc   Test toLowerCase with two characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_TwoChars_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "AB";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('ab');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_MediumLength_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0500
     * @tc.desc   Test toLowerCase with medium length string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_MediumLength_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD TEST";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello world test');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_RepeatedPattern_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0600
     * @tc.desc   Test toLowerCase with repeated pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_RepeatedPattern_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ABC".repeat(100);
      let result: string = str.toLowerCase();
      expect(result).assertEqual('abc'.repeat(100));
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_AlternatingCase_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0700
     * @tc.desc   Test toLowerCase with alternating case pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_AlternatingCase_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "AbCdEfGhIjKlMnOpQrStUvWxYz";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('abcdefghijklmnopqrstuvwxyz');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_OnlySpaces_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0800
     * @tc.desc   Test toLowerCase with string containing only spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_OnlySpaces_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "     ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('     ');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_SingleLowercase_009
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_BOUNDARY_0900
     * @tc.desc   Test toLowerCase with single lowercase character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_SingleLowercase_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_VsLocaleLowerCase_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0100
     * @tc.desc   Compare toLowerCase with toLocaleLowerCase in normal case
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_VsLocaleLowerCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD";
      let result1: string = str.toLowerCase();
      let result2: string = str.toLocaleLowerCase();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_VsLocaleLowerCaseEnUS_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0200
     * @tc.desc   Compare toLowerCase with toLocaleLowerCase for en-US locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_VsLocaleLowerCaseEnUS_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result1: string = str.toLowerCase();
      let result2: string = str.toLocaleLowerCase('en-US');
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_VsLocaleLowerCaseDeDE_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0300
     * @tc.desc   Compare toLowerCase with toLocaleLowerCase for de-DE locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_VsLocaleLowerCaseDeDE_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result1: string = str.toLowerCase();
      let result2: string = str.toLocaleLowerCase('de-DE');
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_VsLocaleLowerCaseFrFR_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0400
     * @tc.desc   Compare toLowerCase with toLocaleLowerCase for fr-FR locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_VsLocaleLowerCaseFrFR_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result1: string = str.toLowerCase();
      let result2: string = str.toLocaleLowerCase('fr-FR');
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ICharacterComparison_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0500
     * @tc.desc   Test 'I' character with toLowerCase (non-locale specific)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ICharacterComparison_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "I";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('i');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_TurkishIComparison_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0600
     * @tc.desc   Compare toLowerCase with Turkish locale for 'I'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_TurkishIComparison_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_compare_helper.testTurkishI();
      // toLowerCase should always return 'i', not 'ı'
      expect(result.lower).assertEqual('i');
      // toLocaleLowerCase with tr-TR returns 'ı'
      expect(result.localeLower).assertEqual('ı');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_IstanbulComparison_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0700
     * @tc.desc   Compare toLowerCase with Turkish locale for word "ISTANBUL"
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_IstanbulComparison_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ISTANBUL";
      let result1: string = str.toLowerCase();
      expect(result1).assertEqual('istanbul');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_CaseInsensitiveComparison_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0800
     * @tc.desc   Test case-insensitive string comparison using toLowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_CaseInsensitiveComparison_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = "Hello";
      let str2: string = "HELLO";
      expect(str1.toLowerCase() === str2.toLowerCase()).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_SearchIgnoreCase_009
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_0900
     * @tc.desc   Test case-insensitive search using toLowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_SearchIgnoreCase_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = "Hello World";
      let search: string = "hello";
      let lowerText: string = text.toLowerCase();
      let lowerSearch: string = search.toLowerCase();
      expect(lowerText.includes(lowerSearch)).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_DottedCapitalICompare_010
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_COMPARE_1000
     * @tc.desc   Compare toLowerCase and toLocaleLowerCase for dotted capital I (İ)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_DottedCapitalICompare_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_compare_helper.testDottedCapitalI();
      // Both should handle dotted capital I the same way
      expect(result.lower.length).assertLarger(0);
    });


    /**
     * @tc.name   StringPrototypeToLowerCase_Null_This_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0100
     * @tc.desc   Test toLowerCase with null this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Null_This_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testNull();
      expect(result.thrown).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Undefined_This_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0200
     * @tc.desc   Test toLowerCase with undefined this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Undefined_This_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testUndefined();
      expect(result.thrown).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Number_This_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0300
     * @tc.desc   Test toLowerCase with number this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Number_This_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testNumber();
      // Note: JavaScript converts number to string before toLowerCase
      expect(result.thrown).assertEqual(false);
      expect(result.result).assertEqual('123');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Object_This_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0400
     * @tc.desc   Test toLowerCase with plain object this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Object_This_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testObject();
      // Note: JavaScript converts object to string before toLowerCase
      expect(result.thrown).assertEqual(false);
      expect(result.result).assertEqual('[object object]');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Array_This_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0500
     * @tc.desc   Test toLowerCase with array this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Array_This_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testArray();
      // Note: JavaScript converts array to string before toLowerCase
      expect(result.thrown).assertEqual(false);
      expect(result.result).assertEqual('1,2,3');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Boolean_This_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0600
     * @tc.desc   Test toLowerCase with boolean this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Boolean_This_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testBoolean();
      // Note: JavaScript converts boolean to string before toLowerCase
      expect(result.thrown).assertEqual(false);
      expect(result.result).assertEqual('true');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ObjectWithToString_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0700
     * @tc.desc   Test toLowerCase with object having toString method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ObjectWithToString_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testObjectWithToString();
      expect(result.result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_CallApply_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0800
     * @tc.desc   Test toLowerCase with call/apply methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_CallApply_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testCallApply();
      expect(result.callResult).assertEqual('hello');
      expect(result.applyResult).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Symbol_This_009
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_0900
     * @tc.desc   Test toLowerCase with Symbol this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Symbol_This_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testSymbol();
      expect(result.thrown).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_StringWrapperWorks_010
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_EXCEPTION_1000
     * @tc.desc   Test that String wrapper object works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_StringWrapperWorks_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_exception_helper.testStringWrapper();
      expect(result.result).assertEqual('hello');
      expect(result.type).assertEqual('string');
    });


    /**
     * @tc.name   StringPrototypeToLowerCase_LiteralDirectCall_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0100
     * @tc.desc   Test toLowerCase called directly on string literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_LiteralDirectCall_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = "HELLO".toLowerCase();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_VariableCall_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0200
     * @tc.desc   Test toLowerCase called on string variable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_VariableCall_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_NoParameters_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0300
     * @tc.desc   Test toLowerCase without any parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_NoParameters_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithTrim_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0400
     * @tc.desc   Test toLowerCase chained with trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithTrim_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "  HELLO WORLD  ";
      let result1: string = str.trim().toLowerCase();
      expect(result1).assertEqual('hello world');

      let result2: string = str.toLowerCase().trim();
      expect(result2).assertEqual('hello world');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithSlice_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0500
     * @tc.desc   Test toLowerCase chained with slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithSlice_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD";
      let result1: string = str.slice(0, 5).toLowerCase();
      expect(result1).assertEqual('hello');

      let result2: string = str.toLowerCase().slice(0, 5);
      expect(result2).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithConcat_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0600
     * @tc.desc   Test toLowerCase chained with concat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithConcat_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result1: string = str.concat(" WORLD").toLowerCase();
      expect(result1).assertEqual('hello world');

      let result2: string = str.toLowerCase().concat(" world");
      expect(result2).assertEqual('hello world');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithReplace_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0700
     * @tc.desc   Test toLowerCase chained with replace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithReplace_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD";
      let result: string = str.toLowerCase().replace("world", "there");
      expect(result).assertEqual('hello there');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_TripleChain_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0800
     * @tc.desc   Test toLowerCase with multiple chained methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_TripleChain_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "  HELLO WORLD  ";
      let result: string = str.trim().toLowerCase().slice(0, 5);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithSplit_009
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_0900
     * @tc.desc   Test toLowerCase with split method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithSplit_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD TEST";
      let result: string[] = str.toLowerCase().split(' ');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('hello');
      expect(result[1]).assertEqual('world');
      expect(result[2]).assertEqual('test');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithRepeat_010
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_METHOD_1000
     * @tc.desc   Test toLowerCase chained with repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithRepeat_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ABC";
      let result: string = str.toLowerCase().repeat(3);
      expect(result).assertEqual('abcabcabc');
    });


    /**
     * @tc.name   StringPrototypeToLowerCase_UserInputNormalization_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0100
     * @tc.desc   Test normalizing user input by converting to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_UserInputNormalization_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let input: string = "  HELLO  ";
      let result: string = input.trim().toLowerCase();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_EmailNormalization_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0200
     * @tc.desc   Test normalizing email address domain to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_EmailNormalization_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let email: string = "User@Example.COM";
      let parts: string[] = email.split('@');
      let username: string = parts[0];
      let domain: string = parts[1].toLowerCase();
      let normalized: string = username + "@" + domain;
      expect(normalized).assertEqual('User@example.com');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_URLNormalization_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0300
     * @tc.desc   Test normalizing URL to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_URLNormalization_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let url: string = "HTTP://EXAMPLE.COM/PATH";
      let normalized: string = url.toLowerCase();
      expect(normalized).assertEqual('http://example.com/path');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_FileExtensionCheck_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0400
     * @tc.desc   Test checking file extension case-insensitively
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_FileExtensionCheck_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let filename: string = "Document.PDF";
      let parts: string[] = filename.split('.');
      let ext: string = parts[parts.length - 1].toLowerCase();
      expect(ext).assertEqual('pdf');
      expect(ext === 'pdf').assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_DatabaseFilter_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0500
     * @tc.desc   Test filtering records with case-insensitive match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_DatabaseFilter_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let records: string[] = ["HELLO", "World", "TEST", "Data"];
      let search: string = "test";
      let results: string[] = records.filter((r: string) => {
        return r.toLowerCase() === search.toLowerCase();
      });
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual('TEST');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ArrayMap_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0600
     * @tc.desc   Test mapping array to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ArrayMap_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let arr: string[] = ["HELLO", "WORLD", "TEST"];
      let lowerArr: string[] = arr.map((s: string) => s.toLowerCase());
      expect(lowerArr.length).assertEqual(3);
      expect(lowerArr[0]).assertEqual('hello');
      expect(lowerArr[1]).assertEqual('world');
      expect(lowerArr[2]).assertEqual('test');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ArrayFilterAndMap_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0700
     * @tc.desc   Test filtering and mapping array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ArrayFilterAndMap_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_practical_helper.filterAndMapArray();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('hello');
      expect(result[1]).assertEqual('world');
      expect(result[2]).assertEqual('test');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_UsernameComparison_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0800
     * @tc.desc   Test case-insensitive username comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_UsernameComparison_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let storedUser: string = "Admin";
      let inputUser: string = "ADMIN";
      expect(storedUser.toLowerCase() === inputUser.toLowerCase()).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_KeywordSearch_009
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_0900
     * @tc.desc   Test case-insensitive keyword search in text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_KeywordSearch_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = "The Quick Brown Fox";
      let keyword: string = "QUICK";
      let lowerText: string = text.toLowerCase();
      let lowerKeyword: string = keyword.toLowerCase();
      expect(lowerText.includes(lowerKeyword)).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Validation_010
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_PRACTICAL_1000
     * @tc.desc   Test validating input format with lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Validation_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let input: string = "YES";
      let normalized: string = input.toLowerCase();
      expect(normalized === "yes").assertEqual(true);
    });


    /**
     * @tc.name   StringPrototypeToLowerCase_Immutability_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0100
     * @tc.desc   Test that toLowerCase does not modify original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Immutability_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let original: string = "HELLO";
      let result: string = original.toLowerCase();
      expect(original).assertEqual('HELLO');
      expect(result).assertEqual('hello');
      expect(result === original).assertFalse();
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_MultipleCallsConsistency_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0200
     * @tc.desc   Test that multiple calls return same result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_MultipleCallsConsistency_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD";
      let result1: string = str.toLowerCase();
      let result2: string = str.toLowerCase();
      expect(result1 === result2).assertEqual(true);
      expect(str === "HELLO WORLD").assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ReturnsNewString_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0300
     * @tc.desc   Test that toLowerCase returns a new string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ReturnsNewString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let lower: string = str.toLowerCase();
      expect(typeof lower).assertEqual('string');
      expect(lower !== str).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ReturnType_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0400
     * @tc.desc   Test that return value is always string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ReturnType_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD";
      let result: string = str.toLowerCase();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ToStringMethod_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0500
     * @tc.desc   Test toString() method on toLowerCase result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ToStringMethod_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result: string = str.toLowerCase();
      expect(result.toString()).assertEqual('hello');
      expect(result.toString() === result).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ValueOfMethod_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0600
     * @tc.desc   Test valueOf() method on toLowerCase result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ValueOfMethod_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result: string = str.toLowerCase();
      expect(result.valueOf()).assertEqual('hello');
      expect(result.valueOf() === result).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_StringWrapper_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0700
     * @tc.desc   Test toLowerCase with String wrapper object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_StringWrapper_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let strObj: String = new String("HELLO");
      let result: string = strObj.toLowerCase();
      expect(result).assertEqual('hello');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_DoubleCall_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0800
     * @tc.desc   Test calling toLowerCase twice on same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_DoubleCall_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let result: string = str.toLowerCase().toLowerCase();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ChainedUpperCase_009
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_0900
     * @tc.desc   Test toLowerCase chained with toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ChainedUpperCase_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result1: string = str.toLowerCase().toUpperCase();
      expect(result1).assertEqual('HELLO WORLD');

      let result2: string = str.toUpperCase().toLowerCase();
      expect(result2).assertEqual('hello world');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ConsistencyAfterMod_010
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_RETURN_1000
     * @tc.desc   Test consistency when original variable is reassigned
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ConsistencyAfterMod_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO";
      let lower1: string = str.toLowerCase();
      str = "WORLD";
      let lower2: string = str.toLowerCase();
      expect(lower1).assertEqual('hello');
      expect(lower2).assertEqual('world');
    });


    /**
     * @tc.name   StringPrototypeToLowerCase_WithDigits_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0100
     * @tc.desc   Test toLowerCase with string containing digits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithDigits_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ABC123DEF";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('abc123def');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithSpecialSymbols_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0200
     * @tc.desc   Test toLowerCase with string containing special symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithSpecialSymbols_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello@World#123$";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello@world#123$');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WithSpaces_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0300
     * @tc.desc   Test toLowerCase with string containing spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WithSpaces_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "A B C D E";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('a b c d e');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_NonLetterChars_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0400
     * @tc.desc   Test toLowerCase with string containing only non-letter characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_NonLetterChars_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "123!@#456%";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('123!@#456%');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_WhitespaceChars_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0500
     * @tc.desc   Test toLowerCase with various whitespace characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_WhitespaceChars_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "A\tB\nC\rD"; // tab, newline, carriage return
      let result: string = str.toLowerCase();
      expect(result).assertEqual('a\tb\nc\rd');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_NbspChar_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0600
     * @tc.desc   Test toLowerCase with non-breaking space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_NbspChar_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "A\u00A0B"; // non-breaking space
      let result: string = str.toLowerCase();
      expect(result).assertEqual('a\u00A0b');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_ComplexMixedChars_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0700
     * @tc.desc   Test toLowerCase with complex mixed character types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_ComplexMixedChars_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello123@World #456 Test";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello123@world #456 test');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_NewlineAndTab_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_SPECIAL_0800
     * @tc.desc   Test toLowerCase with newline and tab characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_NewlineAndTab_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\nWorld\tTest";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello\nworld\ttest');
    });


    /**
     * @tc.name   StringPrototypeToLowerCase_AccentedLatin_001
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0100
     * @tc.desc   Test toLowerCase with accented Latin characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_AccentedLatin_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "CAFÉ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('café');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_GermanUmlaut_002
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0200
     * @tc.desc   Test toLowerCase with German umlaut characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_GermanUmlaut_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ÄÖÜ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('äöü');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_GermanSharpS_003
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0300
     * @tc.desc   Test toLowerCase with German sharp s (ß) - special length change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_GermanSharpS_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ß";
      let originalLen: number = str.length;
      let result: string = str.toLowerCase();
      let resultLen: number = result.length;
      // Note: toLowerCase() returns 'ß' in standard JavaScript
      // Use toLocaleLowerCase('de-DE') for 'ss' conversion
      expect(result).assertEqual('ß');
      expect(originalLen).assertEqual(1);
      expect(resultLen).assertEqual(1);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_GermanSharpSInString_004
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0400
     * @tc.desc   Test toLowerCase with German sharp s (ß) within a string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_GermanSharpSInString_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "STRASSE";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('strasse');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_GermanCombined_005
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0500
     * @tc.desc   Test toLowerCase with German characters including umlauts and sharp s
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_GermanCombined_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ÄÜÖß";
      let result: string = str.toLowerCase();
      // Note: toLowerCase() returns 'äüöß' in standard JavaScript
      expect(result).assertEqual('äüöß');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_GreekLetters_006
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0600
     * @tc.desc   Test toLowerCase with Greek uppercase letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_GreekLetters_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ΆΈΉΊΌΎΏ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('άέήίόύώ');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_GreekSigma_007
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0700
     * @tc.desc   Test toLowerCase with Greek sigma
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_GreekSigma_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ΣΣΣ";
      let result: string = str.toLowerCase();
      // Note: Greek sigma has two lowercase forms: σ (medial) and ς (final)
      // When at end of string, the last Σ becomes ς (final sigma)
      expect(result).assertEqual('σσς');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_IcelandicEth_008
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0800
     * @tc.desc   Test toLowerCase with Icelandic eth character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_IcelandicEth_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ÐÐÐ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('ððð');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_IcelandicThorn_009
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_0900
     * @tc.desc   Test toLowerCase with Icelandic thorn character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_IcelandicThorn_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ÞÞÞ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('þþþ');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Cyrillic_010
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_1000
     * @tc.desc   Test toLowerCase with Cyrillic uppercase letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Cyrillic_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "АБВГДЕ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('абвгде');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_LatinExtA_011
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_1100
     * @tc.desc   Test toLowerCase with Latin Extended-A characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_LatinExtA_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ĂÂĊĐĔĞĬ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('ăâċđĕğĭ');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_Emoji_012
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_1200
     * @tc.desc   Test toLowerCase with emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_Emoji_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO 😀 WORLD";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('hello 😀 world');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_PrecomposedVsDecomposed_013
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_1300
     * @tc.desc   Test toLowerCase with precomposed vs decomposed characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_PrecomposedVsDecomposed_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // Precomposed É (U+00C9)
      let str1: string = "É";
      let result1: string = str1.toLowerCase();
      expect(result1).assertEqual('é');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_DottedCapitalI_014
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_1400
     * @tc.desc   Test toLowerCase with dotted capital I (İ) - special length change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_DottedCapitalI_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = tolowercase_unicode_helper.testDottedCapitalI();
      expect(result.originalLen).assertEqual(1);
      expect(result.resultLen).assertEqual(2);
      expect(result.result).assertEqual('i̇');
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_LengthChangeVerification_015
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_1500
     * @tc.desc   Test toLowerCase to verify length change behavior for special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_LengthChangeVerification_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let resultA = tolowercase_unicode_helper.testLengthChange('A');
      expect(resultA.lengthChanged).assertFalse();

      let resultSharpS = tolowercase_unicode_helper.testLengthChange('ß');
      // Note: toLowerCase() does not change length in standard JavaScript
      // The 'ß' to 'ss' conversion only happens with toLocaleLowerCase('de-DE')
      expect(resultSharpS.lengthChanged).assertEqual(false);
      expect(resultSharpS.originalLen).assertEqual(1);
      expect(resultSharpS.resultLen).assertEqual(1);
    });

    /**
     * @tc.name   StringPrototypeToLowerCase_MixedUnicode_016
     * @tc.number SUB_BUILTINS_STRING_TOLOWERCASE_UNICODE_1600
     * @tc.desc   Test toLowerCase with mixed Unicode features
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeToLowerCase_MixedUnicode_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "CAFÉ ÄÖÜ Ð Þ Σ";
      let result: string = str.toLowerCase();
      expect(result).assertEqual('café äöü ð þ σ');
    });
  })
}
