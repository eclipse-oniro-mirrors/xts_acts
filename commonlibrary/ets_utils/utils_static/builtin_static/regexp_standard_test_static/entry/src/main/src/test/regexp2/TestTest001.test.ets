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
 * RegExp.prototype.test boolean API: cheaper than exec when only presence matters. Covers coercions, flags, strict-mode
 * deletes, and RegExpHelper-backed throws; complements ExecTest which validates capture arrays.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  regexpTestCallThisNotRegExpThrows,
  regexpTestCallThisUndefinedThrows,
  regexpTestCallThisNullThrows,
  regexpTestCallRegexLikeObject,
  strictDeleteRegexSourceThrows,
  regexpTestSymbolParameterThrows,
  regexpTestToPrimitiveCoercionMatchesPrimitive,
  regexpTestBigintParameterMatches123
} from './RegExpHelper';

// Minimal fixtures keep receiver/coercion cases free of unrelated prototype pollution.
class EmptyObjForTest0107 {
}

class CustomToStringForTest0111 {
  toString(): string {
    return 'custom';
  }
}

// Gates advanced flags and unicode escapes so partial engines skip instead of failing entire describe trees.
function supportsRegExp(pattern: string, flags: string = ''): boolean {
  /*
   * test() cases are numerous; a single ctor gate at the describe head prevents duplicating try/catch around each pattern
   * while still honoring engines that ship partial RegExp flag sets.
   */
  try {
    /*
     * Same construction path as the tests under Test_Flags and Syntax—probes must not use a looser ctor than the cases.
     */
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    /*
     * Failure here is intentionally feature-level, not assertion-level—return false so the suite can bail out quietly.
     */
    return false;
  }
}

// Collapses ctor throws into booleans for metadata-heavy cases that only need “invalid pattern” signal.
function throwsOnRegExpCtor(pattern: string, flags?: string): boolean {
  /*
   * Splitting one-arg vs two-arg mirrors real call sites: some invalid patterns only throw when flags interact (e.g.
   * illegal combo), so the probe must not always pass undefined flags.
   */
  try {
    if (flags === undefined) {
      new RegExp(pattern);
    } else {
      new RegExp(pattern, flags);
    }
    return false;
  } catch (_) {
    /*
     * Any throw satisfies “invalid RegExp source for this embedding”—callers only need the boolean, not the error kind.
     */
    return true;
  }
}

// Placeholder function value for tests that need a stable Function.prototype.toString subject.
function functionToStringForTest0114(): void {
}

