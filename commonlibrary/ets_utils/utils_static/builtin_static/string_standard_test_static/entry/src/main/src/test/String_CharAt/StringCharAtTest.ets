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

export default function StringCharAtTest():void {
  describe('StringCharAtTest', () => {
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
      let result: string = sentence.charAt(index).toString();
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
      let result: string = anyString.charAt(0).toString();
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
      let result: string = str.charAt(str.length - 1).toString();
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
      let result1: string = str.charAt(0).toString();
      let result2: string = str.charAt(1).toString();
      let result3: string = str.charAt(2).toString();
      let result4: string = str.charAt(3).toString();
      let result5: string = str.charAt(4).toString();
      expect(result1).assertEqual("H");
      expect(result2).assertEqual("e");
      expect(result3).assertEqual("l");
      expect(result4).assertEqual("l");
      expect(result5).assertEqual("o");
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
      let result0: string = str.charAt(0).toString();
      let result1: string = str.charAt(1).toString();
      let result2: string = str.charAt(2).toString();
      let result3: string = str.charAt(3).toString();
      let result4: string = str.charAt(4).toString();
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
      let firstChar: string = str.charAt(0).toString();
      let lastChar: string = str.charAt(str.length - 1).toString();
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
      let capitalized: string = str.charAt(0).toString().toUpperCase() + str.slice(1);
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
      let thirdChar: string = str.charAt(2).toString();
      let fifthChar: string = str.charAt(4).toString();
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
        let ch: string = str.charAt(i).toString();
        if (i % 2 === 0) {
          evenChars = evenChars + ch;
        } else {
          oddChars = oddChars + ch;
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
      let startsWithUpperH: boolean = str1.charAt(0).toString() === "H";
      let startsWithLowerH: boolean = str2.charAt(0).toString() === "h";
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
      let endsWithT: boolean = str.charAt(str.length - 1).toString() === "t";
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
       let midIndex = Math.floor(str.length / 2).toInt();
      let midChar: string = str.charAt(midIndex).toString();
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
        if (str.charAt(i).toString() === "l") {
          count++;
        }
      }
      expect(count).assertEqual(2);
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
      let result1: string = str.charAt(str.length - 1).toString();
      let result2: string = str.charAt(4).toString();
      expect(result1).assertEqual("o");
      expect(result2).assertEqual("o");
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
      const result = str.charAt(0).toString();
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
      const result = str.charAt(0).toString();
      expect(result.length).assertEqual(1);
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
      const result = str.charAt(0).toString();
      // Modifying result doesn't affect original string
      expect(str).assertEqual("Hello");
      expect(result).assertEqual("H");
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
      let result: string = str.charAt(0).toString().toUpperCase();
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
      let result: string = str.charAt(1).toString().repeat(3);
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
      let result1: string = str.charAt(0).toString().toUpperCase();
      let result2: string = str.charAt(str.length - 1).toString().repeat(3);
      let result3: string = str.charAt(0).toString() + str.charAt(6).toString();
      expect(result1).assertEqual("H");
      expect(result2).assertEqual("ddd");
      expect(result3).assertEqual("HW");
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
      let result: string = str.charAt(0).toString();
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
      let result1: string = str.charAt(5).toString();
      let result2: string = str.charAt(6).toString();
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
      let result1: string = str.charAt(0).toString();
      let result2: string = str.charAt(1).toString();
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
      let result0: string = str.charAt(0).toString();
      let result1: string = str.charAt(1).toString();
      let result2: string = str.charAt(2).toString();
      let result3: string = str.charAt(3).toString();
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
      let result0: string = str.charAt(0).toString();
      let result1: string = str.charAt(1).toString();
      let result2: string = str.charAt(2).toString();
      let result3: string = str.charAt(3).toString();
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
      let result3: string = str.charAt(3).toString();
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
      let result0: string = str.charAt(0).toString();
      let result1: string = str.charAt(1).toString();
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
      let result0: string = str.charAt(0).toString();
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
      let result0: string = str.charAt(0).toString();
      let result1: string = str.charAt(1).toString();
      let result2: string = str.charAt(2).toString();
      let result3: string = str.charAt(3).toString();
      expect(result0).assertEqual("a");
      expect(str.length).assertEqual(4);
    });

  });
}
