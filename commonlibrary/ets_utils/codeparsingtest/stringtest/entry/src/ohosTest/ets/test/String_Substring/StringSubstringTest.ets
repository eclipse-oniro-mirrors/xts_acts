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
import { testMixedTypes, testExtremeValues } from './substring_combine_test';
import { testStringObject, testNumberThis, testBooleanThis, testObjectThis, testFloatThis } from './substring_conversion_test';
import { testNaN, testInfinity, testNull, testBoolean, testStringNumeric, testStringNonNumeric } from './substring_special_test';



function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringSubstringTest() {
  describe('StringSubstringTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   StringPrototypeSubstring_SingleParameter_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BASIC_0100
     * @tc.desc   Test substring with single parameter (indexStart only)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SingleParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(2);
      expect(result).assertEqual('zilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SingleParameter_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BASIC_0200
     * @tc.desc   Test substring with indexStart = 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SingleParameter_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SingleParameter_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BASIC_0300
     * @tc.desc   Test substring with indexStart = 4
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SingleParameter_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(4);
      expect(result).assertEqual('lla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_TwoParameters_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BASIC_0400
     * @tc.desc   Test substring with indexStart and indexEnd parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_TwoParameters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(1, 3);
      expect(result).assertEqual('oz');
    });

    /**
     * @tc.name   StringPrototypeSubstring_TwoParameters_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BASIC_0500
     * @tc.desc   Test substring with indexStart=0, indexEnd=1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_TwoParameters_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 1);
      expect(result).assertEqual('M');
    });

    /**
     * @tc.name   StringPrototypeSubstring_TwoParameters_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BASIC_0600
     * @tc.desc   Test substring with indexStart=0, indexEnd=6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_TwoParameters_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 6);
      expect(result).assertEqual('Mozill');
    });


    /**
     * @tc.name   StringPrototypeSubstring_ZeroBoundary_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0100
     * @tc.desc   Test substring with indexStart = 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ZeroBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 3);
      expect(result).assertEqual('Moz');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ZeroBoundary_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0200
     * @tc.desc   Test substring with indexStart = 0, indexEnd = length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ZeroBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 7);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ZeroBoundary_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0300
     * @tc.desc   Test substring with indexEnd = 0 (parameters swap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ZeroBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(2, 0);
      expect(result).assertEqual('Mo');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ZeroBoundary_004
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0400
     * @tc.desc   Test substring with both parameters = 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ZeroBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_LengthBoundary_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0500
     * @tc.desc   Test substring with indexStart = string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_LengthBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(7);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_LengthBoundary_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0600
     * @tc.desc   Test substring with both parameters = string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_LengthBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(7, 7);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_LengthBoundary_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0700
     * @tc.desc   Test substring with indexEnd = string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_LengthBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(2, 7);
      expect(result).assertEqual('zilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ExceedLength_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0800
     * @tc.desc   Test substring with indexEnd > string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ExceedLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 10);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ExceedLength_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_0900
     * @tc.desc   Test substring with both parameters > string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ExceedLength_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(5, 100);
      expect(result).assertEqual('la');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ExceedLength_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_1000
     * @tc.desc   Test substring with parameters > string length (swapped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ExceedLength_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(100, 200);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_EqualParameters_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_1100
     * @tc.desc   Test substring with indexStart = indexEnd = 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_EqualParameters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_EqualParameters_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_1200
     * @tc.desc   Test substring with indexStart = indexEnd = 3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_EqualParameters_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(3, 3);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_EqualParameters_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_BOUNDARY_1300
     * @tc.desc   Test substring with indexStart = indexEnd = 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_EqualParameters_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(5, 5);
      expect(result).assertEqual('');
    });


    /**
     * @tc.name   StringPrototypeSubstring_CombineBoundary_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0100
     * @tc.desc   Test substring with -Infinity and Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_CombineBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(-Infinity, Infinity);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_CombineBoundary_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0200
     * @tc.desc   Test substring with NaN and large number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_CombineBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(NaN, 100);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_CombineBoundary_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0300
     * @tc.desc   Test substring with negative and length exceed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_CombineBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(-5, 17);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_CombineBoundary_004
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0400
     * @tc.desc   Test substring with decimal parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_CombineBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(3.5, 6.2);
      expect(result).assertEqual('ill');
    });

    /**
     * @tc.name   StringPrototypeSubstring_MixedTypes_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0500
     * @tc.desc   Test substring with mixed special types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_MixedTypes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testMixedTypes();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_ExtremeValues_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0600
     * @tc.desc   Test substring with extreme index values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ExtremeValues_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testExtremeValues();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_NestedSubstring_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0700
     * @tc.desc   Test nested substring calls (first extract)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_NestedSubstring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let first: string = str.substring(1, 6);
      let second: string = first.substring(1, 4);
      expect(second).assertEqual('zil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_NestedSubstring_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0800
     * @tc.desc   Test nested substring calls (inline)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_NestedSubstring_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 7).substring(1, 5);
      expect(result).assertEqual('ozil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_DynamicCalculation_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_0900
     * @tc.desc   Test substring with dynamic position calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_DynamicCalculation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let mid: number = Math.floor(str.length / 2);
      let result: string = str.substring(mid, str.length);
      expect(result).assertEqual('illa');
    });

    /**
     * @tc.name   StringPrototypeSubstring_DynamicCalculation_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMBINE_1000
     * @tc.desc   Test substring from start to mid
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_DynamicCalculation_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let mid: number = Math.floor(str.length / 2);
      let result: string = str.substring(0, str.length - mid);
      expect(result).assertEqual('Mozi');
    });


    /**
     * @tc.name   StringPrototypeSubstring_VsSlice_Negative_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMPARE_0100
     * @tc.desc   Compare substring vs slice with negative indexStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_VsSlice_Negative_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let subResult: string = str.substring(-5, 2);
      let sliceResult: string = str.slice(-5, 2);
      expect(subResult).assertEqual('Mo');
      expect(sliceResult).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_VsSlice_Negative_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMPARE_0200
     * @tc.desc   Compare substring vs slice with both negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_VsSlice_Negative_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let subResult: string = str.substring(-5, -2);
      let sliceResult: string = str.slice(-5, -2);
      expect(subResult).assertEqual('');
      expect(sliceResult).assertEqual('zil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_VsSlice_Swap_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMPARE_0300
     * @tc.desc   Compare substring vs slice with swapped parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_VsSlice_Swap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let subResult: string = str.substring(5, 2);
      let sliceResult: string = str.slice(5, 2);
      expect(subResult).assertEqual('zil');
      expect(sliceResult).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_VsSlice_Length_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMPARE_0400
     * @tc.desc   Compare substring vs slice with length parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_VsSlice_Length_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let subResult: string = str.substring(-3, 7);
      let sliceResult: string = str.slice(-3, 7);
      expect(subResult).assertEqual('Mozilla');
      expect(sliceResult).assertEqual('lla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ChainToUpper_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMPARE_0500
     * @tc.desc   Test substring chained with toUpperCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ChainToUpper_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 3).toUpperCase();
      expect(result).assertEqual('MOZ');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ChainWithRepeat_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMPARE_0600
     * @tc.desc   Test substring chained with repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ChainWithRepeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(4).repeat(2);
      expect(result).assertEqual('llalla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ChainWithLength_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_COMPARE_0700
     * @tc.desc   Test substring result length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ChainWithLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: number = str.substring(1, 5).length;
      expect(result).assertEqual(4);
    });


    /**
     * @tc.name   StringPrototypeSubstring_StringObject_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_CONVERSION_0100
     * @tc.desc   Test substring on String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_StringObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testStringObject();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_NumberThis_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_CONVERSION_0200
     * @tc.desc   Test substring with number as this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_NumberThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testNumberThis();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_BooleanThis_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_CONVERSION_0300
     * @tc.desc   Test substring with boolean as this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_BooleanThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testBooleanThis();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_ObjectThis_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_CONVERSION_0400
     * @tc.desc   Test substring with object as this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     * @tc.desc   ISSUE: ArkTS returns object instead of string - Node.js returns "[object Object]"
     */
    it('StringPrototypeSubstring_ObjectThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testObjectThis();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_FloatThis_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_CONVERSION_0500
     * @tc.desc   Test substring with float number as this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_FloatThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testFloatThis();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringPrototypeSubstring_DateFormat_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0100
     * @tc.desc   Test substring for date formatting (year)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_DateFormat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let dateStr: string = '20250115';
      let year: string = dateStr.substring(0, 4);
      expect(year).assertEqual('2025');
    });

    /**
     * @tc.name   StringPrototypeSubstring_DateFormat_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0200
     * @tc.desc   Test substring for date formatting (month)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_DateFormat_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let dateStr: string = '20250115';
      let month: string = dateStr.substring(4, 6);
      expect(month).assertEqual('01');
    });

    /**
     * @tc.name   StringPrototypeSubstring_DateFormat_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0300
     * @tc.desc   Test substring for date formatting (day)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_DateFormat_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let dateStr: string = '20250115';
      let day: string = dateStr.substring(6, 8);
      expect(day).assertEqual('15');
    });

    /**
     * @tc.name   StringPrototypeSubstring_FileExtension_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0400
     * @tc.desc   Test substring for extracting file name
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_FileExtension_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let filename: string = 'document.pdf';
      let lastDotIndex: number = filename.lastIndexOf('.');
      let name: string = filename.substring(0, lastDotIndex);
      expect(name).assertEqual('document');
    });

    /**
     * @tc.name   StringPrototypeSubstring_FileExtension_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0500
     * @tc.desc   Test substring for extracting extension
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_FileExtension_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let filename: string = 'document.pdf';
      let lastDotIndex: number = filename.lastIndexOf('.');
      let ext: string = filename.substring(lastDotIndex + 1);
      expect(ext).assertEqual('pdf');
    });

    /**
     * @tc.name   StringPrototypeSubstring_RemovePrefix_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0600
     * @tc.desc   Test substring for removing prefix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_RemovePrefix_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'prefix_Hello';
      let prefix: string = 'prefix_';
      let result: string = str.substring(prefix.length);
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringPrototypeSubstring_MaskPhone_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0700
     * @tc.desc   Test substring for phone number masking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_MaskPhone_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let phone: string = '13812345678';
      let masked: string = phone.substring(0, 3) + '****' + phone.substring(7);
      expect(masked).assertEqual('138****5678');
    });

    /**
     * @tc.name   StringPrototypeSubstring_MaskEmail_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0800
     * @tc.desc   Test substring for email masking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_MaskEmail_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let email: string = 'user@example.com';
      let atIndex: number = email.indexOf('@');
      let maskedEmail: string = email.substring(0, 1) + '***' + email.substring(atIndex);
      expect(maskedEmail).assertEqual('u***@example.com');
    });

    /**
     * @tc.name   StringPrototypeSubstring_WithLength_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_0900
     * @tc.desc   Test substring with string.length calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_WithLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(str.length - 4);
      expect(result).assertEqual('illa');
    });

    /**
     * @tc.name   StringPrototypeSubstring_WithLength_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_1000
     * @tc.desc   Test substring extracting last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_WithLength_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(str.length - 1);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringPrototypeSubstring_FullString_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_PRACTICAL_1100
     * @tc.desc   Test substring extracting full string using length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_FullString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, str.length);
      expect(result).assertEqual('Mozilla');
    });


    /**
     * @tc.name   StringPrototypeSubstring_NewString_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_RETURN_0100
     * @tc.desc   Test substring returns new string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_NewString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(1, 4);
      expect(result).assertEqual('ozi');
      expect(result === str).assertEqual(false);
    });

    /**
     * @tc.name   StringPrototypeSubstring_Immutability_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_RETURN_0200
     * @tc.desc   Test original string unchanged after substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Immutability_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      str.substring(2, 5);
      expect(str).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Immutability_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_RETURN_0300
     * @tc.desc   Test original string unchanged after storing result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Immutability_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let sub: string = str.substring(2, 5);
      expect(str).assertEqual('Mozilla');
      expect(sub).assertEqual('zil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_MultipleCalls_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_RETURN_0400
     * @tc.desc   Test multiple substring calls on same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_MultipleCalls_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result1: string = str.substring(0, 7);
      let result2: string = str.substring(0, 4);
      let result3: string = str.substring(2, 5);
      expect(result1).assertEqual('Mozilla');
      expect(result2).assertEqual('Mozi');
      expect(result3).assertEqual('zil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ChainCalls_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_RETURN_0500
     * @tc.desc   Test chained substring calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ChainCalls_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let first: string = str.substring(1, 6);
      let second: string = first.substring(1, 4);
      expect(second).assertEqual('zil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ChainCalls_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_RETURN_0600
     * @tc.desc   Test inline chained substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ChainCalls_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(1, 6).substring(2, 5);
      expect(result).assertEqual('ill');
    });

    /**
     * @tc.name   StringPrototypeSubstring_ChainCalls_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_RETURN_0700
     * @tc.desc   Test substring chain with full then partial
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_ChainCalls_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, 7).substring(1, 5);
      expect(result).assertEqual('ozil');
    });


    /**
     * @tc.name   StringPrototypeSubstring_Negative_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0100
     * @tc.desc   Test substring with negative indexStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Negative_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(-5, 2);
      expect(result).assertEqual('Mo');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Negative_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0200
     * @tc.desc   Test substring with negative indexStart only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Negative_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(-3);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Negative_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0300
     * @tc.desc   Test substring with both parameters negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Negative_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(-10, -5);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Negative_004
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0400
     * @tc.desc   Test substring with negative indexEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Negative_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(2, -5);
      expect(result).assertEqual('Mo');
    });

    /**
     * @tc.name   StringPrototypeSubstring_NaN_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0500
     * @tc.desc   Test substring with NaN indexStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_NaN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testNaN();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_Decimal_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0600
     * @tc.desc   Test substring with decimal parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Decimal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(1.5, 3.8);
      expect(result).assertEqual('oz');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Decimal_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0700
     * @tc.desc   Test substring with decimal parameters (both truncated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Decimal_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0.9, 4.2);
      expect(result).assertEqual('Mozi');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Decimal_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0800
     * @tc.desc   Test substring with decimal indexStart
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Decimal_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(2.7);
      expect(result).assertEqual('zilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Undefined_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_0900
     * @tc.desc   Test substring with undefined indexEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Undefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(2, undefined);
      expect(result).assertEqual('zilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Undefined_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_1000
     * @tc.desc   Test substring with undefined indexEnd (from start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Undefined_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(0, undefined);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Infinity_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_1100
     * @tc.desc   Test substring with Infinity indexEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Infinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testInfinity();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_Null_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_1200
     * @tc.desc   Test substring with null parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testNull();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_Boolean_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_1300
     * @ @tc.desc   Test substring with boolean parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Boolean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testBoolean();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_StringNumeric_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_1400
     * @tc.desc   Test substring with numeric string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_StringNumeric_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testStringNumeric();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringPrototypeSubstring_StringNonNumeric_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SPECIAL_1500
     * @tc.desc   Test substring with non-numeric string parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_StringNonNumeric_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testStringNonNumeric();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringPrototypeSubstring_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0100
     * @tc.desc   Test substring on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.substring(0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_EmptyString_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0200
     * @tc.desc   Test substring on empty string with two parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_EmptyString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.substring(0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_EmptyString_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0300
     * @tc.desc   Test substring on empty string with out of bounds parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_EmptyString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '';
      let result: string = str.substring(0, 5);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0400
     * @tc.desc   Test substring on single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'A';
      let result: string = str.substring(0);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SingleChar_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0500
     * @tc.desc   Test substring on single character string (extract char)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SingleChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'A';
      let result: string = str.substring(0, 1);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SingleChar_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0600
     * @tc.desc   Test substring on single character string (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SingleChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'A';
      let result: string = str.substring(1);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SingleChar_004
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0700
     * @tc.desc   Test substring on single character string (equal params)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SingleChar_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'A';
      let result: string = str.substring(0, 0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Unicode_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0800
     * @tc.desc   Test substring with emoji in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Unicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello😀World';
      let result: string = str.substring(0, 5);
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Unicode_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_0900
     * @tc.desc   Test substring extracting emoji (surrogate pair)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Unicode_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello😀World';
      let result: string = str.substring(5, 6);
      expect(result).assertEqual('\ud83d');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Unicode_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_1000
     * @tc.desc   Test substring after emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Unicode_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello😀World';
      let result: string = str.substring(6);
      expect(result).assertEqual('\ude00World');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Chinese_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_1100
     * @tc.desc   Test substring with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Chinese_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '你好世界';
      let result: string = str.substring(0, 2);
      expect(result).assertEqual('你好');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Chinese_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_1200
     * @tc.desc   Test substring extracting last Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Chinese_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '你好世界';
      let result: string = str.substring(2);
      expect(result).assertEqual('世界');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SpecialChars_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_1300
     * @tc.desc   Test substring with special characters (newline)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SpecialChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello World\nTest';
      let result: string = str.substring(0, 5);
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SpecialChars_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_1400
     * @tc.desc   Test substring extracting space and newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SpecialChars_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello World\nTest';
      let result: string = str.substring(5, 11);
      expect(result).assertEqual(' World');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SpecialChars_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_STRINGTYPE_1500
     * @tc.desc   Test substring after newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SpecialChars_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello World\nTest';
      let result: string = str.substring(11);
      expect(result).assertEqual('\nTest');
    });


    /**
     * @tc.name   StringPrototypeSubstring_Swap_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SWAP_0100
     * @tc.desc   Test substring with indexStart > indexEnd (swap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Swap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(7, 4);
      expect(result).assertEqual('lla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Swap_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SWAP_0200
     * @tc.desc   Test substring with indexStart=5, indexEnd=2 (swap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Swap_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(5, 2);
      expect(result).assertEqual('zil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_Swap_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SWAP_0300
     * @tc.desc   Test substring with indexStart=1, indexEnd=0 (swap)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_Swap_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(1, 0);
      expect(result).assertEqual('M');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SwapWithBoundary_001
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SWAP_0400
     * @tc.desc   Test substring swap with NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SwapWithBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(5, NaN);
      expect(result).assertEqual('Mozil');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SwapWithBoundary_002
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SWAP_0500
     * @tc.desc   Test substring swap with Infinity and -Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SwapWithBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(Infinity, -Infinity);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SwapWithBoundary_003
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SWAP_0600
     * @tc.desc   Test substring swap with length and negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SwapWithBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(7, -5);
      expect(result).assertEqual('Mozilla');
    });

    /**
     * @tc.name   StringPrototypeSubstring_SwapWithBoundary_004
     * @tc.number SUB_BUILTINS_STRING_SUBSTRING_SWAP_0700
     * @tc.desc   Test substring swap with str.length and 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototypeSubstring_SwapWithBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Mozilla';
      let result: string = str.substring(str.length, 0);
      expect(result).assertEqual('Mozilla');
    });
  });
}
