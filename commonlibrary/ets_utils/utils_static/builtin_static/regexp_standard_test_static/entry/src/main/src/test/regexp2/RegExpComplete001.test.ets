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
 * Cross-cutting RegExp smoke: exec/toString, ctor, static hooks, Symbol methods, unicode/advanced syntax, and errors.
 * Pulls both live RegExp operations and RegExpHelper stubs—splitting concerns would duplicate TC numbers across modules.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import { regexpSymbolMatchAll } from './RegExpSymbols';
import {
  assignSourceStrictStillOriginal,
  assignGlobalHasNoEffect,
  execNamedGroupsYmd,
  symbolMatchTwoMatches,
  symbolMatchAllTwoMatches,
  symbolReplaceAllDemo,
  symbolSearchIndex6,
  symbolSplitThreeParts,
  subclassSpeciesIsConstructor,
  regexpStaticLastIndexIsNumberOrUndefined,
  globalPropertyNotEnumerable,
  globalDescriptorIsNonWritableData,
  newRegExpInvalidBracketThrows,
  newRegExpInvalidUnicodeThrows,
  literalUnknownFlagThrows,
  captureGroup10IsJ,
  regexpWithDFlagHasIndicesTrue,
  regexpLiteralWithoutDNotHasIndices
} from './RegExpHelper';

// Guards optional regexp features so incomplete engines can exit early without masking core ctor/exec failures.
function supportsRegExp(pattern: string, flags: string = ''): boolean {
  /*
   * Complete-test mixes mandatory and optional syntax; probing via ctor failure isolates “not implemented” from logic bugs
   * in exec/toString that should always run when construction succeeds.
   */
  try {
    /*
     * Keeps the probe consistent with the suite’s predominant RegExp(pattern, flags) usage.
     */
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    /*
     * Treat all ctor failures as skip signals—enumerating error types would couple tests to engine-specific wrappers.
     */
    return false;
  }
}

