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
 * RegExp.prototype.exec coverage grouped by language feature. Small static helper classes centralize pattern strings so
 * failures map cleanly to anchors, captures, or flags. RegExpHelper assertions cover coercion paths; supportsRegExp gates
 * optional syntax without hard-failing older engines.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';
import {
  execCoercesNullToString,
  execCoercesUndefinedToString,
  execCoercesNumberToString,
  execCoercesObjectWithToString,
  execObjectCreateNullThrowsTypeError,
  regexpSymbolMatchAll,
  regexpSymbolSearch
} from './RegExpHelper';

// Constructor probe so optional flags (dotAll, unicode properties) skip explicitly instead of try/catch in every case.
function supportsRegExp(pattern: string, flags: string = ''): boolean {
  /*
   * Instantiation is the ground truth: pattern strings that parse in documentation may still be rejected by this VM
   * build, and we want that to read as “feature off” instead of a failing assertion deep inside a describe tree.
   */
  try {
    /*
     * Empty flags string is the default RegExp branch; passing it explicitly keeps the probe aligned with two-argument
     * calls used elsewhere in the suite.
     */
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    /*
     * Swallowing all errors treats any ctor failure as “unsupported or invalid here”—callers use early return, not throws.
     */
    return false;
  }
}

// Pattern harnesses: one regexp source per scenario reduces copy-paste drift when TC numbers move between suites.
class ExecBasic {
  static matchHello(input: string): RegExpExecArray | null {
    const re = new RegExp('hello');
    return re.exec(input);
  }

  static matchAbc(input: string): RegExpExecArray | null {
    const re = new RegExp('abc');
    return re.exec(input);
  }

  static matchEmptyPattern(input: string): RegExpExecArray | null {
    const re = new RegExp('(?:)');
    return re.exec(input);
  }

  static searchWithPattern(input: string, re: RegExp): number {
    return input.search(re);
  }
}

class Anchor {
  static matchStartAnchor(input: string): RegExpExecArray | null {
    const re = new RegExp('^hello');
    return re.exec(input);
  }

  static matchEndAnchor(input: string): RegExpExecArray | null {
    const re = new RegExp('world$');
    return re.exec(input);
  }

  static matchWordBoundary(input: string): RegExpExecArray | null {
    const re = new RegExp('\\btest\\b');
    return re.exec(input);
  }

  static matchNonWordBoundary(input: string): RegExpExecArray | null {
    const re = new RegExp('test\\B');
    return re.exec(input);
  }
}

class ExecBoundary {
  static execTest(input: string): RegExpExecArray | null {
    return new RegExp('test').exec(input);
  }

  static execThreeDigits(input: string): RegExpExecArray | null {
    return new RegExp('123').exec(input);
  }
}

class ExecBacktrack {
  static matchAlternation(input: string): RegExpExecArray | null {
    const re = new RegExp('a(b|c)d');
    return re.exec(input);
  }

  static matchNestedPattern(input: string): RegExpExecArray | null {
    const re = new RegExp('((?:[A-Za-z]+)(?:\\d+))');
    return re.exec(input);
  }
}

class ExecCapture {
  static matchOrdinary(input: string): RegExpExecArray | null {
    const re = new RegExp('(\\d{4})-(\\d{2})-(\\d{2})');
    return re.exec(input);
  }

  static matchNested(input: string): RegExpExecArray | null {
    const re = new RegExp('((\\d{4})-(\\d{2}))-(\\d{2})');
    return re.exec(input);
  }

  static matchNamed(input: string): RegExpExecArray | null {
    const re = new RegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})');
    return re.exec(input);
  }

  static matchNonCapture(input: string): RegExpExecArray | null {
    const re = new RegExp('(?:\\d{4})-(?:\\d{2})-(\\d{2})');
    return re.exec(input);
  }

  static matchOptional(input: string): RegExpExecArray | null {
    const re = new RegExp('hello(\\s+world)?');
    return re.exec(input);
  }

  static matchMixed(input: string): RegExpExecArray | null {
    const re = new RegExp('(?<name>\\w+)\\s+(\\d+)');
    return re.exec(input);
  }
}


class ExecQuantifier {
  static execGreedy(input: string): RegExpExecArray | null {
    return new RegExp('a.*b').exec(input);
  }

