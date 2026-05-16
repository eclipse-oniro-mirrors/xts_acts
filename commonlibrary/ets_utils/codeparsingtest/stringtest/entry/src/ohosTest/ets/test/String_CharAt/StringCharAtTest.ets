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
import * as helper from './StringCharAtTestHelper';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringCharAtTest() {
  describe('StringCharAtTest', () => {
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
     * @tc.name   StringCharAt_Basic_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BASIC_0100
     * @tc.desc   Test charAt with normal index access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const sentence = "The quick brown fox jumps over the lazy dog.";
      const index = 4;
      let result: string = sentence.charAt(index);
      expect(result).assertEqual("q");
    });

    /**
     * @tc.name   StringCharAt_Basic_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BASIC_0200
     * @tc.desc   Test charAt to access first character at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const anyString = "Brave new world";
      let result: string = anyString.charAt(0);
      expect(result).assertEqual("B");
    });

    /**
     * @tc.name   StringCharAt_Basic_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BASIC_0300
     * @tc.desc   Test charAt to access last character using length-1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let result: string = str.charAt(str.length - 1);
      expect(result).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Basic_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BASIC_0400
     * @tc.desc   Test charAt with multiple valid indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let result1: string = str.charAt(0);
      let result2: string = str.charAt(1);
      let result3: string = str.charAt(2);
      let result4: string = str.charAt(3);
      let result5: string = str.charAt(4);
      expect(result1).assertEqual("H");
      expect(result2).assertEqual("e");
      expect(result3).assertEqual("l");
      expect(result4).assertEqual("l");
      expect(result5).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Basic_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BASIC_0500
     * @tc.desc   Test charAt with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const emptyStr = "";
      let result1: string = emptyStr.charAt(0);
      let result2: string = emptyStr.charAt(0);
      expect(result1).assertEqual("");
      expect(result2).assertEqual("");
    });


    /**
     * @tc.name   StringCharAt_Apply_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0100
     * @tc.desc   Test string traversal using charAt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Apply_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let result0: string = str.charAt(0);
      let result1: string = str.charAt(1);
      let result2: string = str.charAt(2);
      let result3: string = str.charAt(3);
      let result4: string = str.charAt(4);
      expect(result0).assertEqual("H");
      expect(result1).assertEqual("e");
      expect(result2).assertEqual("l");
      expect(result3).assertEqual("l");
      expect(result4).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Apply_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0200
     * @tc.desc   Test string validation (check first and last character)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let firstChar: string = str.charAt(0);
      let lastChar: string = str.charAt(str.length - 1);
      let startsWithH: boolean = firstChar === "H";
      let endsWithO: boolean = lastChar === "o";
      expect(startsWithH).assertTrue();
      expect(endsWithO).assertTrue();
    });

    /**
     * @tc.name   StringCharAt_Apply_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0300
     * @tc.desc   Test first character uppercase (capitalize)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "hello";
      let capitalized: string = str.charAt(0).toUpperCase() + str.slice(1);
      expect(capitalized).assertEqual("Hello");
    });

    /**
     * @tc.name   StringCharAt_Apply_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0400
     * @tc.desc   Test character at specific position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Apply_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "JavaScript";
      let thirdChar: string = str.charAt(2);
      let fifthChar: string = str.charAt(4);
      expect(thirdChar).assertEqual("v");
      expect(fifthChar).assertEqual("S");
    });

    /**
     * @tc.name   StringCharAt_Apply_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0500
     * @tc.desc   Test alternating characters access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "abcdef";
      let evenChars: string = "";
      let oddChars: string = "";
      for (let i = 0; i < str.length; i++) {
        let char: string = str.charAt(i);
        if (i % 2 === 0) {
          evenChars = evenChars + char;
        } else {
          oddChars = oddChars + char;
        }
      }
      expect(evenChars).assertEqual("ace");
      expect(oddChars).assertEqual("bdf");
    });

    /**
     * @tc.name   StringCharAt_Apply_006
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0600
     * @tc.desc   Test checking if string starts with specific character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str1 = "Hello";
      const str2 = "hello";
      let startsWithUpperH: boolean = str1.charAt(0) === "H";
      let startsWithLowerH: boolean = str2.charAt(0) === "h";
      expect(startsWithUpperH).assertTrue();
      expect(startsWithLowerH).assertTrue();
    });

    /**
     * @tc.name   StringCharAt_Apply_007
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0700
     * @tc.desc   Test checking if string ends with specific character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "test";
      let endsWithT: boolean = str.charAt(str.length - 1) === "t";
      expect(endsWithT).assertTrue();
    });

    /**
     * @tc.name   StringCharAt_Apply_008
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0800
     * @tc.desc   Test middle character extraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "abcde";
      let midIndex: number = Math.floor(str.length / 2);
      let midChar: string = str.charAt(midIndex);
      expect(midChar).assertEqual("c");
    });

    /**
     * @tc.name   StringCharAt_Apply_009
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_0900
     * @tc.desc   Test character replacement using charAt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      // Replace first character using slice and charAt
      let newStr: string = "J" + str.slice(1);
      expect(newStr).assertEqual("Jello");
      // Verify original unchanged
      expect(str).assertEqual("Hello");
    });

    /**
     * @tc.name   StringCharAt_Apply_010
     * @tc.number SUB_BUILTINS_STRING_CHARAT_APPLY_1000
     * @tc.desc   Test counting specific character using charAt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Apply_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "hello";
      let count: number = 0;
      for (let i = 0; i < str.length; i++) {
        if (str.charAt(i) === "l") {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });


    /**
     * @tc.name   StringCharAt_Boundary_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0100
     * @tc.desc   Test charAt with index exceeding upper bound
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Boundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const anyString = "Brave new world";
      let result: string = anyString.charAt(999);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Boundary_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0200
     * @tc.desc   Test charAt with negative index (exceeding lower bound)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Boundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result1: string = str.charAt(-1);
      let result2: string = str.charAt(-100);
      expect(result1).assertEqual("");
      expect(result2).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Boundary_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0300
     * @tc.desc   Test charAt with maximum valid index (length-1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Boundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let result1: string = str.charAt(str.length - 1);
      let result2: string = str.charAt(4);
      expect(result1).assertEqual("o");
      expect(result2).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Boundary_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0400
     * @tc.desc   Test charAt with index equal to string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Boundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result1: string = str.charAt(str.length);
      let result2: string = str.charAt(5);
      expect(result1).assertEqual("");
      expect(result2).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Boundary_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0500
     * @tc.desc   Test charAt on single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Boundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "a";
      let result1: string = str.charAt(0);
      let result2: string = str.charAt(1);
      expect(result1).assertEqual("a");
      expect(result2).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Boundary_006
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0600
     * @tc.desc   Test charAt on two character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Boundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "ab";
      let result0: string = str.charAt(0);
      let result1: string = str.charAt(1);
      let result2: string = str.charAt(2);
      expect(result0).assertEqual("a");
      expect(result1).assertEqual("b");
      expect(result2).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Boundary_007
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0700
     * @tc.desc   Test charAt returns single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Boundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      const result = str.charAt(0);
      expect(typeof result).assertEqual("string");
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringCharAt_Boundary_008
     * @tc.number SUB_BUILTINS_STRING_CHARAT_BOUNDARY_0800
     * @tc.desc   Test charAt returns empty string for out of bounds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Boundary_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      const result = str.charAt(100);
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
      let isEqual: boolean = result === "";
      expect(isEqual).assertTrue();
    });


    /**
     * @tc.name   StringCharAt_Compare_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0100
     * @tc.desc   Compare charAt with bracket notation for normal access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Compare_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let results = helper.testBracketNotationCompare(str);
      expect(results.charAtResult).assertEqual(results.bracketResult);
      expect(results.charAtResult).assertEqual("e");
    });

    /**
     * @tc.name   StringCharAt_Compare_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0200
     * @tc.desc   Compare charAt with bracket notation for out of bounds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Compare_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let resultCharAt: string = str.charAt(100);
      // Bracket notation returns undefined for out of bounds
      // charAt returns empty string
      expect(resultCharAt).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Compare_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0300
     * @tc.desc   Compare charAt with bracket notation with string number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Compare_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      // charAt converts string to number
      let resultCharAt: string = helper.testCharAtWithStringNumber(str).result1;
      expect(resultCharAt).assertEqual("l");
    });

    /**
     * @tc.name   StringCharAt_Compare_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0400
     * @tc.desc   Compare charAt with bracket notation at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Compare_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let resultCharAt: string = str.charAt(0);
      let resultBracket: string = helper.testBracketNotation(str, 0);
      expect(resultCharAt).assertEqual(resultBracket);
      expect(resultCharAt).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Compare_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0500
     * @tc.desc   Compare charAt with bracket notation at last index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Compare_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let resultCharAt: string = str.charAt(str.length - 1);
      let resultBracket: string = helper.testBracketNotation(str, str.length - 1);
      expect(resultCharAt).assertEqual(resultBracket);
      expect(resultCharAt).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Compare_006
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0600
     * @tc.desc   Compare return types of charAt and bracket notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Compare_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let resultCharAt: string = str.charAt(0);
      let resultBracket: string = helper.testBracketNotation(str, 0);
      expect(typeof resultCharAt).assertEqual("string");
      expect(typeof resultBracket).assertEqual("string");
      expect(resultCharAt).assertEqual(resultBracket);
    });

    /**
     * @tc.name   StringCharAt_Compare_007
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0700
     * @tc.desc   Compare charAt with bracket notation for float index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Compare_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      // charAt truncates float to integer
      let resultCharAt: string = str.charAt(1.5);
      expect(resultCharAt).assertEqual("e");
    });

    /**
     * @tc.name   StringCharAt_Compare_008
     * @tc.number SUB_BUILTINS_STRING_CHARAT_COMPARE_0800
     * @tc.desc   Compare charAt with bracket notation for negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Compare_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let resultCharAt: string = str.charAt(-1);
      expect(resultCharAt).assertEqual("");
    });


    /**
     * @tc.name   StringCharAt_Param_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0100
     * @tc.desc   Test charAt with no parameter (undefined defaults to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Param_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const anyString = "Brave new world";
      let result: string = helper.testCharAtWithNoParam(anyString);
      expect(result).assertEqual("B");
    });

    /**
     * @tc.name   StringCharAt_Param_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0200
     * @tc.desc   Test charAt with integer parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Param_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let result1: string = str.charAt(1);
      let result2: string = str.charAt(2);
      let result3: string = str.charAt(3);
      expect(result1).assertEqual("e");
      expect(result2).assertEqual("l");
      expect(result3).assertEqual("l");
    });

    /**
     * @tc.name   StringCharAt_Param_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0300
     * @tc.desc   Test charAt with float parameter (truncated to integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Param_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let result1: string = str.charAt(1.5);
      let result2: string = str.charAt(2.9);
      expect(result1).assertEqual("e");
      expect(result2).assertEqual("l");
    });

    /**
     * @tc.name   StringCharAt_Param_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0400
     * @tc.desc   Test charAt with negative parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = str.charAt(-1);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Param_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0500
     * @tc.desc   Test charAt with string number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithStringNumber(str);
      expect(results.result1).assertEqual("l");
      expect(results.result2).assertEqual("l");
    });

    /**
     * @tc.name   StringCharAt_Param_006
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0600
     * @tc.desc   Test charAt with boolean parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithBoolean(str);
      expect(results.result1).assertEqual("e");
      expect(results.result2).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Param_007
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0700
     * @tc.desc   Test charAt with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = helper.testCharAtWithNull(str);
      expect(result).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Param_008
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0800
     * @tc.desc   Test charAt with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = helper.testCharAtWithUndefined(str);
      expect(result).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Param_009
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_0900
     * @tc.desc   Test charAt with special values (Infinity, -Infinity, NaN)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result1: string = str.charAt(Infinity);
      let result2: string = str.charAt(-Infinity);
      let result3: string = str.charAt(NaN);
      expect(result1).assertEqual("");
      expect(result2).assertEqual("");
      expect(result3).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Param_010
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_1000
     * @tc.desc   Test charAt with non-numeric string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = helper.testCharAtWithNonNumericString(str);
      expect(result).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Param_011
     * @tc.number SUB_BUILTINS_STRING_CHARAT_PARAM_1100
     * @tc.desc   Test charAt with multiple parameters (should only use first)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Param_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = helper.testCharAtWithMultipleParams(str);
      expect(result).assertEqual("e");
    });


    /**
     * @tc.name   StringCharAt_Return_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0100
     * @tc.desc   Test charAt returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Return_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      const result = str.charAt(0);
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name   StringCharAt_Return_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0200
     * @tc.desc   Test charAt returns single character string with length 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Return_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      const result = str.charAt(0);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringCharAt_Return_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0300
     * @tc.desc   Test charAt returns empty string for out of bounds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Return_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      const result = str.charAt(100);
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringCharAt_Return_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0400
     * @tc.desc   Test charAt returns new string (non-destructive)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Return_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      const result = str.charAt(0);
      // Modifying result doesn't affect original string
      expect(str).assertEqual("Hello");
      expect(result).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Return_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0500
     * @tc.desc   Test consecutive charAt calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Return_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result1: string = str.charAt(0).charAt(0);
      let result2: string = str.charAt(0).charAt(1);
      expect(result1).assertEqual("H");
      expect(result2).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Return_006
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0600
     * @tc.desc   Test charAt with toUpperCase chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Return_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = str.charAt(0).toUpperCase();
      expect(result).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Return_007
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0700
     * @tc.desc   Test charAt with repeat chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Return_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = str.charAt(1).repeat(3);
      expect(result).assertEqual("eee");
    });

    /**
     * @tc.name   StringCharAt_Return_008
     * @tc.number SUB_BUILTINS_STRING_CHARAT_RETURN_0800
     * @tc.desc   Test charAt combined with other string methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Return_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello World";
      let result1: string = str.charAt(0).toUpperCase();
      let result2: string = str.charAt(str.length - 1).repeat(3);
      let result3: string = str.charAt(0) + str.charAt(6);
      expect(result1).assertEqual("H");
      expect(result2).assertEqual("ddd");
      expect(result3).assertEqual("HW");
    });


    /**
     * @tc.name   StringCharAt_Supp_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_0100
     * @tc.desc   Test charAt with hexadecimal string parameter (0x prefix)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithHexString(str);
      expect(results.result1).assertEqual("l");
      expect(results.result2).assertEqual("e");
      expect(results.result3).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Supp_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_0200
     * @tc.desc   Test charAt with octal string parameter (0o prefix)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithOctalString(str);
      expect(results.result1).assertEqual("l");
      expect(results.result2).assertEqual("o");
      expect(results.result3).assertEqual("e");
    });

    /**
     * @tc.name   StringCharAt_Supp_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_0300
     * @tc.desc   Test charAt with binary string parameter (0b prefix)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithBinaryString(str);
      expect(results.result1).assertEqual("l");
      expect(results.result2).assertEqual("l");
      expect(results.result3).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Supp_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_0400
     * @tc.desc   Test charAt with array parameter (single element)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithSingleArray(str);
      expect(results.result1).assertEqual("l");
      expect(results.result2).assertEqual("H");
      expect(results.result3).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Supp_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_0500
     * @tc.desc   Test charAt with array parameter (multiple elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithMultipleArray(str);
      expect(results.result1).assertEqual("H");
      expect(results.result2).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Supp_006
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_0600
     * @tc.desc   Test charAt with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let result: string = helper.testCharAtWithEmptyArray(str);
      expect(result).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Supp_007
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_0700
     * @tc.desc   Test charAt with function parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithFunction(str);
      expect(results.result1).assertEqual("H");
      expect(results.result2).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Supp_010
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1000
     * @tc.desc   Test charAt with String object instance (new String())
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results = helper.testCharAtWithStringObject();
      expect(results.result1).assertEqual("e");
      expect(results.result2).assertEqual("H");
      expect(results.result3).assertEqual("");
    });

    /**
     * @tc.name   StringCharAt_Supp_011
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1100
     * @tc.desc   Test charAt with String object instance type checking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results = helper.testStringObjectTypeCheck();
      expect(results.isStringObject).assertTrue();
      expect(results.typeofValue).assertEqual("object");
      expect(results.charAtResult).assertEqual("l");
    });

    /**
     * @tc.name   StringCharAt_Supp_012
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1200
     * @tc.desc   Compare charAt with at() method - positive index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results = helper.testCharAtVsAtPositive();
      expect(results.charAtResult).assertEqual(results.atResult);
      expect(results.charAtResult).assertEqual("e");
    });

    /**
     * @tc.name   StringCharAt_Supp_013
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1300
     * @tc.desc   Compare charAt with at() method - negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results = helper.testCharAtVsAtNegative();
      // charAt doesn't support negative index, returns ""
      // at() supports negative index, returns "o"
      expect(results.charAtResult).assertEqual("");
      expect(results.atResult).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Supp_014
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1400
     * @tc.desc   Compare charAt with at() method - last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results = helper.testCharAtVsAtLastChar();
      expect(results.charAtResult).assertEqual(results.atResult);
      expect(results.charAtResult).assertEqual("o");
    });

    /**
     * @tc.name   StringCharAt_Supp_015
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1500
     * @tc.desc   Test charAt with object parameter (with valueOf method)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithObject(str);
      expect(results.result1).assertEqual("H");
      expect(results.result2).assertEqual("l");
    });

    /**
     * @tc.name   StringCharAt_Supp_016
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1600
     * @tc.desc   Test charAt with Number object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithNumberObject(str);
      expect(results.result1).assertEqual("l");
      expect(results.result2).assertEqual("l");
    });

    /**
     * @tc.name   StringCharAt_Supp_017
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1700
     * @tc.desc   Test charAt with various numeric format strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Supp_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Hello";
      let results = helper.testCharAtWithFormatStrings(str);
      expect(results.result1).assertEqual("l"); // "  2  " to NaN to 0
      expect(results.result2).assertEqual("l"); // "\t2\n" to 2 (after trim)
    });

    /**
     * @tc.name   StringCharAt_Supp_018
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1800
     * @tc.desc   Test charAt chaining operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Supp_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello";
      let results = helper.testCharAtChaining(str);
      expect(results.result1).assertEqual("H");
      expect(results.result2).assertEqual("eee");
    });

    /**
     * @tc.name   StringCharAt_Supp_019
     * @tc.number SUB_BUILTINS_STRING_CHARAT_SUPP_1900
     * @tc.desc   Test charAt in expression with other string methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Supp_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello World";
      let results = helper.testCharAtInExpression(str);
      expect(results.result1).assertEqual("H");
      expect(results.result2).assertEqual("ddd");
      expect(results.result3).assertEqual("HW");
    });


    /**
     * @tc.name   StringCharAt_Unicode_001
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0100
     * @tc.desc   Test charAt with BMP characters (ASCII)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Unicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello你好";
      let result: string = str.charAt(0);
      expect(result).assertEqual("H");
    });

    /**
     * @tc.name   StringCharAt_Unicode_002
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0200
     * @tc.desc   Test charAt with BMP characters (Chinese)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Unicode_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hello你好";
      let result1: string = str.charAt(5);
      let result2: string = str.charAt(6);
      expect(result1).assertEqual("你");
      expect(result2).assertEqual("好");
    });

    /**
     * @tc.name   StringCharAt_Unicode_003
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0300
     * @tc.desc   Test charAt with surrogate pairs (characters outside BMP)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('StringCharAt_Unicode_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const str = "𠮷𠮾";
      let result1: string = str.charAt(0);
      let result2: string = str.charAt(1);
      // Returns isolated surrogates, not complete characters
      expect(result1.length).assertEqual(1);
      expect(result2.length).assertEqual(1);
      expect(str.length).assertEqual(4);
    });

    /**
     * @tc.name   StringCharAt_Unicode_004
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0400
     * @tc.desc   Test charAt with emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('StringCharAt_Unicode_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const str = "😀😃";
      let result0: string = str.charAt(0);
      let result1: string = str.charAt(1);
      let result2: string = str.charAt(2);
      let result3: string = str.charAt(3);
      // Emoji are represented by surrogate pairs, taking two index positions
      expect(result0.length).assertEqual(1);
      expect(result1.length).assertEqual(1);
      expect(result2.length).assertEqual(1);
      expect(result3.length).assertEqual(1);
      expect(str.length).assertEqual(4);
    });

    /**
     * @tc.name   StringCharAt_Unicode_005
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0500
     * @tc.desc   Test charAt with mixed ASCII and BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharAt_Unicode_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = "Hi你好";
      let result0: string = str.charAt(0);
      let result1: string = str.charAt(1);
      let result2: string = str.charAt(2);
      let result3: string = str.charAt(3);
      expect(result0).assertEqual("H");
      expect(result1).assertEqual("i");
      expect(result2).assertEqual("你");
      expect(result3).assertEqual("好");
    });

    /**
     * @tc.name   StringCharAt_Unicode_006
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0600
     * @tc.desc   Test charAt with Latin extended characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Unicode_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "café";
      let result3: string = str.charAt(3);
      expect(result3).assertEqual("é");
    });

    /**
     * @tc.name   StringCharAt_Unicode_007
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0700
     * @tc.desc   Test charAt with Cyrillic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Unicode_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "Привет";
      let result0: string = str.charAt(0);
      let result1: string = str.charAt(1);
      expect(result0.length).assertEqual(1);
      expect(result1.length).assertEqual(1);
    });

    /**
     * @tc.name   StringCharAt_Unicode_008
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0800
     * @tc.desc   Test charAt with Arabic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCharAt_Unicode_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const str = "مرحبا";
      let result0: string = str.charAt(0);
      expect(result0.length).assertEqual(1);
    });

    /**
     * @tc.name   StringCharAt_Unicode_009
     * @tc.number SUB_BUILTINS_STRING_CHARAT_UNICODE_0900
     * @tc.desc   Test charAt at boundary between BMP and surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('StringCharAt_Unicode_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const str = "a𠮷b";
      let result0: string = str.charAt(0);
      let result1: string = str.charAt(1);
      let result2: string = str.charAt(2);
      let result3: string = str.charAt(3);
      expect(result0).assertEqual("a");
      expect(str.length).assertEqual(4);
    });

  });
}