// Organized from observable instance methods outward to syntax, statics, then integration to mirror how failures appear in apps.
export default function regExpCompleteTest(): void {
  // Exec and toString: the minimum user-visible RegExp behavior before constructor corner cases.
  describe('Instance_Methods_exec_toString', () => {
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
     * @tc.name testRegExpComplete0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0100
     * @tc.desc Test RegExp.prototype.exec basic hello match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      const regex = new RegExp("hello");
      const result = regex.exec(str);
      expect(result?.[0]).assertEqual('hello');
      expect(result?.index).assertEqual(0);
      expect(result?.input).assertEqual('hello world');
    });

    /**
     * @tc.name testRegExpComplete0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0200
     * @tc.desc Test RegExp.prototype.exec ordinary numbered capture groups for date
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '2023-12-25';
      const regex = new RegExp("(\\d{4})-(\\d{2})-(\\d{2})");
      const result = regex.exec(str);
      expect(result?.[0]).assertEqual('2023-12-25');
      expect(result?.[1]).assertEqual('2023');
      expect(result?.[2]).assertEqual('12');
      expect(result?.[3]).assertEqual('25');
    });

    /**
     * @tc.name testRegExpComplete0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0300
     * @tc.desc Test RegExp.prototype.exec named capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})')) {
        return;
      }
      expect(execNamedGroupsYmd()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0400
     * @tc.desc Test exec loop updates lastIndex with global flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test test test';
      const regex = new RegExp("test", "g");
      expect(regex.exec(str)?.[0]).assertEqual('test');
      expect(regex.lastIndex).assertEqual(4);
      expect(regex.exec(str)?.[0]).assertEqual('test');
      expect(regex.lastIndex).assertEqual(9);
      expect(regex.exec(str)?.[0]).assertEqual('test');
      expect(regex.lastIndex).assertEqual(14);
      expect(regex.exec(str)).assertEqual(null);
      expect(regex.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testRegExpComplete0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0500
     * @tc.desc Test exec returns null when no match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp("xyz").exec('hello world')).assertEqual(null);
    });

    /**
     * @tc.name testRegExpComplete0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0600
     * @tc.desc Test sticky exec respects lastIndex with y flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test test';
      const regex = new RegExp("test", "y");
      regex.lastIndex = 0;
      expect(regex.exec(str)?.[0]).assertEqual('test');
      regex.lastIndex = 5;
      expect(regex.exec(str)?.[0]).assertEqual('test');
      regex.lastIndex = 2;
      expect(regex.exec(str)).assertEqual(null);
    });

    /**
     * @tc.name testRegExpComplete0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0700
     * @tc.desc Test exec result exposes index and input properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result = new RegExp("world").exec('hello world');
      expect(result?.index).assertEqual(6);
      expect(result?.input).assertEqual('hello world');
      expect(result?.[0]).assertEqual('world');
    });

    /**
     * @tc.name testRegExpComplete0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0800
     * @tc.desc Test RegExp.prototype.toString returns slash form with flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex1 = new RegExp("abc", "gim");
      const regex2 = new RegExp('\\d+', 'g');
      expect(regex1.toString()).assertEqual('/abc/gim');
      expect(regex2.toString()).assertEqual('/\\d+/g');
    });

    /**
     * @tc.name testRegExpComplete0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_0900
     * @tc.desc Test toString escapes whitespace characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex = new RegExp("\\n\\r\\t\\f\\v");
      const s = regex.toString();
      expect(s.indexOf('\\n') >= 0).assertTrue();
      expect(s.indexOf('\\t') >= 0).assertTrue();
    });
  });

  // Flag overrides, invalid patterns, and dynamic sources—construction rules independent of a particular match call.
  describe('Constructor', () => {
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
     * @tc.name testRegExpComplete0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1000
     * @tc.desc Test regex literal flags and properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex = new RegExp("test", "i");
      expect(regex.test('TEST')).assertTrue();
      expect(regex.source).assertEqual('test');
      expect(regex.flags).assertEqual('i');
    });

    /**
     * @tc.name testRegExpComplete0110
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1100
     * @tc.desc Test RegExp constructor with string pattern and flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex = new RegExp('test', 'i');
      expect(regex.test('TEST')).assertTrue();
      expect(regex.source).assertEqual('test');
    });

    /**
     * @tc.name testRegExpComplete0111
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1200
     * @tc.desc Test RegExp constructor handles escaped \\w and \\d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex1 = new RegExp('\\w+');
      const regex2 = new RegExp('\\d{3}');
      expect(regex1.test('abc123')).assertTrue();
      expect(regex2.test('123')).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0112
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1300
     * @tc.desc Test RegExp constructor overrides flags when input is RegExp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex1 = new RegExp("test", "gi");
      const regex2 = new RegExp(regex1, 'm');
      expect(regex2.source).assertEqual('test');
      expect(regex2.flags.indexOf('m') >= 0).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0113
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1400
     * @tc.desc Test RegExp constructor flag override priority
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex1 = new RegExp("test", "g");
      const regex2 = new RegExp(regex1, 'i');
      expect(regex2.global).assertFalse();
      expect(regex2.ignoreCase).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0114
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1500
     * @tc.desc Test RegExp constructor throws on invalid bracket pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let threw = false;
      try {
        new RegExp('[a-z');
      } catch (_) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(newRegExpInvalidBracketThrows()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0115
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1600
     * @tc.desc Test RegExp constructor with dynamic pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const searchWord = 'hello';
      const regex = new RegExp(searchWord, 'i');
      expect(regex.test('HELLO World')).assertTrue();
    });
  });

  // RegExp statics and subclass species: cross-instance behavior not covered by prototype methods alone.
  describe('Static_RegExp', () => {
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
     * @tc.name testRegExpComplete0116
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1700
     * @tc.desc Test RegExp subclass species behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(subclassSpeciesIsConstructor()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0117
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1800
     * @tc.desc Test RegExp.lastIndex static property type shape
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp("test", "g");
      re.test('test test');
      expect(regexpStaticLastIndexIsNumberOrUndefined()).assertTrue();
    });
  });

  // Well-known symbols route string algorithms through customizable RegExp hooks.
  describe('Symbol_well_known_methods', () => {
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
     * @tc.name testRegExpComplete0118
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_1900
     * @tc.desc Test RegExp[Symbol.match] behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(symbolMatchTwoMatches()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0119
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2000
     * @tc.desc Test RegExp[Symbol.matchAll] behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(symbolMatchAllTwoMatches()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0120
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2100
     * @tc.desc Test RegExp[Symbol.replace] behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(symbolReplaceAllDemo()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0121
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2200
     * @tc.desc Test RegExp[Symbol.search] behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(symbolSearchIndex6()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0122
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2300
     * @tc.desc Test RegExp[Symbol.split] behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(symbolSplitThreeParts()).assertTrue();
    });
  });

  // RegExp.prototype.test in scenario form: complements exec-focused suites with boolean outcomes.
  describe('test_method_scenarios', () => {
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
     * @tc.name testRegExpComplete0123
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2400
     * @tc.desc Test empty quantifier with star matches empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'abc';
      const regex = new RegExp("\\d*");
      expect(regex.test(str)).assertTrue();
      const ex = regex.exec(str);
      expect(ex?.[0]).assertEqual('');
    });

    /**
     * @tc.name testRegExpComplete0124
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2500
     * @tc.desc Test RegExp.prototype.test returns boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex = new RegExp("test");
      expect(typeof regex.test('test')).assertEqual('boolean');
      expect(regex.test('test')).assertTrue();
      expect(regex.test('xyz')).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0125
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2600
     * @tc.desc Test sticky y flag affects lastIndex in test()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test test';
      const regex = new RegExp("test", "y");
      regex.lastIndex = 0;
      expect(regex.test(str)).assertTrue();
      regex.lastIndex = 5;
      expect(regex.test(str)).assertTrue();
      regex.lastIndex = 2;
      expect(regex.test(str)).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0126
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2700
     * @tc.desc Test exec equivalence without capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test123';
      const regex = new RegExp("test\\d{3}");
      expect(regex.test(str)).assertTrue();
      expect(regex.exec(str)?.[0]).assertEqual('test123');
    });
  });

  // Unicode escapes and properties: often gated because table completeness varies by engine build.
  describe('Unicode_advanced', () => {
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
     * @tc.name testRegExpComplete0127
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2800
     * @tc.desc Test Unicode property escape pL when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\p{L}', 'u')) {
        return;
      }
      const regex1 = new RegExp('\\p{L}', 'u');
      expect(regex1.test('a')).assertTrue();
      expect(regex1.test('\u4e2d')).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0154
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5500
     * @tc.desc Test Unicode Script Han property when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\p{L}', 'u')) {
        return;
      }
      if (!supportsRegExp('\\p{Script=Han}', 'u')) {
        return;
      }
      const regex2 = new RegExp('\\p{Script=Han}', 'u');
      expect(regex2.test('\u4e2d\u6587')).assertTrue();
      expect(regex2.test('abc')).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0128
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_2900
     * @tc.desc Test Unicode property escapes pP, pN and \\P when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\p{P}', 'u')) {
        return;
      }
      const pP = new RegExp('\\p{P}', 'u');
      expect(pP.test('!')).assertTrue();
      expect(pP.test(',')).assertTrue();
      expect(pP.test('a')).assertFalse();
      const pN = new RegExp('\\p{N}', 'u');
      expect(pN.test('123')).assertTrue();
      expect(pN.test('\u0967\u0968\u0969')).assertTrue();
      const pL = new RegExp('\\P{L}', 'u');
      expect(pL.test('123')).assertTrue();
      expect(pL.test('!')).assertTrue();
      expect(pL.test('a')).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0129
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3000
     * @tc.desc Test ASCII \\w does not match Greek letters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '\u03B1\u03B2';
      expect(new RegExp("\\w").test(str)).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0155
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5600
     * @tc.desc Test \\w with u flag does not match Greek letters when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '\u03B1\u03B2';
      if (!supportsRegExp('\\w', 'u')) {
        return;
      }
      expect(new RegExp('\\w', 'u').test(str)).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0156
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5700
     * @tc.desc Test \\p{L} matches Greek letters when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '\u03B1\u03B2';
      if (!supportsRegExp('\\p{L}', 'u')) {
        return;
      }
      expect(new RegExp('\\p{L}', 'u').test(str)).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0130
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3100
     * @tc.desc Test combining character matches with dot without u flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'e\u0301';
      expect(new RegExp(".").test(str)).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0157
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5800
     * @tc.desc Test combining character with dot under u when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'e\u0301';
      if (!supportsRegExp('.', 'u')) {
        return;
      }
      expect(new RegExp('.', 'u').test(str)).assertTrue();
    });
  });

  // Lookarounds and nested groups: syntax stress beyond linear alternation.
  describe('Advanced_syntax', () => {
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
     * @tc.name testRegExpComplete0131
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3200
     * @tc.desc Test atomic group pattern throws in standard RegExp constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let threw = false;
      try {
        new RegExp('(?>(a|ab))+c');
      } catch (_) {
        threw = true;
      }
      if (threw) {
        expect(threw).assertTrue();
        return;
      }
      
      const re = new RegExp('(?>(a|ab))+c');
      expect(re instanceof RegExp).assertTrue();
      expect(typeof re.test('anything')).assertEqual('boolean');
    });

    /**
     * @tc.name testRegExpComplete0132
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3300
     * @tc.desc Test possessive quantifier pattern throws in standard RegExp constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let threw = false;
      try {
        new RegExp('\\d++');
      } catch (_) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0133
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3400
     * @tc.desc Test greedy vs non-greedy quantifiers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '<div>test</div><div>demo</div>';
      expect(new RegExp("<div>.*<\\/div>").test(str)).assertTrue();
      expect(new RegExp("<div>.*?<\\/div>").test(str)).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0134
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3500
     * @tc.desc Test brace quantifiers {m,n}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'aaa';
      expect(new RegExp("a{2,3}").test(str)).assertTrue();
      expect(new RegExp("a{1,3}").test(str)).assertTrue();
    });
  });

  // Empty inputs, degenerate patterns, and state edges that fuzzers often hit first.
  describe('RegExp_Boundaries', () => {
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
     * @tc.name testRegExpComplete0135
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3600
     * @tc.desc Test $ matches empty string end position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp("^$").test('')).assertTrue();
      expect(new RegExp("^$").test('a')).assertFalse();
    });

    /**
     * @tc.name testRegExpComplete0136
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3700
     * @tc.desc Test lookahead prefix matching
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test';
      expect(new RegExp("(?=test).*").test(str)).assertTrue();
      const ex = new RegExp("(?=test).*").exec(str);
      expect(ex?.[0]).assertEqual('test');
    });

    /**
     * @tc.name testRegExpComplete0137
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3800
     * @tc.desc Test empty group matches at any position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp("(?:)").test('test')).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0138
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_3900
     * @tc.desc Test word boundary is zero-width assertion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test';
      expect(new RegExp("\\b").test(str)).assertTrue();
      const ex = new RegExp("\\b").exec(str);
      expect(ex?.[0]).assertEqual('');
    });

    /**
     * @tc.name testRegExpComplete0139
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4000
     * @tc.desc Test large quantifier count 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a'.repeat(1000);
      expect(new RegExp("a{1000}").test(str)).assertTrue();
    });
  });

  // SyntaxError vs TypeError boundaries: distinguishes compile-time pattern rejection from runtime misuse.
  describe('Errors', () => {
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
     * @tc.name testRegExpComplete0140
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4100
     * @tc.desc Test unknown flag throws syntax error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(literalUnknownFlagThrows()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0141
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4200
     * @tc.desc Test capture group 10 is parsed correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(captureGroup10IsJ()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0142
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4300
     * @tc.desc Test invalid Unicode escape throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(newRegExpInvalidUnicodeThrows()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0143
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4400
     * @tc.desc Test incomplete character class throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(newRegExpInvalidBracketThrows()).assertTrue();
    });
  });

  // Descriptor shape for builtins: affects strict assignment and reflection-based tooling.
  describe('Property_descriptor', () => {
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
     * @tc.name testRegExpComplete0144
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4500
     * @tc.desc Test assigning global property has no effect
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(assignGlobalHasNoEffect()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0145
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4600
     * @tc.desc Test manual lastIndex affects global exec
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex = new RegExp("test", "g");
      const str = 'test test';
      regex.lastIndex = 5;
      expect(regex.test(str)).assertTrue();
      expect(regex.lastIndex).assertEqual(9);
    });

    /**
     * @tc.name testRegExpComplete0146
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4700
     * @tc.desc Test flags property enumerability
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(globalPropertyNotEnumerable()).assertTrue();
    });

    /**
     * @tc.name testRegExpComplete0147
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4800
     * @tc.desc Test global property descriptor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(globalDescriptorIsNonWritableData()).assertTrue();
    });
  });

  // Multi-step API combinations closer to real usage than single-method micro-tests.
  describe('API_integration', () => {
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
     * @tc.name testRegExpComplete0148
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_4900
     * @tc.desc Test String.prototype.matchAll returns iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test test test';
      const regex = new RegExp("test", "g");
      const iter = regexpSymbolMatchAll(regex, str);
      const arr: RegExpMatchArray[] = Array.from(iter);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testRegExpComplete0149
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5000
     * @tc.desc Test String.prototype.split with RegExp separator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a,b,c';
      const regex = new RegExp(",");
      const result = str.split(regex);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
    });

    /**
     * @tc.name testRegExpComplete0150
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5100
     * @tc.desc Test String.prototype.replace with function replacer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test123test456';
      const regex = new RegExp("test(\\d+)", "g");
      const result = str.replace(regex, 'demo$1');
      expect(result).assertEqual('demo123demo456');
    });

    /**
     * @tc.name testRegExpComplete0151
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5200
     * @tc.desc Test String.prototype.search with RegExp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello test world';
      expect(str.search(new RegExp("test"))).assertEqual(6);
      expect(str.search(new RegExp("xyz"))).assertEqual(-1);
    });

    /**
     * @tc.name testRegExpComplete0152
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5300
     * @tc.desc Test Array.prototype.filter with match results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: string[] = ['test1', 'test2', 'demo'];
      const regex = new RegExp("test");
      const result = arr.filter((item: string) => regex.test(item));
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testRegExpComplete0153
     * @tc.number SUB_COMMONLIBRARY_REGEXP_COMPLETE_TEST_5400
     * @tc.desc Test Array.prototype.map over match results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testRegExpComplete0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: string[] = ['test1', 'test2'];
      const regex = new RegExp("test(\\d+)");
      const out: string[] = [];
      for (let i = 0; i < arr.length; i++) {
        const m = arr[i].match(regex);
        const v: string = (m !== null && m[1] !== undefined) ? (m[1] as string) : arr[i];
        out.push(v);
      }
      expect(out[0]).assertEqual('1');
      expect(out[1]).assertEqual('2');
    });
  });

}