  static execNonGreedy(input: string): RegExpExecArray | null {
    return new RegExp('a.*?b').exec(input);
  }

  static execExact(input: string): RegExpExecArray | null {
    return new RegExp('a{3}').exec(input);
  }

  static execRange(input: string): RegExpExecArray | null {
    return new RegExp('a{2,4}').exec(input);
  }

  static execZeroOrMore(input: string): RegExpExecArray | null {
    return new RegExp('a*b').exec(input);
  }

  static execOneOrMore(input: string): RegExpExecArray | null {
    return new RegExp('a+b').exec(input);
  }
}

class ExecReturn {
  static execHello(input: string): RegExpExecArray | null {
    return new RegExp('hello').exec(input);
  }

  static execNamedHello(input: string): RegExpExecArray | null {
    return new RegExp('(?<word>hello)').exec(input);
  }
}

class ExecSpecialChar {
  static execEscapedDot(input: string): RegExpExecArray | null {
    return new RegExp('\\.').exec(input);
  }

  static execTab(input: string): RegExpExecArray | null {
    return new RegExp('\\t').exec(input);
  }

  static execNewline(input: string): RegExpExecArray | null {
    return new RegExp('\\n').exec(input);
  }

  static execChineseRange(input: string): RegExpExecArray | null {
    return new RegExp('[\\u4e00-\\u9fa5]+').exec(input);
  }

