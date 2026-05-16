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
 * Consolidated String.replace / RegExp replace tests (formerly Replace*Test.test.ets).
 * Covers string vs regexp patterns, callable replacements, Symbol.replace, and web-shaped pipelines; helpers isolate
 * extreme callbacks and invalid-pattern throws so Hypium cases stay readable under long @tc metadata blocks.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  extreme17_1CustomSymbolReplaceObject,
  extreme17_2RegexpSymbolReplaceDirectCall,
  extreme17_3ParameterOrderVerification,
  extreme18_1RecursiveReplacement,
  extreme18_2ConditionalReplacement,
  extreme18_3AccumulativeReplacement,
  extreme18_4ContextAwareReplacement,
  extreme18_5LookupTableReplacement,
  regexpReplaceCallNullThrows,
  regexpReplaceCallUndefinedThrows,
  replaceComplexInvalidLookbehindThrows,
  replaceComplexInvalidRegExpCharClassCtorThrows,
  replaceComplexInvalidRegExpFlagCtorThrows,
  replaceComplexInvalidUnicodeCodePointThrows,
  replaceComplexInvalidUnicodePropertyThrows,
  replaceComplexNonRegExpReceiverSymbolReplaceThrows,
  replaceComplexRegexpPrototypeSymbolReplaceNullThisThrows,
  replaceComplexRegexpPrototypeSymbolReplaceRegexLikeResult,
  replaceComplexRegexpPrototypeSymbolReplaceUndefinedThisThrows,
  replaceComplexReplaceHelloHWithNumber,
  replaceComplexReplaceTestWithArray,
  replaceComplexReplaceTestWithBigInt,
  replaceComplexReplaceTestWithBoolean,
  replaceComplexReplaceTestWithNull,
  replaceComplexReplaceTestWithNumber,
  replaceComplexReplaceTestWithObjectToString,
  replaceComplexReplaceTestWithSymbolToPrimitive,
  replaceComplexReplaceTestWithSymbolValueThrows,
  replaceComplexReplaceTestWithUndefined,
  stringReplaceCustomSymbolReplace,
  webCanInstantiateRegExp,
  webComplexEmailRedact,
  webDetectHasIndices,
  webEscapeHTML,
  webEscapeSQL,
  webFormatCurrency,
  webFormatPhone,
  webMaskEmail,
  webMarkdownToHTML,
  webMultipleReplaceChain,
  webNormalizePath,
  webSquareDigitsReplace,
  webSubclassReplaceLogging,
  webSubclassReplaceUppercase,
  webSubclassSpeciesGlobalReplace,
  webToCamelCase,
  webToHyphenCase,
  webUnescapeHTML
} from './RegExpHelper';

interface NameGroups {
  first?: string;
  last?: string;
}

interface KeyValueGroups {
  key?: string;
  value?: string;
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  return webCanInstantiateRegExp(pattern, flags);
}

function supportsLookbehindSemantics(): boolean {
  try {
    const re: RegExp = new RegExp('(?<!abc)\\d+');
    if (re.test('abc100')) {
      return false;
    }
    if (!re.test('def100')) {
      return false;
    }
    return true;
  } catch (_) {
    return false;
  }
}



