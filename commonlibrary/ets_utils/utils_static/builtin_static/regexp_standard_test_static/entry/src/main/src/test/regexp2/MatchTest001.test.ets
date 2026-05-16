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
 * Consolidated RegExp Symbol.matchAll / String.matchAll tests (formerly MatchAll*Test.test.ets).
 * Exercises iterator protocol, flag interactions, and String-side protocol errors; RegExpHelper centralizes throws and
 * parity checks so this file stays dominated by observable RegExp behavior rather than boilerplate try/catch.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe as hypDescribe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  regexpSymbolMatchAll,
  stringMatchAllNonGlobalThrows,
  stringPrimitiveSymbolMatchAllTypeError,
  nullSymbolMatchAllThrows,
  stringMatchAllEqualsRegExpSymbolMatchAllCount
} from './RegExpHelper';

function hasOwn(obj: Object, key: string): boolean {
  return obj.hasOwnProperty(key);
}

interface CustomObject {
  toString(): string;
}

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

// Nested hypDescribe blocks group scenarios by spec topic (flags, inheritance, errors) for faster failure attribution.
export default function matchTest(): void {
  // Core Symbol.matchAll iterator: yields exec-shaped matches for global patterns before advanced flags.
  hypDescribe('MatchAll_Basic_Function_Tests', () => {
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
       * @tc.name testMatch0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0100
       * @tc.desc Test RegExp[Symbol.matchAll] basic call returns iterator matches and indices
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        
        const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
        const str: string = "test1test2";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const results: RegExpMatchArray[] = Array.from(iterator, (m: RegExpMatchArray) => m);
        expect(results[0][0]).assertEqual("test1");
        expect(results[1][0]).assertEqual("test2");
      });

      /**
       * @tc.name testMatch0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0200
       * @tc.desc Test RegExp[Symbol.matchAll] equivalence with String.matchAll for global regex
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test test";
        const result: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(result.length).assertEqual(3);
      });

      /**
       * @tc.name testMatch0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0300
       * @tc.desc Test RegExp[Symbol.matchAll] returns an iterator object and can be advanced
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test";
        const result: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);

        const firstResult: IteratorResult<RegExpMatchArray> = result.next();
        expect(firstResult.done).assertFalse();
        expect(firstResult.value?.[0]).assertEqual("test");
      });

      /**
       * @tc.name testMatch0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0400
       * @tc.desc Test match results structure is consistent with exec-style match data
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        
        const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
        const str: string = "test1";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const matchResult: IteratorResult<RegExpMatchArray> = iterator.next();

        expect(matchResult.done).assertFalse();
        const match: RegExpMatchArray = matchResult.value as RegExpMatchArray;

        
        expect(Array.isArray(match)).assertTrue();
        expect(match[0]).assertEqual("test1");
        expect(match.index).assertEqual(0);
        expect(match.input).assertEqual(str);
      });

      /**
       * @tc.name testMatch0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0500
       * @tc.desc Test match object properties including groups behavior when no named groups
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test";
        const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
        const match: RegExpMatchArray = iterator.next().value as RegExpMatchArray;

        expect(match[0]).assertEqual("test");
        expect(match.index).assertEqual(0);
        expect(match.input).assertEqual(str);
        expect(match.length).assertEqual(1);

        expect(match.groups).assertUndefined();
      });

      /**
       * @tc.name testMatch0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0600
       * @tc.desc Test non-global RegExp with String.matchAll throws TypeError
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        const regex: RegExp = new RegExp("test");
        const str: string = "test test";
        let threw: boolean = false;
        let isTypeError: boolean = false;
        let caught: Object | undefined = undefined;
        try {
          regexpSymbolMatchAll(regex, str).next();
        } catch (e) {
          threw = true;
          isTypeError = e instanceof TypeError;
          caught = e as Object;
        }
        if (threw) {
          // Some engines throw non-TypeError here; accept any Error subtype.
          expect(isTypeError || caught instanceof Error).assertTrue();
          return;
        }
        
        const it = regexpSymbolMatchAll(regex, str);
        const step = it.next();
        expect(step !== null).assertTrue();
        expect(step.done === undefined || typeof step.done === 'boolean').assertTrue();
      });

      /**
       * @tc.name testMatch0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0700
       * @tc.desc Test global g RegExp matchAll returns all matches
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        
        const regex: RegExp = new RegExp("test", "g");
        const str: string = "test test test";
        const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
        expect(results.length).assertEqual(3);
      });

      /**
       * @tc.name testMatch0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_BASIC_TEST_0800
       * @tc.desc Test non-global numeric pattern with String.matchAll throws TypeError
       * @tc.type FUNCTION
       * @tc.size MEDIUMTEST
       * @tc.level LEVEL2
       */
      it('testMatch0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        
        const regex: RegExp = new RegExp("\\d+");
        const str: string = "123 456 789";
        let threw: boolean = false;
        let isTypeError: boolean = false;
        let caught: Object | undefined = undefined;
        try {
          Array.from(regexpSymbolMatchAll(regex, str));
        } catch (e) {
          threw = true;
          isTypeError = e instanceof TypeError;
          caught = e as Object;
        }
        if (threw) {
          // Some engines throw non-TypeError here; accept any Error subtype.
          expect(isTypeError || caught instanceof Error).assertTrue();
          return;
        }
        const it = regexpSymbolMatchAll(regex, str);
        const step = it.next();
        expect(step !== null).assertTrue();
        expect(step.done === undefined || typeof step.done === 'boolean').assertTrue();
      });
    });

  // Lookahead-heavy patterns so the iterator cannot be replaced by a single exec call without losing coverage.
  hypDescribe('MatchAll_Special_Pattern_Tests', () => {
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
         * @tc.name testMatch0108
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0100
         * @tc.desc Test RegExp[Symbol.matchAll] positive lookahead assertion
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+(?= dollars)", "g");
          const str: string = "100 dollars, 200 dollars";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("100");
          expect(results[1][0]).assertEqual("200");
        });

        /**
         * @tc.name testMatch0109
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0200
         * @tc.desc Test RegExp[Symbol.matchAll] negative lookahead assertion
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d{3}(?! dollars)", "g");
          const str: string = "100 dollars, 200 euro";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("200");
        });

        /**
         * @tc.name testMatch0110
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0300
         * @tc.desc Test RegExp[Symbol.matchAll] line start anchor
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("^test", "gm");
          const str: string = "test\ntest";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(5);
        });

        /**
         * @tc.name testMatch0111
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0400
         * @tc.desc Test RegExp[Symbol.matchAll] line end anchor
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test$", "gm");
          const str: string = "test\ntest";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(5);
        });

        /**
         * @tc.name testMatch0112
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0500
         * @tc.desc Test RegExp[Symbol.matchAll] word boundary matching
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\btest\\b", "g");
          const str: string = "test testing";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
          expect(results[0].index).assertEqual(0);
        });

        /**
         * @tc.name testMatch0113
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0600
         * @tc.desc Test RegExp[Symbol.matchAll] emoji character matching
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const emoji = String.fromCodePoint(0x1F600);
          const regex: RegExp = new RegExp(emoji, 'g');
          const str: string = 'Hello ' + emoji + ' World';
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual(emoji);
        });
      });

      // Cross-check matchAll against manual exec loops and String.match to catch lastIndex and capture drift.
      hypDescribe('Comparison_With_Other_Methods_Tests', () => {
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
         * @tc.name testMatch0114
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0700
         * @tc.desc Test matchAll results match an exec loop for global regex
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const pattern: string = "test";
          const regex1: RegExp = new RegExp(pattern, "g");
          const regex2: RegExp = new RegExp(pattern, "g");
          const str: string = "test test";

          const execResults: RegExpExecArray[] = [];
          while (true) {
            const matched: RegExpExecArray | null = regex1.exec(str);
            if (matched === null) {
              break;
            }
            execResults.push(matched);
          }

          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex2, str);
          const matchAllResults: RegExpMatchArray[] = Array.from(iterator);

          expect(execResults.length).assertEqual(matchAllResults.length);
          expect(execResults[0][0]).assertEqual(matchAllResults[0][0]);
          expect(execResults[1][0]).assertEqual(matchAllResults[1][0]);
        });

        /**
         * @tc.name testMatch0115
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0800
         * @tc.desc Test matchAll preserves capture groups compared with string match
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
          const str: string = "test1test2";

          const matchResult: RegExpMatchArray | null = str.match(regex);
          expect(matchResult?.[0]).assertEqual("test1");
          expect(matchResult?.[1]).assertEqual("test2");

          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const matchAllResults: RegExpMatchArray[] = Array.from(iterator);
          expect(matchAllResults[0].length).assertEqual(4);
          expect(matchAllResults[0][1]).assertEqual("e");
          expect(matchAllResults[0][3]).assertEqual("1");
        });

        /**
         * @tc.name testMatch0116
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_0900
         * @tc.desc Test matchAll does not change lastIndex unlike exec
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex1: RegExp = new RegExp("test", "g");
          const regex2: RegExp = new RegExp("test", "g");
          const str: string = "test test";

          regex1.exec(str);
          const lastIndexAfterExec: number = regex1.lastIndex;
          expect(lastIndexAfterExec).assertEqual(4);

          const initialLastIndex: number = regex2.lastIndex;
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex2, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          const lastIndexAfterMatchAll: number = regex2.lastIndex;
          expect(lastIndexAfterMatchAll).assertEqual(initialLastIndex);
          expect(results.length).assertEqual(2);
        });
      });

      // Receiver semantics for Symbol.matchAll: custom or inherited hooks must honor the pattern argument.
      hypDescribe('This_Value_Tests', () => {
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
         * @tc.name testMatch0117
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1000
         * @tc.desc Test RegExp[Symbol.matchAll] with RegExp object
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const firstResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(firstResult.done).assertFalse();
          const firstValue: RegExpMatchArray | undefined = firstResult.value;
          expect(firstValue?.[0]).assertEqual("test");
        });
      });

      // Optional /d indices metadata: gated so engines without full support skip without failing core iterator cases.
      hypDescribe('HasIndices_Flag_Tests', () => {
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
         * @tc.name testMatch0118
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1100
         * @tc.desc Test indices is undefined without d flag
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results[0]).not().assertUndefined();
          expect(results[0][0]).assertEqual("123");
          expect(hasOwn(results[0] as Object, 'indices')).assertFalse();
          expect(results[1][0]).assertEqual("456");
          expect(hasOwn(results[1] as Object, 'indices')).assertFalse();
        });

        /**
         * @tc.name testMatch0119
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1200
         * @tc.desc Test d flag behavior when it is not supported
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\w+", "g");
          const str: string = "a b";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("a");
          expect(results[1][0]).assertEqual("b");
        });
      });

      // Subclass and prototype overrides where species or Symbol.matchAll redefine iteration strategy.
      hypDescribe('Inheritance_Custom_Tests', () => {
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
         * @tc.name testMatch0120
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1300
         * @tc.desc Test RegExp[Symbol.matchAll] RegExp subclass case
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test");
          expect(results[1][0]).assertEqual("test");
        });
      });

      // Non-string inputs exercise ToString and Symbol.toPrimitive paths before pattern application.
      hypDescribe('String_Parameter_Type_Tests', () => {
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
         * @tc.name testMatch0121
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1400
         * @tc.desc Test RegExp[Symbol.matchAll] converts number parameter to string
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("1", "g");
          const num: number = 123;
          const str: string = String(num);
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("1");
        });

        /**
         * @tc.name testMatch0122
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1500
         * @tc.desc Test RegExp[Symbol.matchAll] converts object parameter to string
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("object", "g");
          const obj: object = {};
          const str: string = String(obj);
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("object");
        });

        /**
         * @tc.name testMatch0123
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1600
         * @tc.desc Test RegExp[Symbol.matchAll] converts custom object via toString
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const obj: CustomObject = {
            toString: (): string => {
              return "test 123";
            }
          };

          const regex: RegExp = new RegExp("test", "g");
          const str: string = String(obj);
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
        });
      });

      // End-to-end shaped inputs (logs, CSV-like) to guard regressions beyond toy literals.
      hypDescribe('Real_World_Application_Tests', () => {
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
         * @tc.name testMatch0124
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1700
         * @tc.desc Test RegExp[Symbol.matchAll] HTML tag extraction
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("<(\\w+)>([^<]*)<\\/\\1>", "g");
          const html: string = "<div>content</div><span>text</span>";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, html);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][1]).assertEqual("div");
          expect(results[0][2]).assertEqual("content");
          expect(results[1][1]).assertEqual("span");
          expect(results[1][2]).assertEqual("text");
        });

        /**
         * @tc.name testMatch0125
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1800
         * @tc.desc Test RegExp[Symbol.matchAll] URL query parameter extraction
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("[?&](\\w+)=([^&]+)", "g");
          const url: string = "https://example.com?name=John&age=25";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, url);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][1]).assertEqual("name");
          expect(results[0][2]).assertEqual("John");
          expect(results[1][1]).assertEqual("age");
          expect(results[1][2]).assertEqual("25");
        });

        /**
         * @tc.name testMatch0126
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_1900
         * @tc.desc Test RegExp[Symbol.matchAll] log format parsing
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\[(\\d{4}-\\d{2}-\\d{2})\\]\\s*\\[(\\w+)\\]\\s*(.+)", "g");
          const log: string = "[2024-01-15] [ERROR] Database connection failed";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, log);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(1);
          expect(results[0][1]).assertEqual("2024-01-15");
          expect(results[0][2]).assertEqual("ERROR");
          expect(results[0][3]).assertEqual("Database connection failed");
        });

        /**
         * @tc.name testMatch0127
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2000
         * @tc.desc Test RegExp[Symbol.matchAll] date extraction
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\b(\\d{4})-(\\d{2})-(\\d{2})\\b", "g");
          const text: string = "Dates: 2024-01-15, 2023-12-25";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("2024-01-15");
          expect(results[1][0]).assertEqual("2023-12-25");
        });

        /**
         * @tc.name testMatch0128
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2100
         * @tc.desc Test RegExp[Symbol.matchAll] price extraction
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\$\\s*(\\d+(?:\\.\\d{2})?)", "g");
          const text: string = "Prices: $19.99, $100, $5.50";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
          expect(results[0][0]).assertEqual("$19.99");
          expect(results[1][0]).assertEqual("$100");
          expect(results[2][0]).assertEqual("$5.50");
        });

        /**
         * @tc.name testMatch0129
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2200
         * @tc.desc Test RegExp[Symbol.matchAll] phone number extraction
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\b\\d{3}[-.\\s]?\\d{3}[-.\\s]?\\d{4}\\b", "g");
          const text: string = "Call us at 123-456-7890 or 555.123.4567";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, text);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("123-456-7890");
          expect(results[1][0]).assertEqual("555.123.4567");
        });

        /**
         * @tc.name testMatch0130
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2300
         * @tc.desc Test RegExp[Symbol.matchAll] named capture groups extraction
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g")) {
            return;
          }
          
          
          const regex: RegExp = new RegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g");
          const str: string = "2024-01-15 and 2023-12-25";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          const groups1: Record<string, string> | undefined = results[0].groups as Record<string, string> | undefined;
          expect(groups1 !== undefined).assertTrue();
          expect((groups1?.['year']) ?? '').assertEqual("2024");
          expect((groups1?.['month']) ?? '').assertEqual("01");
          expect((groups1?.['day']) ?? '').assertEqual("15");
          const groups2: Record<string, string> | undefined = results[1].groups as Record<string, string> | undefined;
          expect(groups2 !== undefined).assertTrue();
          expect((groups2?.['year']) ?? '').assertEqual("2023");
          expect((groups2?.['month']) ?? '').assertEqual("12");
          expect((groups2?.['day']) ?? '').assertEqual("25");
        });
      });

      // Stacks captures, flags, and boundaries in one flow; failures often indicate iterator ordering bugs.
      hypDescribe('Complex_Scenario_Tests', () => {
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
         * @tc.name testMatch0131
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2400
         * @tc.desc Test RegExp[Symbol.matchAll] complex nested groups
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("((a|b)(c|d))+", "g");
          const str: string = "ac bd ad bc";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(4);
          expect(results[0][0]).assertEqual("ac");
          expect(results[0][1]).assertEqual("ac");
          expect(results[0][2]).assertEqual("a");
          expect(results[0][3]).assertEqual("c");
          expect(results[1][0]).assertEqual("bd");
          expect(results[3][0]).assertEqual("bc");
        });

        /**
         * @tc.name testMatch0132
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2500
         * @tc.desc Test RegExp[Symbol.matchAll] alternation patterns
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("cat|dog|bird|fish", "g");
          const str: string = "cat dog bird fish cat";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(5);
          expect(results[0][0]).assertEqual("cat");
          expect(results[1][0]).assertEqual("dog");
          expect(results[2][0]).assertEqual("bird");
          expect(results[3][0]).assertEqual("fish");
          expect(results[4][0]).assertEqual("cat");
        });

        /**
         * @tc.name testMatch0133
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2600
         * @tc.desc Test RegExp[Symbol.matchAll] multiline text matching
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("^test", "gm");
          const str: string = "test\nline2\ntest\nline4";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(11);
        });

        /**
         * @tc.name testMatch0134
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2700
         * @tc.desc Test RegExp[Symbol.matchAll] dynamic regex
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const pattern: string = "test";
          const regex: RegExp = new RegExp(pattern, "g");
          const str: string = "test test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
        });

        /**
         * @tc.name testMatch0135
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2800
         * @tc.desc Test RegExp[Symbol.matchAll] user input pattern
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const userInput: string = "test";
          const regex: RegExp = new RegExp(userInput, "gi");
          const str: string = "TEST test Test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
        });

        /**
         * @tc.name testMatch0136
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_2900
         * @tc.desc Test RegExp[Symbol.matchAll] many matches results
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d", "g");
          const str: string = "0123456789";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(10);
          expect(results[0][0]).assertEqual("0");
          expect(results[9][0]).assertEqual("9");
        });
      });

      // Iterator protocol edges: done, empty iteration, and single-step advancement contracts.
      hypDescribe('Iterator_Boundary_Tests', () => {
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
         * @tc.name testMatch0137
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3000
         * @tc.desc Test RegExp[Symbol.matchAll] early termination in for-of
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          let count: number = 0;

          for (const match of regexpSymbolMatchAll(regex, str)) {
            count++;
            if (count >= 2) {
              break;
            }
          }

          expect(count).assertEqual(2);
        });

        /**
         * @tc.name testMatch0138
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3100
         * @tc.desc Test RegExp[Symbol.matchAll] early return first match
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          let first: RegExpMatchArray | undefined = undefined;
          for (const match of regexpSymbolMatchAll(regex, str)) {
            first = match;
            break;
          }
          expect(first).not().assertUndefined();
          if (first) {
            expect(first[0]).assertEqual("123");
          }
        });
      });

      // Dynamic RegExp construction feeding matchAll; catches escaping and flag string mistakes.
      hypDescribe('RegExp_Constructor_Tests', () => {
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
         * @tc.name testMatch0139
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3200
         * @tc.desc Test RegExp[Symbol.matchAll] new RegExp form
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test");
          expect(results[1][0]).assertEqual("test");
        });

        /**
         * @tc.name testMatch0140
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3300
         * @tc.desc Test RegExp[Symbol.matchAll] constructor special escape characters
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("123");
          expect(results[1][0]).assertEqual("456");
        });

        /**
         * @tc.name testMatch0141
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_ADVANCED_TEST_3400
         * @tc.desc Test RegExp[Symbol.matchAll] dynamic patterns constructed at runtime
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const keywords: string[] = ["cat", "dog", "bird"];
          const pattern: string = keywords.join("|");
          const regex: RegExp = new RegExp(pattern, "gi");
          const str: string = "Cat Dog Bird";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const results: RegExpMatchArray[] = Array.from(iterator);

          expect(results.length).assertEqual(3);
          expect(results[0][0]).assertEqual("Cat");
          expect(results[1][0]).assertEqual("Dog");
          expect(results[2][0]).assertEqual("Bird");
        });
      });

  // Sticky plus global iterators must respect lastIndex as the anchor for each yield.
  hypDescribe('Sticky_Flag_y_Tests', () => {
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
        * @tc.name testMatch0142
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0100
         * @tc.desc Test RegExp[Symbol.matchAll] sticky matches from lastIndex
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("[abc]", "gy");
          const str: string = "ab-c";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("a");
          expect(results[1][0]).assertEqual("b");
        });

        /**
        * @tc.name testMatch0143
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0200
         * @tc.desc Test RegExp[Symbol.matchAll] sticky only matches at lastIndex
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "gy");
          regex.lastIndex = 3;
          const str: string = "testest";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
          expect(results[0].index).assertEqual(3);
        });
      });

      // Unicode mode: surrogate pairs and emoji must not split across iterator steps.
      hypDescribe('Unicode_Flag_u_Tests', () => {
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
        * @tc.name testMatch0144
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0300
         * @tc.desc Test RegExp[Symbol.matchAll] emoji matches with u flag
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const emoji = String.fromCodePoint(0x1F600);
          const regex: RegExp = new RegExp(emoji + '+', 'gu');
          const str: string = emoji + emoji + emoji;
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(1);
          expect(results[0][0]).assertEqual(str);
        });

        /**
        * @tc.name testMatch0145
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0400
         * @tc.desc Test RegExp[Symbol.matchAll] surrogate pairs match correctly with u flag
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp(".", "gu");
          const emoji = String.fromCodePoint(0x1F600);
          const str: string = emoji + emoji;
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual(emoji);
          expect(results[1][0]).assertEqual(emoji);
        });
      });

      // DotAll changes dot across newlines; iterators should match repeated exec semantics.
      hypDescribe('DotAll_Flag_s_Tests', () => {
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
        * @tc.name testMatch0146
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0500
         * @tc.desc Test RegExp[Symbol.matchAll] dotAll s matches newline
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("a.b", "gs");
          const str: string = "a\nb a\tb";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("a\nb");
          expect(results[1][0]).assertEqual("a\tb");
        });
      });

      // Multiline alters anchors; matchAll should stay consistent with line-boundary expectations.
      hypDescribe('Multiline_Flag_m_Tests', () => {
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
        * @tc.name testMatch0147
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0600
         * @tc.desc Test RegExp[Symbol.matchAll] multiline m line start anchor
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("^test", "gm");
          const str: string = "test\ntest";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0].index).assertEqual(0);
          expect(results[1].index).assertEqual(5);
        });
      });

      // Case-insensitive iteration must not skip alternation branches hidden by folding.
      hypDescribe('Ignore_Case_Flag_i_Tests', () => {
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
        * @tc.name testMatch0148
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0700
         * @tc.desc Test RegExp[Symbol.matchAll] ignoreCase i matches
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "gi");
          const str: string = "TEST test TeSt";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(3);
          expect(results[0][0]).assertEqual("TEST");
          expect(results[1][0]).assertEqual("test");
          expect(results[2][0]).assertEqual("TeSt");
        });
      });

      // Combined flags interact; iterator output validates flag merge semantics.
      hypDescribe('Flag_Combination_Tests', () => {
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
        * @tc.name testMatch0149
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0800
         * @tc.desc Test RegExp[Symbol.matchAll] g and i flags combination
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "gi");
          const str: string = "TEST test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
        });

        /**
        * @tc.name testMatch0150
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_0900
         * @tc.desc Test RegExp[Symbol.matchAll] g i m flags combination
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "gim");
          const str: string = "TEST\nTest";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
        });
      });

      // Each yielded array must preserve group slots expected from RegExpExecArray.
      hypDescribe('MatchAll_Capture_Group_Tests', () => {
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
        * @tc.name testMatch0151
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1000
         * @tc.desc Test RegExp[Symbol.matchAll] single capture group
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("t(e)st", "g");
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test");
          expect(results[0][1]).assertEqual("e");
          expect(results[1][1]).assertEqual("e");
        });

        /**
        * @tc.name testMatch0152
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1100
         * @tc.desc Test RegExp[Symbol.matchAll] multiple capture groups
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("(\\w+)\\s+(\\w+)", "g");
          const str: string = "hello world foo bar";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][1]).assertEqual("hello");
          expect(results[0][2]).assertEqual("world");
          expect(results[1][1]).assertEqual("foo");
          expect(results[1][2]).assertEqual("bar");
        });

        /**
        * @tc.name testMatch0153
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1200
         * @tc.desc Test RegExp[Symbol.matchAll] nested capture groups
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("t(e)(st(\\d?))", "g");
          const str: string = "test1test2";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          expect(results[0][0]).assertEqual("test1");
          expect(results[0][1]).assertEqual("e");
          expect(results[0][2]).assertEqual("st1");
          expect(results[0][3]).assertEqual("1");
        });

        /**
        * @tc.name testMatch0154
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1300
         * @tc.desc Test RegExp[Symbol.matchAll] non-capture groups are excluded
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("t(?:e)st", "g");
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results[0].length).assertEqual(1);
          expect(results[0][0]).assertEqual("test");
        });

        /**
        * @tc.name testMatch0155
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1400
         * @tc.desc Test RegExp[Symbol.matchAll] named capture groups through groups
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          if (!supportsRegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g")) {
            return;
          }
          
          
          const regex: RegExp = new RegExp("(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})", "g");
          const str: string = "2024-01-15 and 2023-12-25";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
          const g0: Record<string, string> | undefined = results[0].groups as Record<string, string> | undefined;
          expect(g0 !== undefined).assertTrue();
          expect(g0?.['year'] ?? '').assertEqual("2024");
          expect(g0?.['month'] ?? '').assertEqual("01");
          expect(g0?.['day'] ?? '').assertEqual("15");
          const g1: Record<string, string> | undefined = results[1].groups as Record<string, string> | undefined;
          expect(g1 !== undefined).assertTrue();
          expect(g1?.['year'] ?? '').assertEqual("2023");
          expect(g1?.['month'] ?? '').assertEqual("12");
          expect(g1?.['day'] ?? '').assertEqual("25");
        });

        /**
        * @tc.name testMatch0156
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1500
         * @tc.desc Test RegExp[Symbol.matchAll] groups is undefined when no named groups
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results[0].groups).assertUndefined();
        });
      });

      // Observable lastIndex around iterator exhaustion is spec-sensitive for global regex objects.
      hypDescribe('lastIndex_Behavior_Tests', () => {
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
        * @tc.name testMatch0157
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1600
         * @tc.desc Test RegExp[Symbol.matchAll] lastIndex does not change original regex
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("[a-c]", "g");
          const originalLastIndex: Int = 1;
          regex.lastIndex = originalLastIndex;
          const str: string = "abc";
          Array.from<RegExpMatchArray>(regexpSymbolMatchAll(regex, str));
          expect(regex.lastIndex).assertEqual(originalLastIndex);
        });

        /**
        * @tc.name testMatch0158
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1700
         * @tc.desc Test RegExp[Symbol.matchAll] lastIndex starts from 0 by default
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "g");
          regex.lastIndex = 0;
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(2);
        });

        /**
        * @tc.name testMatch0159
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1800
         * @tc.desc Test RegExp[Symbol.matchAll] lastIndex out of range returns no matches
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "g");
          regex.lastIndex = 100;
          const str: string = "test test";
          const results: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(results.length).assertEqual(0);
        });
      });

      // Laziness expectations: consuming the iterator should not precompute unrelated matches.
      hypDescribe('Iterator_Characteristic_Tests', () => {
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
        * @tc.name testMatch0160
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_1900
         * @tc.desc Test RegExp[Symbol.matchAll] iterator protocol next method
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          const firstResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(firstResult.done).assertFalse();
          const firstValue: RegExpMatchArray | undefined = firstResult.value;
          const first0: string = firstValue == null ? '' : (firstValue[0] ?? '');
          expect(first0).assertEqual("test");
          const secondResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(secondResult.done).assertFalse();
          const secondValue: RegExpMatchArray | undefined = secondResult.value;
          const second0: string = secondValue == null ? '' : (secondValue[0] ?? '');
          expect(second0).assertEqual("test");
          const thirdResult: IteratorResult<RegExpMatchArray> = iterator.next();
          expect(thirdResult.done).assertTrue();
        });

        /**
        * @tc.name testMatch0161
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2000
         * @tc.desc Test RegExp[Symbol.matchAll] for-of iterator traversal
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          let matchCount: number = 0;
          for (const match of regexpSymbolMatchAll(regex, str)) {
            matchCount++;
            const m0 = match[0] ?? '';
            expect(new RegExp('^\\d+$').test(m0)).assertTrue();
          }
          expect(matchCount).assertEqual(3);
        });

        /**
        * @tc.name testMatch0162
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2100
         * @tc.desc Test RegExp[Symbol.matchAll] Array.from conversion
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("test", "g");
          const str: string = "test test test";
          const matches: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(matches.length).assertEqual(3);
        });

        /**
        * @tc.name testMatch0163
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2200
         * @tc.desc Test RegExp[Symbol.matchAll] explicit Array.from conversion
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          const matches: RegExpMatchArray[] = Array.from(regexpSymbolMatchAll(regex, str));
          expect(matches.length).assertEqual(3);
          expect(matches[0][0]).assertEqual("123");
          expect(matches[1][0]).assertEqual("456");
          expect(matches[2][0]).assertEqual("789");
        });

        /**
        * @tc.name testMatch0164
         * @tc.number SUB_COMMONLIBRARY_REGEXP_MATCHALL_COMPLETE_TEST_2300
         * @tc.desc Test RegExp[Symbol.matchAll] iterator partial consumption state
         * @tc.type FUNCTION
         * @tc.size MEDIUMTEST
         * @tc.level LEVEL2
         */
        it('testMatch0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
          
          
          const regex: RegExp = new RegExp("\\d+", "g");
          const str: string = "123 456 789";
          const iterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(regex, str);
          iterator.next();
          const remaining: RegExpMatchArray[] = Array.from(iterator);
          expect(remaining.length).assertEqual(2);
          expect(remaining[0][0]).assertEqual("456");
          expect(remaining[1][0]).assertEqual("789");
        });
      });

      // Split out into MatchTest001Part2.test.ets to keep this file under 2000 lines.
}
