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

export default function StringPrototypeIndexOfBasicTest():void {
  describe('StringPrototypeIndexOfBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringPrototype_IndexOf_Basic_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BASIC_0100
     * @tc.desc   Test indexOf with existing single character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("o");
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Basic_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BASIC_0200
     * @tc.desc   Test indexOf with existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("world");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Basic_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BASIC_0300
     * @tc.desc   Test indexOf with non-existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("xyz");
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Basic_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BASIC_0400
     * @tc.desc   Test indexOf finding substring at beginning (returns 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let result: number = str.indexOf("Blue");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Basic_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BASIC_0500
     * @tc.desc   Test indexOf finding substring at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("world");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Basic_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BASIC_0600
     * @tc.desc   Test indexOf with empty string (no position parameter)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Basic_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Boundary_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BOUNDARY_0100
     * @tc.desc   Test indexOf on single char string finding that char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Boundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      let result: number = str.indexOf("a");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Boundary_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BOUNDARY_0200
     * @tc.desc   Test indexOf on single char string finding other char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Boundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      let result: number = str.indexOf("b");
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Boundary_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BOUNDARY_0300
     * @tc.desc   Test indexOf on single char string with position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Boundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      let result1: number = str.indexOf("a", 0);
      let result2: number = str.indexOf("a", 1);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Boundary_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BOUNDARY_0400
     * @tc.desc   Test indexOf with repeated character pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Boundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aaaaaaa";
      let result: number = str.indexOf("a");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Boundary_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BOUNDARY_0500
     * @tc.desc   Test indexOf finding other char in repeated char string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Boundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aaaaaaa";
      let result: number = str.indexOf("b");
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Boundary_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BOUNDARY_0600
     * @tc.desc   Test indexOf with adjacent repeated substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Boundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hellohello world";
      let result: number = str.indexOf("hello");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Boundary_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_BOUNDARY_0700
     * @tc.desc   Test indexOf finding repeated pattern occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Boundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abcabcabc";
      let first: number = str.indexOf("abc");
      let second: number = str.indexOf("abc", 1);
      let third: number = str.indexOf("abc", 4);
      expect(first).assertEqual(0);
      expect(second).assertEqual(3);
      expect(third).assertEqual(6);
    });


    /**
     * @tc.name   StringPrototype_IndexOf_Case_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_CASE_0100
     * @tc.desc   Test indexOf with exact case match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Case_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let result: number = str.indexOf("Blue");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Case_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_CASE_0200
     * @tc.desc   Test indexOf finding uppercase substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Case_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello World";
      let result: number = str.indexOf("World");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Case_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_CASE_0300
     * @tc.desc   Test indexOf case mismatch (lowercase searching uppercase)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Case_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let result: number = str.indexOf("blue");
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Case_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_CASE_0400
     * @tc.desc   Test indexOf case mismatch (uppercase searching lowercase)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Case_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("HELLO");
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Case_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_CASE_0500
     * @tc.desc   Test indexOf with mixed case strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Case_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let myString: string = "brie, pepper jack, cheddar";
      let myCapString: string = "Brie, Pepper Jack, Cheddar";
      let result1: number = myString.indexOf("cheddar");
      let result2: number = myCapString.indexOf("cheddar");
      expect(result1).assertEqual(19);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Unicode_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_UNICODE_0100
     * @tc.desc   Test indexOf finding single space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Unicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf(" ");
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Unicode_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_UNICODE_0200
     * @tc.desc   Test indexOf finding consecutive spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Unicode_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello  world";
      let result: number = str.indexOf("  ");
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Unicode_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_UNICODE_0300
     * @tc.desc   Test indexOf finding punctuation marks
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Unicode_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello, world!";
      let result1: number = str.indexOf(",");
      let result2: number = str.indexOf("!");
      expect(result1).assertEqual(5);
      expect(result2).assertEqual(12);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Unicode_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_UNICODE_0400
     * @tc.desc   Test indexOf finding special character combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Unicode_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "price: $100";
      let result: number = str.indexOf("$");
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Unicode_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_UNICODE_0500
     * @tc.desc   Test indexOf finding Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Unicode_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "你好世界";
      let result: number = str.indexOf("世");
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Unicode_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_UNICODE_0600
     * @tc.desc   Test indexOf finding emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Unicode_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 😊 World";
      let result: number = str.indexOf("😊");
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Unicode_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_UNICODE_0700
     * @tc.desc   Test indexOf finding combined Unicode character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Unicode_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "café";
      let result: number = str.indexOf("é");
      expect(result).assertEqual(3);
    });


    /**
     * @tc.name   StringPrototype_IndexOf_Empty_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_EMPTY_0100
     * @tc.desc   Test indexOf searching empty string with position=0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Empty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("", 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Empty_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_EMPTY_0200
     * @tc.desc   Test indexOf searching empty string with position < length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Empty_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result1: number = str.indexOf("", 3);
      let result2: number = str.indexOf("", 8);
      expect(result1).assertEqual(3);
      expect(result2).assertEqual(8);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Empty_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_EMPTY_0300
     * @tc.desc   Test indexOf searching empty string with position = length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Empty_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("", 11);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Empty_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_EMPTY_0400
     * @tc.desc   Test indexOf searching empty string with position > length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Empty_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result1: number = str.indexOf("", 13);
      let result2: number = str.indexOf("", 22);
      expect(result1).assertEqual(11);
      expect(result2).assertEqual(11);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Empty_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_EMPTY_0500
     * @tc.desc   Test indexOf on empty string finding empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Empty_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: number = str.indexOf("");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Empty_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_EMPTY_0600
     * @tc.desc   Test indexOf on empty string finding non-empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Empty_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: number = str.indexOf("a");
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Empty_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_EMPTY_0700
     * @tc.desc   Test indexOf with searchValue longer than string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Empty_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello";
      let result: number = str.indexOf("hello world");
      expect(result).assertEqual(-1);
    });


    /**
     * @tc.name   StringPrototype_IndexOf_Interaction_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_INTERACTION_0100
     * @tc.desc   Test indexOf vs lastIndexOf with multiple occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Interaction_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world hello";
      let firstIndex: number = str.indexOf("hello");
      let lastIndex: number = str.lastIndexOf("hello");
      expect(firstIndex).assertEqual(0);
      expect(lastIndex).assertEqual(12);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Interaction_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_INTERACTION_0200
     * @tc.desc   Test indexOf vs lastIndexOf with single occurrence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Interaction_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let firstIdx: number = str.indexOf("world");
      let lastIdx: number = str.lastIndexOf("world");
      expect(firstIdx).assertEqual(6);
      expect(lastIdx).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Interaction_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_INTERACTION_0300
     * @tc.desc   Test indexOf vs includes for existence check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Interaction_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let withIndexOf: boolean = str.indexOf("world") !== -1;
      let withIncludes: boolean = str.includes("world");
      expect(withIndexOf).assertTrue();
      expect(withIncludes).assertTrue();
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Interaction_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_INTERACTION_0400
     * @tc.desc   Test indexOf vs includes for non-existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Interaction_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let withIndexOf: boolean = str.indexOf("xyz") !== -1;
      let withIncludes: boolean = str.includes("xyz");
      expect(withIndexOf).assertFalse();
      expect(withIncludes).assertFalse();
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Interaction_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_INTERACTION_0500
     * @tc.desc   Test indexOf after using split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Interaction_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "apple,banana,orange";
      let fruits: string[] = str.split(",");
      let index: number = fruits.indexOf("banana");
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Interaction_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_INTERACTION_0600
     * @tc.desc   Test indexOf to determine substring starting position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Interaction_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let start: int = str.indexOf("world");
      let result: string = str.substring(start);
      expect(result).assertEqual("world");
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Interaction_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_INTERACTION_0700
     * @tc.desc   Test indexOf to extract content between markers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Interaction_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "<div>content</div>";
      let start: int = str.indexOf(">") + 1;
      let end: int = str.indexOf("<", start);
      let content: string = str.substring(start, end);
      expect(content).assertEqual("content");
    });


    /**
     * @tc.name   StringPrototype_IndexOf_Position_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0100
     * @tc.desc   Test indexOf with position=0 finding existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("o", 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0200
     * @tc.desc   Test indexOf with position=0 finding non-existing substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("xyz", 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0300
     * @tc.desc   Test indexOf with position pointing to substring location
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let result: number = str.indexOf("Whale", 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0400
     * @tc.desc   Test indexOf with position after substring location
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let result: number = str.indexOf("Whale", 7);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0500
     * @tc.desc   Test indexOf with position before substring location
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let result: number = str.indexOf("Whale", 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0600
     * @tc.desc   Test indexOf finding repeated occurrence with position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let paragraph: string = "I think Ruth's dog is cuter than your dog!";
      let searchTerm: string = "dog";
      let indexOfFirst: int = paragraph.indexOf(searchTerm);
      let indexOfSecond: int = paragraph.indexOf(searchTerm, indexOfFirst + 1);
      expect(indexOfFirst).assertEqual(15);
      expect(indexOfSecond).assertEqual(38);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0700
     * @tc.desc   Test indexOf with negative position (treated as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world hello";
      let result: number = str.indexOf("o", -5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_008
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0800
     * @tc.desc   Test indexOf with position=-1 (treated as 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("hello", -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_009
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_0900
     * @tc.desc   Test indexOf with position equal to string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("o", 11);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_010
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_1000
     * @tc.desc   Test indexOf with position greater than string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world hello";
      let result: number = str.indexOf("o", 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_011
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_1100
     * @tc.desc   Test indexOf with position just before substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("world", 5);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_012
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_1200
     * @tc.desc   Test indexOf with position at last index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello";
      let result: number = str.indexOf("o", 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Position_013
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_POSITION_1300
     * @tc.desc   Test indexOf with very large negative position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Position_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("hello", -999999);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.name   StringPrototype_IndexOf_Practical_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_PRACTICAL_0100
     * @tc.desc   Test indexOf for substring existence detection (found)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Practical_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let hasBlue: boolean = str.indexOf("Blue") !== -1;
      expect(hasBlue).assertTrue();
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Practical_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_PRACTICAL_0200
     * @tc.desc   Test indexOf for substring existence detection (not found)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Practical_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Blue Whale";
      let hasBloe: boolean = str.indexOf("Bloe") !== -1;
      expect(hasBloe).assertFalse();
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Practical_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_PRACTICAL_0300
     * @tc.desc   Test indexOf to count character occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Practical_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "To be, or not to be, that is the question.";
      let count: int = 0;
      let position: int = str.indexOf("e");
      while (position !== -1) {
        count++;
        position = str.indexOf("e", position + 1);
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Practical_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_PRACTICAL_0400
     * @tc.desc   Test indexOf to count substring occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Practical_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world, hello universe";
      let count: int = 0;
      let position: int = str.indexOf("hello");
      while (position !== -1) {
        count++;
        position = str.indexOf("hello", position + 1);
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Practical_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_PRACTICAL_0500
     * @tc.desc   Test indexOf to find all occurrences positions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Practical_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world hello";
      let positions: int[] = [];
      let position: int = str.indexOf("hello");
      while (position !== -1) {
        positions.push(position);
        position = str.indexOf("hello", position + 1);
      }
      expect(positions.length).assertEqual(2);
      expect(positions[0]).assertEqual(0);
      expect(positions[1]).assertEqual(12);
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Practical_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_PRACTICAL_0600
     * @tc.desc   Test indexOf for prefix check (has prefix)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Practical_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // ArkTS does not support nested functions, inline the logic
      let str: string = "hello world";
      let prefix: string = "hello";
      let result: boolean = str.indexOf(prefix) === 0;
      expect(result).assertTrue();
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Practical_007
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_PRACTICAL_0700
     * @tc.desc   Test indexOf for prefix check (no prefix)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Practical_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // ArkTS does not support nested functions, inline the logic
      let str: string = "hello world";
      let prefix: string = "world";
      let result: boolean = str.indexOf(prefix) === 0;
      expect(result).assertFalse();
    });


    /**
     * @tc.name   StringPrototype_IndexOf_Return_001
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_RETURN_0100
     * @tc.desc   Test indexOf return type is always number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Return_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result1: number = str.indexOf("world");
      let result2: number = str.indexOf("xyz");
      expect(typeof result1).assertEqual("number");
      expect(typeof result2).assertEqual("number");
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Return_002
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_RETURN_0200
     * @tc.desc   Test indexOf returns non-negative integer when found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Return_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("world");
      expect(result >= 0).assertTrue();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Return_003
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_RETURN_0300
     * @tc.desc   Test indexOf returns -1 when not found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Return_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: number = str.indexOf("xyz");
      expect(result === -1).assertTrue();
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Return_004
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_RETURN_0400
     * @tc.desc   Test indexOf index accuracy using substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Return_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let index: int = str.indexOf("world");
      let extracted: string = str.substring(index, index + 5);
      expect(extracted).assertEqual("world");
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Return_005
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_RETURN_0500
     * @tc.desc   Test indexOf index accuracy using charAt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Return_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let index: int = str.indexOf("o");
      expect(str.charAt(index).toString()).assertEqual("o");
    });

    /**
     * @tc.name   StringPrototype_IndexOf_Return_006
     * @tc.number SUB_BUILTINS_STRING_PROTOTYPE_INDEXOF_RETURN_0600
     * @tc.desc   Test indexOf index accuracy using bracket notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringPrototype_IndexOf_Return_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let index: int = str.indexOf("o");
      expect(str[index]).assertEqual("o");
    });

  })
}
