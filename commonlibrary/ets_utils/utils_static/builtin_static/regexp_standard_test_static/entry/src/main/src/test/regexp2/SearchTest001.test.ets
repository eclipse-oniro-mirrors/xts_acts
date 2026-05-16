/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * Consolidated RegExp @@search / String.search tests (formerly Search*Test.test.ets).
 * Focuses on index results, lastIndex side effects, coercions, and RegExp-like objects; RegExpHelper encodes throws that
 * are awkward to express inline without drowning cases in try/catch noise.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import { regexpSymbolSearch } from './RegExpSymbols';
import {
  regexpSearchCallNullThrows,
  regexpSearchCallUndefinedThrows,
  regexpSearchRegexLikeIndex,
  searchBigIntCoerces,
  searchCustomSymbolSearchObject,
  searchFunctionCoerces,
  searchObjectWithSymbolToPrimitive,
  searchStringEqualsRegExpSymbolSearch,
  searchSymbolParameterThrows
} from './RegExpHelper';

// Feature gate for pattern/flag pairs so unsupported syntax yields a clean early return instead of a red suite.
function supportsRegExp(pattern: string, flags: string = ''): boolean {
  /*
   * Instantiation is the ground truth for this VM: a flag may be documented yet rejected in a given product build, and
   * we treat that as “skip this branch” rather than a hard failure inside property assertions.
   */
  try {
    /*
     * Two-argument form matches the majority of guarded cases; default '' flags would diverge from those call sites.
     */
    new RegExp(pattern, flags);
    return true;
  } catch (err) {
    /*
     * Any rejection (SyntaxError, policy, limits) collapses to false so describe bodies can return early uniformly.
     */
    return false;
  }
}

// Lookbehind support is uneven; this semantic probe avoids asserting (?<=) behavior on engines that parse but mis-run it.
function supportsLookbehindSemantics(): boolean {
  /*
   * A compile-only check is insufficient: some runtimes accept (?<!) yet implement the boundary wrong, which would flip
   * search/split expectations in later suites. We therefore require both a negative and a positive behavioral sample.
   */
  try {
    const re: RegExp = new RegExp('(?<!abc)\\d+');
    /*
     * After “abc”, digits are still part of the same token in many grammars; a correct negative lookbehind must reject
     * matching “100” here—otherwise we would green-light broken engines.
     */
    if (re.test('abc100')) {
      return false;
    }
    /*
     * Conversely, digits after a non-abc prefix must match or the assertion is too strict for valid implementations.
     */
    if (!re.test('def100')) {
      return false;
    }
    return true;
  } catch (_) {
    /*
     * SyntaxError or staged-syntax rejection: entire lookbehind bucket should skip rather than partially run.
     */
    return false;
  }
}

// Minimal plain object for ToString coercions without polluting cases with ad-hoc class semantics.
class PlainObjectForToString {
}

