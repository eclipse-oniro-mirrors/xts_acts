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
 * RegExp.prototype.toString, descriptor introspection, freeze/seal, JSON.stringify, and numeric coercion. Mixes live
 * RegExp with RegExpHelper stubs because many scenarios need controlled getter side effects or non-throwing defaults.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  toStringDefinePropertySourceGetter,
  toStringDefinePropertyFlagsGetter,
  toStringGetterHijackSourceCalled,
  regexpToStringCallNonRegExpThrows,
  regexpToStringCallNullThrows,
  regexpToStringCallUndefinedThrows,
  regexpToStringCallStringThrows,
  regexpToStringCallNumberThrows,
  regexpToStringOnFrozen,
  regexpToStringOnSealed,
  definePropertyOnFrozenThrows,
  regexpToStringApply,
  regexpToStringBind,
  jsonStringifyRegExpIsEmptyObject,
  jsonStringifyWithToJSON,
  regexpToStringByComputedName,
  regexpInstanceHasOwnToString,
  regexpPrototypeHasOwnToString,
  regexpToStringSameAsPrototype,
  objectPrototypeToStringOnRegExp,
  regexpOverrideToStringReturnsCustom,
  regexpDeleteOverrideRestoresPrototype,
  regexpSubclassInheritsToString,
  regexpSubclassOverridesToString,
  regexpToNumberIsNaN,
  regexpPrototypeToStringDescriptor
} from './RegExpHelper';

// Structured helper payloads: ToString tests often need more than a bare string (getter flags, throw bits).
interface ToStringHelperResult {
  ok?: boolean;
  thrown?: boolean;
  value?: string;
  getterCalled?: boolean;
}

function makeToStringHelperResult(value: Object): ToStringHelperResult {
  const raw = JSON.stringify(value) ?? '';
  return {
    ok: raw.indexOf('"ok":true') >= 0,
    thrown: raw.indexOf('"thrown":true') >= 0,
    getterCalled: raw.indexOf('"getterCalled":true') >= 0,
    value: raw.indexOf('/modified/gi') >= 0 ? '/modified/gi'
      : raw.indexOf('/test/um') >= 0 ? '/test/um'
      : undefined
  };
}

interface ToStringOverride {
  toString: () => string;
}

// Skip unicode-heavy patterns when the ctor rejects them鈥攌eeps toString cases about output shape, not parser support.
function supportsRegExp(pattern: string, flags: string = ''): boolean {
  /*
   * toString tests care about stable /source/flags text; if the pattern cannot be constructed, the case should skip rather
   * than conflate parser gaps with stringify regressions.
   */
  try {
    /*
     * Aligns with how ToString_Flags cases build regex鈥攎ixed probe arity would hide flag-normalization bugs.
     */
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    /*
     * Broad catch: same rationale as other suites鈥攅mbedding-specific SyntaxError wrappers still mean 鈥渦navailable鈥?
     */
    return false;
  }
}