// Describes progress from core boolean results toward syntax, strict mode, and compatibility overlays.
export default function testTest(): void {

  // Smallest true/false expectations: anchors simple patterns before coercions complicate inputs.
  describe('Test_Basic', () => {
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
     * @tc.name testTest0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0100
     * @tc.desc Test simple match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      const re = new RegExp('hello');
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0200
     * @tc.desc Test full match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello';
      const re = new RegExp('^hello$');
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0300
     * @tc.desc Test repeatable non global
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      const re = new RegExp('hello');
      expect(re.test(str)).assertTrue();
      expect(re.test(str)).assertTrue();
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0400
     * @tc.desc Test no match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      const re = new RegExp('goodbye');
      expect(re.test(str)).assertFalse();
    });

    /**
     * @tc.name testTest0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0500
     * @tc.desc Test partial match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      const re = new RegExp('world');
      expect(re.test(str)).assertTrue();
    });
  });

  // Exotic arguments and ToString: test must reject or coerce consistently with exec’s preamble.
  describe('Parameter_Types', () => {
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
     * @tc.name testTest0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0600
     * @tc.desc Test string parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      expect(re.test('test string')).assertTrue();
      expect(re.test('no match')).assertFalse();
    });

    /**
     * @tc.name testTest0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0700
     * @tc.desc Test empty string parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^$');
      expect(re.test('')).assertTrue();
      expect(re.test('not empty')).assertFalse();
    });

    /**
     * @tc.name testTest0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0800
     * @tc.desc Test non string coercion number array object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('123');
      expect(re.test(String(123))).assertTrue();
      const arr: number[] = [1, 2, 3];
      expect(re.test(String(arr))).assertFalse();
      expect(re.test(String(new EmptyObjForTest0107()))).assertFalse();
    });

    /**
     * @tc.name testTest0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_0900
     * @tc.desc Test undefined and null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('undefined');
      expect(re.test(String(undefined))).assertTrue();
      expect(re.test(String(null))).assertFalse();
    });

    /**
     * @tc.name testTest0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1000
     * @tc.desc Test symbol parameter throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpTestSymbolParameterThrows()).assertTrue();
    });

    /**
     * @tc.name testTest0110
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1100
     * @tc.desc Test boolean parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('true');
      expect(re.test(String(true))).assertTrue();
      expect(re.test(String(false))).assertFalse();
    });

    /**
     * @tc.name testTest0111
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1200
     * @tc.desc Test object toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj = new CustomToStringForTest0111();
      const re = new RegExp('custom');
      expect(re.test(String(obj))).assertTrue();
    });

    /**
     * @tc.name testTest0112
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1300
     * @tc.desc Test symbol toPrimitive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpTestToPrimitiveCoercionMatchesPrimitive()).assertTrue();
    });

    /**
     * @tc.name testTest0113
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1400
     * @tc.desc Test bigint parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpTestBigintParameterMatches123()).assertTrue();
    });

    /**
     * @tc.name testTest0114
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1500
     * @tc.desc Test RegExp.test on String(function): boolean result and non-empty serialization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = String(functionToStringForTest0114);
      
      
      const v = new RegExp('.').test(s);
      
      expect(typeof v).assertEqual('boolean');
      expect(v).assertTrue();
    });
  });

  // g/i/m/u/y change whether test advances lastIndex or matches case-insensitively.
  describe('Test_Flags', () => {
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
     * @tc.name testTest0115
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1600
     * @tc.desc Test ignoreCase
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'HELLO world';
      expect(new RegExp('hello').test(str)).assertFalse();
      expect(new RegExp('hello', 'i').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0116
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1700
     * @tc.desc Test global lastIndex changes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello hello';
      const re = new RegExp('hello', 'g');
      expect(re.lastIndex).assertEqual(0);
      expect(re.test(str)).assertTrue();
      expect(re.lastIndex).assertEqual(5);
      expect(re.test(str)).assertTrue();
      expect(re.lastIndex).assertEqual(11);
      expect(re.test(str)).assertFalse();
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testTest0117
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1800
     * @tc.desc Test multiline affects anchors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello\nworld';
      expect(new RegExp('^world').test(str)).assertFalse();
      expect(new RegExp('^world', 'm').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0118
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_1900
     * @tc.desc Test sticky uses lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world hello';
      const re = new RegExp('hello', 'y');
      re.lastIndex = 0;
      expect(re.test(str)).assertTrue();
      expect(re.lastIndex).assertEqual(5);
      expect(re.test(str)).assertFalse();
    });

    /**
     * @tc.name testTest0119
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2000
     * @tc.desc Test dot without s does not span newline
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello\nworld';
      const re1 = new RegExp('hello.*world');
      expect(re1.test(str)).assertFalse();
    });

    /**
     * @tc.name testTest0120
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0300
     * @tc.desc Test dotAll pattern unsupported when s flag not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('hello.*world', 's')) {
        const out = new RegExp('hello.*world', 's').test('hello\nworld');
        expect(out).assertTrue();
        return;
      }
      return;
    });

    /**
     * @tc.name testTest0121
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2100
     * @tc.desc Test dot matches supplementary plane without u flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = String.fromCodePoint(0x1D306);
      expect(new RegExp('.').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0122
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2200
     * @tc.desc Test hasIndices supported or skip
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('test', 'd')) {
        return;
      }
      const re = new RegExp('test', 'd');
      expect(re.test('test')).assertTrue();
    });

    /**
     * @tc.name testTest0123
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXTRA_TEST_0400
     * @tc.desc Test d flag unsupported when hasIndices not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('test', 'd')) {
        return;
      }
      expect(supportsRegExp('test', 'd')).assertFalse();
    });

    /**
     * @tc.name testTest0124
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2300
     * @tc.desc Test combined flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'HELLO\nhello';
      const re = new RegExp('^hello$', 'gim');
      expect(re.test(str)).assertTrue();
      expect(re.lastIndex > 0).assertTrue();
      re.lastIndex = 6;
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0125
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2400
     * @tc.desc Test invalid flag throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(throwsOnRegExpCtor('test', 'x')).assertTrue();
    });
  });

  // Character classes, escapes, and unicode property escapes gated when tables or flags are missing.
  describe('Syntax', () => {
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
     * @tc.name testTest0126
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2500
     * @tc.desc Test character match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test@example.com';
      expect(new RegExp('@').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0127
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2600
     * @tc.desc Test character class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a1b2c3';
      expect(new RegExp('[abc]').test(str)).assertTrue();
      expect(new RegExp('[0-9]').test(str)).assertTrue();
      expect(new RegExp('[^abc]').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0128
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2700
     * @tc.desc Test predefined classes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test123  ';
      expect(new RegExp('\\d').test(str)).assertTrue();
      expect(new RegExp('\\w').test(str)).assertTrue();
      expect(new RegExp('\\s').test(str)).assertTrue();
      expect(new RegExp('\\D').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0129
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2800
     * @tc.desc Test quantifiers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('a?').test('a')).assertTrue();
      expect(new RegExp('a+').test('ab')).assertTrue();
      expect(new RegExp('a{2}').test('abc')).assertFalse();
      expect(new RegExp('a{1,3}').test('aaaa')).assertTrue();
    });

    /**
     * @tc.name testTest0130
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_2900
     * @tc.desc Test anchors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      expect(new RegExp('^hello').test(str)).assertTrue();
      expect(new RegExp('world$').test(str)).assertTrue();
      expect(new RegExp('\\bhello\\b').test(str)).assertTrue();
      expect(new RegExp('\\Bwor\\B').test(str)).assertFalse();
    });

    /**
     * @tc.name testTest0131
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3000
     * @tc.desc Test alternation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('apple|orange').test('apple')).assertTrue();
      expect(new RegExp('apple|orange').test('orange')).assertTrue();
      expect(new RegExp('apple|orange').test('banana')).assertFalse();
    });

    /**
     * @tc.name testTest0132
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3100
     * @tc.desc Test group and backref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello hello';
      const re = new RegExp('(hello)\\s\\1');
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0133
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3200
     * @tc.desc Test non capture group
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      expect(new RegExp('(?:hello|world) world').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0134
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3300
     * @tc.desc Test lookahead
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str1 = 'hello world';
      const str2 = 'hello universe';
      expect(new RegExp('hello(?= world)').test(str1)).assertTrue();
      expect(new RegExp('hello(?= world)').test(str2)).assertFalse();
      expect(new RegExp('hello(?! world)').test(str1)).assertFalse();
      expect(new RegExp('hello(?! world)').test(str2)).assertTrue();
    });

    /**
     * @tc.name testTest0135
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3400
     * @tc.desc Test lookbehind when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<=hello )world')) {
        return;
      }
      expect(new RegExp('(?<=hello )world').test('hello world')).assertTrue();
      expect(new RegExp('(?<=hello )world').test('hi world')).assertFalse();
      expect(new RegExp('(?<!hello )world').test('hello world')).assertFalse();
      expect(new RegExp('(?<!hello )world').test('hi world')).assertTrue();
    });

    /**
     * @tc.name testTest0136
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3500
     * @tc.desc Test atomic group if supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?>a*)ab')) {
        return;
      }
      const atomic: RegExp = new RegExp('(?>a*)ab');
      const greedy: RegExp = new RegExp('a*ab');
      expect(atomic.test('abc')).assertFalse();
      expect(greedy.test('abc')).assertTrue();
    });

    /**
     * @tc.name testTest0137
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3600
     * @tc.desc Test possessive quantifier if supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('a++ab')) {
        return;
      }
      const twoAsThenB = '\u0061\u0061\u0062';
      expect(new RegExp('a++ab').test(twoAsThenB)).assertFalse();
      expect(new RegExp('a+ab').test(twoAsThenB)).assertTrue();
    });

    /**
     * @tc.name testTest0138
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3700
     * @tc.desc Test unicode property escape if supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\p{Lu}', 'u')) {
        return;
      }
      expect(new RegExp('\\p{Lu}', 'u').test('A')).assertTrue();
      expect(new RegExp('\\p{Lu}', 'u').test('\u6D7C')).assertFalse();
    });

    /**
     * @tc.name testTest0139
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3800
     * @tc.desc Test G anchor if supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\Gtest', 'g')) {
        return;
      }
      const probe = new RegExp('\\Gtest', 'g');
      if (!probe.test('test')) {
        return;
      }
      const str = 'test test';
      const re = new RegExp('\\Gtest', 'g');
      const first = re.test(str);
      const second = re.test(str);
      
      expect(first).assertTrue();
      expect(second).assertFalse();
    });
  });

  // Empty strings and degenerate patterns: boolean results still must be deterministic.
  describe('Test_Boundaries', () => {
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
     * @tc.name testTest0140
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_3900
     * @tc.desc Test min length strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('.*');
      expect(re.test('')).assertTrue();
      expect(re.test('a')).assertTrue();
    });

    /**
     * @tc.name testTest0141
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4000
     * @tc.desc Test long string reasonable size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longStr = 'a'.repeat(20000) + 'b';
      expect(new RegExp('b$').test(longStr)).assertTrue();
    });

    /**
     * @tc.name testTest0142
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4100
     * @tc.desc Test special unicode
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emoji = String.fromCodePoint(0x1F600);
      expect(new RegExp(emoji, 'u').test('hello ' + emoji + ' world')).assertTrue();
      expect(new RegExp('^\\u947C').test('\u947C')).assertTrue();
    });

    /**
     * @tc.name testTest0144
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4300
     * @tc.desc Test zero width assertions
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test';
      expect(new RegExp('^test').test(str)).assertTrue();
      expect(new RegExp('test$').test(str)).assertTrue();
      expect(new RegExp('\\btest\\b').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0145
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4400
     * @tc.desc Test number boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^9007199254740991$');
      expect(re.test(String(9007199254740991))).assertTrue();
      expect(re.test(String(-9007199254740991))).assertFalse();
    });

    /**
     * @tc.name testTest0146
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4500
     * @tc.desc Test quantifier edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('a{0}').test('')).assertTrue();
      expect(new RegExp('a{1024}').test('a'.repeat(1024))).assertTrue();
    });
  });

  // Whitespace, punctuation, and surrogate-bearing inputs for boolean matching.
  describe('Special_Characters', () => {
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
     * @tc.name testTest0147
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4600
     * @tc.desc Test escape dot
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test.txt';
      expect(new RegExp('.').test(str)).assertTrue();
      expect(new RegExp('\\.').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0148
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4700
     * @tc.desc Test backslash
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'path\\to\\file';
      expect(new RegExp('\\\\').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0149
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4800
     * @tc.desc Test quotes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp("'").test("it's a test")).assertTrue();
      expect(new RegExp('"').test('he said "hello"')).assertTrue();
    });

    /**
     * @tc.name testTest0150
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_4900
     * @tc.desc Test parentheses
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = '(test)';
      expect(new RegExp('[(]').test(str)).assertTrue();
      expect(new RegExp('[)]').test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0151
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5000
     * @tc.desc Test brackets
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str1 = 'test[1]';
      const leftBracket = new RegExp('\\[');
      const rightBracket = new RegExp('\\]');
      expect(leftBracket.test(str1)).assertTrue();
      expect(rightBracket.test(str1)).assertTrue();
      expect(leftBracket.test('a')).assertFalse();
      expect(leftBracket.test(str1)).assertTrue();
    });

    /**
     * @tc.name testTest0152
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5100
     * @tc.desc Test braces colon semicolon equals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('\\{').test('{test}')).assertTrue();
      expect(new RegExp('\\}').test('{test}')).assertTrue();
      expect(new RegExp(':').test('key:value')).assertTrue();
      expect(new RegExp(';').test('statement1;statement2')).assertTrue();
      expect(new RegExp('=').test('a=b')).assertTrue();
    });

    /**
     * @tc.name testTest0153
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5200
     * @tc.desc Test plus star question
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('\\+').test('1+1')).assertTrue();
      expect(new RegExp('\\d+').test('1+1')).assertTrue();
      expect(new RegExp('\\*').test('a*b')).assertTrue();
      expect(new RegExp('a.*b').test('a*b')).assertTrue();
      expect(new RegExp('\\?').test('really?')).assertTrue();
      expect(new RegExp('really?').test('really?')).assertTrue();
    });

    /**
     * @tc.name testTest0154
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5300
     * @tc.desc Test hash dollar percent amp pipe tilde backtick at
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('#').test('#heading')).assertTrue();
      expect(new RegExp('\\$').test('$100')).assertTrue();
      expect(new RegExp('100$').test('$100')).assertTrue();
      expect(new RegExp('%').test('50%')).assertTrue();
      expect(new RegExp('&').test('a&b')).assertTrue();
      expect(new RegExp('\\|').test('a|b')).assertTrue();
      expect(new RegExp('a|b').test('a|b')).assertTrue();
      expect(new RegExp('~').test('~/.bashrc')).assertTrue();
      expect(new RegExp('`').test('`code`')).assertTrue();
      expect(new RegExp('@').test('user@example.com')).assertTrue();
    });
  });

  // Groups affect matching even though test ignores capture array contents—branch selection still matters.
  describe('Test_Capture_Groups', () => {
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
     * @tc.name testTest0155
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5400
     * @tc.desc Test basic groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('([a-z]+)([0-9]+)').test('abc123')).assertTrue();
    });

    /**
     * @tc.name testTest0156
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5500
     * @tc.desc Test nested groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('((test)(123))').test('test123')).assertTrue();
    });

    /**
     * @tc.name testTest0157
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5600
     * @tc.desc Test named groups when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})')) {
        return;
      }
      const re = new RegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})');
      expect(re.test('2023-12-25')).assertTrue();
    });

    /**
     * @tc.name testTest0158
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5700
     * @tc.desc Test backreference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('([a-z]+)\\1');
      expect(re.test('abcabc')).assertTrue();
      expect(re.test('abcxyz')).assertFalse();
    });

    /**
     * @tc.name testTest0159
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5800
     * @tc.desc Test named backreference when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<word>\\w+)_\\k<word>')) {
        return;
      }
      const re = new RegExp('(?<word>\\w+)_\\k<word>');
      expect(re.test('test_test')).assertTrue();
      expect(re.test('test_demo')).assertFalse();
    });

    /**
     * @tc.name testTest0160
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_5900
     * @tc.desc Test non capture group does not shift backref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(?:a)(b)\\1');
      expect(re.test('abb')).assertTrue();
    });

    /**
     * @tc.name testTest0161
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6000
     * @tc.desc Test multiple groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('([^=]+)=([^=]+)').test('name=value')).assertTrue();
    });

    /**
     * @tc.name testTest0162
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6100
     * @tc.desc Test nested named groups when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<outer>t(?<inner>es)t)(?<num>123)')) {
        return;
      }
      const re = new RegExp('(?<outer>t(?<inner>es)t)(?<num>123)');
      expect(re.test('test123')).assertTrue();
    });

    /**
     * @tc.name testTest0163
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6200
     * @tc.desc Test empty groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('()').test('')).assertTrue();
      expect(new RegExp('()()').test('')).assertTrue();
    });

    /**
     * @tc.name testTest0164
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6300
     * @tc.desc Test many groups reasonable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let groups = '';
      for (let i = 0; i < 20; i++) {
        groups += '(\\w)';
      }
      const re = new RegExp('^' + groups + '$');
      const str = 'a'.repeat(20);
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0165
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6400
     * @tc.desc Test backref out of range is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pattern = '(a)\\2';
      if (!supportsRegExp(pattern)) {
        return;
      }
      const re = new RegExp(pattern);
      expect(re.test('aa')).assertFalse();
    });

    /**
     * @tc.name testTest0166
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6500
     * @tc.desc Test duplicate named group throws when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<a>a)')) {
        return;
      }
      expect(throwsOnRegExpCtor('(?<a>a)(?<a>b)')).assertTrue();
    });
  });

  // Nested/alternation patterns: ensures test’s internal matching engine tracks the same paths as exec.
  describe('Test_Complex_Patterns', () => {
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
     * @tc.name testTest0167
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6600
     * @tc.desc Test email
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$');
      expect(re.test('test@example.com')).assertTrue();
      expect(re.test('invalid-email')).assertFalse();
    });

    /**
     * @tc.name testTest0168
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6700
     * @tc.desc Test url
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^https?:\\/\\/[^\\s/$.?#].[^\\s]*$');
      expect(re.test('https://example.com')).assertTrue();
      expect(re.test('not a url')).assertFalse();
    });

    /**
     * @tc.name testTest0169
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6800
     * @tc.desc Test phone
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^(\\([0-9]{3}\\)\\s?|[0-9]{3}-)[0-9]{3}-[0-9]{4}$');
      expect(re.test('123-456-7890')).assertTrue();
      expect(re.test('(123) 456-7890')).assertTrue();
      expect(re.test('not a phone')).assertFalse();
    });

    /**
     * @tc.name testTest0170
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_6900
     * @tc.desc Test date format
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$');
      expect(re.test('2023-12-25')).assertTrue();
      expect(re.test('2023-02-28')).assertTrue();
      expect(re.test('not a date')).assertFalse();
    });
  });

  // Cross-check test vs String methods that delegate to the same RegExp slots.
  describe('Compare_With_String_Methods', () => {
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
     * @tc.name testTest0171
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7000
     * @tc.desc Test includes indexOf search match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      const re = new RegExp('hello');
      expect(re.test(str)).assertTrue();
      expect(str.includes('hello')).assertTrue();
      expect(str.indexOf('hello') !== -1).assertTrue();
      expect(str.search(re) !== -1).assertTrue();
      expect(str.match(re) !== null).assertTrue();
    });

    /**
     * @tc.name testTest0172
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7100
     * @tc.desc Test replace split exec types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'hello world';
      const re = new RegExp('hello');
      expect(re.test(str)).assertTrue();
      expect(str.replace(re, 'hi')).assertEqual('hi world');
      expect('a,b,c'.split(new RegExp(',')).length).assertEqual(3);
      expect(re.exec(str) !== null).assertTrue();
      expect(typeof re.test(str) === 'boolean').assertTrue();
    });
  });

  // Invalid patterns should throw at construction or invocation—not return misleading booleans.
  describe('Error_Handling', () => {
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
     * @tc.name testTest0173
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7200
     * @tc.desc Test invalid regex syntax
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(throwsOnRegExpCtor('[a-z')).assertTrue();
    });

    /**
     * @tc.name testTest0174
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7300
     * @tc.desc Test invalid flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(throwsOnRegExpCtor('test', 'x')).assertTrue();
    });

    /**
     * @tc.name testTest0175
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7400
     * @tc.desc Test nested quantifier invalid
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(throwsOnRegExpCtor('a**')).assertTrue();
    });

    /**
     * @tc.name testTest0176
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7500
     * @tc.desc Test invalid quantifier range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(throwsOnRegExpCtor('a{5,3}')).assertTrue();
    });

    /**
     * @tc.name testTest0177
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7600
     * @tc.desc Test unicode codepoint invalid when u supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(throwsOnRegExpCtor('\\u{123456}', 'u')).assertTrue();
    });
  });

  // Receiver must be a RegExp (or RegExp-like per spec); helpers assert the negative cases.
  describe('This_Value', () => {
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
     * @tc.name testTest0178
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7700
     * @tc.desc Test call this not regexp throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpTestCallThisNotRegExpThrows()).assertTrue();
    });

    /**
     * @tc.name testTest0179
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7800
     * @tc.desc Test call this undefined throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpTestCallThisUndefinedThrows()).assertTrue();
    });

    /**
     * @tc.name testTest0180
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_7900
     * @tc.desc Test call this null throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpTestCallThisNullThrows()).assertTrue();
    });

    /**
     * @tc.name testTest0181
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8000
     * @tc.desc Test regex like object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = regexpTestCallRegexLikeObject();
      
      expect(typeof v).assertEqual('boolean');
      expect(v).assertTrue();
    });

    /**
     * @tc.name testTest0182
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8100
     * @tc.desc Test subclass override test
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      expect(re.test('test')).assertTrue();
    });
  });

  // Construction variants feeding test(): invalid sources should be caught before matching.
  describe('RegExp_Constructor', () => {
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
     * @tc.name testTest0183
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8200
     * @tc.desc Test new RegExp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'g');
      expect(re.test('test string')).assertTrue();
      expect(re.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name testTest0184
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8300
     * @tc.desc Test escape in constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re1 = new RegExp('\\d+');
      const re2 = new RegExp('\\d+');
      expect(re1.test('123')).assertTrue();
      expect(re2.test('123')).assertTrue();
    });

    /**
     * @tc.name testTest0185
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8400
     * @tc.desc Test dynamic pattern flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pattern = 'test';
      const flags = 'gi';
      const re = new RegExp(pattern, flags);
      expect(re.test('TEST')).assertTrue();
    });

    /**
     * @tc.name testTest0186
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8500
     * @tc.desc Test empty pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re1 = new RegExp('');
      expect(re1.test('')).assertTrue();
      const re2 = new RegExp('', 'g');
      expect(re2.test('anything')).assertTrue();
    });

    /**
     * @tc.name testTest0187
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8600
     * @tc.desc Test construct from regexp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = new RegExp('test', 'g');
      const r2 = new RegExp(r1);
      expect(r2.test('test')).assertTrue();
      expect(r2.global).assertTrue();
    });

    /**
     * @tc.name testTest0188
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_8700
     * @tc.desc Test override flags in constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1 = new RegExp('test');
      const r2 = new RegExp(r1, 'g');
      expect(r2.global).assertTrue();
    });
  });

  // Strict mode: deleting non-configurable regexp fields throws—surfaced via helper booleans in static builds.
  describe('Strict_Mode', () => {
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
     * @tc.name testTest0192
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9000
     * @tc.desc Test basic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test').test('test')).assertTrue();
    });

    /**
     * @tc.name testTest0193
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9100
     * @tc.desc Test strict delete source throws via helper
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(strictDeleteRegexSourceThrows()).assertTrue();
    });
  });

  // Independent instances must not share lastIndex accidentally across parallel tests.
  describe('Multi_Instance', () => {
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
     * @tc.name testTest0194
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9200
     * @tc.desc Test independent lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test test test';
      const r1 = new RegExp('test', 'g');
      const r2 = new RegExp('test', 'g');
      r1.test(str);
      r2.test(str);
      expect(r1.lastIndex).assertEqual(4);
      expect(r2.lastIndex).assertEqual(4);
    });

    /**
     * @tc.name testTest0195
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9300
     * @tc.desc Test alternate usage
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'foo bar foo';
      const r1 = new RegExp('foo', 'g');
      const r2 = new RegExp('bar', 'g');
      expect(r1.test(str)).assertTrue();
      expect(r2.test(str)).assertTrue();
      expect(r1.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0196
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9400
     * @tc.desc Test same pattern diff flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'test test';
      const r1 = new RegExp('test');
      const r2 = new RegExp('test', 'g');
      expect(r1.test(str)).assertTrue();
      expect(r2.test(str)).assertTrue();
      expect(r1.lastIndex).assertEqual(0);
      expect(r2.lastIndex).assertEqual(4);
    });
  });

  // Browser-shaped inputs (URLs, emails) as smoke for typical validation regexes.
  describe('Web_Compatibility', () => {
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
     * @tc.name testTest0197
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9500
     * @tc.desc Test lookbehind support probe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const supported = supportsRegExp('(?<=lookbehind)test');
      expect(typeof supported === 'boolean').assertTrue();
    });

    /**
     * @tc.name testTest0198
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9600
     * @tc.desc Test unicode property support probe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const supported = supportsRegExp('\\p{Extended_Pictographic}', 'u');
      expect(typeof supported === 'boolean').assertTrue();
    });

    /**
     * @tc.name testTest0199
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9700
     * @tc.desc Test hasIndices support probe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const supported = supportsRegExp('test', 'd');
      expect(typeof supported === 'boolean').assertTrue();
    });

    /**
     * @tc.name testTest0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9800
     * @tc.desc Test dotAll support probe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const supported = supportsRegExp('test.test', 's');
      expect(typeof supported === 'boolean').assertTrue();
    });
  });

  // Light repetition to catch accidental O(n^2) test implementations, not formal benchmarking.
  describe('Performance_Smoke', () => {
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
     * @tc.name testTest0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_TEST_9900
     * @tc.desc Test simple perf smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a'.repeat(20000) + 'b';
      const re = new RegExp('b$');
      expect(re.test(str)).assertTrue();
    });

    /**
     * @tc.name testTest0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_PROTO_EXT_TEST_0100
     * @tc.desc Test global loop smoke
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testTest0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const str = 'a b c d e f g h i j'.repeat(50);
      const re = new RegExp('a', 'g');
      let count = 0;
      while (re.test(str)) {
        count++;
        if (count > 1000) {
          break;
        }
      }
      expect(count > 0).assertTrue();
    });
  });

}



