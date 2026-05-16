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
  testArrayParam001,
  testArrayParam002,
  testArrayParam003,
  testDateParam001,
  testNullParam001,
  testNullParam002,
  testNullParam003,
  testUndefinedParam001,
  testUndefinedParam002,
  testUndefinedParam003,
  testNoParam001,
  testNoParam002,
  testNoParam003,
  testIntParam001,
  testIntParam002,
  testIntParam003,
  testFloatParam001,
  testFloatParam002,
  testFloatParam003,
  testNegativeParam001,
  testNegativeParam002,
  testNegativeParam003,
  testTrueParam001,
  testTrueParam002,
  testTrueParam003,
  testFalseParam001,
  testFalseParam002,
  testFalseParam003,
  testObjParam001,
  testObjParam002,
  testNumToString001,
  testNumToString002,
  testNumToString003,
  testBoolToString001,
  testBoolToString002,
  testBoolToString003,
  testStrPosition001,
  testStrPosition002,
  testStrPosition003,
  testBoolPosition001,
  testBoolPosition002,
  testBoolPosition003,
  testRegexMatch001,
  testRegexSearch001
} from './StringLastIndexOfJSHelper';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringLastIndexOfBasicTest() {
  describe('StringLastIndexOfBasicTest', () => {
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
     * @tc.name   StringLastIndexOf_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHAR_0100
     * @tc.desc   Test lastIndexOf with single character 'l' in string 'hello'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleChar_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHAR_0200
     * @tc.desc   Test lastIndexOf with single character 'o' in string 'world'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'world'.lastIndexOf('o');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleChar_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHAR_0300
     * @tc.desc   Test lastIndexOf with single character 'a' in string 'javascript'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'javascript'.lastIndexOf('a');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_Substring_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SUBSTRING_0100
     * @tc.desc   Test lastIndexOf with substring 'world' in string 'hello world'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Substring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world'.lastIndexOf('world');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_Substring_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SUBSTRING_0200
     * @tc.desc   Test lastIndexOf with substring 'script' in string 'javascript'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Substring_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'javascript'.lastIndexOf('script');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_Substring_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SUBSTRING_0300
     * @tc.desc   Test lastIndexOf with repeated substring 'test' in string 'test test test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Substring_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test test test'.lastIndexOf('test');
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   StringLastIndexOf_RepeatSubstring_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPEATSUBSTRING_0100
     * @tc.desc   Test lastIndexOf with repeated pattern 'ab' in string 'ababab'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RepeatSubstring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'ababab'.lastIndexOf('ab');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_RepeatSubstring_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPEATSUBSTRING_0200
     * @tc.desc   Test lastIndexOf with overlapping pattern 'aa' in string 'aaaa'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RepeatSubstring_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'aaaa'.lastIndexOf('aa');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_RepeatSubstring_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPEATSUBSTRING_0300
     * @tc.desc   Test lastIndexOf with repeated substring 'test' in string 'testtesttest'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RepeatSubstring_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'testtesttest'.lastIndexOf('test');
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name   StringLastIndexOf_CompleteMatch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPLETEMATCH_0100
     * @tc.desc   Test lastIndexOf with complete string match for 'hello'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompleteMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('hello');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_CompleteMatch_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPLETEMATCH_0200
     * @tc.desc   Test lastIndexOf with complete string match for 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompleteMatch_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('test');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_CompleteMatch_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPLETEMATCH_0300
     * @tc.desc   Test lastIndexOf with complete string match for 'javascript'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompleteMatch_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'javascript'.lastIndexOf('javascript');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_LongSubstring_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LONGSUBSTRING_0100
     * @tc.desc   Test lastIndexOf with longer search string than source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LongSubstring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hi'.lastIndexOf('hello');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_LongSubstring_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LONGSUBSTRING_0200
     * @tc.desc   Test lastIndexOf with longer search string 'abcd' in 'ab'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LongSubstring_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'ab'.lastIndexOf('abcd');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_LongSubstring_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LONGSUBSTRING_0300
     * @tc.desc   Test lastIndexOf with longer search string 'testing' in 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LongSubstring_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('testing');
      expect(result).assertEqual(-1);
    });


    /**
     * @tc.name   StringLastIndexOf_EmptyInNonEmpty_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINNONEMPTY_0100
     * @tc.desc   Test lastIndexOf with empty string in non-empty string 'hello'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInNonEmpty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInNonEmpty_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINNONEMPTY_0200
     * @tc.desc   Test lastIndexOf with empty string in non-empty string 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInNonEmpty_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInNonEmpty_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINNONEMPTY_0300
     * @tc.desc   Test lastIndexOf with empty string in single character string 'a'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInNonEmpty_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a'.lastIndexOf('');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInEmpty_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINEMPTY_0100
     * @tc.desc   Test lastIndexOf with empty string in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInEmpty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf('');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInEmpty_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINEMPTY_0200
     * @tc.desc   Test lastIndexOf with empty string and position 0 in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInEmpty_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf('', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInEmpty_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINEMPTY_0300
     * @tc.desc   Test lastIndexOf with empty string and position 10 in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInEmpty_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf('', 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_NonEmptyInEmpty_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NONEMPTYINEMPTY_0100
     * @tc.desc   Test lastIndexOf with non-empty search in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NonEmptyInEmpty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf('a');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_NonEmptyInEmpty_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NONEMPTYINEMPTY_0200
     * @tc.desc   Test lastIndexOf with 'test' in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NonEmptyInEmpty_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf('test');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_NonEmptyInEmpty_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NONEMPTYINEMPTY_0300
     * @tc.desc   Test lastIndexOf with space character in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NonEmptyInEmpty_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf(' ');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyWithPos_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYWITHPOS_0100
     * @tc.desc   Test lastIndexOf with empty string and position 3 in 'hello'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyWithPos_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('', 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyWithPos_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYWITHPOS_0200
     * @tc.desc   Test lastIndexOf with empty string and position 0 in 'hello'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyWithPos_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyWithPos_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYWITHPOS_0300
     * @tc.desc   Test lastIndexOf with empty string and position 2 in 'canal'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyWithPos_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'canal'.lastIndexOf('', 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleChar_011
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHAR_0110
     * @tc.desc   Test lastIndexOf with single character match in 'a'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleChar_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a'.lastIndexOf('a');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleChar_012
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHAR_0120
     * @tc.desc   Test lastIndexOf with single character match in 'z'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleChar_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'z'.lastIndexOf('z');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleChar_013
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHAR_0130
     * @tc.desc   Test lastIndexOf with numeric character '1' in string '1'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleChar_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '1'.lastIndexOf('1');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleCharDiff_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHARDIFF_0100
     * @tc.desc   Test lastIndexOf with different single characters 'b' in 'a'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleCharDiff_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a'.lastIndexOf('b');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleCharDiff_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHARDIFF_0200
     * @tc.desc   Test lastIndexOf with different single characters 'y' in 'x'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleCharDiff_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'x'.lastIndexOf('y');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_SingleCharDiff_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SINGLECHARDIFF_0300
     * @tc.desc   Test lastIndexOf with different numeric characters '2' in '1'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SingleCharDiff_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '1'.lastIndexOf('2');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_LongString_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LONGSTRING_0100
     * @tc.desc   Test lastIndexOf with single character in very long string (20001 chars)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LongString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let longStr: string = 'a'.repeat(10000) + 'b' + 'a'.repeat(10000);
      let result: number = longStr.lastIndexOf('b');
      expect(result).assertEqual(10000);
    });

    /**
     * @tc.name   StringLastIndexOf_LongString_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LONGSTRING_0200
     * @tc.desc   Test lastIndexOf with substring 'aaa' in very long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LongString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let longStr: string = 'a'.repeat(10000) + 'b' + 'a'.repeat(10000);
      let result: number = longStr.lastIndexOf('aaa');
      expect(result).assertEqual(19998);
    });

    /**
     * @tc.name   StringLastIndexOf_LongString_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LONGSTRING_0300
     * @tc.desc   Test lastIndexOf with non-existent substring 'bab' in very long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LongString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let longStr: string = 'a'.repeat(10000) + 'b' + 'a'.repeat(10000);
      let result: number = longStr.lastIndexOf('bab');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_RepeatString_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPEATSTRING_0100
     * @tc.desc   Test lastIndexOf with pattern 'ab' in repeated string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RepeatString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let repeatStr: string = 'ab'.repeat(5000);
      let result: number = repeatStr.lastIndexOf('ab');
      expect(result).assertEqual(9998);
    });

    /**
     * @tc.name   StringLastIndexOf_RepeatString_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPEATSTRING_0200
     * @tc.desc   Test lastIndexOf with pattern 'ba' in repeated string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RepeatString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let repeatStr: string = 'ab'.repeat(5000);
      let result: number = repeatStr.lastIndexOf('ba');
      expect(result).assertEqual(9997);
    });

    /**
     * @tc.name   StringLastIndexOf_RepeatString_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPEATSTRING_0300
     * @tc.desc   Test lastIndexOf with longer pattern 'abab' in repeated string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RepeatString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let repeatStr: string = 'ab'.repeat(5000);
      let result: number = repeatStr.lastIndexOf('abab');
      expect(result).assertEqual(9996);
    });

    /**
     * @tc.name   StringLastIndexOf_MinSafeInt_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MINSAFEINT_0100
     * @tc.desc   Test lastIndexOf with position parameter as MIN_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MinSafeInt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('h', Number.MIN_SAFE_INTEGER);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_UpperVsLower_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UPPERVSLOWER_0100
     * @tc.desc   Test lastIndexOf case sensitivity with uppercase string and lowercase search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UpperVsLower_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'HELLO'.lastIndexOf('hello');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_UpperVsLower_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UPPERVSLOWER_0200
     * @tc.desc   Test lastIndexOf case sensitivity with lowercase string and uppercase search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UpperVsLower_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('HELLO');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_UpperVsLower_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UPPERVSLOWER_0300
     * @tc.desc   Test lastIndexOf case sensitivity with mixed case string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UpperVsLower_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'JavaScript'.lastIndexOf('javascript');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PartialCase_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PARTIALCASE_0100
     * @tc.desc   Test lastIndexOf case sensitivity with capital first letter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PartialCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'Hello'.lastIndexOf('hello');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PartialCase_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PARTIALCASE_0200
     * @tc.desc   Test lastIndexOf case sensitivity with mixed uppercase letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PartialCase_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'HeLLo'.lastIndexOf('hello');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PartialCase_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PARTIALCASE_0300
     * @tc.desc   Test lastIndexOf case sensitivity with camelCase string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PartialCase_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'JavaScript'.lastIndexOf('Javascript');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_AllLower_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ALLLOWER_0100
     * @tc.desc   Test lastIndexOf with all lowercase exact match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_AllLower_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('hello');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_AllLower_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ALLLOWER_0200
     * @tc.desc   Test lastIndexOf with lowercase substring in lowercase string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_AllLower_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world'.lastIndexOf('world');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_AllLower_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ALLLOWER_0300
     * @tc.desc   Test lastIndexOf with lowercase substring at end of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_AllLower_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'javascript'.lastIndexOf('script');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_AllUpper_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ALLUPPER_0100
     * @tc.desc   Test lastIndexOf with all uppercase exact match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_AllUpper_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'HELLO'.lastIndexOf('HELLO');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_AllUpper_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ALLUPPER_0200
     * @tc.desc   Test lastIndexOf with uppercase substring in uppercase string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_AllUpper_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'HELLO WORLD'.lastIndexOf('WORLD');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_AllUpper_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ALLUPPER_0300
     * @tc.desc   Test lastIndexOf with uppercase substring at end of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_AllUpper_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'JAVASCRIPT'.lastIndexOf('SCRIPT');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedCase_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDCASE_0100
     * @tc.desc   Test lastIndexOf with mixed case exact match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'JavaScript'.lastIndexOf('JavaScript');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedCase_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDCASE_0200
     * @tc.desc   Test lastIndexOf with mixed case string including space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedCase_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'Hello World'.lastIndexOf('Hello World');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedCase_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDCASE_0300
     * @tc.desc   Test lastIndexOf with mixed case substring in camelCase string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedCase_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'TestCase'.lastIndexOf('Case');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_NumberSymbol_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMBERSYMBOL_0100
     * @tc.desc   Test lastIndexOf with numeric string exact match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumberSymbol_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '123'.lastIndexOf('123');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_NumberSymbol_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMBERSYMBOL_0200
     * @tc.desc   Test lastIndexOf with special symbols exact match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumberSymbol_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '!@#'.lastIndexOf('!@#');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_NumberSymbol_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMBERSYMBOL_0300
     * @tc.desc   Test lastIndexOf with numeric substring at end of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumberSymbol_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test123'.lastIndexOf('123');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_UnicodeCase_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNICODECASE_0100
     * @tc.desc   Test lastIndexOf case sensitivity with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UnicodeCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'CAFÉ'.lastIndexOf('café');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_UnicodeCase_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNICODECASE_0200
     * @tc.desc   Test lastIndexOf with German sharp s character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UnicodeCase_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'ß'.lastIndexOf('SS');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_UnicodeCase_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNICODECASE_0300
     * @tc.desc   Test lastIndexOf with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UnicodeCase_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '测试'.lastIndexOf('测');
      expect(result).assertEqual(0);
    });


    /**
     * @tc.name   StringLastIndexOf_CompareUnique_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPAREUNIQUE_0100
     * @tc.desc   Compare indexOf and lastIndexOf for unique substring 'world'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompareUnique_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let indexOf: number = str.indexOf('world');
      let lastIndexOf: number = str.lastIndexOf('world');
      expect(indexOf).assertEqual(6);
      expect(lastIndexOf).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_CompareUnique_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPAREUNIQUE_0200
     * @tc.desc   Compare indexOf and lastIndexOf for unique substring 'hello'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompareUnique_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let indexOf: number = str.indexOf('hello');
      let lastIndexOf: number = str.lastIndexOf('hello');
      expect(indexOf).assertEqual(0);
      expect(lastIndexOf).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_CompareNoMatch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPARENOMATCH_0100
     * @tc.desc   Compare indexOf and lastIndexOf when substring not found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompareNoMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let indexOf: number = str.indexOf('xyz');
      let lastIndexOf: number = str.lastIndexOf('xyz');
      expect(indexOf).assertEqual(-1);
      expect(lastIndexOf).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_CompareNoMatch_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPARENOMATCH_0200
     * @tc.desc   Compare indexOf and lastIndexOf when another substring not found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompareNoMatch_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let indexOf: number = str.indexOf('test');
      let lastIndexOf: number = str.lastIndexOf('test');
      expect(indexOf).assertEqual(-1);
      expect(lastIndexOf).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_CompareMultiple_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPAREMULTIPLE_0100
     * @tc.desc   Compare indexOf and lastIndexOf for multiple occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompareMultiple_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test test test';
      let indexOf: number = str.indexOf('test');
      let lastIndexOf: number = str.lastIndexOf('test');
      expect(indexOf).assertEqual(0);
      expect(lastIndexOf).assertEqual(10);
    });

    /**
     * @tc.name   StringLastIndexOf_CompareMultiple_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPAREMULTIPLE_0200
     * @tc.desc   Compare indexOf and lastIndexOf for single character occurrences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompareMultiple_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test test test';
      let indexOf: number = str.indexOf('t');
      let lastIndexOf: number = str.lastIndexOf('t');
      expect(indexOf).assertEqual(0);
      expect(lastIndexOf).assertEqual(13);
    });

    /**
     * @tc.name   StringLastIndexOf_CompareOverlap_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPAREOVERLAP_0100
     * @tc.desc   Compare indexOf and lastIndexOf with overlapping patterns
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CompareOverlap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'aaaa';
      let indexOf: number = str.indexOf('aa');
      let lastIndexOf: number = str.lastIndexOf('aa');
      expect(indexOf).assertEqual(0);
      expect(lastIndexOf).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_ComparePosition_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMPAREPOSITION_0100
     * @tc.desc   Compare indexOf and lastIndexOf with different position parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ComparePosition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world hello';
      let indexOf: number = str.indexOf('hello', 5);
      let lastIndexOf: number = str.lastIndexOf('hello', 10);
      expect(indexOf).assertEqual(12);
      expect(lastIndexOf).assertEqual(0);
    });


    /**
     * @tc.name   StringLastIndexOf_EmptyNoPos_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYNOPOS_0100
     * @tc.desc   Test lastIndexOf with empty string and no position in 'hello'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyNoPos_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyNoPos_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYNOPOS_0200
     * @tc.desc   Test lastIndexOf with empty string and no position in 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyNoPos_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyNoPos_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYNOPOS_0300
     * @tc.desc   Test lastIndexOf with empty string and no position in single char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyNoPos_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a'.lastIndexOf('');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyPosZero_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYPOSZERO_0100
     * @tc.desc   Test lastIndexOf with empty string and position 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyPosZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyPosZero_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYPOSZERO_0200
     * @tc.desc   Test lastIndexOf with empty string and position 0 in 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyPosZero_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyPosZero_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYPOSZERO_0300
     * @tc.desc   Test lastIndexOf with empty string and position 0 in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyPosZero_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf('', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInRange_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINRANGE_0100
     * @tc.desc   Test lastIndexOf with empty string and position in valid range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInRange_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('', 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInRange_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINRANGE_0200
     * @tc.desc   Test lastIndexOf with empty string and position 2 in 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInRange_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('', 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInRange_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINRANGE_0300
     * @tc.desc   Test lastIndexOf with empty string and position 2 in 'canal'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInRange_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'canal'.lastIndexOf('', 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyOverLen_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYOVERLEN_0100
     * @tc.desc   Test lastIndexOf with empty string and position beyond string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyOverLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('', 100);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyOverLen_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYOVERLEN_0200
     * @tc.desc   Test lastIndexOf with empty string and very large position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyOverLen_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('', 1000);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyOverLen_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYOVERLEN_0300
     * @tc.desc   Test lastIndexOf with empty string and position 10 in single char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyOverLen_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a'.lastIndexOf('', 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyNegPos_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYNEGPOS_0100
     * @tc.desc   Test lastIndexOf with empty string and negative position -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyNegPos_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('', -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyNegPos_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYNEGPOS_0200
     * @tc.desc   Test lastIndexOf with empty string and large negative position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyNegPos_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('', -100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyNegPos_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYNEGPOS_0300
     * @tc.desc   Test lastIndexOf with empty string and negative position -5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyNegPos_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('', -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_EmptyInEmpty_004
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMPTYINEMPTY_0400
     * @tc.desc   Test lastIndexOf with empty string and large position in empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EmptyInEmpty_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = ''.lastIndexOf('', 100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_ArrayParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ARRAYPARAM_0100
     * @tc.desc   Test lastIndexOf with array parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ArrayParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testArrayParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_ArrayParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ARRAYPARAM_0200
     * @tc.desc   Test lastIndexOf with another array parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ArrayParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testArrayParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_ArrayParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ARRAYPARAM_0300
     * @tc.desc   Test lastIndexOf with third array parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ArrayParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testArrayParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_DateParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_DATEPARAM_0100
     * @tc.desc   Test lastIndexOf with Date object parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_DateParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testDateParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NullParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLPARAM_0100
     * @tc.desc   Test lastIndexOf with null parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNullParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NullParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLPARAM_0200
     * @tc.desc   Test lastIndexOf with null search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNullParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NullParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLPARAM_0300
     * @tc.desc   Test lastIndexOf with null position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNullParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_UndefinedParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNDEFINEDPARAM_0100
     * @tc.desc   Test lastIndexOf with undefined parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UndefinedParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testUndefinedParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_UndefinedParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNDEFINEDPARAM_0200
     * @tc.desc   Test lastIndexOf with undefined search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UndefinedParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testUndefinedParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_UndefinedParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNDEFINEDPARAM_0300
     * @tc.desc   Test lastIndexOf with undefined position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UndefinedParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testUndefinedParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NoParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOPARAM_0100
     * @tc.desc   Test lastIndexOf with no parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NoParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNoParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NoParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOPARAM_0200
     * @tc.desc   Test lastIndexOf called with empty arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NoParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNoParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NoParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOPARAM_0300
     * @tc.desc   Test lastIndexOf with missing parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NoParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNoParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_IntParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_INTPARAM_0100
     * @tc.desc   Test lastIndexOf with integer parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_IntParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIntParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_IntParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_INTPARAM_0200
     * @tc.desc   Test lastIndexOf with integer search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_IntParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIntParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_IntParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_INTPARAM_0300
     * @tc.desc   Test lastIndexOf with integer position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_IntParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIntParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_FloatParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FLOATPARAM_0100
     * @tc.desc   Test lastIndexOf with float parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FloatParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFloatParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_FloatParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FLOATPARAM_0200
     * @tc.desc   Test lastIndexOf with float search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FloatParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFloatParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_FloatParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FLOATPARAM_0300
     * @tc.desc   Test lastIndexOf with float position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FloatParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFloatParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NegativeParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGATIVEPARAM_0100
     * @tc.desc   Test lastIndexOf with negative number parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegativeParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNegativeParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NegativeParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGATIVEPARAM_0200
     * @tc.desc   Test lastIndexOf with negative search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegativeParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNegativeParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NegativeParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGATIVEPARAM_0300
     * @tc.desc   Test lastIndexOf with negative position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegativeParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNegativeParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_TrueParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TRUEPARAM_0100
     * @tc.desc   Test lastIndexOf with boolean true parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_TrueParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testTrueParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_TrueParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TRUEPARAM_0200
     * @tc.desc   Test lastIndexOf with true as search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_TrueParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testTrueParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_TrueParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TRUEPARAM_0300
     * @tc.desc   Test lastIndexOf with true as position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_TrueParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testTrueParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_FalseParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FALSEPARAM_0100
     * @tc.desc   Test lastIndexOf with boolean false parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FalseParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFalseParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_FalseParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FALSEPARAM_0200
     * @tc.desc   Test lastIndexOf with false as search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FalseParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFalseParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_FalseParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_FALSEPARAM_0300
     * @tc.desc   Test lastIndexOf with false as position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_FalseParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testFalseParam003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_ObjParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_OBJPARAM_0100
     * @tc.desc   Test lastIndexOf with object parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ObjParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testObjParam001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_ObjParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_OBJPARAM_0200
     * @tc.desc   Test lastIndexOf with object toString conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ObjParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testObjParam002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NumToString_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMTOSTRING_0100
     * @tc.desc   Test lastIndexOf with number to string conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumToString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNumToString001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NumToString_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMTOSTRING_0200
     * @tc.desc   Test lastIndexOf with number search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumToString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNumToString002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_NumToString_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NUMTOSTRING_0300
     * @tc.desc   Test lastIndexOf with number position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NumToString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNumToString003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolToString_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLTOSTRING_0100
     * @tc.desc   Test lastIndexOf with boolean to string conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolToString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBoolToString001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolToString_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLTOSTRING_0200
     * @tc.desc   Test lastIndexOf with boolean search parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolToString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBoolToString002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolToString_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLTOSTRING_0300
     * @tc.desc   Test lastIndexOf with boolean position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolToString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBoolToString003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_StrPosition_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRPOSITION_0100
     * @tc.desc   Test lastIndexOf with string position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StrPosition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testStrPosition001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_StrPosition_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRPOSITION_0200
     * @tc.desc   Test lastIndexOf with numeric string position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StrPosition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testStrPosition002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_StrPosition_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRPOSITION_0300
     * @tc.desc   Test lastIndexOf with string numeric position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StrPosition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testStrPosition003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolPosition_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLPOSITION_0100
     * @tc.desc   Test lastIndexOf with boolean position parameter conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolPosition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBoolPosition001();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolPosition_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLPOSITION_0200
     * @tc.desc   Test lastIndexOf with true as position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolPosition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBoolPosition002();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_BoolPosition_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BOOLPOSITION_0300
     * @tc.desc   Test lastIndexOf with false as position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_BoolPosition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testBoolPosition003();
      expect(result['result']).assertEqual(result['expected']);
    });

    /**
     * @tc.name   StringLastIndexOf_RegexMatch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REGEXMATCH_0100
     * @tc.desc   Test lastIndexOf interaction with regex match method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RegexMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testRegexMatch001();
      expect(result['lastIndex']).assertEqual(result['expectedIndex']);
      expect(result['lastMatch']).assertEqual(result['expectedMatch']);
    });

    /**
     * @tc.name   StringLastIndexOf_RegexSearch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REGEXSEARCH_0100
     * @tc.desc   Test lastIndexOf interaction with regex search method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_RegexSearch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testRegexSearch001();
      expect(result['lastIndexOf']).assertEqual(result['expectedLast']);
      expect(result['searchResult']).assertEqual(result['expectedSearch']);
    });


    /**
     * @tc.name   StringLastIndexOf_Substring_011
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SUBSTRING_1100
     * @tc.desc   Test lastIndexOf combined with substring for path extraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Substring_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'path/to/file.txt';
      let lastSlash: number = str.lastIndexOf('/');
      let result: string = str.substring(lastSlash + 1);
      expect(result).assertEqual('file.txt');
    });

    /**
     * @tc.name   StringLastIndexOf_Slice_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SLICE_0100
     * @tc.desc   Test lastIndexOf combined with slice for email extraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Slice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'user@domain.com';
      let atIndex: number = str.lastIndexOf('@');
      let result1: string = str.slice(0, atIndex);
      let result2: string = str.slice(atIndex + 1);
      expect(result1).assertEqual('user');
      expect(result2).assertEqual('domain.com');
    });

    /**
     * @tc.name   StringLastIndexOf_Split_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SPLIT_0100
     * @tc.desc   Test lastIndexOf combined with slice for version splitting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Split_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'a.b.c.d';
      let lastDot: number = str.lastIndexOf('.');
      let result1: string = str.slice(0, lastDot);
      let result2: string = str.slice(lastDot + 1);
      expect(result1).assertEqual('a.b.c');
      expect(result2).assertEqual('d');
    });

    /**
     * @tc.name   StringLastIndexOf_Replace_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPLACE_0100
     * @tc.desc   Test lastIndexOf combined with slice for replacement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Replace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test.test.test';
      let search: string = 'test';
      let lastIndex: number = str.lastIndexOf(search);
      let result: string = str.slice(0, lastIndex) + 'demo' + str.slice(lastIndex + search.length);
      expect(result).assertEqual('test.test.demo');
    });

    /**
     * @tc.name   StringLastIndexOf_Includes_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_INCLUDES_0100
     * @tc.desc   Test lastIndexOf used for includes check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Includes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let includes: boolean = str.lastIndexOf('world') !== -1;
      expect(includes).assertTrue();
      expect(str.includes('world')).assertTrue();
    });

    /**
     * @tc.name   StringLastIndexOf_EndsWith_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ENDSWITH_0100
     * @tc.desc   Test lastIndexOf combined with endsWith check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_EndsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello world';
      let endsWith: boolean = str.lastIndexOf('world') === str.length - 'world'.length;
      expect(endsWith).assertTrue();
      expect(str.endsWith('world')).assertTrue();
    });

    /**
     * @tc.name   StringLastIndexOf_Repeat_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_REPEAT_0100
     * @tc.desc   Test lastIndexOf with repeated string patterns
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Repeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let repeated: string = 'ab'.repeat(5);
      let result1: number = repeated.lastIndexOf('ab');
      let result2: number = repeated.lastIndexOf('ba');
      expect(result1).assertEqual(8);
      expect(result2).assertEqual(7);
    });

    /**
     * @tc.name   StringLastIndexOf_Trim_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TRIM_0100
     * @tc.desc   Test lastIndexOf with trimmed and untrimmed strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Trim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '  hello world  ';
      let trimmed: string = str.trim();
      let result1: number = trimmed.lastIndexOf('world');
      let result2: number = str.lastIndexOf('world');
      expect(result1).assertEqual(6);
      expect(result2).assertEqual(8);
    });

    /**
     * @tc.name   StringLastIndexOf_ToLowerCase_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TOLOWERCASE_0100
     * @tc.desc   Test lastIndexOf with toLowerCase for case-insensitive search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ToLowerCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello World';
      let searchStr: string = 'world';
      let index: number = str.toLowerCase().lastIndexOf(searchStr.toLowerCase());
      expect(index).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_ToUpperCase_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TOUPPERCASE_0100
     * @tc.desc   Test lastIndexOf with toUpperCase for case-insensitive search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ToUpperCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'Hello World';
      let searchStr: string = 'WORLD';
      let index: number = str.toUpperCase().lastIndexOf(searchStr.toUpperCase());
      expect(index).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_PadStart_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PADSTART_0100
     * @tc.desc   Test lastIndexOf with padStart modified string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PadStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test'.padStart(10, '0');
      let result1: number = str.lastIndexOf('test');
      let result2: number = str.lastIndexOf('0');
      expect(str).assertEqual('000000test');
      expect(result1).assertEqual(6);
      expect(result2).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_PadEnd_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PADEND_0100
     * @tc.desc   Test lastIndexOf with padEnd modified string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PadEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test'.padEnd(10, '0');
      let result1: number = str.lastIndexOf('test');
      let result2: number = str.lastIndexOf('0');
      expect(str).assertEqual('test000000');
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(9);
    });

    /**
     * @tc.name   StringLastIndexOf_Concat_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CONCAT_0100
     * @tc.desc   Test lastIndexOf with concatenated string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Concat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = 'hello';
      let str2: string = 'world';
      let combined: string = str1.concat(' ', str2);
      let result1: number = combined.lastIndexOf('world');
      let result2: number = combined.lastIndexOf('hello');
      expect(result1).assertEqual(6);
      expect(result2).assertEqual(0);
    });


    /**
     * @tc.name   StringLastIndexOf_PositionMiddle_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONMIDDLE_0100
     * @tc.desc   Test lastIndexOf with middle position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionMiddle_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'canal'.lastIndexOf('a', 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionMiddle_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONMIDDLE_0200
     * @tc.desc   Test lastIndexOf with middle position in longer string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionMiddle_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world'.lastIndexOf('o', 5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionMiddle_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONMIDDLE_0300
     * @tc.desc   Test lastIndexOf with position parameter in middle of repeated substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionMiddle_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'testtest'.lastIndexOf('test', 6);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionEqual_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONEQUAL_0100
     * @tc.desc   Test lastIndexOf with position equal to character index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionEqual_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l', 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionEqual_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONEQUAL_0200
     * @tc.desc   Test lastIndexOf with position equal to character index in 'world'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionEqual_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'world'.lastIndexOf('r', 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionEqual_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONEQUAL_0300
     * @tc.desc   Test lastIndexOf with position equal to character index in 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionEqual_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('e', 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionGreater_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONGREATER_0100
     * @tc.desc   Test lastIndexOf with position greater than string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionGreater_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l', 100);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionGreater_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONGREATER_0200
     * @tc.desc   Test lastIndexOf with very large position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionGreater_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('t', 1000);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionGreater_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONGREATER_0300
     * @tc.desc   Test lastIndexOf with position greater than length in repeated string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionGreater_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world hello'.lastIndexOf('hello', 99);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionZero_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONZERO_0100
     * @tc.desc   Test lastIndexOf with position 0 and character at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionZero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('h', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionZero_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONZERO_0200
     * @tc.desc   Test lastIndexOf with position 0 and character not at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionZero_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('e', 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionZero_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONZERO_0300
     * @tc.desc   Test lastIndexOf with position 0 and character at start in 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionZero_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('t', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionNegative_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONNEGATIVE_0100
     * @tc.desc   Test lastIndexOf with negative position parameter -5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionNegative_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'canal'.lastIndexOf('c', -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionNegative_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONNEGATIVE_0200
     * @tc.desc   Test lastIndexOf with position 0 to verify negative handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionNegative_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'canal'.lastIndexOf('c', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionNegative_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONNEGATIVE_0300
     * @tc.desc   Test lastIndexOf with large negative position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionNegative_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('h', -100);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionNegative_004
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONNEGATIVE_0400
     * @tc.desc   Test lastIndexOf with position -1 searching for character not at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionNegative_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('e', -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionDecimal_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONDECIMAL_0100
     * @tc.desc   Test lastIndexOf with decimal position parameter 2.9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionDecimal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l', 2.9);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionDecimal_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONDECIMAL_0200
     * @tc.desc   Test lastIndexOf with decimal position parameter 3.1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionDecimal_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l', 3.1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_PositionDecimal_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSITIONDECIMAL_0300
     * @tc.desc   Test lastIndexOf with decimal position parameter 3.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PositionDecimal_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('t', 3.5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_NegInfinity_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGINFINITY_0100
     * @tc.desc   Test lastIndexOf with negative infinity position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegInfinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('h', -Infinity);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_NegInfinity_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGINFINITY_0200
     * @tc.desc   Test lastIndexOf with negative infinity position and character not at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegInfinity_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('e', -Infinity);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_NegInfinity_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEGINFINITY_0300
     * @tc.desc   Test lastIndexOf with negative infinity position in 'test'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NegInfinity_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('t', -Infinity);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_NaN_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NAN_0100
     * @tc.desc   Test lastIndexOf with NaN position parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NaN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('h', NaN);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_NaN_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NAN_0200
     * @tc.desc   Test lastIndexOf with NaN position and character not at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NaN_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('e', NaN);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_NaN_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NAN_0300
     * @tc.desc   Test lastIndexOf with NaN position in repeated character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NaN_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('t', NaN);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_PosBeforeMatches_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSBEFOREMATCHES_0100
     * @tc.desc   Test lastIndexOf with position before first match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosBeforeMatches_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world hello'.lastIndexOf('hello', 4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PosBeforeMatches_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSBEFOREMATCHES_0200
     * @tc.desc   Test lastIndexOf with position before match returns -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosBeforeMatches_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world hello'.lastIndexOf('world', 4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PosBeforeMatches_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSBEFOREMATCHES_0300
     * @tc.desc   Test lastIndexOf with position before second match returns first match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosBeforeMatches_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test test test'.lastIndexOf('test', 2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PosBetweenMatches_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSBETWEENMATCHES_0100
     * @tc.desc   Test lastIndexOf with position between two matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosBetweenMatches_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world hello'.lastIndexOf('hello', 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_PosBetweenMatches_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSBETWEENMATCHES_0200
     * @tc.desc   Test lastIndexOf with position between matches returns earlier match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosBetweenMatches_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test test test'.lastIndexOf('test', 8);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_PosBetweenMatches_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSBETWEENMATCHES_0300
     * @tc.desc   Test lastIndexOf with position at last match index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosBetweenMatches_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'ab ab ab'.lastIndexOf('ab', 6);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_PosAfterMatches_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSAFTERMATCHES_0100
     * @tc.desc   Test lastIndexOf with position after all matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosAfterMatches_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world hello'.lastIndexOf('hello', 20);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name   StringLastIndexOf_PosAfterMatches_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSAFTERMATCHES_0200
     * @tc.desc   Test lastIndexOf with large position in repeated string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosAfterMatches_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test test test'.lastIndexOf('test', 20);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   StringLastIndexOf_PosAfterMatches_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_POSAFTERMATCHES_0300
     * @tc.desc   Test lastIndexOf with position beyond string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PosAfterMatches_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'ab ab ab'.lastIndexOf('ab', 20);
      expect(result).assertEqual(6);
    });


    /**
     * @tc.name   StringLastIndexOf_CorrectIndex_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CORRECTINDEX_0100
     * @tc.desc   Test lastIndexOf returns correct index for character at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CorrectIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('h');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_CorrectIndex_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CORRECTINDEX_0200
     * @tc.desc   Test lastIndexOf returns correct index for second character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CorrectIndex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('e');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_CorrectIndex_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CORRECTINDEX_0300
     * @tc.desc   Test lastIndexOf returns correct index for repeated character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CorrectIndex_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_CorrectIndex_004
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CORRECTINDEX_0400
     * @tc.desc   Test lastIndexOf returns correct index for last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CorrectIndex_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('o');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_LastOccurrence_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LASTOCCURRENCE_0100
     * @tc.desc   Test lastIndexOf returns last occurrence of repeated pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LastOccurrence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'ababab'.lastIndexOf('ab');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_LastOccurrence_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LASTOCCURRENCE_0200
     * @tc.desc   Test lastIndexOf returns last occurrence of single character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LastOccurrence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'aaa'.lastIndexOf('a');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_LastOccurrence_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_LASTOCCURRENCE_0300
     * @tc.desc   Test lastIndexOf returns last occurrence of substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_LastOccurrence_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'testtest'.lastIndexOf('test');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_StartIndex_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STARTINDEX_0100
     * @tc.desc   Test lastIndexOf returns correct index for substring at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StartIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('he');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_StartIndex_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STARTINDEX_0200
     * @tc.desc   Test lastIndexOf returns correct index for substring at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StartIndex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('te');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_StartIndex_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STARTINDEX_0300
     * @tc.desc   Test lastIndexOf returns correct index for substring at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StartIndex_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'javascript'.lastIndexOf('java');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_NotFound_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOTFOUND_0100
     * @tc.desc   Test lastIndexOf returns -1 when character not found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NotFound_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('x');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_NotFound_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOTFOUND_0200
     * @tc.desc   Test lastIndexOf returns -1 when substring not found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NotFound_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'world'.lastIndexOf('test');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_NotFound_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NOTFOUND_0300
     * @tc.desc   Test lastIndexOf returns -1 when another substring not found
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NotFound_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'javascript'.lastIndexOf('python');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PartialMatch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PARTIALMATCH_0100
     * @tc.desc   Test lastIndexOf returns -1 for partial match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PartialMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('helx');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PartialMatch_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PARTIALMATCH_0200
     * @tc.desc   Test lastIndexOf returns -1 for longer search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PartialMatch_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'world'.lastIndexOf('worlde');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_PartialMatch_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_PARTIALMATCH_0300
     * @tc.desc   Test lastIndexOf returns -1 for longer search string than source
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_PartialMatch_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test'.lastIndexOf('testing');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_CaseMismatch_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CASEMISMATCH_0100
     * @tc.desc   Test lastIndexOf case sensitivity with different first character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CaseMismatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'Hello'.lastIndexOf('hello');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_CaseMismatch_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CASEMISMATCH_0200
     * @tc.desc   Test lastIndexOf case sensitivity with all uppercase string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CaseMismatch_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'WORLD'.lastIndexOf('world');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_CaseMismatch_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CASEMISMATCH_0300
     * @tc.desc   Test lastIndexOf case sensitivity with mixed case string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CaseMismatch_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'JavaScript'.lastIndexOf('javascript');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   StringLastIndexOf_ReturnType_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_RETURNTYPE_0100
     * @tc.desc   Test lastIndexOf returns number type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ReturnType_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l');
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   StringLastIndexOf_ReturnType_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_RETURNTYPE_0200
     * @tc.desc   Test lastIndexOf return value strict equality check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ReturnType_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l');
      expect(result === 3).assertTrue();
    });

    /**
     * @tc.name   StringLastIndexOf_ReturnType_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_RETURNTYPE_0300
     * @tc.desc   Test lastIndexOf return value is not string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ReturnType_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l');
      expect(typeof result !== 'string').assertTrue();
    });

    /**
     * @tc.name   StringLastIndexOf_ReturnType_004
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_RETURNTYPE_0400
     * @tc.desc   Test lastIndexOf return value with multiple assertions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ReturnType_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello'.lastIndexOf('l');
      expect(result).assertEqual(3);
      expect(result === 3).assertTrue();
    });


    /**
     * @tc.name   StringLastIndexOf_StringParam_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRINGPARAM_0100
     * @tc.desc   Test lastIndexOf with string parameter in middle of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StringParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world'.lastIndexOf('world');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_StringParam_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRINGPARAM_0200
     * @tc.desc   Test lastIndexOf with string parameter at start of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StringParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'javascript'.lastIndexOf('java');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLastIndexOf_StringParam_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_STRINGPARAM_0300
     * @tc.desc   Test lastIndexOf with string parameter at end of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_StringParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'testing'.lastIndexOf('ing');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_SpecialChar_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SPECIALCHAR_0100
     * @tc.desc   Test lastIndexOf with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SpecialChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello\nworld'.lastIndexOf('\n');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_SpecialChar_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SPECIALCHAR_0200
     * @tc.desc   Test lastIndexOf with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SpecialChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'tab\there'.lastIndexOf('\t');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_SpecialChar_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SPECIALCHAR_0300
     * @tc.desc   Test lastIndexOf with backslash character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_SpecialChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'path\\to\\file'.lastIndexOf('\\');
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   StringLastIndexOf_QuoteChar_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_QUOTECHAR_0100
     * @tc.desc   Test lastIndexOf with single quote character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_QuoteChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "it's".lastIndexOf("'");
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_QuoteChar_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_QUOTECHAR_0200
     * @tc.desc   Test lastIndexOf with double quote character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_QuoteChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'say "hello"'.lastIndexOf('"');
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   StringLastIndexOf_QuoteChar_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_QUOTECHAR_0300
     * @tc.desc   Test lastIndexOf with multiple single quotes in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_QuoteChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test'test'test".lastIndexOf("'");
      expect(result).assertEqual(9);
    });


    /**
     * @tc.name   StringLastIndexOf_Space_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SPACE_0100
     * @tc.desc   Test lastIndexOf with single space character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Space_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello world'.lastIndexOf(' ');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_Space_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SPACE_0200
     * @tc.desc   Test lastIndexOf with double space characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Space_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a  b  c'.lastIndexOf('  ');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_Space_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SPACE_0300
     * @tc.desc   Test lastIndexOf with space between words
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Space_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test test'.lastIndexOf(' ');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_Tab_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TAB_0100
     * @tc.desc   Test lastIndexOf with multiple tab characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Tab_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a\tb\tc'.lastIndexOf('\t');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_Tab_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TAB_0200
     * @tc.desc   Test lastIndexOf with single tab character between words
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Tab_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello\tworld'.lastIndexOf('\t');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_Tab_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_TAB_0300
     * @tc.desc   Test lastIndexOf with all tab characters in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Tab_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '\t\t\t'.lastIndexOf('\t');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_NewLine_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEWLINE_0100
     * @tc.desc   Test lastIndexOf with multiple newline characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NewLine_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a\nb\nc'.lastIndexOf('\n');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_NewLine_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEWLINE_0200
     * @tc.desc   Test lastIndexOf with single newline character between words
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NewLine_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello\nworld'.lastIndexOf('\n');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_NewLine_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NEWLINE_0300
     * @tc.desc   Test lastIndexOf with newline characters in multi-line string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NewLine_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'line1\nline2\nline3'.lastIndexOf('\n');
      expect(result).assertEqual(11);
    });

    /**
     * @tc.name   StringLastIndexOf_CarriageReturn_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CARRIAGERETURN_0100
     * @tc.desc   Test lastIndexOf with multiple carriage return characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CarriageReturn_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a\rb\rc'.lastIndexOf('\r');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_CarriageReturn_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CARRIAGERETURN_0200
     * @tc.desc   Test lastIndexOf with single carriage return character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_CarriageReturn_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello\rworld'.lastIndexOf('\r');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedWhitespace_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDWHITESPACE_0100
     * @tc.desc   Test lastIndexOf with mixed tab and newline characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedWhitespace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a \t\n b'.lastIndexOf('\t\n');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedWhitespace_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDWHITESPACE_0200
     * @tc.desc   Test lastIndexOf with carriage return and newline combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedWhitespace_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test\r\nvalue'.lastIndexOf('\r\n');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_Backslash_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BACKSLASH_0100
     * @tc.desc   Test lastIndexOf with multiple backslash characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Backslash_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a\\b\\c'.lastIndexOf('\\');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_Backslash_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BACKSLASH_0200
     * @tc.desc   Test lastIndexOf with backslash in Windows-style path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Backslash_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'C:\\path\\to\\file'.lastIndexOf('\\');
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   StringLastIndexOf_Backslash_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BACKSLASH_0300
     * @tc.desc   Test lastIndexOf with all backslash characters in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Backslash_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '\\\\\\\\'.lastIndexOf('\\');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_Quote_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_QUOTE_0100
     * @tc.desc   Test lastIndexOf with single quote character in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Quote_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "it's".lastIndexOf("'");
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Quote_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_QUOTE_0200
     * @tc.desc   Test lastIndexOf with double quote character in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Quote_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'say "hi"'.lastIndexOf('"');
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   StringLastIndexOf_Quote_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_QUOTE_0300
     * @tc.desc   Test lastIndexOf with single quotes around string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Quote_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "'test'".lastIndexOf("'");
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_Emoji_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMOJI_0100
     * @tc.desc   Test lastIndexOf with emoji characters in mixed string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Emoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello 😊 world 😊'.lastIndexOf('😊');
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   StringLastIndexOf_Emoji_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMOJI_0200
     * @tc.desc   Test lastIndexOf with repeated emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Emoji_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '👍👎👍'.lastIndexOf('👍');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_Emoji_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_EMOJI_0300
     * @tc.desc   Test lastIndexOf with emoji in middle of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Emoji_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test🎉test'.lastIndexOf('🎉');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_UnicodeEscape_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNICODEESCAPE_0100
     * @tc.desc   Test lastIndexOf with Unicode escape sequence for Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UnicodeEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello\u4e16\u754c'.lastIndexOf('\u4e16');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_UnicodeEscape_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_UNICODEESCAPE_0200
     * @tc.desc   Test lastIndexOf with Unicode escape sequence for copyright symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_UnicodeEscape_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test\u00A9test'.lastIndexOf('\u00A9');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_ZeroWidth_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ZEROWIDTH_0100
     * @tc.desc   Test lastIndexOf with zero-width space character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ZeroWidth_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello\u200Bworld'.lastIndexOf('\u200B');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_ZeroWidth_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ZEROWIDTH_0200
     * @tc.desc   Test lastIndexOf with zero-width non-joiner character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ZeroWidth_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test\u200Ctest'.lastIndexOf('\u200C');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_NullChar_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLCHAR_0100
     * @tc.desc   Test lastIndexOf with multiple null characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a\0b\0c'.lastIndexOf('\0');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_NullChar_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_NULLCHAR_0200
     * @tc.desc   Test lastIndexOf with null character in middle of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_NullChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test\0value'.lastIndexOf('\0');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_Backspace_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_BACKSPACE_0100
     * @tc.desc   Test lastIndexOf with backspace character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Backspace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'a\bb\bc'.lastIndexOf('\b');
      expect(result).assertEqual(3);
    });


    /**
     * @tc.name   StringLastIndexOf_Chinese_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CHINESE_0100
     * @tc.desc   Test lastIndexOf with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Chinese_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '你好世界'.lastIndexOf('世界');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Chinese_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CHINESE_0200
     * @tc.desc   Test lastIndexOf with repeated Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Chinese_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '测试测试'.lastIndexOf('测试');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Chinese_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CHINESE_0300
     * @tc.desc   Test lastIndexOf with single Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Chinese_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '中文测试'.lastIndexOf('文');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedLang_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDLANG_0100
     * @tc.desc   Test lastIndexOf with mixed English and Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedLang_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'hello世界world'.lastIndexOf('world');
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedLang_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDLANG_0200
     * @tc.desc   Test lastIndexOf with mixed Chinese and English
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedLang_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'test测试test'.lastIndexOf('test');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   StringLastIndexOf_MixedLang_003
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_MIXEDLANG_0300
     * @tc.desc   Test lastIndexOf with mixed Chinese and English
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_MixedLang_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '中English文'.lastIndexOf('English');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_ChinesePunct_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CHINESEPUNCT_0100
     * @tc.desc   Test lastIndexOf with Chinese punctuation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ChinesePunct_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '你好，世界！'.lastIndexOf('！');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   StringLastIndexOf_ChinesePunct_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_CHINESEPUNCT_0200
     * @tc.desc   Test lastIndexOf with Chinese punctuation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_ChinesePunct_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '测试【1】测试【2】'.lastIndexOf('【');
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   StringLastIndexOf_Japanese_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_JAPANESE_0100
     * @tc.desc   Test lastIndexOf with Japanese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Japanese_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'こんにちは'.lastIndexOf('に');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Japanese_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_JAPANESE_0200
     * @tc.desc   Test lastIndexOf with Japanese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Japanese_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'テストテスト'.lastIndexOf('テスト');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_Korean_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_KOREAN_0100
     * @tc.desc   Test lastIndexOf with Korean characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Korean_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '안녕하세요'.lastIndexOf('녕');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   StringLastIndexOf_Korean_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_KOREAN_0200
     * @tc.desc   Test lastIndexOf with Korean characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Korean_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '테스트'.lastIndexOf('트');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Arabic_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_ARABIC_0100
     * @tc.desc   Test lastIndexOf with Arabic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Arabic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'مرحبا'.lastIndexOf('ح');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Russian_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_RUSSIAN_0100
     * @tc.desc   Test lastIndexOf with Russian characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Russian_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'привет'.lastIndexOf('и');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Combining_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMBINING_0100
     * @tc.desc   Test lastIndexOf with combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Combining_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'café'.lastIndexOf('é');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   StringLastIndexOf_Combining_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_COMBINING_0200
     * @tc.desc   Test lastIndexOf with combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Combining_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = 'naïve'.lastIndexOf('ï');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   StringLastIndexOf_Surrogate_001
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SURROGATE_0100
     * @tc.desc   Test lastIndexOf with surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Surrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '😀😃😀'.lastIndexOf('😀');
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   StringLastIndexOf_Surrogate_002
     * @tc.number SUB_BUILTINS_STRING_LASTINDEXOF_SURROGATE_0200
     * @tc.desc   Test lastIndexOf with surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLastIndexOf_Surrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = '𝌆𝌆𝌆'.lastIndexOf('𝌆');
      expect(result).assertEqual(4);
    });
  });
}