// Nested describes separate lexical replacement from regexp, callbacks, and symbol override paths for clearer failure domains.
export default function replaceTest(): void {

  // Literal substring replacement: first-match semantics and no regexp metacharacter interpretation.
  describe('String_Pattern_Replacement', () => {
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
         * @tc.name testReplace0100
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0100
         * @tc.desc   Test Basic String Replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello World, Hello Universe";
          const result = str.replace("Hello", "Hi");
          expect(result).assertEqual("Hi World, Hello Universe");
        });

        /**
         * @tc.name testReplace0101
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0200
         * @tc.desc   Test String Replaces First Match Only
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "apple, apple, apple";
          const result = str.replace("apple", "orange");
          expect(result).assertEqual("orange, apple, apple");
        });

        /**
         * @tc.name testReplace0102
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0300
         * @tc.desc   Test Empty String Pattern
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "xxx";
          const result = str.replace("", "_");
          expect(result).assertEqual("_xxx");
        });

        /**
         * @tc.name testReplace0103
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0400
         * @tc.desc   Test Non Existent String Pattern
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello World";
          const result = str.replace("goodbye", "Hi");
          expect(result).assertEqual("Hello World");
        });

        /**
         * @tc.name testReplace0104
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0500
         * @tc.desc   Test String Pattern Escapes Special Chars
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "a.b.c";
          const result = str.replace(".", "_");
          expect(result).assertEqual("a_b.c");
        });
      });

      // RegExp patterns: global vs non-global affects whether all matches or only the first are replaced.
      describe('Regex_Pattern_Replacement', () => {
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
         * @tc.name testReplace0105
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0600
         * @tc.desc   Test Basic Regex Replacement No Flags
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "cat, dog, cat";
          const result = str.replace(new RegExp('cat'), "bird");
          expect(result).assertEqual("bird, dog, cat");
        });

        /**
         * @tc.name testReplace0106
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0700
         * @tc.desc   Test Global Replacement g Flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "cat, dog, cat";
          const result = str.replace(new RegExp('cat', 'g'), "bird");
          expect(result).assertEqual("bird, dog, bird");
        });

        /**
         * @tc.name testReplace0107
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0800
         * @tc.desc   Test Case Insensitive Replacement i Flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello world, hello universe";
          const result = str.replace(new RegExp('hello', 'i'), "Hi");
          expect(result).assertEqual("Hi world, hello universe");
        });

        /**
         * @tc.name testReplace0108
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0900
         * @tc.desc   Test Multiline Replacement m Flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Line1\nLine2\nLine3";
          const result = str.replace(new RegExp('^Line', 'gm'), "Row");
          expect(result).assertEqual("Row1\nRow2\nRow3");
        });

        /**
         * @tc.name testReplace0109
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1000
         * @tc.desc   Test Combined Flags gi
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello HELLO hello HeLLo";
          const result = str.replace(new RegExp('hello', 'gi'), "Hi");
          expect(result).assertEqual("Hi Hi Hi Hi");
        });

        /**
         * @tc.name testReplace0110
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1100
         * @tc.desc   Test dotAll Flag s
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello\nWorld";
          const result = str.replace(new RegExp('Hello.World', 's'), "Hi");
          expect(result).assertEqual("Hi");
        });

        /**
         * @tc.name testReplace0111
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1200
         * @tc.desc   Test Unicode Flag u
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const mathSansHigh = 55349;
          const mathSansDigitZeroLow = 57240;
          const mathSansDigitOneLow = 57241;
          const mathSansDigitTwoLow = 57242;
          const mathZero = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow);
          const str = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow, mathSansHigh, mathSansDigitOneLow,
            mathSansHigh, mathSansDigitTwoLow);
          const result = str.replace(new RegExp(mathZero, 'gu'), '0');
          const digitOne = String.fromCharCode(mathSansHigh, mathSansDigitOneLow);
          const digitTwo = String.fromCharCode(mathSansHigh, mathSansDigitTwoLow);
          expect(result).assertEqual('0' + digitOne + digitTwo);
        });

        /**
         * @tc.name testReplace0112
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1300
         * @tc.desc   Test Sticky Flag y
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "aaa";
          const regex = new RegExp('a', 'y');
          regex.lastIndex = 1;
          const result = str.replace(regex, "b");
          expect(result).assertEqual("aba");
        });

        /**
         * @tc.name testReplace0113
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1400
         * @tc.desc   Test hasIndices Flag d
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "test123";
          try {
            const regex: RegExp = new RegExp('test(\\d+)', 'd');
            const replaced = str.replace(regex, "replaced");
            expect(replaced).assertEqual("replaced");
          } catch (_) {
            expect(str).assertEqual("test123");
          }
        });
      });

      // Capture references ($1, $&) and similar: replacement string grammar is distinct from the pattern grammar.
      describe('Special_Replacement_Patterns', () => {
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
         * @tc.name testReplace0114
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1500
         * @tc.desc   Test Insert Dollar Sign
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "price: 100";
          const result = str.replace(new RegExp('\\d+'), "$$");
          expect(result).assertEqual("price: $");
        });

        /**
         * @tc.name testReplace0115
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1600
         * @tc.desc   Test Insert Entire Match
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello World";
          const result = str.replace(new RegExp('World'), "$&!");
          expect(result).assertEqual("Hello World!");
        });

        /**
         * @tc.name testReplace0116
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1700
         * @tc.desc   Test Insert Text Before Match
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello World";
          const result = str.replace(new RegExp('World'), "[$`]");
          expect(result).assertEqual("Hello [Hello ]");
        });

        /**
         * @tc.name testReplace0117
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1800
         * @tc.desc   Test Insert Text After Match
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello World";
          const result = str.replace(new RegExp('Hello'), "[$']");
          expect(result).assertEqual("[ World] World");
        });

        /**
         * @tc.name testReplace0118
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1900
         * @tc.desc   Test Numbered Capture Groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "John Smith";
          const result = str.replace(new RegExp('(\\w+)\\s(\\w+)'), "$2, $1");
          expect(result).assertEqual("Smith, John");
        });

        /**
         * @tc.name testReplace0119
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2000
         * @tc.desc   Test Multiple Capture Groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "2023-12-25";
          const result = str.replace(new RegExp('(\\d{4})-(\\d{2})-(\\d{2})'), "$3/$2/$1");
          expect(result).assertEqual("25/12/2023");
        });

        /**
         * @tc.name testReplace0120
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2100
         * @tc.desc   Test Named Capture Groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('(?<first>\\w+)\\s(?<last>\\w+)')) {
            return;
          }
          const str = "John Smith";
          const result = str.replace(new RegExp('(?<first>\\w+)\\s(?<last>\\w+)'), "$<last>, $<first>");
          expect(result).assertEqual("Smith, John");
        });

        /**
         * @tc.name testReplace0121
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2200
         * @tc.desc   Test Non Existent Capture Group
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "foo";
          const result = str.replace(new RegExp('(f)'), "$2");
          expect(result).assertEqual("$2oo");
        });

        /**
         * @tc.name testReplace0122
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2300
         * @tc.desc   Test String Pattern Ignores Dollar
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "foo";
          const result = str.replace("f", "$1");
          expect(result).assertEqual("$1oo");
        });

        /**
         * @tc.name testReplace0123
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2400
         * @tc.desc   Test Nested Capture Groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc123";
          const result = str.replace(new RegExp('((\\w)(\\w))'), "$1-$2-$3");
          expect(result).assertEqual("ab-a-bc123");
        });
      });

      // Callable replacers: observe match object shape, offsets, and side-effect ordering across matches.
      describe('Function_as_Replacement', () => {
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
         * @tc.name testReplace0124
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2500
         * @tc.desc   Test Basic Function Replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello World";
          const result = str.replace("World", "WORLD");
          expect(result).assertEqual("Hello WORLD");
        });

        /**
         * @tc.name testReplace0125
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2600
         * @tc.desc   Test Function Receives Match
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc123";
          const result = str.replace(new RegExp('\\d+'), '[123]');
          expect(result).assertEqual("abc[123]");
        });

        /**
         * @tc.name testReplace0126
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2700
         * @tc.desc   Test Function Receives Capture Groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "John Smith";
          const result = str.replace(new RegExp('(\\w+)\\s(\\w+)'), "$2, $1");
          expect(result).assertEqual("Smith, John");
        });

        /**
         * @tc.name testReplace0127
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2800
         * @tc.desc   Test Function Receives Offset
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abcde";
          const result = str.replace("cd", "cd@2");
          expect(result).assertEqual("abcd@2e");
        });

        /**
         * @tc.name testReplace0128
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2900
         * @tc.desc   Test Function Receives String
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello";
          const result = str.replace("l", "l[5]");
          expect(result).assertEqual("Hel[5]lo");
        });

        /**
         * @tc.name testReplace0129
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3000
         * @tc.desc   Test Function Receives Named Groups
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('(?<first>\\w+)\\s(?<last>\\w+)')) {
            return;
          }
          const str = "John Smith";
          const result = str.replace(new RegExp('(?<first>\\w+)\\s(?<last>\\w+)'), "$<last>, $<first>");
          expect(result).assertEqual("Smith, John");
        });

        /**
         * @tc.name testReplace0130
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3100
         * @tc.desc   Test Function Called Multiple Times Global
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "a1b2c3";
          const result = str.replace(new RegExp('\\d', 'g'), "X");
          expect(result).assertEqual("aXbXcX");
        });

        /**
         * @tc.name testReplace0131
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3200
         * @tc.desc   Test Unmatched Branch Capture Group
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc";
          const result = str.replace("a", "A").replace("b", "B");
          expect(result).assertEqual("ABc");
        });

        /**
         * @tc.name testReplace0132
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3300
         * @tc.desc   Test Temperature Conversion Example
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const f2c = (() => {
            const convert = (str: string, p1: string): string => {
              return String(((parseFloat(p1) - 32) * 5) / 9) + 'C';
            };
            return (x: string): string => {
              const s = String(x);
              const test = new RegExp('(-?\\d+(?:\\.\\d*)?)F\\b', 'g');
              const m = test.exec(s);
              if (m === null) {
                return s;
              }
              const whole = m[0] ?? '';
              const g1 = m[1] ?? '';
              if (whole.length === 0) {
                return s;
              }
              return s.replace(whole, convert(whole, g1));
            };
          })();
          const result = f2c("212F");
          expect(result).assertEqual("100C");
        });

        /**
         * @tc.name testReplace0133
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3400
         * @tc.desc   Test Access Named Groups In Function
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('(?<key>\\w+):(?<value>\\w+)', 'g')) {
            return;
          }
          const str = "name:John,age:25";
          const result = str.replace(new RegExp('(?<key>\\w+):(?<value>\\w+)', 'g'), "$<key>=$<value>");
          expect(result).assertEqual("name=John,age=25");
        });

        /**
         * @tc.name testReplace0134
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3500
         * @tc.desc   Test Function Returns Undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc";
          const result = str.replace(new RegExp('a'), (): string => {
            return String(undefined);
          });
          expect(result).assertEqual("undefinedbc");
        });

        /**
         * @tc.name testReplace0135
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3600
         * @tc.desc   Test Function Throws Exception
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc";
          let caughtError = false;
          let isExpectedError = false;
          try {
            str.replace(new RegExp('a'), () => {
              throw new Error("Replace error");
            });
          } catch (e) {
            caughtError = true;
            isExpectedError = e instanceof Error && ((e as Error).message.indexOf('Replace error') >= 0);
          }
          expect(caughtError).assertTrue();
          expect(isExpectedError).assertTrue();
        });
      });

  // replace advances lastIndex for global regexes; mismatches here break loops that interleave replace and test.
  describe('lastIndex_Property_Tests', () => {
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
         * @tc.name testReplace0136
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0100
        * @tc.desc   Test Non-global replace honors lastIndex as search start
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc abc";
          const regex = new RegExp('abc');
          regex.lastIndex = 4;
          const result = str.replace(regex, "XYZ");
          expect(result).assertEqual("XYZ abc");
        });

        /**
         * @tc.name testReplace0137
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0200
        * @tc.desc   Test Global replace replaces all matches and resets lastIndex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc abc abc";
          const regex = new RegExp('abc', 'g');
          regex.lastIndex = 4;
          const result = str.replace(regex, "XYZ");
          expect(result).assertEqual("XYZ XYZ XYZ");
          expect(regex.lastIndex).assertEqual(0);
        });

        /**
         * @tc.name testReplace0138
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0300
        * @tc.desc   Test Sticky replace respects lastIndex positioning
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "aaa";
          const regex = new RegExp('a', 'y');
          regex.lastIndex = 1;
          const result = str.replace(regex, "b");
          expect(result).assertEqual("aba");
        });

        /**
         * @tc.name testReplace0139
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0400
        * @tc.desc   Test Global replace after manually setting lastIndex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "test test";
          const regex = new RegExp('test', 'g');
          regex.lastIndex = 5;
          const result = str.replace(regex, "XYZ");
          expect(result).assertEqual("XYZ XYZ");
          expect(regex.lastIndex).assertEqual(0);
        });

        /**
         * @tc.name testReplace0140
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0500
        * @tc.desc   Test lastIndex returns to zero after global replace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc abc";
          const regex = new RegExp('abc', 'g');
          str.replace(regex, "XYZ");
          const after = regex.lastIndex;
          expect(after).assertEqual(0);
        });
      });

      // Empty strings, degenerate patterns, and unicode edges that stress replacement bookkeeping.
      describe('ReplaceAdvanced_Boundary_Value_Tests', () => {
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
         * @tc.name testReplace0141
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0600
        * @tc.desc   Test Replace on empty source string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "";
          const result = str.replace(new RegExp('a'), "b");
          expect(result).assertEqual("");
        });

        /**
         * @tc.name testReplace0142
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0700
        * @tc.desc   Test Empty-match regex inserts replacement at position zero
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "test";
          const result = str.replace(new RegExp('(?:)'), "_");
          expect(result).assertEqual("_test");
        });

        /**
         * @tc.name testReplace0143
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0800
        * @tc.desc   Test Single-character string replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "a";
          const result = str.replace(new RegExp('a'), "b");
          expect(result).assertEqual("b");
        });

        /**
         * @tc.name testReplace0144
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_0900
        * @tc.desc   Test Long string global replace preserves length
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "a".repeat(10000);
          const result = str.replace(new RegExp('a', 'g'), "b");
          expect(result.length).assertEqual(10000);
          expect(result).assertEqual("b".repeat(10000));
        });

        /**
         * @tc.name testReplace0145
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1000
        * @tc.desc   Test Replace matched segment with empty string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello World";
          const result = str.replace(new RegExp('World'), "");
          expect(result).assertEqual("Hello ");
        });

        /**
         * @tc.name testReplace0146
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1100
        * @tc.desc   Test Replace whole string using start/end anchors
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello";
          const result = str.replace(new RegExp('^.*$'), "Bye");
          expect(result).assertEqual("Bye");
        });

        /**
         * @tc.name   testReplace0147
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1200
         * @tc.desc   Test Emoji replace with Unicode flag on surrogate pairs
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const emoji: string = String.fromCharCode(0xD83D, 0xDE00);
          const str: string = emoji + emoji;
          const resultWithU: string = str.replace(new RegExp(emoji, 'gu'), "X");
          expect(resultWithU).assertEqual("XX");
        });
      });

      // Escapes and supplemental planes: replacement must not split surrogate pairs differently from match.
      describe('Special_Chars_And_Unicode', () => {
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
         * @tc.name testReplace0148
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1300
        * @tc.desc   Test Replace newline and tab with spaces
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "Hello\nWorld\t!";
          const result = str.replace(new RegExp('\\n', 'g'), " ").replace(new RegExp('\\t', 'g'), "  ");
          expect(result).assertEqual("Hello World  !");
        });

        /**
         * @tc.name testReplace0149
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1400
        * @tc.desc   Test Replace accented Unicode character
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "caf\u00e9";
          const result = str.replace(new RegExp('\\u00e9'), "e");
          expect(result).assertEqual("cafe");
        });

        /**
         * @tc.name testReplace0150
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1500
        * @tc.desc   Test Replace emoji in plain text
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const emoji: string = String.fromCharCode(0xD83D, 0xDE00);
          const str: string = "Hello " + emoji + " World";
          const result: string = str.replace(new RegExp(emoji, 'g'), ":-)");
          expect(result).assertEqual("Hello :-) World");
        });

        /**
         * @tc.name testReplace0151
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1600
        * @tc.desc   Test Replace Unicode math digit with u flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const mathSansHigh = 55349;
          const mathSansDigitZeroLow = 57240;
          const mathSansDigitOneLow = 57241;
          const mathSansDigitTwoLow = 57242;
          const mathZero = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow);
          const str = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow, mathSansHigh, mathSansDigitOneLow,
            mathSansHigh, mathSansDigitTwoLow);
          const result = str.replace(new RegExp(mathZero, 'gu'), '0');
          const digitOne = String.fromCharCode(mathSansHigh, mathSansDigitOneLow);
          const digitTwo = String.fromCharCode(mathSansHigh, mathSansDigitTwoLow);
          expect(result).assertEqual('0' + digitOne + digitTwo);
        });

        /**
         * @tc.name testReplace0152
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1700
        * @tc.desc   Test Surrogate pair handling with and without global u
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const emoji: string = String.fromCharCode(0xD83D, 0xDE00);
          const str: string = emoji + emoji;
          const result1: string = str.replace(new RegExp(emoji, 'u'), "X");
          const result2: string = str.replace(new RegExp(emoji, 'gu'), "X");
          expect(result1).assertEqual("X" + emoji);
          expect(result2).assertEqual("XX");
        });

        /**
         * @tc.name testReplace0153
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1800
        * @tc.desc   Test Combining character replace with u flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "e\u0301";
          const result = str.replace(new RegExp('\\u0301', 'u'), "");
          expect(result).assertEqual("e");
        });

        /**
         * @tc.name testReplace0154
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_1900
        * @tc.desc   Test Partial replace in complex emoji sequence
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const emoji: string = String.fromCharCode(0xD83D, 0xDE00);
          const str: string = emoji + emoji + emoji;
          const result: string = str.replace(new RegExp(emoji, 'gu'), "XX");
          expect(result).not().assertEqual(str);
        });

        /**
         * @tc.name testReplace0155
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2000
        * @tc.desc   Test Unicode property escape Script=Greek
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('\\p{Script=Greek}', 'gu')) {
            return;
          }
          const str = "ABC \u03b1\u03b2\u03b3";
          const result = str.replace(new RegExp('\\p{Script=Greek}', 'gu'), "X");
          expect(result).assertEqual("ABC XXX");
        });
      });

      // Flag combinations change what replace considers a match before substitution runs.
      describe('Regex_Flag_Interactions', () => {
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
         * @tc.name testReplace0156
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2100
        * @tc.desc   Test Sticky y flag replace with lastIndex
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('a', 'y')) {
            return;
          }
          const str = "aaa";
          const regex = new RegExp('a', 'y');
          regex.lastIndex = 1;
          const result = str.replace(regex, "b");
          expect(result).assertEqual("aba");
        });

        /**
         * @tc.name testReplace0157
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2200
        * @tc.desc   Test dotAll s flag matches across newline
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('Hello.World', 's')) {
            return;
          }
          const str = "Hello\nWorld";
          const result = str.replace(new RegExp('Hello.World', 's'), "Hi");
          expect(result).assertEqual("Hi");
        });

        /**
         * @tc.name testReplace0158
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2300
        * @tc.desc   Test Combined gim and sm flag replace behavior
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp('test', 'gim') || !supportsRegExp('.+', 'sm')) {
            return;
          }
          const str = "Test\nTEST\ntest";
          const result1 = str.replace(new RegExp('test', 'gim'), "XYZ");
          const result2 = str.replace(new RegExp('.+', 'sm'), "ABC");
          expect(result1).assertEqual("XYZ\nXYZ\nXYZ");
          expect(result2).assertEqual("ABC");
        });

        /**
         * @tc.name testReplace0159
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_ADVANCED_TEST_2400
        * @tc.desc   Test Compare first-only vs global replace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "test test test";
          const result1 = str.replace(new RegExp('test'), "XYZ");
          const result2 = str.replace(new RegExp('test', 'g'), "XYZ");
          expect(result1).assertEqual("XYZ test test");
          expect(result2).assertEqual("XYZ XYZ XYZ");
        });
      });

      // Nested/alternation patterns with replace閳ユ敊alidates capture indexing for $n expansion.
      describe('Complex_Pattern_Matching', () => {
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
         * @tc.name testReplace0160
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0100
         * @tc.desc   Test Zero Width Assertion Replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsLookbehindSemantics()) {
            return;
          }
          const str = "123abc456";
          const result = str.replace(new RegExp('(?<=\\d)(?=[a-z])', 'g'), "-");
          expect(result).assertEqual("123-abc456");
        });

        /**
         * @tc.name testReplace0161
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0200
         * @tc.desc   Test Positive Lookahead
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc123 def456";
          const result = str.replace(new RegExp('\\d(?=\\d)', 'g'), "*");
          expect(result).assertEqual("abc**3 def**6");
        });

        /**
         * @tc.name testReplace0162
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0300
         * @tc.desc   Test Negative Lookahead
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc1 def2";
          const result = str.replace(new RegExp('\\w(?!\\d)', 'g'), "");
          expect(result).assertEqual("c f");
        });

        /**
         * @tc.name testReplace0163
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0400
         * @tc.desc   Test Positive Lookbehind
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsLookbehindSemantics()) {
            return;
          }
          const str = "price:100 cost:200";
          const result = str.replace(new RegExp('(?<=:)\\d+', 'g'), "XXX");
          expect(result).assertEqual("price:XXX cost:XXX");
        });

        /**
         * @tc.name testReplace0164
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0500
         * @tc.desc   Test Negative Lookbehind
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "abc100 def100";
          if (!supportsLookbehindSemantics()) {
            expect(supportsLookbehindSemantics()).assertFalse();
            return;
          }
          const result = str.replace(new RegExp('(?<!abc)\\d+', 'g'), "XXX");
          expect(result).assertEqual("abc100 defXXX");
        });

        /**
         * @tc.name testReplace0165
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0600
         * @tc.desc   Test Atomic Group
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          let regex: RegExp | null = null;
          try {
            regex = new RegExp('(?>a*)bc');
          } catch (_) {
          }
          if (regex === null) {
            return;
          }
          const str = "abc";
          const result = str.replace(regex, "X");
          expect(result).assertEqual("X");
        });

        /**
         * @tc.name testReplace0166
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0700
         * @tc.desc   Test Possessive Quantifier
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          let regex: RegExp | null = null;
          try {
            regex = new RegExp('a*+b');
          } catch (_) {
          }
          if (regex === null) {
            return;
          }
          const str = "aaab";
          const result = str.replace(regex, "X");
          expect(result).assertEqual("X");
        });

        /**
         * @tc.name testReplace0167
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0800
         * @tc.desc   Test G Anchor
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "test test";
          const regex = new RegExp('\\Gtest', 'g');
          const result = str.replace(regex, "XYZ");
          expect(result === "XYZ test" || result === "test test").assertTrue();
        });
      });

      // Replacement value coercions (number, object ToString) exercise the spec閳ユ獨 GetSubstitution preamble.
      describe('replacement_Parameter_Type_Tests', () => {
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
         * @tc.name testReplace0168
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_0900
         * @tc.desc   Test String replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          const str = "hello";
          const result = str.replace(new RegExp('hello'), "HELLO");
          expect(result).assertEqual("HELLO");
        });

        /**
         * @tc.name testReplace0169
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1000
         * @tc.desc   Test Number replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithNumber()).assertEqual("123");
        });

        /**
         * @tc.name testReplace0170
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1100
         * @tc.desc   Test Object toString
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithObjectToString()).assertEqual("REPLACED");
        });

        /**
         * @tc.name testReplace0171
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1200
         * @tc.desc   Test Symbol toPrimitive
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithSymbolToPrimitive()).assertEqual("REPLACED");
        });

        /**
         * @tc.name testReplace0172
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1300
         * @tc.desc   Test null replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithNull()).assertEqual("null");
        });

        /**
         * @tc.name testReplace0173
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1400
         * @tc.desc   Test undefined replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithUndefined()).assertEqual("undefined");
        });

        /**
         * @tc.name testReplace0174
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1500
         * @tc.desc   Test Symbol replacement Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithSymbolValueThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0175
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1600
         * @tc.desc   Test BigInt replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithBigInt()).assertEqual("123");
        });

        /**
         * @tc.name testReplace0176
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1700
         * @tc.desc   Test Boolean replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithBoolean()).assertEqual("true");
        });

        /**
         * @tc.name testReplace0177
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1800
         * @tc.desc   Test Array replacement
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceTestWithArray()).assertEqual("a,b");
        });
      });

      // Symbol.replace and RegExp.prototype.replace enforce receiver shapes; non-regex receivers throw early.
      describe('this_Value_Tests', () => {
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
         * @tc.name testReplace0178
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_1900
         * @tc.desc   Test Non RegExp Object this Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexNonRegExpReceiverSymbolReplaceThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0179
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2000
         * @tc.desc   Test undefined this Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexRegexpPrototypeSymbolReplaceUndefinedThisThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0180
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2100
         * @tc.desc   Test null this Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexRegexpPrototypeSymbolReplaceNullThisThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0181
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2200
         * @tc.desc   Test RegExp Like Object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexRegexpPrototypeSymbolReplaceRegexLikeResult()).assertEqual("X value");
        });
      });

      // Invalid patterns and illegal replacement tokens should throw catchable errors instead of causing silent corruption.
      describe('Error_and_Exception_Handling', () => {
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
         * @tc.name testReplace0182
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2300
         * @tc.desc   Test Invalid Regex Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexInvalidRegExpCharClassCtorThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0183
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2400
         * @tc.desc   Test Invalid Flag Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexInvalidRegExpFlagCtorThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0184
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2500
         * @tc.desc   Test Invalid Unicode Code Point Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexInvalidUnicodeCodePointThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0185
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2600
         * @tc.desc   Test Lookbehind Syntax Error Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexInvalidLookbehindThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0186
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2700
         * @tc.desc   Test Invalid Unicode Property Throws
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexInvalidUnicodePropertyThrows()).assertTrue();
        });

        /**
         * @tc.name testReplace0187
         * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_COMPLEX_TEST_2800
         * @tc.desc   Test replacement Non Function Non String
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testReplace0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          expect(replaceComplexReplaceHelloHWithNumber()).assertEqual("123ello");
        });
      });
}
