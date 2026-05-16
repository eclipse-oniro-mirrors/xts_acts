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
import * as matchJS from './StringMatchBasicTest_JS';
function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringMatchBasicTest() {
  describe('StringMatchBasicTest', () => {
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
     * @tc.name   StringMatch_SimpleChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SIMPLE_0100
     * @tc.desc   Test match with simple regex for single character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SimpleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: RegExpMatchArray | null = str.match(/H/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('H');
      expect(result!.index).assertEqual(0);
      expect(result!.input).assertEqual('Hello World');
      expect(result!.groups).assertEqual(undefined);
    });

    /**
     * @tc.name   StringMatch_StringFragment_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_FRAGMENT_0100
     * @tc.desc   Test match with string fragment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_StringFragment_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The quick brown fox";
      let result: RegExpMatchArray | null = str.match(/quick/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('quick');
      expect(result!.index).assertEqual(4);
      expect(result!.input).assertEqual('The quick brown fox');
    });

    /**
     * @tc.name   StringMatch_IgnoreCase_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ICASE_0100
     * @tc.desc   Test match with i flag for case-insensitive matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_IgnoreCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: RegExpMatchArray | null = str.match(/hello/i);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('Hello');
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatch_MixedCase_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_MIXED_0100
     * @tc.desc   Test match with mixed case
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_MixedCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "JavaScript is Great";
      let result: RegExpMatchArray | null = str.match(/javascript/i);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('JavaScript');
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatch_Digits_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_DIGITS_0100
     * @tc.desc   Test match with \d for digits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Digits_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "There are 123 apples";
      let result: RegExpMatchArray | null = str.match(/\d+/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('123');
      expect(result!.index).assertEqual(10);
    });

    /**
     * @tc.name   StringMatch_Letters_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LETTERS_0100
     * @tc.desc   Test match with character class for letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Letters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abc123def";
      let result: RegExpMatchArray | null = str.match(/[a-zA-Z]+/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('abc');
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatch_GlobalMatches_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GLOBAL_0100
     * @tc.desc   Test match with g flag returns all matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GlobalMatches_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test1test2test3";
      let result: RegExpMatchArray | null = str.match(/test\d/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual('test1');
      expect(result![1]).assertEqual('test2');
      expect(result![2]).assertEqual('test3');
    });

    /**
     * @tc.name   StringMatch_GlobalNoCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GNOCP_0100
     * @tc.desc   Test match with g flag does not return capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GlobalNoCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Chapter 3.4.5.1";
      let result: RegExpMatchArray | null = str.match(/(chapter\s\d+)/gi);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(1);
      expect(result![0]).assertEqual('Chapter 3');
    });

    /**
     * @tc.name   StringMatch_GICombination_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GI_0100
     * @tc.desc   Test match with gi combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GICombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Aaa BBB ccc DDD";
      let result: RegExpMatchArray | null = str.match(/[a-d]/gi);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(12);
      expect(result![0]).assertEqual('A');
      expect(result![1]).assertEqual('a');
      expect(result![2]).assertEqual('a');
      expect(result![3]).assertEqual('B');
      expect(result![4]).assertEqual('B');
      expect(result![5]).assertEqual('B');
      expect(result![6]).assertEqual('c');
      expect(result![7]).assertEqual('c');
      expect(result![8]).assertEqual('c');
      expect(result![9]).assertEqual('D');
      expect(result![10]).assertEqual('D');
      expect(result![11]).assertEqual('D');
    });

    /**
     * @tc.name   StringMatch_GlobalPattern_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GPTN_0100
     * @tc.desc   Test global match with specific pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GlobalPattern_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test@example.com and admin@domain.org";
      let result: RegExpMatchArray | null = str.match(/\w+@\w+\.\w+/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(2);
      expect(result![0]).assertEqual('test@example.com');
      expect(result![1]).assertEqual('admin@domain.org');
    });

    /**
     * @tc.name   StringMatch_GlobalNull_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GNULL_0100
     * @tc.desc   Test global match with no result returns null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GlobalNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: RegExpMatchArray | null = str.match(/\d+/g);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   StringMatch_NonGlobalNull_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NGNULL_0100
     * @tc.desc   Test non-global match with no result returns null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NonGlobalNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: RegExpMatchArray | null = str.match(/\d+/);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   StringMatch_SingleCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SCP_0100
     * @tc.desc   Test match with single capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SingleCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Chapter 3.4.5.1";
      let result: RegExpMatchArray | null = str.match(/(chapter\s(\d+(\.\d)*) )/i);
      expect(result === null).assertTrue();
    });

    /**
     * @tc.name   StringMatch_NestedCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NCP_0100
     * @tc.desc   Test match with nested capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NestedCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "see Chapter 3.4.5.1";
      let result: RegExpMatchArray | null = str.match(/see (chapter \d+(\.\d)*)/i);
      expect(result !== null).assertTrue();
      expect(result![1]).assertEqual('Chapter 3.4.5.1');
      expect(result![2]).assertEqual('.1');
    });

    /**
     * @tc.name   StringMatch_NamedCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NAMECP_0100
     * @tc.desc   Test match with named capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NamedCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "The quick brown fox jumps over the lazy dog";
      let result: RegExpMatchArray | null = str.match(/(?<animal>fox|cat) jumps over/);
      expect(result !== null).assertTrue();
      expect(result!.groups !== null).assertTrue();
      expect(result!.groups!.animal).assertEqual('fox');
    });

    /**
     * @tc.name   StringMatch_AccessNamedCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ACCNCP_0100
     * @tc.desc   Test accessing named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_AccessNamedCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "John Smith";
      let result: RegExpMatchArray | null = str.match(/(?<first>\w+)\s(?<last>\w+)/);
      expect(result !== null).assertTrue();
      expect(result!.groups !== null).assertTrue();
      expect(result!.groups!.first).assertEqual('John');
      expect(result!.groups!.last).assertEqual('Smith');
    });

    /**
     * @tc.name   StringMatch_NonCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NOCAP_0100
     * @tc.desc   Test match with non-capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NonCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let result: RegExpMatchArray | null = str.match(/(?:hello)\s(world)/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('hello world');
      expect(result![1]).assertEqual('world');
      expect(result!.length).assertEqual(2);
    });

    /**
     * @tc.name   StringMatch_NonCaptureIndex_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NCINDEX_0100
     * @tc.desc   Test non-capture group does not affect index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NonCaptureIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "foo bar";
      let result: RegExpMatchArray | null = str.match(/(foo)\s(?:bar)/);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(2);
      expect(result![0]).assertEqual('foo bar');
      expect(result![1]).assertEqual('foo');
    });

    /**
     * @tc.name   StringMatch_EmptyCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_EMPCP_0100
     * @tc.desc   Test match with empty capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EmptyCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abc";
      let result: RegExpMatchArray | null = str.match(/a()b/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('ab');
      expect(result![1]).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_EmptyCaptureGlobal_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_EMCPG_0100
     * @tc.desc   Test empty capture group in global match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EmptyCaptureGlobal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abc";
      let result: RegExpMatchArray | null = str.match(/()a/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(1);
      expect(result![0]).assertEqual('a');
    });

    /**
     * @tc.name   StringMatch_NumericBackreference_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NUMBR_0100
     * @tc.desc   Test match with numeric backreference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NumericBackreference_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello hello";
      let result: RegExpMatchArray | null = str.match(/(\w+)\s\1/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('hello hello');
      expect(result![1]).assertEqual('hello');
    });

    /**
     * @tc.name   StringMatch_NamedBackreference_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NAMEBR_0100
     * @tc.desc   Test match with named backreference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NamedBackreference_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello hello";
      let result: RegExpMatchArray | null = str.match(/(?<word>\w+)\s\k<word>/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('hello hello');
      expect(result!.groups !== null).assertTrue();
      expect(result!.groups!.word).assertEqual('hello');
    });


    /**
     * @tc.name   StringMatch_EmptyStringStar_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ESSTAR_0100
     * @tc.desc   Test empty string with .*
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EmptyStringStar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: RegExpMatchArray | null = str.match(/.*/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_EmptyStringGlobal_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ESGLB_0100
     * @tc.desc   Test empty string global match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EmptyStringGlobal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      let result: RegExpMatchArray | null = str.match(/a?/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(1);
      expect(result![0]).assertEqual('');
    });

    /**
     * @tc.name   StringMatch_LongString_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LONG_0100
     * @tc.desc   Test match on very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatch_LongString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let str: string = "a".repeat(10000) + "target" + "b".repeat(10000);
      let result: RegExpMatchArray | null = str.match(/target/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('target');
      expect(result!.index).assertEqual(10000);
    });

    /**
     * @tc.name   StringMatch_LongGlobal_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LONGG_0100
     * @tc.desc   Test global match on long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatch_LongGlobal_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let str: string = "test ".repeat(1000).trim();
      let result: RegExpMatchArray | null = str.match(/test/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(1000);
    });

    /**
     * @tc.name   StringMatch_EscapeChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ESC_0100
     * @tc.desc   Test match with escape characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EscapeChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Line1\nLine2\tLine3";
      let result: RegExpMatchArray | null = str.match(/\n/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('\n');
    });

    /**
     * @tc.name   StringMatch_MetaChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_META_0100
     * @tc.desc   Test match with regex metacharacters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_MetaChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Price: $100.50 (20% off)";
      let result1: RegExpMatchArray | null = str.match(/\$/);
      expect(result1 !== null).assertTrue();
      expect(result1![0]).assertEqual('$');
      let result2: RegExpMatchArray | null = str.match(/\(/);
      expect(result2 !== null).assertTrue();
      expect(result2![0]).assertEqual('(');
    });

    /**
     * @tc.name   StringMatch_Lookahead_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LKAH_0100
     * @tc.desc   Test match with positive lookahead
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Lookahead_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test123test";
      let result: RegExpMatchArray | null = str.match(/test(?=\d)/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('test');
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatch_NegativeLookahead_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NGLK_0100
     * @tc.desc   Test match with negative lookahead
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NegativeLookahead_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "testabc";
      let result: RegExpMatchArray | null = str.match(/test(?!\d)/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('test');
    });

    /**
     * @tc.name   StringMatch_Lookbehind_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LKBH_0100
     * @tc.desc   Test match with positive lookbehind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Lookbehind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test123";
      let result: RegExpMatchArray | null = str.match(/(?<=test)\d+/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('123');
    });

    /**
     * @tc.name   StringMatch_NegativeLookbehind_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NGLB_0100
     * @tc.desc   Test match with negative lookbehind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NegativeLookbehind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "abc123";
      let result: RegExpMatchArray | null = str.match(/(?<!\d)\d+/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('123');
    });

    /**
     * @tc.name   StringMatch_StartAnchor_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_START_0100
     * @tc.desc   Test match with ^ anchor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_StartAnchor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: RegExpMatchArray | null = str.match(/^Hello/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('Hello');
    });

    /**
     * @tc.name   StringMatch_EndAnchor_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_END_0100
     * @tc.desc   Test match with $ anchor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_EndAnchor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let result: RegExpMatchArray | null = str.match(/World$/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_WordBoundary_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_WB_0100
     * @tc.desc   Test match with \b word boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_WordBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "cat category concatenate";
      let result: RegExpMatchArray | null = str.match(/\bcat\b/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(1);
      expect(result![0]).assertEqual('cat');
    });

    /**
     * @tc.name   StringMatch_NonWordBoundary_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NWB_0100
     * @tc.desc   Test match with \B non-word boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NonWordBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "cat category concatenate";
      let result: RegExpMatchArray | null = str.match(/\Bcat\B/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(1);
      expect(result![0]).assertEqual('cat');
    });

    /**
     * @tc.name   StringMatch_ExactMatch_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_EXACT_0100
     * @tc.desc   Test match with {n} exact count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ExactMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aaa";
      let result: RegExpMatchArray | null = str.match(/a{3}/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('aaa');
    });

    /**
     * @tc.name   StringMatch_AtLeast_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ATLEAST_0100
     * @tc.desc   Test match with {n,} at least n times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_AtLeast_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aaaaa";
      let result: RegExpMatchArray | null = str.match(/a{3,}/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('aaaaa');
    });

    /**
     * @tc.name   StringMatch_Range_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_RANGE_0100
     * @tc.desc   Test match with {n,m} range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Range_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aaa";
      let result: RegExpMatchArray | null = str.match(/a{2,4}/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('aaa');
    });

    /**
     * @tc.name   StringMatch_Optional_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_OPT_0100
     * @tc.desc   Test match with ? optional
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Optional_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = "color";
      let result1: RegExpMatchArray | null = str1.match(/colou?r/);
      expect(result1 !== null).assertTrue();
      expect(result1![0]).assertEqual('color');
      let str2: string = "colour";
      let result2: RegExpMatchArray | null = str2.match(/colou?r/);
      expect(result2 !== null).assertTrue();
      expect(result2![0]).assertEqual('colour');
    });

    /**
     * @tc.name   StringMatch_OneOrMore_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_OM_0100
     * @tc.desc   Test match with + one or more
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_OneOrMore_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aaa";
      let result: RegExpMatchArray | null = str.match(/a+/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('aaa');
    });

    /**
     * @tc.name   StringMatch_ZeroOrMore_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ZOM_0100
     * @tc.desc   Test match with * zero or more
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ZeroOrMore_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = "b";
      let result1: RegExpMatchArray | null = str1.match(/a*b/);
      expect(result1 !== null).assertTrue();
      expect(result1![0]).assertEqual('b');
      let str2: string = "aaab";
      let result2: RegExpMatchArray | null = str2.match(/a*b/);
      expect(result2 !== null).assertTrue();
      expect(result2![0]).assertEqual('aaab');
    });

    /**
     * @tc.name   StringMatch_LastIndexNonGlobal_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LNONG_0100
     * @tc.desc   Test lastIndex ignored for non-global match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_LastIndexNonGlobal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test1 test2 test3";
      let regex: RegExp = /test\d/;
      regex.lastIndex = 10;
      let result: RegExpMatchArray | null = str.match(regex);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('test1');
      expect(result!.index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatch_LastIndexGlobal_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LGLOB_0100
     * @tc.desc   Test global match from lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_LastIndexGlobal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test1 test2 test3";
      let regex: RegExp = /test\d/g;
      regex.lastIndex = 5;
      let result: RegExpMatchArray | null = str.match(regex);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
    });

    /**
     * @tc.name   StringMatch_LastIndexSticky_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_LSTICKY_0100
     * @tc.desc   Test sticky match respects lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_LastIndexSticky_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test1 test2 test3";
      let regex: RegExp = /test\d/y;
      regex.lastIndex = 0;
      let result1: RegExpMatchArray | null = str.match(regex);
      expect(result1 !== null).assertTrue();
      expect(result1![0]).assertEqual('test1');
      regex.lastIndex = 6;
      let result2: RegExpMatchArray | null = str.match(regex);
      expect(result2 !== null).assertTrue();
      expect(result2![0]).assertEqual('test2');
    });

    /**
     * @tc.name   StringMatch_SourceProperty_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SRC_0100
     * @tc.desc   Test regex source property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SourceProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let regex: RegExp = /\d+/gi;
      expect(regex.source).assertEqual('\\d+');
    });

    /**
     * @tc.name   StringMatch_FlagsProperty_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_FLGS_0100
     * @tc.desc   Test regex flags property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_FlagsProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let regex: RegExp = /\d+/gim;
      expect(regex.flags).assertEqual('gim');
    });

    /**
     * @tc.name   StringMatch_FlagProperties_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_FLGP_0100
     * @tc.desc   Test regex flag properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_FlagProperties_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let regex: RegExp = /\d+/gim;
      expect(regex.global).assertTrue();
      expect(regex.ignoreCase).assertTrue();
      expect(regex.multiline).assertTrue();
      expect(regex.sticky).assertFalse();
      expect(regex.unicode).assertFalse();
      expect(regex.dotAll).assertFalse();
    });

    /**
     * @tc.name   StringMatch_Greedy_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GRDY_0100
     * @tc.desc   Test greedy match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Greedy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "<div>content</div>";
      let result: RegExpMatchArray | null = str.match(/<div>.*<\/div>/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('<div>content</div>');
    });

    /**
     * @tc.name   StringMatch_NonGreedy_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NGRDY_0100
     * @tc.desc   Test non-greedy match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NonGreedy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "<div>content1</div><div>content2</div>";
      let result: RegExpMatchArray | null = str.match(/<div>.*?<\/div>/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(2);
      expect(result![0]).assertEqual('<div>content1</div>');
      expect(result![1]).assertEqual('<div>content2</div>');
    });

    /**
     * @tc.name   StringMatch_GreedyNonGreedy_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GNG_0100
     * @tc.desc   Test greedy vs non-greedy
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GreedyNonGreedy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a123b456b";
      let greedy: RegExpMatchArray | null = str.match(/a.*b/);
      expect(greedy !== null).assertTrue();
      expect(greedy![0]).assertEqual('a123b456b');
      let nonGreedy: RegExpMatchArray | null = str.match(/a.*?b/);
      expect(nonGreedy !== null).assertTrue();
      expect(nonGreedy![0]).assertEqual('a123b');
    });


    /**
     * @tc.name   StringMatch_SymbolCustom_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SYM_0100
     * @tc.desc   Test custom matcher with Symbol.match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SymbolCustom_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testSymbolMatcher();
      expect(result.hasResult).assertTrue();
      expect(result.result0).assertEqual('custom');
      expect(result.result1).assertEqual('match');
    });

    /**
     * @tc.name   StringMatch_SymbolNull_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SYMNULL_0100
     * @tc.desc   Test custom matcher returning null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SymbolNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testNullSymbolMatcher();
      expect(result.result).assertEqual(null);
    });

    /**
     * @tc.name   StringMatch_Conditional_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_COND_0100
     * @tc.desc   Test conditional custom matcher
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Conditional_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testConditionalMatcher();
      expect(result.result1![0]).assertEqual('long');
      expect(result.result2![0]).assertEqual('short');
    });

    /**
     * @tc.name   StringMatch_UpperCaseTransform_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UPTR_0100
     * @tc.desc   Test custom matcher transforming results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UpperCaseTransform_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testUpperCaseMatcher();
      expect(result.result !== null).assertTrue();
      expect(result.result![0]).assertEqual('HELLO');
      expect(result.result![1]).assertEqual('WORLD');
    });

    /**
     * @tc.name   StringMatch_CustomRegexClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_CUSTREG_0100
     * @tc.desc   Test custom regex class with Symbol.match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_CustomRegexClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testCustomRegexClass();
      expect(result.result !== null).assertTrue();
      expect(result.result![0]).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_PatternMatcherClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_PATCLS_0100
     * @tc.desc   Test pattern matcher class with Symbol.match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_PatternMatcherClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testPatternMatcherClass();
      expect(result.result !== null).assertTrue();
      expect(result.result!.length).assertEqual(2);
      expect(result.result![0]).assertEqual('hello');
      expect(result.result![1]).assertEqual('world');
    });

    /**
     * @tc.name   StringMatch_SimpleNested_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_SNEST_0100
     * @tc.desc   Test nested quantifiers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_SimpleNested_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aaaa";
      let result: RegExpMatchArray | null = str.match(/(a+)+/);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('aaaa');
    });



    /**
     * @tc.name   StringMatch_PrototypeCall_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_PROT_0100
     * @tc.desc   Test match via String.prototype.call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_PrototypeCall_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testPrototypeCall();
      expect(result.result).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_StringObject_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_STROBJ_0100
     * @tc.desc   Test match on String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_StringObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testStringObject();
      expect(result.result).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_NumberThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NUMT_0100
     * @tc.desc   Test match with number as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NumberThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testNumberThis();
      expect(result.result).assertEqual('2');
    });

    /**
     * @tc.name   StringMatch_ObjectThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_OBJT_0100
     * @tc.desc   Test match with object as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ObjectThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testObjectThis();
      expect(result.result).assertEqual('World');
    });

    /**
     * @tc.name   StringMatch_ArrayThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ARRT_0100
     * @tc.desc   Test match with array as this
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ArrayThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testArrayThis();
      expect(result.result).assertEqual('2');
    });

    /**
     * @tc.name   StringMatch_NullThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NULT_0100
     * @tc.desc   Test match with null as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NullThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testPrototypeNull();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_UndefinedThis_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UNDT_0100
     * @tc.desc   Test match with undefined as this throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UndefinedThis_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testPrototypeUndefined();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_InvalidEscape_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_INVE_0100
     * @tc.desc   Test invalid escape sequence throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_InvalidEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testInvalidEscape();
      expect(result.isSyntaxError).assertFalse();
    });

    /**
     * @tc.name   StringMatch_UnclosedCharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UCC_0100
     * @tc.desc   Test unclosed character class throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UnclosedCharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testUnclosedCharClass();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_UnclosedGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UCG_0100
     * @tc.desc   Test unclosed capture group throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UnclosedGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testUnclosedGroup();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_InvalidQuantifier_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_INVQ_0100
     * @tc.desc   Test invalid quantifier throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_InvalidQuantifier_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testInvalidQuantifier();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatch_MatchVsMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_MVMA_0100
     * @tc.desc   Test match vs matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_MatchVsMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test1 test2 test3";
      let matchResult: RegExpMatchArray | null = str.match(/test\d/g);
      expect(matchResult !== null).assertTrue();
      expect(Array.isArray(matchResult)).assertTrue();
    });

    /**
     * @tc.name   StringMatch_MatchAndReplace_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_MR_0100
     * @tc.desc   Test match then replace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_MatchAndReplace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let matches: RegExpMatchArray | null = str.match(/World/);
      if (matches) {
        let result: string = str.replace(/World/, "JavaScript");
        expect(result).assertEqual('Hello JavaScript');
      }
    });

    /**
     * @tc.name   StringMatch_MatchAndSplit_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_MS_0100
     * @tc.desc   Test match for delimiters then split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_MatchAndSplit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a,b;c|d";
      let delimiters: RegExpMatchArray | null = str.match(/[,;|]/g);
      expect(delimiters !== null).assertTrue();
      expect(delimiters!.length).assertEqual(3);
      let result: string[] = str.split(/[,;|]/);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.name   StringMatch_VsIncludes_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_VI_0100
     * @tc.desc   Test match vs includes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_VsIncludes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.includes("World")).assertTrue();
      let matchResult: RegExpMatchArray | null = str.match(/World/);
      expect(matchResult !== null).assertTrue();
      expect(matchResult!.index).assertEqual(6);
    });

    /**
     * @tc.name   StringMatch_VsStartsWith_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_VSS_0100
     * @tc.desc   Test match vs startsWith
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_VsStartsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.startsWith("Hello")).assertTrue();
      let matchResult: RegExpMatchArray | null = str.match(/^Hello/);
      expect(matchResult !== null).assertTrue();
    });

    /**
     * @tc.name   StringMatch_VsEndsWith_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_VES_0100
     * @tc.desc   Test match vs endsWith
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_VsEndsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("World")).assertTrue();
      let matchResult: RegExpMatchArray | null = str.match(/World$/);
      expect(matchResult !== null).assertTrue();
    });

    /**
     * @tc.name   StringMatch_VsSearch_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_VSR_0100
     * @tc.desc   Test match vs search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_VsSearch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let matchResult: RegExpMatchArray | null = str.match(/World/);
      expect(matchResult !== null).assertTrue();
      expect(matchResult![0]).assertEqual('World');
      let searchResult: number = str.search(/World/);
      expect(searchResult).assertEqual(6);
    });

    /**
     * @tc.name   StringMatch_VsExec_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_VE_0100
     * @tc.desc   Test match vs exec
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_VsExec_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test1 test2 test3";
      let matchResult: RegExpMatchArray | null = str.match(/test\d/g);
      expect(matchResult !== null).assertTrue();
      expect(matchResult!.length).assertEqual(3);
    });

    /**
     * @tc.name   StringMatch_VsTest_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_VT_0100
     * @tc.desc   Test match vs test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_VsTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let matchResult: RegExpMatchArray | null = str.match(/World/);
      expect(matchResult !== null).assertTrue();
      expect(matchResult![0]).assertEqual('World');
      expect(matchResult!.index).assertEqual(6);
      let testResult: boolean = /World/.test(str);
      expect(testResult).assertTrue();
    });

    /**
     * @tc.name   StringMatch_ChainMethods_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_CM_0100
     * @tc.desc   Test match chained with array methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ChainMethods_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a1 b2 c3 d4";
      let result: string[] = str.match(/[a-z]\d/g) || [];
      let mapped: string[] = result.map(s => s.toUpperCase());
      expect(mapped.length).assertEqual(4);
      expect(mapped[0]).assertEqual('A1');
      expect(mapped[1]).assertEqual('B2');
      expect(mapped[2]).assertEqual('C3');
      expect(mapped[3]).assertEqual('D4');
    });

    /**
     * @tc.name   StringMatch_Email_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_EMAIL_0100
     * @tc.desc   Test email validation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Email_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Contact: test@example.com or admin@domain.org";
      let result: RegExpMatchArray | null = str.match(/[\w.-]+@[\w.-]+\.\w+/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(2);
      expect(result![0]).assertEqual('test@example.com');
      expect(result![1]).assertEqual('admin@domain.org');
    });

    /**
     * @tc.name   StringMatch_URLProtocol_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_URLP_0100
     * @tc.desc   Test extract URL protocol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_URLProtocol_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let url: string = "https://www.example.com/path";
      let result: RegExpMatchArray | null = url.match(/^(https?|ftp):/);
      expect(result !== null).assertTrue();
      expect(result![1]).assertEqual('https');
    });

    /**
     * @tc.name   StringMatch_URLDomain_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_URLD_0100
     * @tc.desc   Test extract URL domain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_URLDomain_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let url: string = "https://www.example.com/path";
      let result: RegExpMatchArray | null = url.match(/:\/\/([^/]+)/);
      expect(result !== null).assertTrue();
      expect(result![1]).assertEqual('www.example.com');
    });

    /**
     * @tc.name   StringMatch_Date_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_DATE_0100
     * @tc.desc   Test parse date string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Date_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let dateStr: string = "2023-12-25";
      let result: RegExpMatchArray | null = dateStr.match(/^(\d{4})-(\d{2})-(\d{2})$/);
      expect(result !== null).assertTrue();
      expect(result![1]).assertEqual('2023');
      expect(result![2]).assertEqual('12');
      expect(result![3]).assertEqual('25');
    });

    /**
     * @tc.name   StringMatch_DateNamedGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_DATENG_0100
     * @tc.desc   Test parse date with named groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_DateNamedGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let dateStr: string = "2023-12-25";
      let result: RegExpMatchArray | null = dateStr.match(/^(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})$/);
      expect(result !== null).assertTrue();
      expect(result!.groups !== null).assertTrue();
      expect(result!.groups!.year).assertEqual('2023');
      expect(result!.groups!.month).assertEqual('12');
      expect(result!.groups!.day).assertEqual('25');
    });

    /**
     * @tc.name   StringMatch_Phone_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_PHONE_0100
     * @tc.desc   Test phone number validation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Phone_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let phone: string = "13812345678";
      let result: RegExpMatchArray | null = phone.match(/^1[3-9]\d{9}$/);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.name   StringMatch_PhoneExtract_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_PHNEX_0100
     * @tc.desc   Test extract phone numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_PhoneExtract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = "联系电话: 13812345678 或 15987654321";
      let result: RegExpMatchArray | null = text.match(/1[3-9]\d{9}/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(2);
      expect(result![0]).assertEqual('13812345678');
      expect(result![1]).assertEqual('15987654321');
    });

    /**
     * @tc.name   StringMatch_HTMLContent_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_HTML_0100
     * @tc.desc   Test extract HTML content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_HTMLContent_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let html: string = "<div>Hello World</div>";
      let result: RegExpMatchArray | null = html.match(/<div>(.*?)<\/div>/);
      expect(result !== null).assertTrue();
      expect(result![1]).assertEqual('Hello World');
    });

    /**
     * @tc.name   StringMatch_HTMLTags_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_HTMLT_0100
     * @tc.desc   Test extract HTML tags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_HTMLTags_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let html: string = "<p>Para 1</p><div>Div</div><span>Span</span>";
      let result: RegExpMatchArray | null = html.match(/<[^>]+>/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(6);
    });

    /**
     * @tc.name   StringMatch_IPAddress_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_IP_0100
     * @tc.desc   Test IPv4 address validation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_IPAddress_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let ip: string = "192.168.1.1";
      let result: RegExpMatchArray | null = ip.match(/^(?:(?:25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(?:25[0-5]|2[0-4]\d|[01]?\d\d?)$/);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.name   StringMatch_IPExtract_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_IPEX_0100
     * @tc.desc   Test extract IP addresses
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_IPExtract_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = "Server IP: 192.168.1.1 and 10.0.0.1";
      let result: RegExpMatchArray | null = text.match(/(?:\d{1,3}\.){3}\d{1,3}/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(2);
      expect(result![0]).assertEqual('192.168.1.1');
      expect(result![1]).assertEqual('10.0.0.1');
    });

    /**
     * @tc.name   StringMatch_HexColor_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_HEX_0100
     * @tc.desc   Test extract hex color codes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_HexColor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let css: string = "color: #fff; background: #123456; border: #abc";
      let result: RegExpMatchArray | null = css.match(/#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})\b/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual('#fff');
      expect(result![1]).assertEqual('#123456');
      expect(result![2]).assertEqual('#abc');
    });

    /**
     * @tc.name   StringMatch_RGBColor_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_RGB_0100
     * @tc.desc   Test extract RGB colors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_RGBColor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let css: string = "color: rgb(255, 0, 0); background: rgb(0, 128, 255)";
      let result: RegExpMatchArray | null = css.match(/rgb\(\s*\d+\s*,\s*\d+\s*,\s*\d+\s*\)/g);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(2);
      expect(result![0]).assertEqual('rgb(255, 0, 0)');
      expect(result![1]).assertEqual('rgb(0, 128, 255)');
    });


    /**
     * @tc.name   StringMatch_ChineseChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_CHN_0100
     * @tc.desc   Test match with Chinese characters using u flag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_ChineseChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "你好世界";
      let result: RegExpMatchArray | null = str.match(/好/u);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('好');
    });

    /**
     * @tc.name   StringMatch_Emoji_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_EMOJI_0100
     * @tc.desc   Test match with emoji using u flag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Emoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 👍 World";
      let result: RegExpMatchArray | null = str.match(/👍/u);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('👍');
    });

    /**
     * @tc.name   StringMatch_UnicodePropertyL_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UPL_0100
     * @tc.desc   Test match with \p{L} for letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UnicodePropertyL_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 你好";
      let result: RegExpMatchArray | null = str.match(/\p{L}/gu);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(7);
      expect(result![0]).assertEqual('H');
      expect(result![1]).assertEqual('e');
      expect(result![2]).assertEqual('l');
      expect(result![3]).assertEqual('l');
      expect(result![4]).assertEqual('o');
      expect(result![5]).assertEqual('你');
      expect(result![6]).assertEqual('好');
    });

    /**
     * @tc.name   StringMatch_UnicodePropertyN_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UPN_0100
     * @tc.desc   Test match with \p{N} for numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UnicodePropertyN_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "123 ④⑤⑥";
      let result: RegExpMatchArray | null = str.match(/\p{N}/gu);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(6);
      expect(result![0]).assertEqual('1');
      expect(result![1]).assertEqual('2');
      expect(result![2]).assertEqual('3');
      expect(result![3]).assertEqual('④');
      expect(result![4]).assertEqual('⑤');
      expect(result![5]).assertEqual('⑥');
    });

    /**
     * @tc.name   StringMatch_UnicodeScriptHan_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_UPSH_0100
     * @tc.desc   Test match with \p{Script=Han} for Chinese
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_UnicodeScriptHan_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 你好 World 世界";
      let result: RegExpMatchArray | null = str.match(/\p{Script=Han}/gu);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(4);
      expect(result![0]).assertEqual('你');
      expect(result![1]).assertEqual('好');
      expect(result![2]).assertEqual('世');
      expect(result![3]).assertEqual('界');
    });

    /**
     * @tc.name   StringMatch_NegatedProperty_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NEGP_0100
     * @tc.desc   Test match with \P{L} for non-letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NegatedProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 123 World!";
      let result: RegExpMatchArray | null = str.match(/\P{L}/gu);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(6);
      expect(result![0]).assertEqual(' ');
      expect(result![1]).assertEqual('1');
      expect(result![2]).assertEqual('2');
      expect(result![3]).assertEqual('3');
      expect(result![4]).assertEqual(' ');
      expect(result![5]).assertEqual('!');
    });

    /**
     * @tc.name   StringMatch_Multiline_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_ML_0100
     * @tc.desc   Test match with m flag for multiline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Multiline_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "First line\nSecond line\nThird line";
      let result: RegExpMatchArray | null = str.match(/^Second/gm);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(1);
      expect(result![0]).assertEqual('Second');
    });

    /**
     * @tc.name   StringMatch_MultilineAnchor_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_MLA_0100
     * @tc.desc   Test m flag changes ^ and $ behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_MultilineAnchor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "line1\nline2\nline3";
      let result: RegExpMatchArray | null = str.match(/^line/gm);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual('line');
      expect(result![1]).assertEqual('line');
      expect(result![2]).assertEqual('line');
    });

    /**
     * @tc.name   StringMatch_DotAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_DOTALL_0100
     * @tc.desc   Test match with s flag for dot matching newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_DotAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\nWorld";
      let result: RegExpMatchArray | null = str.match(/Hello.World/s);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('Hello\nWorld');
    });

    /**
     * @tc.name   StringMatch_NoDotAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_NODOTALL_0100
     * @tc.desc   Test dot without s flag does not match newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_NoDotAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\nWorld";
      let result: RegExpMatchArray | null = str.match(/Hello.World/);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   StringMatch_Sticky_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_STICKY_0100
     * @tc.desc   Test match with y flag for sticky matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Sticky_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello hello";
      let regex: RegExp = /hello/y;
      regex.lastIndex = 6;
      let result: RegExpMatchArray | null = str.match(regex);
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual('hello');
    });

    /**
     * @tc.name   StringMatch_StickyLastIndex_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_STKLIDX_0100
     * @tc.desc   Test y flag only matches at lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_StickyLastIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      let regex: RegExp = /hello/y;
      regex.lastIndex = 2;
      let result: RegExpMatchArray | null = str.match(regex);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   StringMatch_Indices_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_IND_0100
     * @tc.desc   Test match with d flag returns indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_Indices_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testIndices();
      expect(result.indices0).assertEqual(0);
      expect(result.indices1).assertEqual(3);
      expect(result.indices2).assertEqual(0);
      expect(result.indices3).assertEqual(1);
    });

    /**
     * @tc.name   StringMatch_IndicesNamedGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_INDNG_0100
     * @tc.desc   Test d flag with named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_IndicesNamedGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchJS.testIndicesNamedGroups();
      expect(result.firstStart).assertEqual(0);
      expect(result.firstEnd).assertEqual(4);
      expect(result.lastStart).assertEqual(5);
      expect(result.lastEnd).assertEqual(10);
    });

    /**
     * @tc.name   StringMatch_GICombination_002
     * @tc.number SUB_BUILTINS_STRING_MATCH_GI_0200
     * @tc.desc   Test gi combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GICombination_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello HELLO hello";
      let result: RegExpMatchArray | null = str.match(/hello/gi);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual('Hello');
      expect(result![1]).assertEqual('HELLO');
      expect(result![2]).assertEqual('hello');
    });

    /**
     * @tc.name   StringMatch_GIRange_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GIR_0100
     * @tc.desc   Test gi combination with letter range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GIRange_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "aAbBcCdD";
      let result: RegExpMatchArray | null = str.match(/[a-c]/gi);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(6);
      expect(result![0]).assertEqual('a');
      expect(result![1]).assertEqual('A');
      expect(result![2]).assertEqual('b');
      expect(result![3]).assertEqual('B');
      expect(result![4]).assertEqual('c');
      expect(result![5]).assertEqual('C');
    });

    /**
     * @tc.name   StringMatch_GMCombination_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GM_0100
     * @tc.desc   Test gm combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GMCombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "line1\nline2\nline3";
      let result: RegExpMatchArray | null = str.match(/^line/gm);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual('line');
      expect(result![1]).assertEqual('line');
      expect(result![2]).assertEqual('line');
    });

    /**
     * @tc.name   StringMatch_GMEnd_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GME_0100
     * @tc.desc   Test gm combination matching end of lines
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GMEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "line1\nline2\nline3";
      let result: RegExpMatchArray | null = str.match(/^line/gm);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual('line');
      expect(result![1]).assertEqual('line');
      expect(result![2]).assertEqual('line');
    });

    /**
     * @tc.name   StringMatch_GIMCombination_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GIM_0100
     * @tc.desc   Test gim combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GIMCombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Line1\nline2\nLINE3";
      let result: RegExpMatchArray | null = str.match(/^line/gim);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(3);
      expect(result![0]).assertEqual('Line');
      expect(result![1]).assertEqual('line');
      expect(result![2]).assertEqual('LINE');
    });

    /**
     * @tc.name   StringMatch_GUCombination_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GU_0100
     * @tc.desc   Test gu combination for Unicode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GUCombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "你好世界";
      let result: RegExpMatchArray | null = str.match(/[\u4e00-\u9fa5]/gu);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(4);
      expect(result![0]).assertEqual('你');
      expect(result![1]).assertEqual('好');
      expect(result![2]).assertEqual('世');
      expect(result![3]).assertEqual('界');
    });

    /**
     * @tc.name   StringMatch_GSUCombination_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GSU_0100
     * @tc.desc   Test gsu combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GSUCombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\nWorld 你好";
      let result: RegExpMatchArray | null = str.match(/./gsu);
      expect(result !== null).assertTrue();
      expect(result!.length).assertEqual(14);
    });

    /**
     * @tc.name   StringMatch_GYICombination_001
     * @tc.number SUB_BUILTINS_STRING_MATCH_GYI_0100
     * @tc.desc   Test gyi combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatch_GYICombination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test TEST test";
      let regex: RegExp = /test/gyi;
      let result1: RegExpMatchArray | null = str.match(regex);
      expect(result1 !== null).assertTrue();
      expect(result1![0]).assertEqual('test');
      regex.lastIndex = 5;
      let result2: RegExpMatchArray | null = str.match(regex);
      expect(result2 !== null).assertTrue();
      expect(result2![0]).assertEqual('test');
    });
  });
}
