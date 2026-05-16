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
  testNoSeparator,
  testUndefinedSeparator,
  testNullSeparator,
  testBooleanTrueSeparator,
  testBooleanFalseSeparator,
  testNumberSeparator,
  testEmptyArraySeparator,
  testNegativeNumberSeparator,
  testFloatNumberSeparator,
  testZeroNumberSeparator
} from './String_Prototype_Split_BasicTest_JS';

import {
  testBasicCustomSplitter,
  testCustomSplitterWithLimit,
  testConditionalSplitter,
  testFilterSplitter
} from './String_Prototype_Split_CustomTest_JS';

import {
  testInvalidRegex,
  testSymbolSplitNonArray,
  testSymbolSplitThrowsError
} from './String_Prototype_Split_ErrorTest_JS';

import {
  testLimitNull,
  testLimitNegative,
  testLimitStringNumber,
  testLimitBoolean,
  testLimitSmallFloat
} from './String_Prototype_Split_LimitTest_JS';

import {
  testCallWithString,
  testCallWithNumber,
  testCallWithObject,
  testStringWrapper,
  testInheritedString
} from './String_Prototype_Split_ThisBindingTest_JS';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringPrototypeSplitBasicTest() {
  describe('StringPrototypeSplitBasicTest', () => {
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
     * @tc.name   StringPrototypeSplit_SingleCharSeparator_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0100
     * @tc.desc   Test split with single character separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SingleCharSeparator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: string[] = str.split(" ");
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
    });

    /**
     * @tc.name   StringPrototypeSplit_MultiCharSeparator_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0200
     * @tc.desc   Test split with multi-character separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_MultiCharSeparator_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abc123def456ghi";
      let result: string[] = str.split("123");
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("abc");
      expect(result[1]).assertEqual("def456ghi");
    });

    /**
     * @tc.name   StringPrototypeSplit_EmptyStringSeparator_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0300
     * @tc.desc   Test split with empty string separator (splits into characters)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_EmptyStringSeparator_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello";
      let result: string[] = str.split("");
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("h");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("l");
      expect(result[3]).assertEqual("l");
      expect(result[4]).assertEqual("o");
    });

    /**
     * @tc.name   StringPrototypeSplit_NoSeparator_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0400
     * @tc.desc   Test split without separator parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_NoSeparator_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testNoSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValue);
    });

    /**
     * @tc.name   StringPrototypeSplit_UndefinedSeparator_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0500
     * @tc.desc   Test split with undefined as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_UndefinedSeparator_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testUndefinedSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValue);
    });

    /**
     * @tc.name   StringPrototypeSplit_NullSeparator_006
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0600
     * @tc.desc   Test split with null as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_NullSeparator_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testNullSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

    /**
     * @tc.name   StringPrototypeSplit_BooleanTrueSeparator_007
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0700
     * @tc.desc   Test split with true as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_BooleanTrueSeparator_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testBooleanTrueSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

    /**
     * @tc.name   StringPrototypeSplit_BooleanFalseSeparator_008
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0800
     * @tc.desc   Test split with false as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_BooleanFalseSeparator_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testBooleanFalseSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
    });

    /**
     * @tc.name   StringPrototypeSplit_NumberSeparator_009
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_0900
     * @tc.desc   Test split with number as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_NumberSeparator_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testNumberSeparator(2);
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
      expect(testResult.result[2]).assertEqual(testResult.expectedValues[2]);
    });

    /**
     * @tc.name   StringPrototypeSplit_SeparatorNotFound_010
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1000
     * @tc.desc   Test split with separator that doesn't exist in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SeparatorNotFound_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: string[] = str.split("xyz");
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("Hello World");
    });

    /**
     * @tc.name   StringPrototypeSplit_ConsecutiveSeparators_011
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1100
     * @tc.desc   Test split with consecutive separators (produces empty strings)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ConsecutiveSeparators_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,,b";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("");
      expect(result[2]).assertEqual("b");
    });

    /**
     * @tc.name   StringPrototypeSplit_SeparatorAtStart_012
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1200
     * @tc.desc   Test split with separator at the start of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SeparatorAtStart_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = ",Hello,World";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("Hello");
      expect(result[2]).assertEqual("World");
    });

    /**
     * @tc.name   StringPrototypeSplit_SeparatorAtEnd_013
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1300
     * @tc.desc   Test split with separator at the end of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SeparatorAtEnd_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello,World,";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
      expect(result[2]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_TabSeparator_014
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1400
     * @tc.desc   Test split with tab character separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_TabSeparator_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Jan\tFeb\tMar";
      let result: string[] = str.split("\t");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("Jan");
      expect(result[1]).assertEqual("Feb");
      expect(result[2]).assertEqual("Mar");
    });

    /**
     * @tc.name   StringPrototypeSplit_NewlineSeparator_015
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1500
     * @tc.desc   Test split with newline character separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_NewlineSeparator_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "line1\nline2\nline3";
      let result: string[] = str.split("\n");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("line1");
      expect(result[1]).assertEqual("line2");
      expect(result[2]).assertEqual("line3");
    });

    /**
     * @tc.name   StringPrototypeSplit_MultipleConsecutiveSeparators_016
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1600
     * @tc.desc   Test split with multiple consecutive separators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_MultipleConsecutiveSeparators_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,,,b";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("");
      expect(result[2]).assertEqual("");
      expect(result[3]).assertEqual("b");
    });

    /**
     * @tc.name   StringPrototypeSplit_OnlySeparator_017
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1700
     * @tc.desc   Test split with string containing only separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_OnlySeparator_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = ",";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_AllSeparators_018
     * @tc.number SUB_BUILTINS_STRING_SPLIT_BASIC_1800
     * @tc.desc   Test split with string containing all same separators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_AllSeparators_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = ",,,,";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("");
      expect(result[2]).assertEqual("");
      expect(result[3]).assertEqual("");
      expect(result[4]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_SingleCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0100
     * @tc.desc   Test split with regex containing single capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SingleCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello1World2Test";
      let result: string[] = str.split(/(\d)/);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("1");
      expect(result[2]).assertEqual("World");
      expect(result[3]).assertEqual("2");
      expect(result[4]).assertEqual("Test");
    });

    /**
     * @tc.name   StringPrototypeSplit_MultipleCaptureGroups_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0200
     * @tc.desc   Test split with regex containing multiple capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_MultipleCaptureGroups_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1b2c3";
      let result: string[] = str.split(/(\d)(\w)/);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("1");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual("");
      expect(result[4]).assertEqual("2");
      expect(result[5]).assertEqual("c");
      expect(result[6]).assertEqual("3");
    });

    /**
     * @tc.name   StringPrototypeSplit_CaptureGroupWithLimit_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0300
     * @tc.desc   Test split with capture group and limit parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CaptureGroupWithLimit_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1b2c3d4";
      let result: string[] = str.split(/(\d)/, 5);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("1");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual("2");
      expect(result[4]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_CaptureGroupComplexRegex_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0400
     * @tc.desc   Test split with capture group in complex regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CaptureGroupComplexRegex_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "key1=value1;key2=value2";
      let result: string[] = str.split(/([;=])/);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual("key1");
      expect(result[1]).assertEqual("=");
      expect(result[2]).assertEqual("value1");
      expect(result[3]).assertEqual(";");
      expect(result[4]).assertEqual("key2");
      expect(result[5]).assertEqual("=");
      expect(result[6]).assertEqual("value2");
    });

    /**
     * @tc.name   StringPrototypeSplit_CaptureGroupLetterDigit_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0500
     * @tc.desc   Test split with capture group for letters and digits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CaptureGroupLetterDigit_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1b2c3";
      let result: string[] = str.split(/([0-9])/);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("1");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual("2");
      expect(result[4]).assertEqual("c");
      expect(result[5]).assertEqual("3");
      expect(result[6]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_CaptureGroupSeparator_006
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0600
     * @tc.desc   Test split with capture group for comma separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CaptureGroupSeparator_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,b,c";
      let result: string[] = str.split(/(,)/);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(",");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual(",");
      expect(result[4]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_CaptureGroupWordBoundary_007
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0700
     * @tc.desc   Test split with word boundary capture
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CaptureGroupWordBoundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world test";
      let result: string[] = str.split(/(\s)/);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual(" ");
      expect(result[2]).assertEqual("world");
      expect(result[3]).assertEqual(" ");
      expect(result[4]).assertEqual("test");
    });

    /**
     * @tc.name   StringPrototypeSplit_CaptureGroupPunctuation_008
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0800
     * @tc.desc   Test split with punctuation capture
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CaptureGroupPunctuation_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a.b.c";
      let result: string[] = str.split(/(\.)/);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(".");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual(".");
      expect(result[4]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_CaptureGroupHyphen_009
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CAPTURE_0900
     * @tc.desc   Test split with hyphen capture
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CaptureGroupHyphen_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a-b-c";
      let result: string[] = str.split(/(-)/);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("-");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual("-");
      expect(result[4]).assertEqual("c");
    });


    /**
     * @tc.name   StringPrototypeSplit_CustomSplitterBasic_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CUSTOM_0100
     * @tc.desc   Test split with custom splitter using Symbol.split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CustomSplitterBasic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBasicCustomSplitter();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("custom");
      expect(result[1]).assertEqual("split");
      expect(result[2]).assertEqual("result");
    });

    /**
     * @tc.name   StringPrototypeSplit_CustomSplitterWithLimit_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CUSTOM_0200
     * @tc.desc   Test custom splitter with limit parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CustomSplitterWithLimit_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testCustomSplitterWithLimit();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_ConditionalSplitter_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CUSTOM_0300
     * @tc.desc   Test conditional splitter based on uppercase letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ConditionalSplitter_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testConditionalSplitter();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("World");
      expect(result[2]).assertEqual("Test");
      expect(result[3]).assertEqual("Example");
    });

    /**
     * @tc.name   StringPrototypeSplit_FilterSplitter_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_CUSTOM_0400
     * @tc.desc   Test splitter that filters empty strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_FilterSplitter_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFilterSplitter();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });


    /**
     * @tc.name   StringPrototypeSplit_EmptyStringEmptySeparator_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0100
     * @tc.desc   Test split with empty string and empty separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_EmptyStringEmptySeparator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: string[] = str.split("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototypeSplit_EmptyStringNonEmptySeparator_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0200
     * @tc.desc   Test split with empty string and non-empty separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_EmptyStringNonEmptySeparator_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: string[] = str.split("a");
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_EmptyStringRegexSeparator_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0300
     * @tc.desc   Test split with empty string and regex separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_EmptyStringRegexSeparator_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: string[] = str.split(/\d/);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_SingleCharString_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0400
     * @tc.desc   Test split with single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SingleCharString_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      let result1: string[] = str.split("");
      let result2: string[] = str.split("a");
      let result3: string[] = str.split("b");

      expect(result1.length).assertEqual(1);
      expect(result1[0]).assertEqual("a");

      expect(result2.length).assertEqual(2);
      expect(result2[0]).assertEqual("");
      expect(result2[1]).assertEqual("");

      expect(result3.length).assertEqual(1);
      expect(result3[0]).assertEqual("a");
    });

    /**
     * @tc.name   StringPrototypeSplit_OriginalStringUnchanged_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0500
     * @tc.desc   Verify that split does not modify the original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_OriginalStringUnchanged_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a-b-c";
      let original: string = str;
      str.split("-");
      expect(str).assertEqual(original);
      expect(str).assertEqual("a-b-c");
    });

    /**
     * @tc.name   StringPrototypeSplit_WrapperObject_006
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0600
     * @tc.desc   Test split using String wrapper object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_WrapperObject_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let strObj: String = new String("a,b,c");
      let result: string[] = strObj.split(",");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_StartAndEndSeparators_007
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0700
     * @tc.desc   Test split with separators at both start and end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_StartAndEndSeparators_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = ",Hello,World,";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("Hello");
      expect(result[2]).assertEqual("World");
      expect(result[3]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_AlternatingSeparators_008
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0800
     * @tc.desc   Test split with alternating separators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_AlternatingSeparators_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,b,c,d";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
      expect(result[3]).assertEqual("d");
    });

    /**
     * @tc.name   StringPrototypeSplit_MultipleSpaces_009
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_0900
     * @tc.desc   Test split with multiple space separators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_MultipleSpaces_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a  b   c";
      let result: string[] = str.split(" ");
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual("");
      expect(result[4]).assertEqual("");
      expect(result[5]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_SingleSpace_010
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_1000
     * @tc.desc   Test split with single space string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SingleSpace_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = " ";
      let result: string[] = str.split(" ");
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_EmptyMiddle_011
     * @tc.number SUB_BUILTINS_STRING_SPLIT_EDGECASE_1100
     * @tc.desc   Test split with empty string in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_EmptyMiddle_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,,b";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("");
      expect(result[2]).assertEqual("b");
    });


    /**
     * @tc.name   StringPrototypeSplit_InvalidRegex_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_ERROR_0100
     * @tc.desc   Test split with invalid regex throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_InvalidRegex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInvalidRegex();
      expect(result.thrown).assertEqual(true);
      expect(result.errorType).assertEqual("SyntaxError");
    });

    /**
     * @tc.name   StringPrototypeSplit_SymbolSplitNonArray_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_ERROR_0200
     * @tc.desc   Test Symbol.split returning non-array throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SymbolSplitNonArray_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSymbolSplitNonArray();
      expect(result.thrown).assertEqual(false);
      expect(result.errorType).assertEqual(null);
    });

    /**
     * @tc.name   StringPrototypeSplit_SymbolSplitThrowsError_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_ERROR_0300
     * @tc.desc   Test Symbol.split throwing custom error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SymbolSplitThrowsError_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testSymbolSplitThrowsError();
      expect(result.thrown).assertEqual(true);
      expect(result.errorType).assertEqual("Error");
      expect(result.errorMessage).assertEqual("Custom error");
    });


    /**
     * @tc.name   StringPrototypeSplit_LimitZero_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0100
     * @tc.desc   Test split with limit parameter as 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World Test";
      let result: string[] = str.split(" ", 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitPositiveInteger_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0200
     * @tc.desc   Test split with positive integer limit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitPositiveInteger_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World Test Example";
      let result: string[] = str.split(" ", 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitGreaterThanPossible_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0300
     * @tc.desc   Test split with limit greater than possible splits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitGreaterThanPossible_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: string[] = str.split(" ", 10);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitOne_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0400
     * @tc.desc   Test split with limit parameter as 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitOne_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a b c d e";
      let result: string[] = str.split(" ", 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("a");
    });

    /**
     * @tc.name   StringPrototypeSplit_NoLimit_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0500
     * @tc.desc   Test split without limit parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_NoLimit_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a b c d e";
      let result: string[] = str.split(" ");
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
      expect(result[3]).assertEqual("d");
      expect(result[4]).assertEqual("e");
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitUndefined_006
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0600
     * @tc.desc   Test split with undefined as limit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitUndefined_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a b c";
      let result: string[] = str.split(" ", undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitNull_007
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0700
     * @tc.desc   Test split with null as limit (converts to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitNull_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testLimitNull();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitNegative_008
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0800
     * @tc.desc   Test split with negative limit (converts to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitNegative_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testLimitNegative();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitFloat_009
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_0900
     * @tc.desc   Test split with float limit (ToLength handling)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitFloat_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a b c d";
      let result: string[] = str.split(" ", 2.5);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitSmallFloat_010
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_1000
     * @tc.desc   Test split with small float limit (converts to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitSmallFloat_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testLimitSmallFloat();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitStringNumber_011
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_1100
     * @tc.desc   Test split with string number as limit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitStringNumber_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testLimitStringNumber();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
    });

    /**
     * @tc.name   StringPrototypeSplit_LimitBoolean_012
     * @tc.number SUB_BUILTINS_STRING_SPLIT_LIMIT_1200
     * @tc.desc   Test split with boolean as limit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_LimitBoolean_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testLimitBoolean();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValue);
    });


    /**
     * @tc.name   StringPrototypeSplit_SplitAndJoin_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0100
     * @tc.desc   Test split and join as reverse operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitAndJoin_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let original: string = "a,b,c";
      let splitAndJoined: string = original.split(",").join(",");
      expect(splitAndJoined).assertEqual("a,b,c");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenReverse_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0200
     * @tc.desc   Test split then reverse array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenReverse_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a-b-c-d";
      let result: string[] = str.split("-").reverse();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("d");
      expect(result[1]).assertEqual("c");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual("a");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenMap_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0300
     * @tc.desc   Test split then map elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenMap_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "1,2,3,4";
      let result: number[] = str.split(",").map((x: string): number => parseInt(x) * 2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenFilter_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0400
     * @tc.desc   Test split then filter empty strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenFilter_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,,b,,c";
      let result: string[] = str.split(",").filter((x: string): boolean => x !== "");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenTrim_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0500
     * @tc.desc   Test split then map with trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenTrim_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = " a , b , c ";
      let result: string[] = str.split(",").map((s: string): string => s.trim());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenLowerCase_006
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0600
     * @tc.desc   Test split then map to lower case
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenLowerCase_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello,World,Test";
      let result: string[] = str.split(",").map((s: string): string => s.toLowerCase());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("world");
      expect(result[2]).assertEqual("test");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenUpperCase_007
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0700
     * @tc.desc   Test split then map to upper case
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenUpperCase_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello,world,test";
      let result: string[] = str.split(",").map((s: string): string => s.toUpperCase());
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("HELLO");
      expect(result[1]).assertEqual("WORLD");
      expect(result[2]).assertEqual("TEST");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenSubstring_008
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0800
     * @tc.desc   Test split then map with substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenSubstring_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello123,world456,test789";
      let result: string[] = str.split(",").map((s: string): string => s.substring(0, 5));
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("world");
      expect(result[2]).assertEqual("test7");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitJoinAsReplace_009
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_0900
     * @tc.desc   Test split+join as replace alternative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitJoinAsReplace_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a-b-c-d";
      let result: string = str.split("-").join(":");
      expect(result).assertEqual("a:b:c:d");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenLength_010
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_1000
     * @tc.desc   Test split then get array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenLength_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,b,c,d,e";
      let count: number = str.split(",").length;
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenIndexOf_011
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_1100
     * @tc.desc   Test split then indexOf on result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenIndexOf_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "apple,banana,cherry";
      let result: number = str.split(",").indexOf("banana");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenIncludes_012
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_1200
     * @tc.desc   Test split then includes on result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenIncludes_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "apple,banana,cherry";
      let result: boolean = str.split(",").includes("banana");
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenSort_013
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_1300
     * @tc.desc   Test split then sort array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenSort_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "c,a,b,e,d";
      let result: string[] = str.split(",").sort();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
      expect(result[3]).assertEqual("d");
      expect(result[4]).assertEqual("e");
    });

    /**
     * @tc.name   StringPrototypeSplit_SplitThenJoinWithDifferentSeparator_014
     * @tc.number SUB_BUILTINS_STRING_SPLIT_METHODCHAIN_1400
     * @tc.desc   Test split then join with different separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_SplitThenJoinWithDifferentSeparator_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,b,c";
      let result: string = str.split(",").join("|");
      expect(result).assertEqual("a|b|c");
    });


    /**
     * @tc.name   StringPrototypeSplit_RegexBasicDigit_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0100
     * @tc.desc   Test split with basic regex digit separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexBasicDigit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello1World2Test3";
      let result: string[] = str.split(/\d/);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
      expect(result[2]).assertEqual("Test");
      expect(result[3]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexWhitespace_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0200
     * @tc.desc   Test split with regex matching one or more whitespace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexWhitespace_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello    World     Test";
      let result: string[] = str.split(/\s+/);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
      expect(result[2]).assertEqual("Test");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexCharacterClass_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0300
     * @tc.desc   Test split with regex character class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexCharacterClass_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "apple,banana;orange:grape";
      let result: string[] = str.split(/[,;]/);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("apple");
      expect(result[1]).assertEqual("banana");
      expect(result[2]).assertEqual("orange:grape");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexOrPattern_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0400
     * @tc.desc   Test split with regex OR pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexOrPattern_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1b2c3d4";
      let result: string[] = str.split(/[0-9]|-/);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
      expect(result[3]).assertEqual("d");
      expect(result[4]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexIgnoreCase_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0500
     * @tc.desc   Test split with regex ignore case flag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexIgnoreCase_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HelloAWorldaTest";
      let result: string[] = str.split(/a/i);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
      expect(result[2]).assertEqual("Test");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexNonCapturingGroup_006
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0600
     * @tc.desc   Test split with regex non-capturing group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexNonCapturingGroup_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1b2c3";
      let result: string[] = str.split(/(?:\d)/);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
      expect(result[3]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexMultipleSeparators_007
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0700
     * @tc.desc   Test split with regex matching multiple separators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexMultipleSeparators_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1!b2@c3";
      let result: string[] = str.split(/[0-9]/);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("!b");
      expect(result[2]).assertEqual("@c");
      expect(result[3]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexAlphanumeric_008
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0800
     * @tc.desc   Test split with regex word separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexAlphanumeric_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello123world456test";
      let result: string[] = str.split(/\d+/);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("world");
      expect(result[2]).assertEqual("test");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexMixedBoundary_009
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_0900
     * @tc.desc   Test split with regex on mixed characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexMixedBoundary_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1!@#b2%^&c3";
      let result: string[] = str.split(/\d/);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("!@#b");
      expect(result[2]).assertEqual("%^&c");
      expect(result[3]).assertEqual("");
    });

    /**
     * @tc.name   StringPrototypeSplit_RegexDotAny_010
     * @tc.number SUB_BUILTINS_STRING_SPLIT_REGEX_1000
     * @tc.desc   Test split with regex dot (matches any character)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_RegexDotAny_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abc";
      let result: string[] = str.split(/./);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("");
      expect(result[2]).assertEqual("");
      expect(result[3]).assertEqual("");
    });


    /**
     * @tc.name   StringPrototypeSplit_Simple_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_SIMPLE_0100
     * @tc.desc   Test simple split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_Simple_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,b,c";
      let result: string[] = str.split(",");
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });


    /**
     * @tc.name   StringPrototypeSplit_CallWithString_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_THIS_0100
     * @tc.desc   Test split with call() on string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CallWithString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testCallWithString();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

    /**
     * @tc.name   StringPrototypeSplit_CallWithNumber_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_THIS_0200
     * @tc.desc   Test split with call() on number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CallWithNumber_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testCallWithNumber();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

    /**
     * @tc.name   StringPrototypeSplit_CallWithObject_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_THIS_0300
     * @tc.desc   Test split with call() on object with toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CallWithObject_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testCallWithObject();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
      expect(testResult.result[2]).assertEqual(testResult.expectedValues[2]);
    });

    /**
     * @tc.name   StringPrototypeSplit_StringWrapper_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_THIS_0400
     * @tc.desc   Test split with String wrapper object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_StringWrapper_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testStringWrapper();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
      expect(testResult.result[2]).assertEqual(testResult.expectedValues[2]);
    });

    /**
     * @tc.name   StringPrototypeSplit_InheritedString_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_THIS_0500
     * @tc.desc   Test split with inherited String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_InheritedString_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testInheritedString();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
      expect(testResult.result[2]).assertEqual(testResult.expectedValues[2]);
    });

    /**
     * @tc.name   StringPrototypeSplit_ArraySeparator_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_TYPECONV_0200
     * @tc.desc   Test split with empty array as separator (converts to empty string)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ArraySeparator_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testEmptyArraySeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual("t");
      expect(testResult.result[1]).assertEqual("e");
      expect(testResult.result[2]).assertEqual("s");
      expect(testResult.result[3]).assertEqual("t");
    });

    /**
     * @tc.name   StringPrototypeSplit_ZeroNumberSeparator_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_TYPECONV_0300
     * @tc.desc   Test split with number 0 as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ZeroNumberSeparator_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testZeroNumberSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

    /**
     * @tc.name   StringPrototypeSplit_NegativeNumberSeparator_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_TYPECONV_0400
     * @tc.desc   Test split with negative number as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_NegativeNumberSeparator_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testNegativeNumberSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

    /**
     * @tc.name   StringPrototypeSplit_BMPCharacters_001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0100
     * @tc.desc   Test split with BMP (Basic Multilingual Plane) characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_BMPCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\u4E16\u754C"; // Hello世界
      let result: string[] = str.split("");
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual("H");
      expect(result[1]).assertEqual("e");
      expect(result[2]).assertEqual("l");
      expect(result[3]).assertEqual("l");
      expect(result[4]).assertEqual("o");
      expect(result[5]).assertEqual("\u4E16");
      expect(result[6]).assertEqual("\u754C");
    });

    /**
     * @tc.name   StringPrototypeSplit_ChineseCharacters_002
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0200
     * @tc.desc   Test split with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ChineseCharacters_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "\u4F60\u597D\u4E16\u754C"; // 你好世界
      let result: string[] = str.split("");
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual("\u4F60");
      expect(result[1]).assertEqual("\u597D");
      expect(result[2]).assertEqual("\u4E16");
      expect(result[3]).assertEqual("\u754C");
    });

    /**
     * @tc.name   StringPrototypeSplit_JapaneseCharacters_003
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0300
     * @tc.desc   Test split with Japanese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_JapaneseCharacters_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "\u3053\u3093\u306B\u3061\u306F"; // こんにちは
      let result: string[] = str.split("");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototypeSplit_KoreanCharacters_004
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0400
     * @tc.desc   Test split with Korean characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_KoreanCharacters_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "\uC548\uB155\uD558\uC138\uC694"; // 안녕하세요
      let result: string[] = str.split("");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototypeSplit_CyrillicCharacters_005
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0500
     * @tc.desc   Test split with Cyrillic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_CyrillicCharacters_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "\u041F\u0440\u0438\u0432\u0435\u0442"; // Привет
      let result: string[] = str.split("");
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototypeSplit_GreekCharacters_006
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0600
     * @tc.desc   Test split with Greek characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_GreekCharacters_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "\u03B3\u03B5\u03B9\u03B1"; // γεια
      let result: string[] = str.split("");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringPrototypeSplit_ArabicCharacters_007
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0700
     * @tc.desc   Test split with Arabic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ArabicCharacters_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "\u0645\u0631\u062D\u0628\u0627"; // مرحبا
      let result: string[] = str.split("");
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototypeSplit_ThaiCharacters_008
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0800
     * @tc.desc   Test split with Thai characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ThaiCharacters_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "\u0E2A\u0E27\u0E31\u0E2A\u0E14\u0E35"; // สวัสดี
      let result: string[] = str.split("");
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototypeSplit_EmptyStringSplit_009
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_0900
     * @tc.desc   Test split with empty string on unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_EmptyStringSplit_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "AB";
      let result: string[] = str.split("");
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("A");
      expect(result[1]).assertEqual("B");
    });

    /**
     * @tc.name   StringPrototypeSplit_UnicodeSpaceSeparator_010
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_1000
     * @tc.desc   Test split with unicode space separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_UnicodeSpaceSeparator_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\u3000World"; // Using ideographic space
      let result: string[] = str.split("\u3000");
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("Hello");
      expect(result[1]).assertEqual("World");
    });

    /**
     * @tc.name   StringPrototypeSplit_MixedScriptText_011
     * @tc.number SUB_BUILTINS_STRING_SPLIT_UNICODE_1100
     * @tc.desc   Test split with mixed script text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_MixedScriptText_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\u4E16\u754C";
      let result: string[] = str.split(" ");
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("Hello世界");
    });

    /**
     * @tc.name   StringPrototypeSplit_ArraySeparator_002Adapt001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_TYPECONV_0200
     * @tc.desc   Test split with empty array as separator (converts to empty string)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ArraySeparator_002Adapt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testEmptyArraySeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual("t");
      expect(testResult.result[1]).assertEqual("e");
      expect(testResult.result[2]).assertEqual("s");
      expect(testResult.result[3]).assertEqual("t");
    });

    /**
     * @tc.name   StringPrototypeSplit_ZeroNumberSeparator_003Adapt001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_TYPECONV_0300
     * @tc.desc   Test split with number 0 as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_ZeroNumberSeparator_003Adapt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testZeroNumberSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

    /**
     * @tc.name   StringPrototypeSplit_NegativeNumberSeparator_004Adapt001
     * @tc.number SUB_BUILTINS_STRING_SPLIT_TYPECONV_0400
     * @tc.desc   Test split with negative number as separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSplit_NegativeNumberSeparator_004Adapt001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const testResult = testNegativeNumberSeparator();
      expect(testResult.result.length).assertEqual(testResult.expectedLength);
      expect(testResult.result[0]).assertEqual(testResult.expectedValues[0]);
      expect(testResult.result[1]).assertEqual(testResult.expectedValues[1]);
    });

  });
}