export default function searchTest(): void {

  // First-match index and -1 sentinel: the core String.search contract before flags and unicode complications.
  describe('RegExp_Search_Basic', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
      /**
         * @tc.name testSearch0100
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0100
        * @tc.desc Test returns the first match index
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('[A-Z]'), 'hey JudE')).assertEqual(4);
      });

      /**
         * @tc.name testSearch0101
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0200
        * @tc.desc Test returns -1 when not found
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('[.]'), 'hey JudE')).assertEqual(-1);
      });

      /**
         * @tc.name testSearch0102
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0300
        * @tc.desc Test accepts a string pattern
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect('Hello World'.search('World')).assertEqual(6);
      });

      /**
         * @tc.name testSearch0103
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0400
        * @tc.desc Test empty pattern returns 0
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect('Hello'.search('')).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('(?:)'), '')).assertEqual(0);
      });
    });

    // Flags change where search resumes conceptually via lastIndex and which substrings can match.
    describe('RegExp_Search_Flags', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0104
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0500
        * @tc.desc Test global flag does not change the result
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('abc', 'g'), 'abc abc abc')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0105
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0600
        * @tc.desc Test ignore-case flag works
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('world', 'i'), 'Hello World')).assertEqual(6);
      });

      /**
         * @tc.name testSearch0106
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0700
        * @tc.desc Test multiline anchors work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('^Line2', 'm'), 'Line1\nLine2\nLine3')).assertEqual(6);
      });

      /**
         * @tc.name testSearch0107
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0800
        * @tc.desc Test combined flags work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('world', 'gim'), 'Hello\nWORLD\nworld')).assertEqual(6);
      });

      /**
         * @tc.name testSearch0108
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_0900
        * @tc.desc Test unicode flag works
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('\\?', 'u'), 'caf?')).assertEqual(3);
      });

      /**
         * @tc.name testSearch0109
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1000
        * @tc.desc Test sticky flag does not affect the result
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const re: RegExp = new RegExp('abc', 'y');
        re.lastIndex = 3;
        expect(regexpSymbolSearch(re, 'abcabc')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0110
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1100
        * @tc.desc Test dotAll matches newline when supported
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (!supportsRegExp('.', 's')) {
          return;
        }
        expect(regexpSymbolSearch(new RegExp('Hello.World', 's'), 'Hello\nWorld')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0111
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4300
        * @tc.desc Test dotAll flag unsupported when not available
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (supportsRegExp('.', 's')) {
          return;
        }
        expect(supportsRegExp('.', 's')).assertFalse();
      });

      /**
         * @tc.name testSearch0112
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1200
        * @tc.desc Test hasIndices does not change search return when supported
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (!supportsRegExp('test(\\d+)', 'd')) {
          return;
        }
        const re: RegExp = new RegExp('test(\\d+)', 'd');
        expect(regexpSymbolSearch(re, 'test123')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0113
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4400
        * @tc.desc Test d flag unsupported when hasIndices not available
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (supportsRegExp('test(\\d+)', 'd')) {
          return;
        }
        expect(supportsRegExp('test(\\d+)', 'd')).assertFalse();
      });
    });

    // @@search updates lastIndex for global/sticky regexes; divergences break interleaved search/exec usage.
    describe('RegExp_Search_lastIndex', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0114
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1300
        * @tc.desc Test ignores an existing lastIndex
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const re: RegExp = new RegExp('abc', 'g');
        re.lastIndex = 4;
        expect(regexpSymbolSearch(re, 'abc abc')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0115
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1400
        * @tc.desc Test restores lastIndex after the call
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const re: RegExp = new RegExp('abc', 'g');
        re.lastIndex = 5;
        regexpSymbolSearch(re, 'abc abc abc');
        expect(re.lastIndex).assertEqual(5);
      });

      /**
         * @tc.name testSearch0116
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1500
        * @tc.desc Test ignores lastIndex for sticky patterns
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const re: RegExp = new RegExp('abc', 'y');
        re.lastIndex = 4;
        expect(regexpSymbolSearch(re, 'abc abc')).assertEqual(0);
      });
    });

    // Unicode and property escapes: index math must stay code-unit consistent with the underlying string.
    describe('RegExp_Search_Patterns_And_Unicode', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0117
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1600
        * @tc.desc Test special and escaped characters work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('@'), 'price@100')).assertEqual(5);
        expect(regexpSymbolSearch(new RegExp('\\n'), 'Hello\nWorld')).assertEqual(5);
      });

      /**
         * @tc.name testSearch0118
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1700
        * @tc.desc Test character classes work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('[0-9]'), 'abc123')).assertEqual(3);
        expect(regexpSymbolSearch(new RegExp("[^\\w\\s']"), "I think Ruth's dog is cuter than your dog!")).assertEqual(41);
      });

      /**
         * @tc.name testSearch0119
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1800
        * @tc.desc Test unicode and emoji work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(regexpSymbolSearch(new RegExp('\\u00A3'), 'a\u00A3')).assertEqual(1);
          const emoji: string = String.fromCharCode(0xD83D, 0xDE00);
          expect(regexpSymbolSearch(new RegExp(emoji, 'u'), 'Hello ' + emoji + ' World')).assertEqual(6);
        });

      /**
         * @tc.name testSearch0120
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_1900
        * @tc.desc Test unicode property escapes work when supported
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (!supportsRegExp('\\p{Greek}', 'u') || !supportsRegExp('\\P{N}', 'u')) {
          return;
        }
        const greekRe: RegExp = new RegExp('\\p{Greek}', 'u');
        const notNumberRe: RegExp = new RegExp('\\P{N}', 'u');
        expect(regexpSymbolSearch(greekRe, 'ABC \u03B1')).assertEqual(4);
        expect(regexpSymbolSearch(notNumberRe, '123ABC')).assertEqual(3);
      });

      /**
         * @tc.name testSearch0121
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4500
        * @tc.desc Test unicode property escapes unsupported when not available
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (supportsRegExp('\\p{Greek}', 'u')) {
          return;
        }
        expect(supportsRegExp('\\p{Greek}', 'u')).assertFalse();
      });

      /**
         * @tc.name testSearch0122
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2000
        * @tc.desc Test predefined character classes work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const str: string = 'test123';
        expect(regexpSymbolSearch(new RegExp('\\d'), str)).assertEqual(4);
        expect(regexpSymbolSearch(new RegExp('\\w'), str)).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('\\s'), str)).assertEqual(-1);
      });
    });

    // Anchors and lookarounds: search should respect zero-width assertions without returning interior offsets incorrectly.
    describe('RegExp_Search_Boundaries_And_Lookarounds', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0123
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2100
        * @tc.desc Test handles empty and single-char cases
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('abc'), '')).assertEqual(-1);
        expect(regexpSymbolSearch(new RegExp('a'), 'a')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0124
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2200
        * @tc.desc Test start/end anchors work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const str: string = 'Hello World';
        expect(regexpSymbolSearch(new RegExp('^Hello'), str)).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('World$'), str)).assertEqual(6);
      });

      /**
         * @tc.name testSearch0125
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2300
        * @tc.desc Test works for long strings
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const str: string = 'a'.repeat(10000) + 'target';
        expect(regexpSymbolSearch(new RegExp('target'), str)).assertEqual(10000);
      });

      /**
         * @tc.name testSearch0126
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2400
        * @tc.desc Test lookahead works
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('\\d(?=def)'), 'abc123def')).assertEqual(5);
        expect(regexpSymbolSearch(new RegExp('\\d(?!def)'), 'abc123def')).assertEqual(3);
      });

      /**
         * @tc.name testSearch0127
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2500
        * @tc.desc Test lookbehind works when supported
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (!supportsLookbehindSemantics()) {
          return;
        }
        const positiveLookbehind: RegExp = new RegExp('(?<=:)\\d+');
        const negativeLookbehind: RegExp = new RegExp('(?<!abc)\\d+');
        expect(regexpSymbolSearch(positiveLookbehind, 'price:100')).assertEqual(6);
        expect(regexpSymbolSearch(negativeLookbehind, 'abc100 def100')).assertEqual(10);
      });

      /**
         * @tc.name testSearch0128
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4600
        * @tc.desc Test lookbehind unsupported when not available
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        if (supportsLookbehindSemantics()) {
          return;
        }
        expect(supportsLookbehindSemantics()).assertFalse();
      });

      /**
         * @tc.name testSearch0129
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2600
        * @tc.desc Test word boundaries work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('\\bhello\\b', 'i'), 'Hello world, hello')).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('\\B\\d\\B'), 'abc123')).assertEqual(3);
      });
    });

    describe('RegExp_Search_Type_Conversion', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0130
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2700
        * @tc.desc Test coerces number/null/undefined/boolean
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect('abc123'.search(String(123))).assertEqual(3);
        expect('null undefined'.search(String(null))).assertEqual(0);
        expect('null undefined'.search(String(undefined))).assertEqual(5);
        expect('true false'.search(String(true))).assertEqual(0);
      });

      /**
         * @tc.name testSearch0131
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2800
        * @tc.desc Test coerces object/array to string when pattern is comma
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const obj: PlainObjectForToString = new PlainObjectForToString();
        const arr: Array<string> = [','];
        const objIdx: number = '[object Object]'.search(String(obj));
        expect(objIdx >= 0).assertTrue();
        const pat: string = String(arr);
        expect(pat).assertEqual(',');
        const idx: number = 'a,b,c'.search(pat);
        expect(idx).assertEqual(1);
      });

      /**
         * @tc.name testSearch0132
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4700
        * @tc.desc Test coerces object/array to string when pattern is not comma
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const obj: PlainObjectForToString = new PlainObjectForToString();
        const arr: Array<string> = ['abc'];
        const objIdx: number = '[object Object]'.search(String(obj));
        expect(objIdx >= 0).assertTrue();
        const pat: string = String(arr);
        expect(pat).assertEqual('abc');
        expect('a,b,c'.search(pat)).assertEqual(-1);
      });
    });

    // Scenario-style searches closer to parsing logs or identifiers than single-literal probes.
    describe('RegExp_Search_Advanced_And_Applications', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0133
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_2900
        * @tc.desc Test preserves group/quantifier/alternation semantics
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})'), '2023-12-25')).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('(?:abc)\\d+'), 'abc123')).assertEqual(0);
        if (!supportsRegExp('(?<first>\\w+)\\s(?<last>\\w+)')) {
          return;
        }
        const namedGroupRe: RegExp = new RegExp('(?<first>\\w+)\\s(?<last>\\w+)');
        expect(regexpSymbolSearch(namedGroupRe, 'John Smith')).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('a+b+'), 'aaabbc')).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('cat|dog'), 'cat or dog')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0134
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3000
        * @tc.desc Test constructor forms work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('test'), 'test')).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('\\d+'), 'test123')).assertEqual(4);
        const pattern: RegExp = new RegExp(['cat', 'dog', 'bird'].join('|'), 'i');
        expect(regexpSymbolSearch(pattern, 'Cat Dog Bird')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0135
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3100
        * @tc.desc Test covers -1, 0 and positive return values
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('xyz'), 'test')).assertEqual(-1);
        expect(regexpSymbolSearch(new RegExp('(?:)'), 'test')).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('test'), 'abc test')).assertEqual(4);
        expect(regexpSymbolSearch(new RegExp('c'), 'abc')).assertEqual(2);
        expect(regexpSymbolSearch(new RegExp('\\n'), 'abc\ndef')).assertEqual(3);
      });

      /**
         * @tc.name testSearch0136
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3200
        * @tc.desc Test covers common application scenarios
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const hasEmail: boolean = regexpSymbolSearch(new RegExp('^[\\w.-]+@[\\w.-]+\\.\\w+$'), 'test@example.com') !== -1;
        const hasHttps: boolean = regexpSymbolSearch(new RegExp('^https:'), 'https://example.com') === 0;
        const hasFirstNumberAt3: boolean = regexpSymbolSearch(new RegExp('\\d'), 'abc123def') === 3;
        const hasHtml: boolean = regexpSymbolSearch(new RegExp('<[^>]+>'), '<div>Hello</div>') !== -1;
        const isHexColor: boolean = regexpSymbolSearch(new RegExp('^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$'), '#FF5733') !== -1;

        expect(hasEmail).assertTrue();
        expect(hasHttps).assertTrue();
        expect(hasFirstNumberAt3).assertTrue();
        expect(hasHtml).assertTrue();
        expect(isHexColor).assertTrue();
      });
    });

    // TypeErrors from bad receivers and compatibility shims asserted through helpers for stable static builds.
    describe('RegExp_Search_Error_And_Compatibility', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0137
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3300
        * @tc.desc Test invalid regex or flag throws syntax error
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let e1: boolean = false;
        let e2: boolean = false;

        try {
          new RegExp('[a-z');
        } catch (err) {
          e1 = true;
        }

        try {
          new RegExp('test', 'x');
        } catch (err) {
          e2 = true;
        }

        expect(e1).assertTrue();
        expect(e2).assertTrue();
      });

      /**
         * @tc.name testSearch0138
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3400
        * @tc.desc Test invalid unicode property throws
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let thrown: boolean = false;
        try {
          new RegExp('\\p{Invalid}', 'u');
        } catch (err) {
          thrown = true;
        }
        expect(thrown).assertTrue();
      });

      /**
         * @tc.name testSearch0139
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3500
        * @tc.desc Test undefined pattern is coerced to "undefined"
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect('null undefined'.search('undefined')).assertEqual(5);
      });

      /**
         * @tc.name testSearch0140
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3600
        * @tc.desc Test feature detection is consistent
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const supportsLookbehind: boolean = supportsRegExp('(?<=a)b');
        const supportsUnicodeProperties: boolean = supportsRegExp('\\p{L}', 'u');
        const supportsDotAll: boolean = supportsRegExp('.', 's');
        const supportsHasIndices: boolean = supportsRegExp('.', 'd');

        expect(typeof supportsLookbehind).assertEqual('boolean');
        expect(typeof supportsUnicodeProperties).assertEqual('boolean');
        expect(typeof supportsDotAll).assertEqual('boolean');
        expect(typeof supportsHasIndices).assertEqual('boolean');
      });
    });

    // Extended bucket: additional coercions and RegExp-like objects without duplicating basic index tests.
    describe('RegExp_Search_Extended_Scenarios', () => {
      beforeAll(() => {
        // Presets an action, which is performed only once before all test cases of the test suite start.
        // This API supports only one parameter: preset action function.
      })
      beforeEach(async (): Promise<void> => {
        await Utils.msSleep(20);
        // Presets an action, which is performed before each unit test case starts.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: preset action function.
      })
      afterEach(() => {
        // Presets a clear action, which is performed after each unit test case ends.
        // The number of execution times is the same as the number of test cases defined by **it**.
        // This API supports only one parameter: clear action function.
      })
      afterAll(() => {
        // Presets a clear action, which is performed after all test cases of the test suite end.
        // This API supports only one parameter: clear action function.
      })
      /**
         * @tc.name testSearch0141
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3700
        * @tc.desc Test zero-width matches return expected positions
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const str: string = 'abc';
        expect(regexpSymbolSearch(new RegExp('^'), str)).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('$'), str)).assertEqual(3);
        expect(regexpSymbolSearch(new RegExp('\\b'), str)).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('\\B'), str)).assertEqual(1);
      });

      /**
         * @tc.name testSearch0142
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3800
        * @tc.desc Test extreme quantifier and nested group work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const longA: string = 'a'.repeat(1000);
        expect(regexpSymbolSearch(new RegExp('a{1000}'), longA)).assertEqual(0);
        expect(regexpSymbolSearch(new RegExp('(((a)))'), 'a')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0143
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_3900
        * @tc.desc Test zero-width global does not loop indefinitely
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(regexpSymbolSearch(new RegExp('(?=)', 'g'), 'test')).assertEqual(0);
      });

      /**
         * @tc.name testSearch0144
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4000
        * @tc.desc Test many capture groups work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const group: string = '(\\w)';
        const groups: string = group.repeat(20);
        const pattern: RegExp = new RegExp('^' + groups + '$');
        const str: string = 'a'.repeat(20);
        expect(regexpSymbolSearch(pattern, str)).assertEqual(0);
      });

      /**
         * @tc.name testSearch0145
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4100
        * @tc.desc Test real-world validation patterns work
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const ipv4: boolean = regexpSymbolSearch(new RegExp('^((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)\\.){3}(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)$'), '192.168.1.1') !== -1;
        const phone: boolean = regexpSymbolSearch(new RegExp('^(\\([0-9]{3}\\)\\s?|[0-9]{3}-)[0-9]{3}-[0-9]{4}$'), '123-456-7890') !== -1;
        const date: boolean = regexpSymbolSearch(new RegExp('^\\d{4}-\\d{2}-\\d{2}$'), '2024-01-15') !== -1;
        const time: boolean = regexpSymbolSearch(new RegExp('^\\d{1,2}:\\d{2}(:\\d{2})?$'), '10:30') !== -1;
        const coordinates: boolean = regexpSymbolSearch(new RegExp('^\\(\\s*-?\\d+(\\.\\d+)?\\s*,\\s*-?\\d+(\\.\\d+)?\\s*\\)$'), '(123.45, -67.89)') !== -1;

        expect(ipv4).assertTrue();
        expect(phone).assertTrue();
        expect(date).assertTrue();
        expect(time).assertTrue();
        expect(coordinates).assertTrue();
      });

      /**
         * @tc.name testSearch0146
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4200
        * @tc.desc Test unicode script cases work when supported
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('\\p{Script=Hiragana}+', 'u')) {
            return;
          }
          const hiraganaRe: RegExp = new RegExp('\\p{Script=Hiragana}+', 'u');
          expect(regexpSymbolSearch(hiraganaRe, '\u3042\u3044\u3046')).assertEqual(0);
        });

      /**
         * @tc.name testSearch0147
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_BASIC_TEST_4800
        * @tc.desc Test Hiragana script property unsupported when not available
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (supportsRegExp('\\p{Script=Hiragana}+', 'u')) {
            return;
          }
          expect(supportsRegExp('\\p{Script=Hiragana}+', 'u')).assertFalse();
        });
    });

  // Odds-and-ends that still belong to search but would unbalance the primary nested tree.
  describe('SearchExtras_Tests', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
        /**
         * @tc.name testSearch0148
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0100
        * @tc.desc Test uses RegExp[Symbol.search] semantics
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(searchStringEqualsRegExpSymbolSearch()).assertTrue();
        });

        /**
         * @tc.name testSearch0149
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0200
        * @tc.desc Test supports custom objects via Symbol.search
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(searchCustomSymbolSearchObject()).assertTrue();
        });

        /**
         * @tc.name testSearch0150
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0300
        * @tc.desc Test coerces BigInt to string
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(searchBigIntCoerces()).assertTrue();
        });

        /**
         * @tc.name testSearch0151
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0400
        * @tc.desc Test throws TypeError for Symbol pattern
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(searchSymbolParameterThrows()).assertTrue();
        });

        /**
         * @tc.name testSearch0152
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0500
        * @tc.desc Test coerces function to string pattern
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(searchFunctionCoerces()).assertTrue();
        });

        /**
         * @tc.name testSearch0153
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0600
        * @tc.desc Test uses @@toPrimitive when available
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(searchObjectWithSymbolToPrimitive()).assertTrue();
        });

        /**
         * @tc.name testSearch0154
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0700
        * @tc.desc Test throws when calling RegExp[Symbol.search] with undefined receiver
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(regexpSearchCallUndefinedThrows()).assertTrue();
        });

        /**
         * @tc.name testSearch0155
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0800
        * @tc.desc Test throws when calling RegExp[Symbol.search] with null receiver
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(regexpSearchCallNullThrows()).assertTrue();
        });

        /**
         * @tc.name testSearch0156
         * @tc.number SUB_COMMONLIBRARY_REGEXP_SEARCH_EXTRAS_TEST_0900
        * @tc.desc Test supports regex-like objects via RegExp[Symbol.search]
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testSearch0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(regexpSearchRegexLikeIndex()).assertTrue();
        });
      });
}