  static execEmojiProperty(input: string): RegExpExecArray | null {
    return new RegExp('\\p{Emoji}', 'u').exec(input);
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

// Describe blocks follow ECMA-262-style concerns to speed triage when a single language feature regresses.
export default function execTest(): void {
  // Whole match, index, input, and null on miss—the observable core before flags and capture metadata.
  describe('Basic_Matching_Tests', () => {
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
     * @tc.name testExec0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0100
     * @tc.desc Test RegExp.prototype.exec simple pattern /hello/ match and index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBasic.matchHello("hello world");
      expect(result?.[0]).assertEqual("hello");
      expect(result?.index).assertEqual(0);
    });
  
    /**
     * @tc.name testExec0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0200
     * @tc.desc Test RegExp.prototype.exec returns null when pattern does not match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBasic.matchHello("world");
      expect(result).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0300
     * @tc.desc Test RegExp.prototype.exec /abc/ on empty string returns null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBasic.matchAbc("");
      expect(result).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0400
     * @tc.desc Test RegExp.prototype.exec empty non-capturing pattern (?:)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBasic.matchEmptyPattern("hello");
      expect(result?.[0]).assertEqual("");
      expect(result?.index).assertEqual(0);
    });
  
    /**
     * @tc.name testExec0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0500
     * @tc.desc Test String.search index aligns with exec match position for /a/ on abc
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      const re: RegExp = new RegExp('a');
      const str: string = "abc";
      const execResult: RegExpExecArray | null = re.exec(str);
      expect(execResult !== null).assertTrue();
      const searchIndex: number = ExecBasic.searchWithPattern(str, re);
      expect(execResult!.index).assertEqual(searchIndex);
    });
  
    /**
     * @tc.name testExec0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0600
     * @tc.desc Test exec returns null when pattern does not match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('z');
      const str: string = "abc";
      const execResult: RegExpExecArray | null = re.exec(str);
      expect(execResult).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0106
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0700
     * @tc.desc Boundary: exec /hello/ on empty string returns null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBasic.matchHello('');
      expect(result).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0107
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0800
     * @tc.desc Boundary: exec empty non-capturing pattern on empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBasic.matchEmptyPattern('');
      expect(result?.[0]).assertEqual('');
      expect(result?.index).assertEqual(0);
    });
  
    /**
     * @tc.name testExec0108
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_0900
     * @tc.desc Boundary: String.search returns -1 when pattern never matches
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(ExecBasic.searchWithPattern('abc', new RegExp('z'))).assertEqual(-1);
    });
  
    /**
     * @tc.name testExec0109
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_1000
     * @tc.desc Boundary: String.search on empty string when pattern requires a character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(ExecBasic.searchWithPattern('', new RegExp('a'))).assertEqual(-1);
    });
  
    /**
     * @tc.name testExec0110
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BASIC_TEST_1100
     * @tc.desc Boundary: exec with whitespace-only input and no match
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBasic.matchHello('   \t\n  ');
      expect(result).assertEqual(null);
    });
  });
  
  // Anchors and word boundaries: position-sensitive matching independent of capture groups.
  describe('Anchor_Boundary_Tests', () => {
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
     * @tc.name testExec0111
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0100
     * @tc.desc Test RegExp.prototype.exec with start anchor ^hello
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = Anchor.matchStartAnchor("hello world");
      const result2 = Anchor.matchStartAnchor("say hello");
      expect(result1?.[0]).assertEqual("hello");
      expect(result2).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0112
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0200
     * @tc.desc Test RegExp.prototype.exec with end anchor world$
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = Anchor.matchEndAnchor("hello world");
      const result2 = Anchor.matchEndAnchor("world hello");
      expect(result1?.[0]).assertEqual("world");
      expect(result2).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0113
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0300
     * @tc.desc Test RegExp.prototype.exec with word boundary \\b for whole word test
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = Anchor.matchWordBoundary("test");
      const result2 = Anchor.matchWordBoundary("testing");
      const result3 = Anchor.matchWordBoundary("123 test 456");
      expect(result1?.[0]).assertEqual("test");
      expect(result2).assertEqual(null);
      expect(result3?.[0]).assertEqual("test");
    });
  
    /**
     * @tc.name testExec0114
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_ANCHOR_TEST_0400
     * @tc.desc Test RegExp.prototype.exec with non-word boundary \\B after test
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = Anchor.matchNonWordBoundary("testing");
      const result2 = Anchor.matchNonWordBoundary("test");
      expect(result1?.[0]).assertEqual("test");
      expect(result2).assertEqual(null);
    });
  });
  
  // Simple literals at known offsets—sanity for index fields before quantifiers complicate consumption.
  describe('Exec_Boundary_Tests', () => {
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
     * @tc.name testExec0115
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BOUNDARY_TEST_0100
     * @tc.desc Test RegExp.prototype.exec word boundary \\b and non-word boundary \\B
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const r1: RegExpExecArray | null = new RegExp('\\b').exec('abc');
      expect(r1?.index).assertEqual(0);
  
      const r2: RegExpExecArray | null = new RegExp('\\B').exec('abc');
      expect(r2?.index).assertEqual(1);
    });
  
    /**
     * @tc.name testExec0116
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BOUNDARY_TEST_0200
     * @tc.desc Test exec helper for literal /test/ and /123/ patterns and index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const t = ExecBoundary.execTest('my test string');
      expect(t?.[0]).assertEqual('test');
      expect(t?.index).assertEqual(3);
      const n = ExecBoundary.execThreeDigits('id:123');
      expect(n?.[0]).assertEqual('123');
      expect(n?.index).assertEqual(3);
    });
  });
  
  // Alternation and nesting: backtracking must pick the correct branch and expose the right capture slot.
  describe('Backtracking_Complex_Tests', () => {
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
     * @tc.name testExec0117
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BACKTRACK_TEST_0100
     * @tc.desc Test RegExp.prototype.exec alternation capture a(b|c)d
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = ExecBacktrack.matchAlternation("abd");
      const result2 = ExecBacktrack.matchAlternation("acd");
      expect(result1?.[1]).assertEqual("b");
      expect(result2?.[1]).assertEqual("c");
    });
  
    /**
     * @tc.name testExec0118
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_BACKTRACK_TEST_0200
     * @tc.desc Test RegExp.prototype.exec nested letter-and-digit group
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecBacktrack.matchNestedPattern("test123");
      expect(result?.[1]).assertEqual("test123");
    });
  });
  
  // Numbered, named, and non-capturing groups: exec arrays and group properties must stay aligned.
  describe('Exec_Capture_Group_Tests', () => {
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
     * @tc.name testExec0119
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0100
     * @tc.desc Test RegExp.prototype.exec ordinary numbered capture groups for date
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      const result = ExecCapture.matchOrdinary("2024-03-27");
      expect(result?.[0]).assertEqual("2024-03-27");
      expect(result?.[1]).assertEqual("2024");
      expect(result?.[2]).assertEqual("03");
      expect(result?.[3]).assertEqual("27");
    });
  
    /**
     * @tc.name testExec0120
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0200
     * @tc.desc Test RegExp.prototype.exec nested capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      const result = ExecCapture.matchNested("2024-03-27");
      expect(result?.[0]).assertEqual("2024-03-27");
      expect(result?.[1]).assertEqual("2024-03");
      expect(result?.[2]).assertEqual("2024");
      expect(result?.[3]).assertEqual("03");
      expect(result?.[4]).assertEqual("27");
    });
  
    /**
     * @tc.name testExec0121
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0300
     * @tc.desc Test RegExp.prototype.exec named capture groups year month day
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<year>\\d{4})-(?<month>\\d{2})-(?<day>\\d{2})')) {
        return;
      }
      
      
      
      const result = ExecCapture.matchNamed("2024-03-27");
      const groups: Record<string, string> | undefined = result?.groups as Record<string, string> | undefined;
      expect(groups?.['year']).assertEqual("2024");
      expect(groups?.['month']).assertEqual("03");
      expect(groups?.['day']).assertEqual("27");
    });
  
    /**
     * @tc.name testExec0122
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0400
     * @tc.desc Test RegExp.prototype.exec non-capturing groups with one capture
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecCapture.matchNonCapture("2024-03-27");
      expect(result?.[0]).assertEqual("2024-03-27");
      expect(result?.[1]).assertEqual("27");
    });
  
    /**
     * @tc.name testExec0123
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0500
     * @tc.desc Test RegExp.prototype.exec optional capture group (\\s+world)?
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      const result1 = ExecCapture.matchOptional("hello");
      const result2 = ExecCapture.matchOptional("hello world");
      expect(result1?.[1]).assertUndefined();
      expect(result2?.[1]).assertEqual(" world");
    });
  
    /**
     * @tc.name testExec0124
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CAPTURE_TEST_0600
     * @tc.desc Test RegExp.prototype.exec mixed named and numbered capture groups
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<name>\\w+)\\s+(\\d+)')) {
        return;
      }
      
      
      const result = ExecCapture.matchMixed("John 25");
      const groups: Record<string, string> | undefined = result?.groups as Record<string, string> | undefined;
      expect(groups?.['name']).assertEqual("John");
      expect(result?.[2]).assertEqual("25");
    });
  });
  
  // Character classes and ranges: distinct from group parsing—errors here usually mean lexer/class edge bugs.
  describe('Character_Class_Tests', () => {
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
     * @tc.name testExec0125
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CHARCLASS_TEST_0100
     * @tc.desc Test RegExp.prototype.exec simple character class [abc]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('[abc]');
      const result1 = re.exec("a");
      const result2 = re.exec("b");
      const result3 = re.exec("d");
      expect(result1?.[0]).assertEqual("a");
      expect(result2?.[0]).assertEqual("b");
      expect(result3).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0126
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CHARCLASS_TEST_0200
     * @tc.desc Test RegExp.prototype.exec range character class [a-z]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('[a-z]');
      const result1 = re.exec("a");
      const result2 = re.exec("z");
      const result3 = re.exec("A");
      expect(result1?.[0]).assertEqual("a");
      expect(result2?.[0]).assertEqual("z");
      expect(result3).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0127
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CHARCLASS_TEST_0300
     * @tc.desc Test RegExp.prototype.exec negated character class [^abc]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('[^abc]');
      const result1 = re.exec("a");
      const result2 = re.exec("d");
      expect(result1).assertEqual(null);
      expect(result2?.[0]).assertEqual("d");
    });
  
    /**
     * @tc.name testExec0128
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CHARCLASS_TEST_0400
     * @tc.desc Test RegExp.prototype.exec predefined class \\d+
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('\\d+');
      const result = re.exec("abc123def");
      expect(result?.[0]).assertEqual("123");
    });
  });
  
  // Exec argument coercion and prototype-null cases asserted via RegExpHelper for static-profile parity.
  describe('Exec__Input_Coercion', () => {
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
     * @tc.name testExec0129
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0100
     * @tc.desc Test RegExp.prototype.exec coerces null argument to string "null"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execCoercesNullToString()).assertTrue();
    });
  
    /**
     * @tc.name testExec0130
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0200
     * @tc.desc Test RegExp.prototype.exec coerces undefined argument to string "undefined"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execCoercesUndefinedToString()).assertTrue();
    });
  
    /**
     * @tc.name testExec0131
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0300
     * @tc.desc Test RegExp.prototype.exec coerces number argument via ToString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execCoercesNumberToString()).assertTrue();
    });
  
    /**
     * @tc.name testExec0132
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0400
     * @tc.desc Test RegExp.prototype.exec coerces object with toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execCoercesObjectWithToString()).assertTrue();
    });
  
    /**
     * @tc.name testExec0133
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_COERCION_TEST_0500
     * @tc.desc Test RegExp.prototype.exec throws TypeError for Object.create(null) without toString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      expect(execObjectCreateNullThrowsTypeError()).assertTrue();
    });
  });
  
  // RegExp constructor variants (string pattern, flags, escapes) that must compile before exec runs.
  describe('Regex_Constructor_Tests', () => {
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
     * @tc.name testExec0134
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CONSTRUCTOR_TEST_0100
     * @tc.desc Test RegExp.prototype.exec with pattern from RegExp constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp("hello");
      const result = re.exec("hello world");
      expect(result?.[0]).assertEqual("hello");
    });
  
    /**
     * @tc.name testExec0135
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CONSTRUCTOR_TEST_0200
     * @tc.desc Test RegExp.prototype.exec with regex literal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('hello');
      const result = re.exec("hello world");
      expect(result?.[0]).assertEqual("hello");
    });
  
    /**
     * @tc.name testExec0136
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_CONSTRUCTOR_TEST_0300
     * @tc.desc Test RegExp.prototype.exec with dynamic pattern and ignoreCase flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const pattern = "hello";
      const flags = "i";
      const re = new RegExp(pattern, flags);
      const result = re.exec("HELLO");
      expect(result?.[0]).assertEqual("HELLO");
    });
  });
  
  // Flag letters change matching semantics; exec results must reflect g/i/m/u/y combinations consistently.
  describe('Regex_Flags_Tests', () => {
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
     * @tc.name testExec0137
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0100
     * @tc.desc Test RegExp.prototype.exec with ignoreCase i flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('hello', 'i');
      const result: RegExpExecArray | null = re.exec("hello");
      expect(result?.[0]).assertEqual("hello");
    });
  
    /**
     * @tc.name testExec0138
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0200
     * @tc.desc Test RegExp.prototype.exec with multiline m flag and ^ anchor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('^hello', 'm');
      const result: RegExpExecArray | null = re.exec("world\nhello");
      expect(result?.index).assertEqual(6);
    });
  
    /**
     * @tc.name testExec0139
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0300
     * @tc.desc Test RegExp.prototype.exec with dotAll s flag matching newline
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('hello.world', 's');
      const result: RegExpExecArray | null = re.exec("hello\nworld");
      expect(result?.[0]).assertEqual("hello\nworld");
    });
  
    /**
     * @tc.name testExec0140
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0400
     * @tc.desc Test RegExp.prototype.exec with unicode u flag and code point escape
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('\\u{1F600}', 'u');
      const emoji = String.fromCodePoint(0x1F600);
      const result: RegExpExecArray | null = re.exec('Hello ' + emoji + ' World');
      expect(result?.[0]).assertEqual(emoji);
    });
  
    /**
     * @tc.name testExec0141
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0500
     * @tc.desc Test RegExp.prototype.exec with hasIndices d flag when supported
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('test', 'd')) {
        return;
      }
      const re: RegExp = new RegExp('test', 'd');
      const raw: RegExpExecArray | null = re.exec("this is a test");
      expect(raw !== null).assertTrue();
      if (raw === null) {
        return;
      }
      
      expect(raw[0]).assertEqual("test");
    });
  
    /**
     * @tc.name testExec0142
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0700
     * @tc.desc Test d flag unsupported when hasIndices not available
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (supportsRegExp('test', 'd')) {
        return;
      }
      expect(supportsRegExp('test', 'd')).assertFalse();
    });
  
    /**
     * @tc.name testExec0143
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_FLAGS_TEST_0600
     * @tc.desc Test RegExp.prototype.exec global g flag loop collects match indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('test', 'g');
      const str: string = "test test test";
      const results: number[] = [];
      while (true) {
        const matched: RegExpExecArray | null = re.exec(str);
        if (matched === null) {
          break;
        }
        results.push(matched.index);
      }
  
      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(5);
      expect(results[2]).assertEqual(10);
    });
  });
  
  // Global regex: successive exec calls advance internal state and eventually return null.
  describe('Global_Matching_State_Tests', () => {
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
     * @tc.name testExec0144
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0100
     * @tc.desc Test RegExp.prototype.exec updates lastIndex for global pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo', 'g');
      let result = re.exec("foo foo");
      expect(result?.index).assertEqual(0);
      expect(re.lastIndex).assertEqual(3);
  
      result = re.exec("foo foo");
      expect(result?.index).assertEqual(4);
      expect(re.lastIndex).assertEqual(7);
    });
  
    /**
     * @tc.name testExec0145
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0200
     * @tc.desc Test RegExp.prototype.exec traverses multiple matches with g flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('ab*', 'g');
      const str = "abbcdefabh";
      let result: RegExpExecArray | null;
      let count = 0;
      while ((result = re.exec(str)) !== null) {
        count++;
      }
      expect(count).assertEqual(2);
    });
  
    /**
     * @tc.name testExec0146
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0300
     * @tc.desc Test RegExp.prototype.exec sticky y flag requires match at lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo', 'y');
      const str = "foo foo";
      re.lastIndex = 0;
      let result = re.exec(str);
      expect(result?.index).assertEqual(0);
  
      re.lastIndex = 1;
      result = re.exec(str);
      expect(result).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0147
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0400
     * @tc.desc Test RegExp lastIndex resets to 0 on global match failure
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('abc', 'g');
      const str = "xyz";
      re.exec(str);
      expect(re.lastIndex).assertEqual(0);
    });
  
    /**
     * @tc.name testExec0148
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBAL_TEST_0500
     * @tc.desc Test RegExp non-global exec does not advance lastIndex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('foo');
      re.exec("foo foo");
      expect(re.lastIndex).assertEqual(0);
    });
  });
  
  // Global edge cases (empty matches, zero-length advances) that historically broke lastIndex bookkeeping.
  describe('Global_Flag_Special_Case_Tests', () => {
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
     * @tc.name testExec0149
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBALSPECIAL_TEST_0100
     * @tc.desc Test RegExp.prototype.exec zero-length matches with ^ multiline global
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      
      const re: RegExp = new RegExp('^', 'gm');
      const str: string = "line1\nline2\nline3";
      let count: number = 0;
      while (count < 10) {
        const matched: RegExpExecArray | null = re.exec(str);
        if (matched === null) {
          break;
        }
        count++;
        const matchedText: string = matched[0] ?? '';
        if (matchedText.length === 0) {
          re.lastIndex++;
        }
      }
      expect(count).assertEqual(3);
    });
  
    /**
     * @tc.name testExec0150
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBALSPECIAL_TEST_0200
     * @tc.desc Test RegExp lastIndex reset when exec fails on a new string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('ab*', 'g');
  
      const result1: RegExpExecArray | null = re.exec("abbc");
      expect(result1?.[0]).assertEqual("abb");
      expect(re.lastIndex).assertEqual(3);
  
      const result2: RegExpExecArray | null = re.exec("xyz");
      expect(result2).assertEqual(null);
      expect(re.lastIndex).assertEqual(0);
    });
  
    /**
     * @tc.name testExec0151
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_GLOBALSPECIAL_TEST_0300
     * @tc.desc Test manual lastIndex reset before repeated exec on same string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re: RegExp = new RegExp('foo', 'g');
      const str: string = "foo foo foo";
      re.exec(str);
      expect(re.lastIndex).assertEqual(3);
      re.lastIndex = 0;
      re.exec(str);
      expect(re.lastIndex).assertEqual(3);
    });
  });
  
  // lastIndex read/write observability: shared mutable state between exec, test, and match on the same object.
  describe('LastIndex_Behavior_Tests', () => {
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
     * @tc.name testExec0152
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0100
     * @tc.desc Test lastIndex initial value 0 for non-global RegExp after exec
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test');
      expect(re.lastIndex).assertEqual(0);
      re.exec("test");
      expect(re.lastIndex).assertEqual(0);
    });
  
    /**
     * @tc.name testExec0153
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0200
     * @tc.desc Test sticky RegExp exec honors lastIndex for next attempt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test', 'y');
      const str = "test test";
      re.lastIndex = 0;
      const result1 = re.exec(str);
      expect(result1?.index).assertEqual(0);
  
      re.lastIndex = 5;
      const result2 = re.exec(str);
      expect(result2?.index).assertEqual(5);
  
      re.lastIndex = 1;
      const result3 = re.exec(str);
      expect(result3).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0154
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0300
     * @tc.desc Test global exec returns null when lastIndex exceeds string length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test', 'g');
      re.lastIndex = 100;
      const result = re.exec("test");
      expect(result).assertEqual(null);
    });
  
    /**
     * @tc.name testExec0155
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_LASTINDEX_TEST_0400
     * @tc.desc Test negative lastIndex is treated as zero for global exec
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test', 'g');
      re.lastIndex = -1;
      const result = re.exec("test");
      expect(result?.index).assertEqual(0);
    });
  });
  
  // Greedy vs non-greedy and bounded counts: different consumption shapes for the same substring.
  describe('Quantifier_Tests', () => {
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
     * @tc.name testExec0156
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0100
     * @tc.desc Test RegExp.prototype.exec greedy quantifier .*
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecQuantifier.execGreedy("a123b456b");
      expect(result?.[0]).assertEqual("a123b456b");
    });
  
    /**
     * @tc.name testExec0157
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0200
     * @tc.desc Test RegExp.prototype.exec non-greedy quantifier .*?
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecQuantifier.execNonGreedy("a123b456b");
      expect(result?.[0]).assertEqual("a123b");
    });
  
    /**
     * @tc.name testExec0158
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0300
     * @tc.desc Test RegExp.prototype.exec fixed count quantifier a{3}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecQuantifier.execExact("aaab");
      expect(result?.[0]).assertEqual("aaa");
    });
  
    /**
     * @tc.name testExec0159
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0400
     * @tc.desc Test RegExp.prototype.exec range quantifier a{2,4}
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = ExecQuantifier.execRange("aa");
      const result2 = ExecQuantifier.execRange("aaa");
      const result3 = ExecQuantifier.execRange("aaaa");
      expect(result1?.[0]).assertEqual("aa");
      expect(result2?.[0]).assertEqual("aaa");
      expect(result3?.[0]).assertEqual("aaaa");
    });
  
    /**
     * @tc.name testExec0160
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0500
     * @tc.desc Test RegExp.prototype.exec zero-or-more quantifier a*
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = ExecQuantifier.execZeroOrMore("b");
      const result2 = ExecQuantifier.execZeroOrMore("ab");
      const result3 = ExecQuantifier.execZeroOrMore("aaab");
      expect(result1?.[0]).assertEqual("b");
      expect(result2?.[0]).assertEqual("ab");
      expect(result3?.[0]).assertEqual("aaab");
    });
  
    /**
     * @tc.name testExec0161
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_QUANTIFIER_TEST_0600
     * @tc.desc Test RegExp.prototype.exec one-or-more quantifier a+
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = ExecQuantifier.execOneOrMore("ab");
      const result2 = ExecQuantifier.execOneOrMore("aaab");
      expect(result1?.[0]).assertEqual("ab");
      expect(result2?.[0]).assertEqual("aaab");
    });
  });
  
  // ExecArray fields beyond [0]: index, input, groups—needed for named capture and debugging parity.
  describe('Return_Value_Property_Tests', () => {
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
     * @tc.name testExec0162
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0100
     * @tc.desc Test RegExpExecArray index property after exec
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecReturn.execHello("say hello world");
      expect(result?.index).assertEqual(4);
    });
  
    /**
     * @tc.name testExec0163
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0200
     * @tc.desc Test RegExpExecArray input property equals original string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('hello');
      const result = re.exec("hello world");
      expect(result?.input).assertEqual("hello world");
    });
  
    /**
     * @tc.name testExec0164
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0300
     * @tc.desc Test RegExpExecArray groups property for named capture
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<word>hello)')) {
        return;
      }
      
      
      const result = ExecReturn.execNamedHello("hello world");
      const groups = result?.groups;
      expect(groups?.['word']).assertEqual("hello");
    });
  
    /**
     * @tc.name testExec0165
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0400
     * @tc.desc Test RegExpExecArray indices property when d flag is set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      if (!supportsRegExp('(?<word>hello)', 'd')) {
        return;
      }
      const re: RegExp = new RegExp('(?<word>hello)', 'd');
      const result: RegExpExecArray | null = re.exec('hello world');
      expect(result !== null).assertTrue();
      if (result === null) {
        return;
      }
      
      expect(result[0]).assertEqual("hello");
    });
  
    /**
     * @tc.name testExec0166
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURN_TEST_0500
     * @tc.desc Test named capture exec full match string without d flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('(?<word>hello)')) {
        return;
      }
      
      
      const re: RegExp = new RegExp('(?<word>hello)');
      const result: RegExpExecArray | null = re.exec('hello world');
      expect(result?.[0]).assertEqual('hello');
    });
  });
  
  // Type-shape checks so upgrades do not regress array-like results to plain objects or null prototypes.
  describe('Match_Result_Type_Tests', () => {
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
     * @tc.name testExec0167
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURNTYPE_TEST_0100
     * @tc.desc Test RegExp.prototype.exec returns array-like object with index and input types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test');
      const result = re.exec("test");
      expect(Array.isArray(result)).assertTrue();
      const indexType: string = String(typeof result?.index);
      expect(indexType === 'number' || indexType === 'int').assertTrue();
      expect(typeof result?.input).assertEqual("string");
    });
  
    /**
     * @tc.name testExec0168
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURNTYPE_TEST_0200
     * @tc.desc Test RegExp.prototype.exec returns null on failure and lastIndex unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('test');
      const result = re.exec("hello");
      expect(result).assertEqual(null);
      expect(re.lastIndex).assertEqual(0);
    });
  
    /**
     * @tc.name testExec0169
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_RETURNTYPE_TEST_0300
    * @tc.desc Test placeholder for enumerable properties on exec result (commented checks)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const re = new RegExp('(a)(b)');
      const result = re.exec('zab');
      expect(result?.[1]).assertEqual('a');
      expect(result?.[2]).assertEqual('b');
      expect(result?.index).assertEqual(1);
    });
  });
  
  // Escapes, unicode ranges, and property escapes—syntax gated when the engine lacks full unicode tables.
  describe('Special_Character_Tests', () => {
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
     * @tc.name testExec0170
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0100
     * @tc.desc Test RegExp.prototype.exec escaped dot matches literal period
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecSpecialChar.execEscapedDot("a.b");
      expect(result?.[0]).assertEqual(".");
    });
  
    /**
     * @tc.name testExec0171
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0200
     * @tc.desc Test RegExp.prototype.exec tab and newline escape sequences
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result1 = ExecSpecialChar.execTab("a\tb");
      const result2 = ExecSpecialChar.execNewline("a\nb");
      expect(result1?.[0]).assertEqual("\t");
      expect(result2?.[0]).assertEqual("\n");
    });
  
    /**
     * @tc.name testExec0172
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0300
     * @tc.desc Test RegExp.prototype.exec Unicode Han character class range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      
      
      const result = ExecSpecialChar.execChineseRange("hello\u4E16\u754Cworld");
      expect(result?.[0]).assertEqual("\u4E16\u754C");
    });
  
    /**
     * @tc.name testExec0173
     * @tc.number SUB_COMMONLIBRARY_REGEXP_EXEC_SPECIALCHAR_TEST_0400
     * @tc.desc Test RegExp.prototype.exec Unicode property escape \\p{Emoji} with u flag
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testExec0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      if (!supportsRegExp('\\p{Emoji}', 'u')) {
        return;
      }
      
      
      const emoji = String.fromCodePoint(0x1F600);
      const result = ExecSpecialChar.execEmojiProperty('Hello ' + emoji + ' World');
      expect(result?.[0]).assertEqual(emoji);
    });
  });
}



