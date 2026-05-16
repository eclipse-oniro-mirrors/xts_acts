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
import * as matchAllJS from './StringMatchAllBasicTest_JS';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringMatchAllBasicTest() {
  describe('StringMatchAllBasicTest', () => {
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
     * @tc.name   StringMatchAll_SimpleGlobal_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SIMPLE_0100
     * @tc.desc   Test matchAll with simple global regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SimpleGlobal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test001();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test1');
      expect(result.match1).assertEqual('test2');
      expect(result.match2).assertEqual('test3');
    });

    /**
     * @tc.name   StringMatchAll_NoMatch_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NOMATCH_0100
     * @tc.desc   Test matchAll with no matching results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NoMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test002();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_SingleMatch_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SINGLE_0100
     * @tc.desc   Test matchAll with single matching result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SingleMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test003();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('only');
    });

    /**
     * @tc.name   StringMatchAll_ConsecutiveMatches_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CONSEC_0100
     * @tc.desc   Test matchAll with consecutive matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ConsecutiveMatches_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test004();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_SpreadOperator_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SPREAD_0100
     * @tc.desc   Test matchAll with spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SpreadOperator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test005();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test1');
      expect(result.match1).assertEqual('test2');
    });

    /**
     * @tc.name   StringMatchAll_SpreadSyntax_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SPREADSYN_0100
     * @tc.desc   Test matchAll with spread syntax for pattern matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SpreadSyntax_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test006();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ArrayFrom_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRFROM_0100
     * @tc.desc   Test matchAll with Array.from()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayFrom_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test007();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_IteratorOnce_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ITERONCE_0100
     * @tc.desc   Test matchAll iterator can only be used once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IteratorOnce_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test008();
      expect(result.firstLength).assertEqual(2);
      expect(result.secondLength).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_NextMethod_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEXT_0100
     * @tc.desc   Test matchAll iterator next() method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NextMethod_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test009();
      expect(result.result1Value).assertEqual('a');
      expect(result.result1Done).assertFalse();
      expect(result.result2Value).assertEqual('b');
      expect(result.result2Done).assertFalse();
      expect(result.result3Done).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMPTY_0100
     * @tc.desc   Test matchAll on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test010();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_EmptyRegex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMPTYREG_0100
     * @tc.desc   Test matchAll on empty string with empty regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EmptyRegex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test011();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SINGLECHAR_0100
     * @tc.desc   Test matchAll on single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test012();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a');
    });

    /**
     * @tc.name   StringMatchAll_LongString_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LONG_0100
     * @tc.desc   Test matchAll on very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatchAll_LongString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = matchAllJS.test013();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_Newline_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEWLINE_0100
     * @tc.desc   Test matchAll with newline characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Newline_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test014();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_Tab_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_TAB_0100
     * @tc.desc   Test matchAll with tab characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Tab_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test015();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_StartAnchor_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_START_0100
     * @tc.desc   Test matchAll with ^ start anchor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_StartAnchor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test016();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_EndAnchor_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_END_0100
     * @tc.desc   Test matchAll with $ end anchor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EndAnchor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test017();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(6);
    });

    /**
     * @tc.name   StringMatchAll_WordBoundary_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_WB_0100
     * @tc.desc   Test matchAll with \b word boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_WordBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test018();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('cat');
    });

    /**
     * @tc.name   StringMatchAll_NonWordBoundary_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NWB_0100
     * @tc.desc   Test matchAll with \B non-word boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NonWordBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test019();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_LastIndexImmutable_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LASTIDX_0100
     * @tc.desc   Test matchAll does not modify lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_LastIndexImmutable_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test020();
      expect(result.matchesLength).assertEqual(result.expectedLength);
      expect(result.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_GlobalFlagRequired_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GFLAG_0100
     * @tc.desc   Test matchAll requires global flag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalFlagRequired_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test021();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_InvalidRegex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INVREG_0100
     * @tc.desc   Test matchAll with invalid regex throws SyntaxError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_InvalidRegex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test022();
      expect(result.isSyntaxError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_VsMatch_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_VSMATCH_0100
     * @tc.desc   Test matchAll vs match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_VsMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test023();
      expect(result.matchResult !== null).assertTrue();
      if (result.matchResult) {
        expect(result.matchResult.length).assertEqual(2);
      }
      expect(result.matchAllLength).assertEqual(2);
      expect(result.matchAll0).assertEqual('test1');
      expect(result.matchAllIndex).assertEqual(0);
    });

    /**
     * @tc.name   StringMatchAll_VsExec_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_VSEXEC_0100
     * @tc.desc   Test matchAll vs exec
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_VsExec_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test024();
      expect(result.execLength).assertEqual(2);
      expect(result.matchAllLength).assertEqual(2);
    });

    /**
     * @tc.name   StringMatchAll_ExecLastIndex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXECLST_0100
     * @tc.desc   Test exec respects lastIndex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExecLastIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test025();
      expect(result.match0).assertEqual('test2');
      expect(result.matchIndex).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_CopyRegex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_COPYREG_0100
     * @tc.desc   Test matchAll creates internal copy of regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_CopyRegex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test026();
      expect(result.matchesLength).assertEqual(result.expectedLength);
      expect(result.lastIndex).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_Greedy_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GREEDY_0100
     * @tc.desc   Test matchAll with greedy quantifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Greedy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test027();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('aaa');
    });

    /**
     * @tc.name   StringMatchAll_NonGreedy_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NONGRDY_0100
     * @tc.desc   Test matchAll with non-greedy quantifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NonGreedy_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test028();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a');
    });

    /**
     * @tc.name   StringMatchAll_QuantifierRange_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_QRANGE_0100
     * @tc.desc   Test matchAll with quantifier range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_QuantifierRange_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test029();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('aa');
      expect(result.match1).assertEqual('aaa');
      expect(result.match2).assertEqual('aaa');
    });

    /**
     * @tc.name   StringMatchAll_ExactQuantifier_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXACTQ_0100
     * @tc.desc   Test matchAll with exact quantifier
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExactQuantifier_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test030();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('aa');
    });

    /**
     * @tc.name   StringMatchAll_CharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CHARCLS_0100
     * @tc.desc   Test matchAll with character class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_CharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test031();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a');
    });

    /**
     * @tc.name   StringMatchAll_NegatedCharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEGCHAR_0100
     * @tc.desc   Test matchAll with negated character class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NegatedCharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test032();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('1');
    });

    /**
     * @tc.name   StringMatchAll_PredifinedCharClass_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_PRECHAR_0100
     * @tc.desc   Test matchAll with predefined character class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PredifinedCharClass_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test033();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('1');
    });

    /**
     * @tc.name   StringMatchAll_PositiveLookahead_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_POSLA_0100
     * @tc.desc   Test matchAll with positive lookahead
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PositiveLookahead_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test034();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test');
    });

    /**
     * @tc.name   StringMatchAll_NegativeLookahead_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEGELA_0100
     * @tc.desc   Test matchAll with negative lookahead
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NegativeLookahead_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test035();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(12);
    });

    /**
     * @tc.name   StringMatchAll_PositiveLookbehind_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_POSLB_0100
     * @tc.desc   Test matchAll with positive lookbehind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PositiveLookbehind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test036();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('100');
    });

    /**
     * @tc.name   StringMatchAll_NegativeLookbehind_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NEGELB_0100
     * @tc.desc   Test matchAll with negative lookbehind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NegativeLookbehind_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test037();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('00');
    });

    /**
     * @tc.name   StringMatchAll_Email_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMAIL_0100
     * @tc.desc   Test matchAll with email pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Email_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test038();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('test@example.com');
      expect(result.match1).assertEqual('admin@test.org');
    });

    /**
     * @tc.name   StringMatchAll_URL_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_URL_0100
     * @tc.desc   Test matchAll with URL pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_URL_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test039();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('https://example.com');
      expect(result.match1).assertEqual('http://test.org');
    });

    /**
     * @tc.name   StringMatchAll_HTMLTag_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_HTML_0100
     * @tc.desc   Test matchAll with HTML tag pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_HTMLTag_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test040();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('<div>');
      expect(result.match1).assertEqual('div');
    });

    /**
     * @tc.name   StringMatchAll_PhoneNumber_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_PHONE_0100
     * @tc.desc   Test matchAll with phone number pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PhoneNumber_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test041();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('123-456-7890');
      expect(result.match1).assertEqual('987.654.3210');
    });

    /**
     * @tc.name   StringMatchAll_IPAddress_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_IP_0100
     * @tc.desc   Test matchAll with IP address pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IPAddress_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test042();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('192.168.1.1');
      expect(result.match1).assertEqual('10.0.0.1');
    });

    /**
     * @tc.name   StringMatchAll_ExtractLinks_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXLINK_0100
     * @tc.desc   Test extracting links with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractLinks_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test043();
      expect(result.result).assertEqual(result.expected);
      expect(result.link0).assertEqual('https://example.com');
      expect(result.link1).assertEqual('http://test.org');
    });

    /**
     * @tc.name   StringMatchAll_ExtractEmails_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXEMAIL_0100
     * @tc.desc   Test extracting emails with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractEmails_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test044();
      expect(result.result).assertEqual(result.expected);
      expect(result.email0).assertEqual('test@example.com');
      expect(result.email1).assertEqual('admin@test.org');
    });

    /**
     * @tc.name   StringMatchAll_ExtractTags_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXTAG_0100
     * @tc.desc   Test extracting tags with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractTags_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test045();
      expect(result.result).assertEqual(result.expected);
      expect(result.tag0).assertEqual('awesome');
      expect(result.tag1).assertEqual('cool');
      expect(result.tag2).assertEqual('javascript');
    });

    /**
     * @tc.name   StringMatchAll_ExtractMentions_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXMENTION_0100
     * @tc.desc   Test extracting mentions with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractMentions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test046();
      expect(result.result).assertEqual(result.expected);
      expect(result.mention0).assertEqual('john');
      expect(result.mention1).assertEqual('jane');
    });

    /**
     * @tc.name   StringMatchAll_ParseCSV_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CSV_0100
     * @tc.desc   Test parsing CSV with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ParseCSV_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test047();
      expect(result.result1).assertEqual(result.expected1);
      expect(result.result1_0).assertEqual('John');
      expect(result.result1_1).assertEqual('30');
      expect(result.result1_2).assertEqual('NYC');
    });

    /**
     * @tc.name   StringMatchAll_ParseKeyValue_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_KV_0100
     * @tc.desc   Test parsing key-value pairs with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ParseKeyValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test048();
      expect(result.resultName).assertEqual('John');
      expect(result.resultAge).assertEqual('30');
      expect(result.resultCity).assertEqual('NYC');
    });

    /**
     * @tc.name   StringMatchAll_ExtractFunctions_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXFUNC_0100
     * @tc.desc   Test extracting function names with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractFunctions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test049();
      expect(result.result).assertEqual(result.expected);
      expect(result.func0).assertEqual('foo');
      expect(result.func1).assertEqual('bar');
      expect(result.func2).assertEqual('baz');
    });

    /**
     * @tc.name   StringMatchAll_ExtractVariables_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXVAR_0100
     * @tc.desc   Test extracting variable declarations with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractVariables_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test050();
      expect(result.result0Name).assertEqual('a');
      expect(result.result1Type).assertEqual('let');
      expect(result.result2Name).assertEqual('c');
    });

    /**
     * @tc.name   StringMatchAll_ExtractComments_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXCOMM_0100
     * @tc.desc   Test extracting comments with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractComments_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test051();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_HighlightKeyword_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_HLKEY_0100
     * @tc.desc   Test highlighting keywords with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_HighlightKeyword_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test052();
      expect(result.result).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_SortNumbers_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SORT_0100
     * @tc.desc   Test sorting extracted numbers with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SortNumbers_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test053();
      expect(result.result).assertEqual(result.expected);
      expect(result.num0).assertEqual(1);
      expect(result.num1).assertEqual(7);
      expect(result.num4).assertEqual(100);
    });

    /**
     * @tc.name   StringMatchAll_WordFrequency_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_FREQ_0100
     * @tc.desc   Test counting word frequency with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_WordFrequency_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test054();
      expect(result.resultHello).assertEqual(2);
      expect(result.resultWorld).assertEqual(2);
      expect(result.resultJavascript).assertEqual(1);
    });

    /**
     * @tc.name   StringMatchAll_PasswordStrength_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_PWDSTR_0100
     * @tc.desc   Test checking password strength with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_PasswordStrength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test055();
      expect(result.result).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_ExtractErrors_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXERR_0100
     * @tc.desc   Test extracting error messages with matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractErrors_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test056();
      expect(result.result).assertEqual(result.expected);
      expect(result.error0).assertEqual('Name is required');
      expect(result.error1).assertEqual('Email is invalid');
      expect(result.error2).assertEqual('Password too short');
    });

    /**
     * @tc.name   StringMatchAll_LargeDataset_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LARGEDS_0100
     * @tc.desc   Test matchAll with large dataset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatchAll_LargeDataset_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = matchAllJS.test057();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_VeryLongString_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_VLONG_0100
     * @tc.desc   Test matchAll on very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringMatchAll_VeryLongString_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result = matchAllJS.test058();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0Index).assertEqual(1000000);
    });

    /**
     * @tc.name   StringMatchAll_LazyEvaluation_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_LAZY_0100
     * @tc.desc   Test matchAll lazy evaluation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_LazyEvaluation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test059();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_EarlyTermination_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EARLY_0100
     * @tc.desc   Test matchAll early termination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EarlyTermination_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test060();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringMatchAll_RegExpObject_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_REGEXOBJ_0100
     * @tc.desc   Test matchAll with RegExp object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_RegExpObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test101();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('123');
      expect(result.match1).assertEqual('456');
    });

    /**
     * @tc.name   StringMatchAll_RegexLiteral_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_REGLIT_0100
     * @tc.desc   Test matchAll with regex literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_RegexLiteral_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test102();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_StringParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_STRPARAM_0100
     * @tc.desc   Test matchAll with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_StringParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test103();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('hello');
      expect(result.match1).assertEqual('hello');
    });

    /**
     * @tc.name   StringMatchAll_StringSpecialChar_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_STRSPECHAR_0100
     * @tc.desc   Test matchAll with string containing special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_StringSpecialChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test104();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('a.b');
    });

    /**
     * @tc.name   StringMatchAll_EmptyStringParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EMPTYSTR_0100
     * @tc.desc   Test matchAll with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_EmptyStringParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test105();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_NullParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NULL_0100
     * @tc.desc   Test matchAll with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NullParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test106();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_UndefinedParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_UNDEF_0100
     * @tc.desc   Test matchAll with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_UndefinedParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test107();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_NumberParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NUM_0100
     * @tc.desc   Test matchAll with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NumberParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test108();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ObjectParam_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_OBJ_0100
     * @tc.desc   Test matchAll with object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ObjectParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test109();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_SingleCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SCP_0100
     * @tc.desc   Test matchAll with single capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SingleCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test201();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0_0).assertEqual('test1');
      expect(result.match0_1).assertEqual('1');
      expect(result.match1_0).assertEqual('test2');
      expect(result.match1_1).assertEqual('2');
    });

    /**
     * @tc.name   StringMatchAll_MultipleCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MCP_0100
     * @tc.desc   Test matchAll with multiple capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MultipleCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test202();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0_0).assertEqual('2019-01-02');
      expect(result.match0_1).assertEqual('2019');
      expect(result.match0_2).assertEqual('01');
      expect(result.match0_3).assertEqual('02');
    });

    /**
     * @tc.name   StringMatchAll_NestedCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NCP_0100
     * @tc.desc   Test matchAll with nested capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NestedCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test203();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0_0).assertEqual('test1');
      expect(result.match0_1).assertEqual('e');
      expect(result.match0_2).assertEqual('st1');
      expect(result.match0_3).assertEqual('1');
    });

    /**
     * @tc.name   StringMatchAll_NamedCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NAMCP_0100
     * @tc.desc   Test matchAll with named capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NamedCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test204();
      expect(result.resultYear).assertEqual(result.expectedYear);
      expect(result.resultMonth).assertEqual(result.expectedMonth);
      expect(result.resultDay).assertEqual(result.expectedDay);
    });

    /**
     * @tc.name   StringMatchAll_OptionalCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_OPTCP_0100
     * @tc.desc   Test matchAll with optional capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_OptionalCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test206();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('color');
      expect(result.match1).assertEqual('colour');
    });

    /**
     * @tc.name   StringMatchAll_CaptureGroupUndefined_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_CPUNDEF_0100
     * @tc.desc   Test matchAll with undefined capture group value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_CaptureGroupUndefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test207();
      expect(result.result0_0).assertEqual(result.expected0);
      expect(result.result0_1).assertEqual(result.expected1);
    });

    /**
     * @tc.name   StringMatchAll_MultipleOptionalCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MOPTCP_0100
     * @tc.desc   Test matchAll with multiple optional capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MultipleOptionalCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test208();
      expect(result.result0_1).assertEqual(result.expected0_1);
      expect(result.result0_2).assertEqual(result.expected0_2);
    });

    /**
     * @tc.name   StringMatchAll_MatchVsMatchAllCapture_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MVMA_0100
     * @tc.desc   Test match vs matchAll with capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MatchVsMatchAllCapture_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test209();
      expect(result.matchResult !== null).assertTrue();
      if (result.matchResult) {
        expect(result.matchResult.length).assertEqual(2);
      }
      expect(result.matchAllLength).assertEqual(2);
      expect(result.matchAll0_0).assertEqual('test1');
      expect(result.matchAll0_1).assertEqual('e');
    });

    /**
     * @tc.name   StringMatchAll_ArrayStructure_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRSTRUC_0100
     * @tc.desc   Test matchAll result array structure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayStructure_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test210();
      expect(result.isArray).assertTrue();
      expect(result.match0_0).assertEqual('te');
      expect(result.match0_index).assertEqual(0);
      expect(result.match0_input).assertEqual('test');
    });

    /**
     * @tc.name   StringMatchAll_ArrayLength_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRLEN_0100
     * @tc.desc   Test matchAll result array length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test211();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ArrayProperties_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ARRPROP_0100
     * @tc.desc   Test matchAll result array properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ArrayProperties_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test212();
      expect(result.match0_index).assertEqual(0);
      expect(result.match0_input).assertEqual('hello world');
      expect(result.match0_groups).assertEqual(undefined);
    });

    /**
     * @tc.name   StringMatchAll_IndexProperty_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INDEX_0100
     * @tc.desc   Test matchAll result index property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IndexProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test213();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_MultipleIndex_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_MIDX_0100
     * @tc.desc   Test matchAll result with multiple indexes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_MultipleIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test214();
      expect(result.match0_index).assertEqual(result.expected0);
      expect(result.match1_index).assertEqual(result.expected1);
      expect(result.match2_index).assertEqual(result.expected2);
    });

    /**
     * @tc.name   StringMatchAll_InputProperty_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INPUT_0100
     * @tc.desc   Test matchAll result input property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_InputProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test215();
      expect(result.match0_input).assertEqual('test string');
      expect(result.match0_inputEqual).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_GroupsUndefined_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GRPUND_0100
     * @tc.desc   Test matchAll groups property without named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GroupsUndefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test216();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GroupsObject_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GRPOBJ_0100
     * @tc.desc   Test matchAll groups property with named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GroupsObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test217();
      expect(result.typeOf).assertEqual('object');
      expect(result.resultYear).assertEqual(result.expectedYear);
    });

    /**
     * @tc.name   StringMatchAll_GlobalIgnoreCase_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GI_0100
     * @tc.desc   Test matchAll with gi flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalIgnoreCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test218();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GlobalMultiline_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GM_0100
     * @tc.desc   Test matchAll with gm flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalMultiline_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test219();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GlobalDotAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GS_0100
     * @tc.desc   Test matchAll with gs flags (dotAll mode)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalDotAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test220();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('line1\nline2');
    });

    /**
     * @tc.name   StringMatchAll_GlobalUnicode_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GU_0100
     * @tc.desc   Test matchAll with gu flags (Unicode mode)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalUnicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test221();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_GlobalIndices_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_GD_0100
     * @tc.desc   Test matchAll with gd flags (indices)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_GlobalIndices_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test222();
      expect(result.indices0_0[0]).assertEqual(result.expected0[0]);
      expect(result.indices0_0[1]).assertEqual(result.expected0[1]);
      expect(result.indices1_0[0]).assertEqual(result.expected1[0]);
      expect(result.indices1_0[1]).assertEqual(result.expected1[1]);
    });

    /**
     * @tc.name   StringMatchAll_IndicesCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ICP_0100
     * @tc.desc   Test matchAll indices with capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IndicesCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test223();
      expect(result.indices0_0[0]).assertEqual(result.expected0_0[0]);
      expect(result.indices0_1[0]).assertEqual(result.expected0_1[0]);
      expect(result.indices0_2[0]).assertEqual(result.expected0_2[0]);
    });

    /**
     * @tc.name   StringMatchAll_IndicesNamedCaptureGroups_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_INCP_0100
     * @tc.desc   Test matchAll indices with named capture groups
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_IndicesNamedCaptureGroups_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test224();
      expect(result.indicesGroupsYear[0]).assertEqual(result.expectedYear[0]);
      expect(result.indicesGroupsMonth[0]).assertEqual(result.expectedMonth[0]);
      expect(result.indicesGroupsDay[0]).assertEqual(result.expectedDay[0]);
    });

    /**
     * @tc.name   StringMatchAll_Backreference_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_BR_0100
     * @tc.desc   Test matchAll with numeric backreference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_Backreference_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test301();
      expect(result.result).assertEqual(result.expected);
      expect(result.match0).assertEqual('abc abc');
      expect(result.match1).assertEqual('def def');
    });

    /**
     * @tc.name   StringMatchAll_NamedBackreference_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NBR_0100
     * @tc.desc   Test matchAll with named backreference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NamedBackreference_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test302();
      expect(result.result).assertEqual(result.expected);
      expect(result.resultWord).assertEqual(result.expectedWord);
    });

    /**
     * @tc.name   StringMatchAll_NonCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NCG_0100
     * @tc.desc   Test matchAll with non-capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NonCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test303();
      expect(result.match0_0).assertEqual('abc123');
      expect(result.match0_1).assertEqual('123');
      expect(result.match1_0).assertEqual('def456');
      expect(result.match1_1).assertEqual('456');
    });

    /**
     * @tc.name   StringMatchAll_NestedNonCaptureGroup_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NNCG_0100
     * @tc.desc   Test matchAll with nested non-capture group
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NestedNonCaptureGroup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test304();
      expect(result.match0_0).assertEqual('foo123bar');
      expect(result.match0_1).assertEqual('123');
    });

    /**
     * @tc.name   StringMatchAll_SplitWithMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SPLIT_0100
     * @tc.desc   Test split string using matchAll results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SplitWithMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test305();
      expect(result.result.length).assertEqual(result.expected.length);
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    /**
     * @tc.name   StringMatchAll_SearchVsMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_SRCHMA_0100
     * @tc.desc   Test search vs matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_SearchVsMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test306();
      expect(result.searchIndex).assertEqual(result.expectedSearch);
      expect(result.matchAllIndex0).assertEqual(0);
      expect(result.matchAllIndex1).assertEqual(5);
    });

    /**
     * @tc.name   StringMatchAll_ReplaceAllVsMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_RPLMA_0100
     * @tc.desc   Test replaceAll vs matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ReplaceAllVsMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test307();
      expect(result.replaced).assertEqual(result.expectedReplaced);
      expect(result.matchesLength).assertEqual(2);
    });

    /**
     * @tc.name   StringMatchAll_ReplaceUsingMatchAll_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_RPLMAALL_0100
     * @tc.desc   Test replace using matchAll results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ReplaceUsingMatchAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test308();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringMatchAll_ExtractKeyValuePairs_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_EXKV_0100
     * @tc.desc   Test extract key-value pairs using matchAll
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_ExtractKeyValuePairs_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test309();
      expect(result.resultName).assertEqual(result.expectedName);
      expect(result.resultAge).assertEqual(result.expectedAge);
    });

    /**
     * @tc.name   StringMatchAll_NoGlobalFlagError_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_NOG_0100
     * @tc.desc   Test matchAll without global flag throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_NoGlobalFlagError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test310();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_OnlyIFlagError_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ONLYI_0100
     * @tc.desc   Test matchAll with only i flag throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_OnlyIFlagError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test311();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringMatchAll_OnlyMFlagError_001
     * @tc.number SUB_BUILTINS_STRING_MATCHALL_ONLYM_0100
     * @tc.desc   Test matchAll with only m flag throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringMatchAll_OnlyMFlagError_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = matchAllJS.test312();
      expect(result.isTypeError).assertTrue();
    });
  });
}