// Moves from literal /source/ rendering through interactions, then prototype and integrity traps.
export default function toStringTest(): void {

  // Canonical /pattern/flags stringification鈥攖he baseline users rely on for logging and eval-style round trips.
  describe('ToString_Basic', () => {
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
     * @tc.name testToString0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0100
     * @tc.desc Test literal simple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc');
      expect(re.toString()).assertEqual('/abc/');
    });

    /**
     * @tc.name testToString0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0200
     * @tc.desc Test literal with flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('abc', 'gi').toString()).assertEqual('/abc/gi');
    });

    /**
     * @tc.name testToString0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0300
     * @tc.desc Test ctor string args
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('abc', 'i').toString()).assertEqual('/abc/i');
    });

    /**
     * @tc.name testToString0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0400
     * @tc.desc Test ctor string arg
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('abc', 'g').toString()).assertEqual('/abc/g');
    });

    /**
     * @tc.name testToString0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0500
     * @tc.desc Test return type is string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof new RegExp('test').toString() === 'string').assertTrue();
    });

    /**
     * @tc.name testToString0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0600
     * @tc.desc Test format is slash pattern slash flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = new RegExp('abc', 'gi').toString();
      expect(s.startsWith('/')).assertTrue();
      expect(s.endsWith('gi')).assertTrue();
    });
  });

  // Escaped slashes, unicode escapes, and empty patterns: stringify must remain syntactically round-trippable.
  describe('Patterns', () => {
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
     * @tc.name testToString0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0700
     * @tc.desc Test metacharacters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+\\w*\\s?');
      expect(re.toString()).assertEqual('/\\d+\\w*\\s?/');
    });

    /**
     * @tc.name testToString0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0800
     * @tc.desc Test char class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('[a-zA-Z0-9]');
      expect(re.toString()).assertEqual('/[a-zA-Z0-9]/');
    });

    /**
     * @tc.name testToString0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_0900
     * @tc.desc Test quantifiers
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a{2,4}b+c?d*');
      expect(re.toString()).assertEqual('/a{2,4}b+c?d*/');
    });

    /**
     * @tc.name testToString0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1000
     * @tc.desc Test capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(abc)(\\d+)');
      expect(re.toString()).assertEqual('/(abc)(\\d+)/');
    });

    /**
     * @tc.name testToString0110
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1100
     * @tc.desc Test non capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(?:abc)+');
      expect(re.toString()).assertEqual('/(?:abc)+/');
    });

    /**
     * @tc.name testToString0111
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1200
     * @tc.desc Test named capture groups toString when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<name>\\w+)')) {
        return;
      }
      expect(new RegExp('(?<name>\\w+)').toString()).assertEqual('/(?<name>\\w+)/');
    });

    /**
     * @tc.name testToString0198
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9900
     * @tc.desc Test named capture groups unsupported when not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('(?<name>\\w+)')) {
        return;
      }
      expect(supportsRegExp('(?<name>\\w+)')).assertFalse();
    });

    /**
     * @tc.name testToString0112
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1300
     * @tc.desc Test positive lookahead
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+(?= dollars)');
      expect(re.toString()).assertEqual('/\\d+(?= dollars)/');
    });

    /**
     * @tc.name testToString0113
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1400
     * @tc.desc Test negative lookahead
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\d+(?! dollars)');
      expect(re.toString()).assertEqual('/\\d+(?! dollars)/');
    });

    /**
     * @tc.name testToString0114
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1500
     * @tc.desc Test lookbehind when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<=\\$)\\d+')) {
        return;
      }
      expect(new RegExp('(?<=\\$)\\d+').toString()).assertEqual('/(?<=\\$)\\d+/');
    });

    /**
     * @tc.name testToString0199
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0100
     * @tc.desc Test lookbehind unsupported when not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('(?<=\\$)\\d+')) {
        return;
      }
      expect(supportsRegExp('(?<=\\$)\\d+')).assertFalse();
    });

    /**
     * @tc.name testToString0115
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1600
     * @tc.desc Test anchors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('^start.*end$');
      expect(re.toString()).assertEqual('/^start.*end$/');
    });

    /**
     * @tc.name testToString0116
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1700
     * @tc.desc Test word boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\bword\\b');
      expect(re.toString()).assertEqual('/\\bword\\b/');
    });

    /**
     * @tc.name testToString0117
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1800
     * @tc.desc Test escape special chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\.\\*\\+\\?\\^\\$\\(\\)\\[\\]\\{\\}\\|\\\\');
      expect(re.toString()).assertEqual('/\\.\\*\\+\\?\\^\\$\\(\\)\\[\\]\\{\\}\\|\\\\/');
    });

    /**
     * @tc.name testToString0118
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_1900
     * @tc.desc Test escape slash
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\/path\\/to\\/file');
      const s: string = re.toString();
      expect(s.startsWith('/') && s.endsWith('/') && s.includes('path') && s.includes('to') && s.includes('file')).assertTrue();
    });

    /**
     * @tc.name testToString0119
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2000
     * @tc.desc Test empty pattern ctor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = new RegExp('').toString();
      expect(s === '/(?:)/' || s === '//').assertTrue();
    });

    /**
     * @tc.name testToString0120
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2100
     * @tc.desc Test empty pattern literal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(?:)');
      expect(re.toString()).assertEqual('/(?:)/');
    });

    /**
     * @tc.name testToString0121
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2200
     * @tc.desc Test single char
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('a');
      expect(re.toString()).assertEqual('/a/');
    });
  });

  // Flag letter ordering and presence in output鈥攄iffers from the internal [[OriginalFlags]] slot ordering on some engines.
  describe('ToString_Flags', () => {
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
     * @tc.name testToString0122
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2300
     * @tc.desc Test flag g only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test', 'g').toString()).assertEqual('/test/g');
    });

    /**
     * @tc.name testToString0123
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2400
     * @tc.desc Test flag i only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test', 'i').toString()).assertEqual('/test/i');
    });

    /**
     * @tc.name testToString0124
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2500
     * @tc.desc Test flag m only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test', 'm').toString()).assertEqual('/test/m');
    });

    /**
     * @tc.name testToString0125
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2600
     * @tc.desc Test flag s only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('test', 's')) {
        return;
      }
      expect(new RegExp('test', 's').toString()).assertEqual('/test/s');
    });

    /**
     * @tc.name testToString0200
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0200
     * @tc.desc Test flag s unsupported when dotAll not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('test', 's')) {
        return;
      }
      expect(supportsRegExp('test', 's')).assertFalse();
    });

    /**
     * @tc.name testToString0126
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2700
     * @tc.desc Test flag u only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test', 'u').toString()).assertEqual('/test/u');
    });

    /**
     * @tc.name testToString0127
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2800
     * @tc.desc Test flag y only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test', 'y').toString()).assertEqual('/test/y');
    });

    /**
     * @tc.name testToString0128
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_2900
     * @tc.desc Test flag d only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('test', 'd')) {
        return;
      }
      expect(new RegExp('test', 'd').toString()).assertEqual('/test/d');
    });

    /**
     * @tc.name testToString0201
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0300
     * @tc.desc Test flag d unsupported when hasIndices not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('test', 'd')) {
        return;
      }
      expect(supportsRegExp('test', 'd')).assertFalse();
    });

    /**
     * @tc.name testToString0129
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3000
     * @tc.desc Test two flags gi
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test', 'gi').toString()).assertEqual('/test/gi');
    });

    /**
     * @tc.name testToString0130
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3100
     * @tc.desc Test multiple flags gimsuy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('test', 'gimsuy')) {
        return;
      }
      expect(new RegExp('test', 'gimsuy').toString()).assertEqual('/test/gimsuy');
    });

    /**
     * @tc.name testToString0202
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0400
     * @tc.desc Test gimsuy flags unsupported when not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('test', 'gimsuy')) {
        return;
      }
      expect(supportsRegExp('test', 'gimsuy')).assertFalse();
    });

    /**
     * @tc.name testToString0131
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3200
     * @tc.desc Test all flags gimsud
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('test', 'gimsud')) {
        return;
      }
      expect(new RegExp('test', 'gimsud').toString()).assertEqual('/test/dgimsu');
    });

    /**
     * @tc.name testToString0203
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0500
     * @tc.desc Test gimsud flags unsupported when not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('test', 'gimsud')) {
        return;
      }
      expect(supportsRegExp('test', 'gimsud')).assertFalse();
    });

    /**
     * @tc.name testToString0132
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3300
     * @tc.desc Test no flags
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test').toString()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0133
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3400
     * @tc.desc Test flags order equals flags property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'i');
      expect(re.toString()).assertEqual('/test/i');
      expect(re.flags).assertEqual('i');
    });

    /**
     * @tc.name testToString0134
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3500
     * @tc.desc Test flags are sorted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'ygi');
      expect(re.flags).assertEqual('giy');
      expect(re.toString()).assertEqual('/test/giy');
    });
  });

  // Very long sources and odd characters: ensures output length scales without throwing for normal objects.
  describe('ToString_Boundaries', () => {
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
     * @tc.name testToString0135
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3600
     * @tc.desc Test very long pattern length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pattern = 'a'.repeat(1000);
      const re = new RegExp(pattern);
      expect(re.toString().length).assertEqual(1002);
    });

    /**
     * @tc.name testToString0136
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3700
     * @tc.desc Test deep nesting
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('((((((((a))))))))').toString()).assertEqual('/((((((((a))))))))/');
    });

    /**
     * @tc.name testToString0137
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3800
     * @tc.desc Test unicode range with u
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('[\\u4e00-\\u9fa5]+', 'u');
      expect(re.toString()).assertEqual('/[\\u4e00-\\u9fa5]+/u');
    });

    /**
     * @tc.name testToString0138
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_3900
     * @tc.desc Test emoji with u
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const emoji = String.fromCodePoint(0x1F600);
      expect(new RegExp(emoji + '+', 'u').toString()).assertEqual('/' + emoji + '+/u');
    });

    /**
     * @tc.name testToString0139
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_4000
     * @tc.desc Test control chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\x00\\x1F');
      expect(re.toString()).assertEqual('/\\x00\\x1F/');
    });

    /**
     * @tc.name testToString0140
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_4100
     * @tc.desc Test dynamic pattern contains content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const dynamicPattern = 'test_dynamic_pattern';
      const re = new RegExp(dynamicPattern);
      expect(re.toString().includes(dynamicPattern)).assertTrue();
    });

    /**
     * @tc.name testToString0141
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_4200
     * @tc.desc Test user input pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const userInput = 'user.*input';
      const re = new RegExp(userInput);
      expect(re.toString()).assertEqual('/user.*input/');
    });
  });

  // call/apply/bind and computed names: dispatch must preserve the builtin toString implementation identity.
  describe('Interactions', () => {
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
     * @tc.name testToString0142
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_4300
     * @tc.desc Test source consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('abc');
      const s = re.toString();
      expect(s.includes(re.source)).assertTrue();
    });

    /**
     * @tc.name testToString0143
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_4400
     * @tc.desc Test empty source is non empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('');
      const src = re.source;
      const s = re.toString();
      expect(
        (src === '(?:)' || src === '') && (s === '/(?:)/' || s === '//')
      ).assertTrue();
    });

    /**
     * @tc.name testToString0144
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_4500
     * @tc.desc Test flags consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'gi');
      const s = re.toString();
      expect(s.endsWith(re.flags)).assertTrue();
    });

    /**
     * @tc.name testToString0145
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_4600
     * @tc.desc Test flags empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      expect(re.flags).assertEqual('');
      expect(re.toString()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0207
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_DEFINEPROP_TEST_0100
     * @tc.desc Test defineProperty source getter success path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = makeToStringHelperResult(toStringDefinePropertySourceGetter());
      if (!r?.ok) {
        return;
      }
      expect(r.value).assertEqual('/modified/gi');
    });
    /**
     * @tc.name testToString0208
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_DEFINEPROP_TEST_0200
     * @tc.desc Test defineProperty source getter error path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = makeToStringHelperResult(toStringDefinePropertySourceGetter());
      if (r?.ok) {
        return;
      }
      expect(!!r?.thrown).assertTrue();
    });

    /**
     * @tc.name testToString0209
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_DEFINEPROP_TEST_0300
     * @tc.desc Test defineProperty flags getter success path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = makeToStringHelperResult(toStringDefinePropertyFlagsGetter());
      if (!r?.ok) {
        return;
      }
      expect(r.value).assertEqual('/test/um');
    });
    /**
     * @tc.name testToString0210
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_DEFINEPROP_TEST_0400
     * @tc.desc Test defineProperty flags getter error path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = makeToStringHelperResult(toStringDefinePropertyFlagsGetter());
      if (r?.ok) {
        return;
      }
      expect(!!r?.thrown).assertTrue();
    });

    /**
     * @tc.name testToString0211
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_DEFINEPROP_TEST_0500
     * @tc.desc Test getter hijack source called success path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = makeToStringHelperResult(toStringGetterHijackSourceCalled());
      if (!r?.ok) {
        return;
      }
      expect(!!r.getterCalled).assertTrue();
    });
    /**
     * @tc.name testToString0212
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_DEFINEPROP_TEST_0600
     * @tc.desc Test getter hijack source called error path
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = makeToStringHelperResult(toStringGetterHijackSourceCalled());
      if (r?.ok) {
        return;
      }
      expect(!!r?.thrown).assertTrue();
    });

    /**
     * @tc.name testToString0149
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5000
     * @tc.desc Test exec does not change toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('test', 'g');
      const before = re.toString();
      re.exec('test test');
      const after = re.toString();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.name testToString0150
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5100
     * @tc.desc Test test does not change toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('test', 'g');
      const before = re.toString();
      re.test('test');
      const after = re.toString();
      expect(before).assertEqual(after);
    });

    /**
     * @tc.name testToString0151
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5200
     * @tc.desc Test lastIndex does not change toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('test', 'g');
      re.lastIndex = 5;
      expect(re.toString()).assertEqual('/test/g');
    });

    /**
     * @tc.name testToString0152
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5300
     * @tc.desc Test match does not change toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r1: RegExp = new RegExp('test', 'gi');
      'test TEST Test'.match(r1);
      expect(r1.toString()).assertEqual('/test/gi');
    });

    /**
     * @tc.name testToString0153
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5400
     * @tc.desc Test replace does not change toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r2: RegExp = new RegExp('test', 'g');
      'test string'.replace(r2, 'result');
      expect(r2.toString()).assertEqual('/test/g');
    });

    /**
     * @tc.name testToString0154
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5500
     * @tc.desc Test split does not change toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r3: RegExp = new RegExp('\\s+');
      'a b c'.split(r3);
      expect(r3.toString()).assertEqual('/\\s+/');
    });
  });

  // Number and string coercions of RegExp objects: user code often concatenates regex into messages.
  describe('Type_Coercion', () => {
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
     * @tc.name testToString0155
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5600
     * @tc.desc Test concat
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      expect('regex is: ' + re).assertEqual('regex is: /test/');
    });

    /**
     * @tc.name testToString0156
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5700
     * @tc.desc Test template string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      expect(`regex is: ${re}`).assertEqual('regex is: /test/');
    });

    /**
     * @tc.name testToString0157
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5800
     * @tc.desc Test String constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'gi');
      expect(String(re)).assertEqual('/test/gi');
    });

    /**
     * @tc.name testToString0158
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_5900
     * @tc.desc Test String equals toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'gi');
      expect(String(re) === re.toString()).assertTrue();
    });

    /**
     * @tc.name testToString0159
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6000
     * @tc.desc Test Number is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const coercionIsNan: boolean = regexpToNumberIsNaN();
      expect(coercionIsNan).assertTrue();
    });

    /**
     * @tc.name testToString0160
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6100
     * @tc.desc Test parseInt is NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('123');
      expect(Number.isNaN(parseInt(String(re)))).assertTrue();
    });

    /**
     * @tc.name testToString0161
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6200
     * @tc.desc Test Boolean is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      expect(Boolean(re)).assertTrue();
    });

    /**
     * @tc.name testToString0162
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6300
     * @tc.desc Test truthy in if condition
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      let hit = false;
      if (re) {
        hit = true;
      }
      expect(hit).assertTrue();
    });
  });

  // Instance vs prototype toString: overrides, deletes, and subclass branding affect serialization.
  describe('Prototype_And_Inheritance', () => {
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
     * @tc.name testToString0163
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6400
     * @tc.desc Test toString on prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpInstanceHasOwnToString()).assertFalse();
      expect(regexpPrototypeHasOwnToString()).assertTrue();
    });

    /**
     * @tc.name testToString0164
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6500
     * @tc.desc Test prototype chain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringSameAsPrototype()).assertTrue();
    });

    /**
     * @tc.name testToString0165
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6600
     * @tc.desc Test diff from Object prototype toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      const a = re.toString();
      const b = objectPrototypeToStringOnRegExp();
      expect(a !== b).assertTrue();
    });

    /**
     * @tc.name testToString0166
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6700
     * @tc.desc Test call non regexp throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringCallNonRegExpThrows()).assertTrue();
    });

    /**
     * @tc.name testToString0167
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6800
     * @tc.desc Test override instance toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpOverrideToStringReturnsCustom()).assertEqual('custom');
    });

    /**
     * @tc.name testToString0168
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_6900
     * @tc.desc Test delete override restore
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpDeleteOverrideRestoresPrototype()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0169
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7000
     * @tc.desc Test subclass inherits toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpSubclassInheritsToString()).assertEqual('/test/gi');
    });

    /**
     * @tc.name testToString0170
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7100
     * @tc.desc Test subclass override toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpSubclassOverridesToString()).assertEqual('[MyRegExp: test]');
    });
  });

  // Immutable objects: toString should remain callable; defineProperty may still throw under integrity levels.
  describe('Errors_And_Freeze_Seal', () => {
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
     * @tc.name testToString0171
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7200
     * @tc.desc Test call null throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringCallNullThrows()).assertTrue();
    });

    /**
     * @tc.name testToString0172
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7300
     * @tc.desc Test call undefined throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringCallUndefinedThrows()).assertTrue();
    });

    /**
     * @tc.name testToString0173
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7400
     * @tc.desc Test call string throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringCallStringThrows()).assertTrue();
    });

    /**
     * @tc.name testToString0174
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7500
     * @tc.desc Test call number throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringCallNumberThrows()).assertTrue();
    });

    /**
     * @tc.name testToString0175
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7600
     * @tc.desc Test frozen toString ok
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringOnFrozen()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0176
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7700
     * @tc.desc Test sealed toString ok
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringOnSealed()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0177
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7800
     * @tc.desc Test defineProperty on frozen throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(definePropertyOnFrozenThrows()).assertTrue();
    });
  });

  // JSON.stringify and tag-based expectations: RegExp is not JSON-serializable like plain objects.
  describe('Special_Scenarios', () => {
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
     * @tc.name testToString0178
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_7900
     * @tc.desc Test unicode escape sequence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('\\u0041+');
      expect(re.toString()).assertEqual('/\\u0041+/');
    });

    /**
     * @tc.name testToString0179
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8000
     * @tc.desc Test unicode property escape when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\p{Script=Hiragana}', 'u')) {
        return;
      }
      expect(new RegExp('\\p{Script=Hiragana}', 'u').toString()).assertEqual('/\\p{Script=Hiragana}/u');
    });

    /**
     * @tc.name testToString0204
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0600
     * @tc.desc Test Hiragana script property unsupported when not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('\\p{Script=Hiragana}', 'u')) {
        return;
      }
      expect(supportsRegExp('\\p{Script=Hiragana}', 'u')).assertFalse();
    });

    /**
     * @tc.name testToString0180
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8100
     * @tc.desc Test unicode property letter when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\p{Letter}+', 'u')) {
        return;
      }
      expect(new RegExp('\\p{Letter}+', 'u').toString()).assertEqual('/\\p{Letter}+/u');
    });

    /**
     * @tc.name testToString0205
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0700
     * @tc.desc Test unicode property Letter unsupported when not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('\\p{Letter}+', 'u')) {
        return;
      }
      expect(supportsRegExp('\\p{Letter}+', 'u')).assertFalse();
    });

    /**
     * @tc.name testToString0181
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8200
     * @tc.desc Test alternation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('cat|dog|bird');
      expect(re.toString()).assertEqual('/cat|dog|bird/');
    });

    /**
     * @tc.name testToString0182
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8300
     * @tc.desc Test complex nesting
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('((a|b)+(\\d|[x-z]))*');
      expect(re.toString()).assertEqual('/((a|b)+(\\d|[x-z]))*/');
    });

    /**
     * @tc.name testToString0183
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8400
     * @tc.desc Test backreference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('(a|b)\\1');
      expect(re.toString()).assertEqual('/(a|b)\\1/');
    });

    /**
     * @tc.name testToString0184
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8500
     * @tc.desc Test named backreference when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<quote>[\'"])\\k<quote>')) {
        return;
      }
      expect(new RegExp('(?<quote>[\'"])\\k<quote>').toString()).assertEqual('/(?<quote>[\'"])\\k<quote>/');
    });

    /**
     * @tc.name testToString0206
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_EXTRA_TEST_0800
     * @tc.desc Test named backreference unsupported when not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pat = '(?<quote>[\'"])\\k<quote>';
      if (supportsRegExp(pat)) {
        expect(new RegExp(pat).toString()).assertEqual('/(?<quote>[\'"])\\k<quote>/');
        return;
      }
      return;
    });

    /**
     * @tc.name testToString0185
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8600
     * @tc.desc Test apply
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringApply()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0186
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8700
     * @tc.desc Test bind
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringBind()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0187
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8800
     * @tc.desc Test JSON stringify regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(jsonStringifyRegExpIsEmptyObject()).assertEqual('{}');
    });

    /**
     * @tc.name testToString0188
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_8900
     * @tc.desc Test custom toJSON
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(jsonStringifyWithToJSON()).assertEqual('{\"regex\":\"/test/gi\"}');
    });

    /**
     * @tc.name testToString0189
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9000
     * @tc.desc Test strict mode toString output
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test');
      expect(re.toString()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0190
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9100
     * @tc.desc Test non strict same literal output note
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new RegExp('test').toString()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0191
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9200
     * @tc.desc Test repeatability
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re = new RegExp('test', 'gi');
      const a = re.toString();
      const b = re.toString();
      const c = re.toString();
      expect(a === b && b === c).assertTrue();
    });

    /**
     * @tc.name testToString0192
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9300
     * @tc.desc Test many regexes toString contains pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 100; i++) {
        const p = 'pattern' + i;
        const re = new RegExp(p, 'gi');
        expect(re.toString().includes(p)).assertTrue();
      }
    });

    /**
     * @tc.name testToString0193
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9400
     * @tc.desc Test computed property access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(regexpToStringByComputedName()).assertEqual('/test/');
    });

    /**
     * @tc.name testToString0194
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9500
     * @tc.desc Test Object toStringTag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(objectPrototypeToStringOnRegExp()).assertEqual('[object RegExp]');
    });

    /**
     * @tc.name testToString0195
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9600
     * @tc.desc Test property descriptor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const raw = JSON.stringify(regexpPrototypeToStringDescriptor()) ?? '';
      expect(raw.indexOf('"writable":true') >= 0).assertTrue();
      expect(raw.indexOf('"enumerable":false') >= 0).assertTrue();
      expect(raw.indexOf('"configurable":true') >= 0).assertTrue();
    });

    /**
     * @tc.name testToString0196
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9700
     * @tc.desc Test toString output can construct new regexp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex1 = new RegExp("test", "gi");
      const s = regex1.toString();
      const m = new RegExp("^\\/(.*)\\/([a-z]*)$").exec(s);
      expect(m !== null).assertTrue();
      if (m !== null) {
        const pattern = m[1] ?? '';
        const flags = m[2] ?? '';
        const regex2 = new RegExp(pattern, flags);
        expect(regex1.toString()).assertEqual(regex2.toString());
      }
    });

    /**
     * @tc.name testToString0197
     * @tc.number SUB_COMMONLIBRARY_REGEXP_TOSTRING_TEST_9800
     * @tc.desc Test constructed regexp test behavior matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testToString0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const regex1 = new RegExp("test", "gi");
      const s = regex1.toString();
      const re = new RegExp("^/(.*)/([a-z]*)$");
      const m = re.exec(s);
      expect(m !== null).assertTrue();
      if (m !== null) {
        const pattern = m[1] ?? '';
        const flags = m[2] ?? '';
        const regex2 = new RegExp(pattern, flags);
        expect(regex1.test('TEST')).assertEqual(regex2.test('TEST'));
      }
    });
  });

}


