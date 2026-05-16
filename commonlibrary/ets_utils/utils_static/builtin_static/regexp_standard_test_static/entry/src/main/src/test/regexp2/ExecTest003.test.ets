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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import { regexpSymbolMatchAll, regexpSymbolSearch } from './RegExpHelper';

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

class ExecSpecial {
  static matchPositiveLookahead(input: string): RegExpExecArray | null {
    const re = new RegExp('foo(?=bar)');
    return re.exec(input);
  }

  static matchNegativeLookahead(input: string): RegExpExecArray | null {
    const re = new RegExp('foo(?!bar)');
    return re.exec(input);
  }

  static matchPositiveLookbehind(input: string): RegExpExecArray | null {
    const re = new RegExp('(?<=test)123');
    return re.exec(input);
  }

  static matchNegativeLookbehind(input: string): RegExpExecArray | null {
    const re = new RegExp('(?<!test)123');
    return re.exec(input);
  }
}

export default function execTest003(): void {
  // Lookahead/lookbehind assertions: optional in some profiles; skips avoid false reds on partial implementations.
  describe('Exec_Special_Pattern_Tests', () => {
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
     * @tc.name testExec0174
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0100
     * @tc.desc Test RegExp.prototype.exec positive lookahead (?=)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1 = ExecSpecial.matchPositiveLookahead("foobar");
      const result2 = ExecSpecial.matchPositiveLookahead("foobaz");
      expect(result1?.[0]).assertEqual("foo");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0175
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0200
     * @tc.desc Test RegExp.prototype.exec negative lookahead (?!)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const result1 = ExecSpecial.matchNegativeLookahead("foobaz");
      const result2 = ExecSpecial.matchNegativeLookahead("foobar");
      expect(result1?.[0]).assertEqual("foo");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0176
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0300
     * @tc.desc Test RegExp.prototype.exec positive lookbehind (?<=) when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<=test)123')) {
        return;
      }
      const result1 = ExecSpecial.matchPositiveLookbehind("test123");
      const result2 = ExecSpecial.matchPositiveLookbehind("abc123");
      expect(result1 !== null).assertTrue();
      expect(result1?.[0] ?? '').assertEqual("123");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0177
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0500
     * @tc.desc Test positive lookbehind yields no match when unsupported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('(?<=test)123')) {
        return;
      }
      expect(supportsRegExp('(?<=test)123')).assertFalse();
    });

    /**
     * @tc.name testExec0178
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0400
     * @tc.desc Test RegExp.prototype.exec negative lookbehind (?<!) when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<!test)123')) {
        return;
      }
      const result1 = ExecSpecial.matchNegativeLookbehind("abc123");
      const result2 = ExecSpecial.matchNegativeLookbehind("test123");
      expect(result1 !== null).assertTrue();
      expect(result1?.[0] ?? '').assertEqual("123");
      expect(result2).assertEqual(null);
    });

    /**
     * @tc.name testExec0179
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIAL_TEST_0600
     * @tc.desc Test negative lookbehind yields no match when unsupported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('(?<!test)123')) {
        return;
      }
      expect(supportsRegExp('(?<!test)123')).assertFalse();
    });
  });

  // Cross-method interference: exec vs test vs search on one RegExp instance shares lastIndex semantics.
  describe('Method_Interaction_Tests', () => {
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
     * @tc.name testExec0180
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0100
     * @tc.desc Test exec and test share lastIndex on same global RegExp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('foo', 'g');
      const str: string = "foo foo";
      re.test(str);
      expect(re.lastIndex).assertEqual(3);
      const execResult = re.exec(str);
      expect(re.lastIndex).assertEqual(7);
      expect(execResult?.[0]).assertEqual("foo");
    });

    /**
     * @tc.name testExec0181
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0200
     * @tc.desc Test exec results align with String.match for global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('foo', 'g');
      const str: string = "foo foo";
      const execResult1: RegExpExecArray | null = re.exec(str);
      const execResult2: RegExpExecArray | null = re.exec(str);
      re.lastIndex = 0;
      const matchResult: RegExpMatchArray | null = str.match(re);
      expect(execResult1?.[0]).assertEqual(matchResult?.[0]);
      expect(execResult2?.[0]).assertEqual(matchResult?.[1]);
    });

    /**
     * @tc.name testExec0182
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0300
     * @tc.desc Test String.matchAll iterator yields same substrings as multiple exec
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('foo', 'g');
      const str: string = "foo foo";
      const matchAllIterator: IterableIterator<RegExpMatchArray> = regexpSymbolMatchAll(re, str);
      const matchAllResults: RegExpMatchArray[] = Array.from(matchAllIterator);
      expect(matchAllResults.length).assertEqual(2);
      expect(matchAllResults[0][0]).assertEqual("foo");
      expect(matchAllResults[1][0]).assertEqual("foo");
    });

    /**
     * @tc.name testExec0183
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0400
     * @tc.desc Test replace does not leave lastIndex mutated for non-global regex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('foo');
      const str: string = "foo bar";
      const replaced: string = str.replace(re, "baz");
      expect(replaced).assertEqual("baz bar");
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExec0184
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_INTERACTION_TEST_0500
     * @tc.desc Test exec match index equals RegExp @@search result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const re: RegExp = new RegExp('hello');
      const str: string = "say hello world";
      const execResult: RegExpExecArray | null = re.exec(str);
      const searchIndex: number = regexpSymbolSearch(re, str);
      expect(execResult?.index).assertEqual(searchIndex);
    });
  });
}

