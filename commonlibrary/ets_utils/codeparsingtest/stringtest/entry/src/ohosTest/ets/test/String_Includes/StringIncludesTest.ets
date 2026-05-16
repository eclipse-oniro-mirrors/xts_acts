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
import * as testFuncs from './string_includes';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringIncludesTest() {
  describe('StringIncludesBasicTest', () => {
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
     * @tc.name   StringIncludes_Basic_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BASIC_0100
     * @tc.desc   Test includes with existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "To be, or not to be, that is the question.";
      expect(str.includes("To be")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Basic_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BASIC_0200
     * @tc.desc   Test includes with existing substring at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "To be, or not to be, that is the question.";
      expect(str.includes("question")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Basic_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BASIC_0300
     * @tc.desc   Test includes with non-existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "To be, or not to be, that is the question.";
      expect(str.includes("nonexistent")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Basic_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BASIC_0400
     * @tc.desc   Test includes with single character that exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("H")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Basic_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BASIC_0500
     * @tc.desc   Test includes with single character that exists in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("W")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Basic_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BASIC_0600
     * @tc.desc   Test includes with single character that does not exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Basic_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("x")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Basic_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BASIC_0700
     * @tc.desc   Test includes with substring that appears multiple times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Basic_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "hello hello hello";
      expect(str.includes("hello")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_EMPTY_0100
     * @tc.desc   Test includes with empty search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_EmptyString_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_EMPTY_0200
     * @tc.desc   Test includes with empty source and empty search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_EmptyString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("".includes("")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_EmptyString_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_EMPTY_0300
     * @tc.desc   Test includes with empty source and non-empty search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_EmptyString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("".includes("a")).assertEqual(false);
    });


    /**
     * @tc.name   StringIncludes_Boundary_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0100
     * @tc.desc   Test includes with single character string - find itself
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("a")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_SingleChar_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0200
     * @tc.desc   Test includes with single character string - find different char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_SingleChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("b")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Boundary_SingleChar_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0300
     * @tc.desc   Test includes with single character string - find empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_SingleChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_DoubleChar_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0400
     * @tc.desc   Test includes with two character string - find first char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_DoubleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "ab";
      expect(str.includes("a")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_DoubleChar_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0500
     * @tc.desc   Test includes with two character string - find second char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_DoubleChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "ab";
      expect(str.includes("b")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_DoubleChar_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0600
     * @tc.desc   Test includes with two character string - find both chars
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_DoubleChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "ab";
      expect(str.includes("ab")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_DoubleChar_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0700
     * @tc.desc   Test includes with two character string - find longer string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_DoubleChar_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "ab";
      expect(str.includes("abc")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Boundary_LongString_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0800
     * @tc.desc   Test includes with very long string - find target
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_LongString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a".repeat(1000) + "target" + "b".repeat(1000);
      expect(str.includes("target")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_LongString_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_0900
     * @tc.desc   Test includes with very long string - find non-existing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_LongString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a".repeat(1000) + "target" + "b".repeat(1000);
      expect(str.includes("notfound")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Boundary_SearchLength_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1000
     * @tc.desc   Test includes with empty search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_SearchLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_SearchLength_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1100
     * @tc.desc   Test includes with single character search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_SearchLength_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("H")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_SearchLength_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1200
     * @tc.desc   Test includes with search string equal to source string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_SearchLength_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello World")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_SearchLength_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1300
     * @tc.desc   Test includes with search string longer than source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_SearchLength_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      expect(str.includes("Hello World")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1400
     * @tc.desc   Test includes with empty string, position 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("".includes("", 0)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1500
     * @tc.desc   Test includes with empty string, position out of range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("".includes("", 100)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1600
     * @tc.desc   Test includes with empty string, position Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("".includes("", Infinity)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1700
     * @tc.desc   Test includes with single char, empty search, position 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("", 0)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1800
     * @tc.desc   Test includes with single char, empty search, position equal to length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("", 1)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_1900
     * @tc.desc   Test includes with single char, empty search, position out of range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("", 2)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2000
     * @tc.desc   Test includes with single char, find itself, position 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("a", 0)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_008
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2100
     * @tc.desc   Test includes with single char, find itself, position equal to length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("a", 1)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_009
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2200
     * @tc.desc   Test includes with single char, find itself, negative position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      expect(str.includes("a", -1)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_010
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2300
     * @tc.desc   Test includes with three char string, find full string, position at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "abc";
      expect(str.includes("abc", 3)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_011
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2400
     * @tc.desc   Test includes with three char string, empty search, position at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "abc";
      expect(str.includes("", 3)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_012
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2500
     * @tc.desc   Test includes with three char string, find last char, position at last char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "abc";
      expect(str.includes("c", 2)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_013
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2600
     * @tc.desc   Test includes with three char string, find two chars, position at last char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "abc";
      expect(str.includes("bc", 2)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Boundary_Combined_014
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_BOUNDARY_2700
     * @tc.desc   Test includes with three char string, find middle char, position at last char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Boundary_Combined_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "abc";
      expect(str.includes("b", 2)).assertEqual(false);
    });


    /**
     * @tc.name   StringIncludes_Case_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CASE_0100
     * @tc.desc   Test includes is case-sensitive (lowercase search)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Case_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Blue Whale";
      expect(str.includes("blue")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Case_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CASE_0200
     * @tc.desc   Test includes is case-sensitive (uppercase search)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Case_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Blue Whale";
      expect(str.includes("BLUE")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Case_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CASE_0300
     * @tc.desc   Test includes with exact case match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Case_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Blue Whale";
      expect(str.includes("Blue")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Case_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CASE_0400
     * @tc.desc   Test includes with mixed case - uppercase search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Case_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("HELLO")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Case_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CASE_0500
     * @tc.desc   Test includes with mixed case - lowercase search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Case_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("hello")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Case_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CASE_0600
     * @tc.desc   Test includes with toLowerCase transformation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Case_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Blue Whale";
      expect(str.toLowerCase().includes("blue")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Case_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CASE_0700
     * @tc.desc   Test includes with toUpperCase transformation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Case_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Blue Whale";
      expect(str.toUpperCase().includes("BLUE")).assertEqual(true);
    });


    /**
     * @tc.name   StringIncludes_Vs_IndexOf_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0100
     * @tc.desc   Test includes vs indexOf with existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_IndexOf_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsIndexOf001();
      expect(result.includes).assertEqual(true);
      expect(result.indexOfNotNegOne).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Vs_IndexOf_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0200
     * @tc.desc   Test includes vs indexOf with non-existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_IndexOf_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsIndexOf002();
      expect(result.includes).assertEqual(false);
      expect(result.indexOfIsNegOne).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Vs_IndexOf_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0300
     * @tc.desc   Test includes vs indexOf with position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_IndexOf_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsIndexOf003();
      expect(result.includes).assertEqual(true);
      expect(result.indexOfNotNegOne).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Vs_IndexOf_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0400
     * @tc.desc   Test includes vs indexOf with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_IndexOf_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsIndexOf004();
      expect(result.includes).assertEqual(true);
      expect(result.indexOf).assertEqual(0);
    });

    /**
     * @tc.name   StringIncludes_Vs_IndexOf_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0500
     * @tc.desc   Test includes vs indexOf with empty string and position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_IndexOf_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsIndexOf005();
      expect(result.includes).assertEqual(true);
      expect(result.indexOf).assertEqual(4);
    });

    /**
     * @tc.name   StringIncludes_Vs_StartsWith_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0600
     * @tc.desc   Test includes vs startsWith with substring at beginning
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_StartsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsStartsWith001();
      expect(result.includes).assertEqual(true);
      expect(result.startsWith).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Vs_StartsWith_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0700
     * @tc.desc   Test includes vs startsWith with substring not at beginning
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_StartsWith_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsStartsWith002();
      expect(result.includes).assertEqual(true);
      expect(result.startsWith).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Vs_EndsWith_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0800
     * @tc.desc   Test includes vs endsWith with substring at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_EndsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsEndsWith001();
      expect(result.includes).assertEqual(true);
      expect(result.endsWith).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Vs_EndsWith_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_COMPARE_0900
     * @tc.desc   Test includes vs endsWith with substring not at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Vs_EndsWith_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesVsEndsWith002();
      expect(result.includes).assertEqual(true);
      expect(result.endsWith).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Chained_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CHAIN_0100
     * @tc.desc   Test includes with toLowerCase chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Chained_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesChained001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Chained_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CHAIN_0200
     * @tc.desc   Test includes with trim chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Chained_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesChained002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Chained_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CHAIN_0300
     * @tc.desc   Test includes with slice chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Chained_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesChained003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Chained_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CHAIN_0400
     * @tc.desc   Test includes with repeat chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Chained_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesChained004();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Practical_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PRACT_0100
     * @tc.desc   Test includes in text search scenario
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Practical_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesPractical001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Practical_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PRACT_0200
     * @tc.desc   Test includes in file extension check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Practical_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesPractical002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Practical_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PRACT_0300
     * @tc.desc   Test includes in path separator check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Practical_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesPractical003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Practical_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PRACT_0400
     * @tc.desc   Test includes in URL protocol check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Practical_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesPractical004();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Practical_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PRACT_0500
     * @tc.desc   Test includes in URL domain check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Practical_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesPractical005();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Practical_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PRACT_0600
     * @tc.desc   Test includes in email validation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Practical_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesPractical006();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   StringIncludes_RegExp_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_REGEX_0100
     * @tc.desc   Test includes throws TypeError with RegExp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_RegExp_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesRegExp001();
      expect(result.hasError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_RegExp_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_REGEX_0200
     * @tc.desc   Test includes throws TypeError with RegExp variable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_RegExp_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesRegExp002();
      expect(result.hasError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_NaN_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_NAN_0100
     * @tc.desc   Test includes with NaN parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_NaN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesNaN001();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_NaN_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_NAN_0200
     * @tc.desc   Test includes with "NaN" string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_NaN_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesNaN002();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_This_Null_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0100
     * @tc.desc   Test includes with null this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesThisNull();
      expect(result.hasError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Undefined_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0200
     * @tc.desc   Test includes with undefined this value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Undefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesThisUndefined();
      expect(result.hasError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Number_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0300
     * @tc.desc   Test includes with number this value - find "1" in 123
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisNumber001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Number_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0400
     * @tc.desc   Test includes with number this value - find "4" in 123
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Number_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisNumber002();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_This_Number_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0500
     * @tc.desc   Test includes with number this value - find "23" in 123
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Number_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisNumber003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Boolean_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0600
     * @tc.desc   Test includes with boolean this value - find "t" in true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Boolean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisBoolean001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Boolean_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0700
     * @tc.desc   Test includes with boolean this value - find "rue" in true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Boolean_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisBoolean002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Boolean_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0800
     * @tc.desc   Test includes with boolean this value - find "fa" in false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Boolean_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisBoolean003();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Object_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_0900
     * @tc.desc   Test includes with object this value - find "Hello"
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Object_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_1000
     * @tc.desc   Test includes with object this value - find "World"
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Object_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisObject002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Array_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_1100
     * @tc.desc   Test includes with array this value - find "1,2" in [1,2,3]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Array_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisArray001();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Array_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_1200
     * @tc.desc   Test includes with array this value - find "2" in [1,2,3]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Array_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisArray002();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_This_Array_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_THIS_1300
     * @tc.desc   Test includes with array this value - find "a,b" in ['a','b']
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_This_Array_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = testFuncs.testIncludesThisArray003();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   StringIncludes_Parameter_SearchString_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0100
     * @tc.desc   Test includes with normal string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("World")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0200
     * @tc.desc   Test includes without search string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesNoParam();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0300
     * @tc.desc   Test includes with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesUndefined();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0400
     * @tc.desc   Test includes with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesNull();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0500
     * @tc.desc   Test includes with number parameter that exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0600
     * @tc.desc   Test includes with number parameter that does not exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesNumberNotFound();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0700
     * @tc.desc   Test includes with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_008
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0800
     * @tc.desc   Test includes with array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesArray();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_009
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_0900
     * @tc.desc   Test includes with true parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesTrue();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_SearchString_010
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_PARAM_1000
     * @tc.desc   Test includes with false parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_SearchString_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFuncs.testIncludesFalse();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0100
     * @tc.desc   Test includes with default position (no position parameter)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0200
     * @tc.desc   Test includes with position = 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", 0)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0300
     * @tc.desc   Test includes with position = -0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", -0)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0400
     * @tc.desc   Test includes with position = -0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", -0.0)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0500
     * @tc.desc   Test includes with positive position where substring exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "To be, or not to be";
      expect(str.includes("not to be", 6)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0600
     * @tc.desc   Test includes with positive position where substring does not exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "To be, or not to be";
      expect(str.includes("To be", 1)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0700
     * @tc.desc   Test includes with negative position (treated as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", -1)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_008
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0800
     * @tc.desc   Test includes with negative decimal position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", -0.5)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_009
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_0900
     * @tc.desc   Test includes with negative decimal position (-1.9)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", -1.9)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_010
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1000
     * @tc.desc   Test includes with decimal position (0.9)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("World", 0.9)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_011
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1100
     * @tc.desc   Test includes with decimal position (6.5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", 6.5)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_012
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1200
     * @tc.desc   Test includes with position greater than string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      expect(str.includes("Hello", 10)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_013
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1300
     * @tc.desc   Test includes with position greater than string length for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      expect(str.includes("", 10)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_014
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1400
     * @tc.desc   Test includes with position equal to string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      expect(str.includes("o", 5)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_015
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1500
     * @tc.desc   Test includes with position equal to string length for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      expect(str.includes("", 5)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_016
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1600
     * @tc.desc   Test includes with position = Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", Infinity)).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_017
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1700
     * @tc.desc   Test includes with position = Infinity for empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("", Infinity)).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Parameter_Position_018
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_POS_1800
     * @tc.desc   Test includes with position = -Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Parameter_Position_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("Hello", -Infinity)).assertEqual(true);
    });


    /**
     * @tc.name   StringIncludes_Unicode_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_UNICODE_0100
     * @tc.desc   Test includes with emoji character that exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Unicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello 👋 World";
      expect(str.includes("👋")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Unicode_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_UNICODE_0200
     * @tc.desc   Test includes with emoji character that does not exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Unicode_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello 👋 World";
      expect(str.includes("😊")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Unicode_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_UNICODE_0300
     * @tc.desc   Test includes with Chinese characters that exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Unicode_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "你好世界";
      expect(str.includes("你好")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Unicode_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_UNICODE_0400
     * @tc.desc   Test includes with Chinese characters that exist at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Unicode_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "你好世界";
      expect(str.includes("世界")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Unicode_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_UNICODE_0500
     * @tc.desc   Test includes with Chinese characters that do not exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Unicode_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "你好世界";
      expect(str.includes("大家好")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Unicode_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_UNICODE_0600
     * @tc.desc   Test includes with copyright symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Unicode_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello © World ®";
      expect(str.includes("©")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Unicode_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_UNICODE_0700
     * @tc.desc   Test includes with registered trademark symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Unicode_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello © World ®";
      expect(str.includes("®")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Surrogate_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_SURROGATE_0100
     * @tc.desc   Test includes with orphan high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Surrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const orphanSurrogate = "a\uD800b";
      expect(orphanSurrogate.includes("\uD800")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Surrogate_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_SURROGATE_0200
     * @tc.desc   Test includes with orphan high surrogate - find character before
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Surrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const orphanSurrogate = "a\uD800b";
      expect(orphanSurrogate.includes("a")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Surrogate_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_SURROGATE_0300
     * @tc.desc   Test includes with orphan high surrogate - find character after
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Surrogate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const orphanSurrogate = "a\uD800b";
      expect(orphanSurrogate.includes("b")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Surrogate_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_SURROGATE_0400
     * @tc.desc   Test includes with orphan low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Surrogate_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const orphanLowSurrogate = "a\uDC00b";
      expect(orphanLowSurrogate.includes("\uDC00")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Surrogate_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_SURROGATE_0500
     * @tc.desc   Test includes with complete surrogate pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Surrogate_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const surrogatePair = "\uD83D\uDE00";
      expect(surrogatePair.includes("\uD83D\uDE00")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Surrogate_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_SURROGATE_0600
     * @tc.desc   Test includes with surrogate pair - find high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Surrogate_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const surrogatePair = "\uD83D\uDE00";
      expect(surrogatePair.includes("\uD83D")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Surrogate_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_SURROGATE_0700
     * @tc.desc   Test includes with surrogate pair - find low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Surrogate_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const surrogatePair = "\uD83D\uDE00";
      expect(surrogatePair.includes("\uDE00")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Escape_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_ESCAPE_0100
     * @tc.desc   Test includes with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Escape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello\nWorld";
      expect(str.includes("\n")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Escape_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_ESCAPE_0200
     * @tc.desc   Test includes with string containing newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Escape_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello\nWorld";
      expect(str.includes("Hello\nWorld")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Escape_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_ESCAPE_0300
     * @tc.desc   Test includes with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Escape_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello\tWorld";
      expect(str.includes("\t")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Escape_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_ESCAPE_0400
     * @tc.desc   Test includes with string containing tab
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Escape_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello\tWorld";
      expect(str.includes("Hello\tWorld")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Escape_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_ESCAPE_0500
     * @tc.desc   Test includes with backslash character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Escape_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello\\World";
      expect(str.includes("\\")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Control_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0100
     * @tc.desc   Test includes with NUL character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "hello\0world";
      expect(str.includes("\0")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Control_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0200
     * @tc.desc   Test includes with string containing NUL character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "hello\0world";
      expect(str.includes("hello\0")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Control_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0300
     * @tc.desc   Test includes with string ending with NUL character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "hello\0world";
      expect(str.includes("\0world")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Control_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0400
     * @tc.desc   Test includes with NUL character in string without it
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "abc";
      expect(str.includes("\0")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Control_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0500
     * @tc.desc   Test includes with hex control character \x01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "start\x01\x02\x03end";
      expect(str.includes("\x01")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Control_006
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0600
     * @tc.desc   Test includes with hex control character \x02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "start\x01\x02\x03end";
      expect(str.includes("\x02")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Control_007
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0700
     * @tc.desc   Test includes with hex control character \x03
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "start\x01\x02\x03end";
      expect(str.includes("\x03")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Control_008
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_CONTROL_0800
     * @tc.desc   Test includes with hex control character \x7F that does not exist
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Control_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "start\x01\x02\x03end";
      expect(str.includes("\x7F")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Whitespace_001
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_WHITESPACE_0100
     * @tc.desc   Test includes with single space character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Whitespace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes(" ")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Whitespace_002
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_WHITESPACE_0200
     * @tc.desc   Test includes with double space in single space string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Whitespace_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      expect(str.includes("  ")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Whitespace_003
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_WHITESPACE_0300
     * @tc.desc   Test includes with double space in double space string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Whitespace_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello  World";
      expect(str.includes("  ")).assertEqual(true);
    });

    /**
     * @tc.name   StringIncludes_Whitespace_004
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_WHITESPACE_0400
     * @tc.desc   Test includes with triple space in double space string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Whitespace_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello  World";
      expect(str.includes("   ")).assertEqual(false);
    });

    /**
     * @tc.name   StringIncludes_Whitespace_005
     * @tc.number SUB_BUILTINS_STRING_INCLUDES_WHITESPACE_0500
     * @tc.desc   Test includes with non-breaking space (\u00A0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIncludes_Whitespace_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello\u00A0World";
      expect(str.includes("\u00A0")).assertEqual(true);
    });

  })
}
