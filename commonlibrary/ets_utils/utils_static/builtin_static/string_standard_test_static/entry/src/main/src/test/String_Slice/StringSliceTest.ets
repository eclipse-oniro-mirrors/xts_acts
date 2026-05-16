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

export default function StringSliceTest():void {
  describe('StringSliceTest', () => {
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
     * @tc.name   StringSlice_SingleParam_Positive_001
     * @tc.number SUB_BUILTINS_STRING_SLICE_SINGLE_POSITIVE_0100
     * @tc.desc   Test slice with positive integer indexStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_SingleParam_Positive_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The morning is upon us.";
      let result: string = str.slice(12);
      expect(result).assertEqual("is upon us.");
    });

    /**
     * @tc.name   StringSlice_SingleParam_Zero_002
     * @tc.number SUB_BUILTINS_STRING_SLICE_SINGLE_ZERO_0100
     * @tc.desc   Test slice with zero index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_SingleParam_Zero_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: string = str.slice(0);
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.name   StringSlice_SingleParam_Negative_003
     * @tc.number SUB_BUILTINS_STRING_SLICE_SINGLE_NEGATIVE_0100
     * @tc.desc   Test slice with negative integer indexStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_SingleParam_Negative_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The morning is upon us.";
      let result1: string = str.slice(-3);
      expect(result1).assertEqual("us.");
      let result2: string = str.slice(-11);
      expect(result2).assertEqual("is upon us.");
    });

    /**
     * @tc.name   StringSlice_SingleParam_ExceedLength_004
     * @tc.number SUB_BUILTINS_STRING_SLICE_SINGLE_EXCEED_0100
     * @tc.desc   Test slice when indexStart exceeds string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_SingleParam_ExceedLength_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.slice(5)).assertEqual("");
      expect(str.slice(10)).assertEqual("");
      expect(str.slice(100)).assertEqual("");
    });

    /**
     * @tc.name   StringSlice_SingleParam_Omit_005
     * @tc.number SUB_BUILTINS_STRING_SLICE_SINGLE_OMIT_0100
     * @tc.desc   Test slice without any parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_SingleParam_Omit_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: string = str.slice();
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.name   StringSlice_DoubleParam_Standard_006
     * @tc.number SUB_BUILTINS_STRING_SLICE_DOUBLE_STANDARD_0100
     * @tc.desc   Test slice with standard positive indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_DoubleParam_Standard_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The quick brown fox";
      let result: string = str.slice(4, 19);
      expect(result).assertEqual("quick brown fox");
    });

    /**
     * @tc.name   StringSlice_DoubleParam_NegativeEnd_007
     * @tc.number SUB_BUILTINS_STRING_SLICE_DOUBLE_NEGEND_0100
     * @tc.desc   Test slice with positive indexStart and negative indexEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_DoubleParam_NegativeEnd_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The morning is upon us.";
      let result1: string = str.slice(0, -1);
      expect(result1).assertEqual("The morning is upon us");
      let result2: string = str.slice(4, -2);
      expect(result2).assertEqual("morning is upon u");
    });

    /**
     * @tc.name   StringSlice_DoubleParam_BothNegative_008
     * @tc.number SUB_BUILTINS_STRING_SLICE_DOUBLE_BOTHNEG_0100
     * @tc.desc   Test slice with both parameters negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_DoubleParam_BothNegative_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The quick brown fox";
      let result1: string = str.slice(-9, -5);
      expect(result1).assertEqual("brow");
      let result2: string = str.slice(-3, -1);
      expect(result2).assertEqual("fo");
    });

    /**
     * @tc.name   StringSlice_DoubleParam_EndExceeds_009
     * @tc.number SUB_BUILTINS_STRING_SLICE_DOUBLE_ENDEXCEED_0100
     * @tc.desc   Test slice when indexEnd exceeds string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_DoubleParam_EndExceeds_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let result1: string = str.slice(1, 100);
      expect(result1).assertEqual("ello");
      let result2: string = str.slice(2, 5);
      expect(result2).assertEqual("llo");
    });

    /**
     * @tc.name   StringSlice_DoubleParam_Mixed_010
     * @tc.number SUB_BUILTINS_STRING_SLICE_DOUBLE_MIXED_0100
     * @tc.desc   Test slice with mixed positive and negative parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_DoubleParam_Mixed_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The morning is upon us.";
      let result1: string = str.slice(-11, 16);
      expect(result1).assertEqual("is u");
      let result2: string = str.slice(11, -7);
      expect(result2).assertEqual(" is u");
    });


    /**
     * @tc.name   StringSlice_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_SLICE_BOUNDARY_EMPTY_0100
     * @tc.desc   Test slice on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      expect(str.slice()).assertEqual("");
      expect(str.slice(0, 5)).assertEqual("");
      expect(str.slice(-5)).assertEqual("");
    });

    /**
     * @tc.name   StringSlice_SingleChar_002
     * @tc.number SUB_BUILTINS_STRING_SLICE_BOUNDARY_SINGLECHAR_0100
     * @tc.desc   Test slice on single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_SingleChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      expect(str.slice(0)).assertEqual("a");
      expect(str.slice(0, 1)).assertEqual("a");
      expect(str.slice(1)).assertEqual("");
      expect(str.slice(-1)).assertEqual("a");
      expect(str.slice(0, -1)).assertEqual("");
    });

    /**
     * @tc.name   StringSlice_EqualIndices_003
     * @tc.number SUB_BUILTINS_STRING_SLICE_BOUNDARY_EQUAL_0100
     * @tc.desc   Test slice when indexStart equals indexEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_EqualIndices_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.slice(2, 2)).assertEqual("");
      expect(str.slice(0, 0)).assertEqual("");
      expect(str.slice(-3, -3)).assertEqual("");
    });

    /**
     * @tc.name   StringSlice_StartGreaterThanEnd_004
     * @tc.number SUB_BUILTINS_STRING_SLICE_BOUNDARY_STARTGTEND_0100
     * @tc.desc   Test slice when indexStart is greater than indexEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_StartGreaterThanEnd_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.slice(4, 2)).assertEqual("");
      expect(str.slice(-2, -4)).assertEqual("");
      expect(str.slice(0, -10)).assertEqual("");
    });

    /**
     * @tc.name   StringSlice_ExtremeNegative_005
     * @tc.number SUB_BUILTINS_STRING_SLICE_BOUNDARY_EXTREMENEG_0100
     * @tc.desc   Test slice with extreme negative values exceeding string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_ExtremeNegative_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.slice(-100)).assertEqual("Hello");
      expect(str.slice(-100, -50)).assertEqual("");
    });


    /**
     * @tc.name   StringSlice_WithTrim_001
     * @tc.number SUB_BUILTINS_STRING_SLICE_COMBINE_TRIM_0100
     * @tc.desc   Test slice combined with trim method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_WithTrim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "  Hello World  ";
      let result1: string = str.trim().slice(0, 5);
      expect(result1).assertEqual("Hello");
      let result2: string = str.slice(0, 8).trim();
      expect(result2).assertEqual("Hello");
    });

    /**
     * @tc.name   StringSlice_WithIndexOf_002
     * @tc.number SUB_BUILTINS_STRING_SLICE_COMBINE_INDEXOF_0100
     * @tc.desc   Test slice combined with indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_WithIndexOf_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let email: string = "user@example.com";
      let atIndex: int = email.indexOf('@');
      let username: string = email.slice(0, atIndex);
      let domain: string = email.slice(atIndex + 1);
      expect(username).assertEqual("user");
      expect(domain).assertEqual("example.com");
    });

    /**
     * @tc.name   StringSlice_WithConcat_003
     * @tc.number SUB_BUILTINS_STRING_SLICE_COMBINE_CONCAT_0100
     * @tc.desc   Test slice combined with concat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_WithConcat_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = "Hello";
      let str2: string = "World";
      let result: string = str1.slice(0, 3).concat(str2.slice(0, 3));
      expect(result).assertEqual("HelWor");
    });

    /**
     * @tc.name   StringSlice_WithRepeat_004
     * @tc.number SUB_BUILTINS_STRING_SLICE_COMBINE_REPEAT_0100
     * @tc.desc   Test slice combined with repeat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_WithRepeat_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abc";
      let result: string = str.slice(0, 2).repeat(3);
      expect(result).assertEqual("ababab");
    });

    /**
     * @tc.name   StringSlice_WithCaseChange_005
     * @tc.number SUB_BUILTINS_STRING_SLICE_COMBINE_CASE_0100
     * @tc.desc   Test slice combined with toLowerCase/toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_WithCaseChange_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result1: string = str.slice(0, 5).toLowerCase();
      let result2: string = str.slice(6).toUpperCase();
      expect(result1).assertEqual("hello");
      expect(result2).assertEqual("WORLD");
    });


    /**
     * @tc.name   StringSlice_NegativeIndexComparison_001
     * @tc.number SUB_BUILTINS_STRING_SLICE_COMPARE_NEGATIVE_0100
     * @tc.desc   Compare slice with substring on negative index handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_NegativeIndexComparison_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let sliceResult1: string = str.slice(-5);
      let substringResult1: string = str.substring(-5);
      expect(sliceResult1).assertEqual("World");
      expect(substringResult1).assertEqual("Hello World");

      let sliceResult2: string = str.slice(6, -1);
      let substringResult2: string = str.substring(6, -1);
      expect(sliceResult2).assertEqual("Worl");
      expect(substringResult2).assertEqual("Hello ");
    });

    /**
     * @tc.name   StringSlice_ParameterOrderComparison_002
     * @tc.number SUB_BUILTINS_STRING_SLICE_COMPARE_ORDER_0100
     * @tc.desc   Compare slice with substring when start > end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_ParameterOrderComparison_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let sliceResult: string = str.slice(4, 2);
      let substringResult: string = str.substring(4, 2);
      expect(sliceResult).assertEqual("");
      expect(substringResult).assertEqual("ll");
    });


    /**
     * @tc.name   StringSlice_Immutability_001
     * @tc.number SUB_BUILTINS_STRING_SLICE_RETURN_IMMUTABLE_0100
     * @tc.desc   Test that slice doesn't modify original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_Immutability_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: string = str.slice(0, 5);
      expect(str).assertEqual("Hello World");
      expect(result).assertEqual("Hello");
      expect(str === result).assertFalse();
    });

    /**
     * @tc.name   StringSlice_ReturnIndependence_002
     * @tc.number SUB_BUILTINS_STRING_SLICE_RETURN_INDEPENDENT_0100
     * @tc.desc   Test that returned string is independent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_ReturnIndependence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let sliced: string = str.slice(0, 2);
      expect(sliced).assertEqual("He");
      expect(str === sliced).assertFalse();
    });

    /**
     * @tc.name   StringSlice_ReturnType_003
     * @tc.number SUB_BUILTINS_STRING_SLICE_RETURN_TYPE_0100
     * @tc.desc   Test that slice always returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_ReturnType_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let result1: string = str.slice(0, 3);
      let result2: string = str.slice(10);
      let result3: string = str.slice();
      expect(typeof (result1)).assertEqual("string");
      expect(typeof (result2)).assertEqual("string");
      expect(typeof (result3)).assertEqual("string");
    });

    /**
     * @tc.name   StringSlice_EmptyReturns_004
     * @tc.number SUB_BUILTINS_STRING_SLICE_RETURN_EMPTY_0100
     * @tc.desc   Test various cases that return empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_EmptyReturns_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.slice(5, 5)).assertEqual("");
      expect(str.slice(10, 20)).assertEqual("");
      expect(str.slice(3, 1)).assertEqual("");
      expect(str.slice(0, -10)).assertEqual("");
    });

    /**
     * @tc.name   StringSlice_ChineseCharacters_001
     * @tc.number SUB_BUILTINS_STRING_SLICE_UNICODE_CHINESE_0100
     * @tc.desc   Test slice with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_ChineseCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "你好世界Hello";
      let result1: string = str.slice(0, 2);
      expect(result1).assertEqual("你好");
      let result2: string = str.slice(2, 4);
      expect(result2).assertEqual("世界");
      let result3: string = str.slice(4);
      expect(result3).assertEqual("Hello");
    });

    /**
     * @tc.name   StringSlice_EmojiCharacters_002
     * @tc.number SUB_BUILTINS_STRING_SLICE_UNICODE_EMOJI_0100
     * @tc.desc   Test slice with emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_EmojiCharacters_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello😊World";
      let result1: string = str.slice(0, 5);
      expect(result1).assertEqual("Hello");
      let result2: string = str.slice(5, 7);
      expect(result2).assertEqual("😊");
      let result3: string = str.slice(7);
      expect(result3).assertEqual("World");
    });

    /**
     * @tc.name   StringSlice_SpecialUnicode_003
     * @tc.number SUB_BUILTINS_STRING_SLICE_UNICODE_SPECIAL_0100
     * @tc.desc   Test slice with special Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringSlice_SpecialUnicode_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello©World™";
      let result1: string = str.slice(5, 6);
      expect(result1).assertEqual("©");
      let result2: string = str.slice(0, 10);
      expect(result2).assertEqual("Hello©Worl");
    });
  })
}
